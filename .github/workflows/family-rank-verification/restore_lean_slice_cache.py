"""Restore only untouched dependencies from a matching public RH CI receipt."""

import hashlib
import json
import os
from pathlib import Path
import runpy
import shutil
import subprocess
import sys

analysis = Path(__file__).resolve().parent
project = Path(os.environ.get("RH_SLICE_PROJECT", analysis.parent / "riemann-hypothesis")).resolve()
lean_project = analysis / "lean"
quick = runpy.run_path(str(project / "scripts/quick-check.py"))
ci = runpy.run_path(str(project / "scripts/ci-cache-get.py"))

if len(sys.argv) < 3:
    raise SystemExit("usage: restore_lean_slice_cache.py BASE MODULE [MODULE...]")
baseline = ci["git"](project, "rev-parse", sys.argv[1])
targets = sys.argv[2:]


def git_blob(path):
    return subprocess.check_output(["git", "-C", str(project), "show", f"{baseline}:{path}"])


identity = {
    "source_tree": ci["git"](project, "rev-parse", f"{baseline}:src"),
    "build_roots": {},
    "lakefile_sha256": ci["digest"](git_blob("lakefile.toml")),
    "manifest_sha256": ci["digest"](git_blob("lake-manifest.json")),
    "toolchain": git_blob("lean-toolchain").decode().strip(),
}
for name in ("lean-toolchain", "lakefile.toml", "lake-manifest.json"):
    if (project / name).read_bytes() != git_blob(name):
        raise SystemExit(f"{name} differs from the cache baseline")
record = ci["find_record"](project, identity, ancestor_limit=0)
if record is None:
    raise SystemExit(f"no matching public CI receipt for {baseline}")
validated = ci["validated_blobs"](record, identity)
if len(validated) == 3:
    _, archive_digests, modules = validated
    manifest = ((name, input_hash, artifact, archive_digests[artifact]) for name, input_hash, artifact in modules)
else:
    _, manifest = validated

affected = {}
closure = quick["dependency_closure"](project, targets)
source_digests = {}
baseline_files = {}
tree = subprocess.check_output(["git", "-C", str(project), "ls-tree", "-r", "-z", baseline, "--", "src"])
for entry in tree.split(b"\0"):
    if entry:
        info, name = entry.split(b"\t", 1)
        _, kind, digest = info.split()
        if kind == b"blob":
            baseline_files[os.fsdecode(name)] = digest.decode()


def changed(module):
    if module not in affected:
        rel = "src/" + module.replace(".", "/") + ".lean"
        path = project / rel
        data = path.read_bytes()
        source_digests[module] = hashlib.sha256(data).hexdigest()
        blob = hashlib.sha1(f"blob {len(data)}\0".encode() + data).hexdigest()
        same = blob == baseline_files.get(rel)
        affected[module] = not same or any(
            changed(dep) for dep in quick["imports"](path) if dep in closure
        )
    return affected[module]


rows = [row for row in manifest if row[0] in closure and not changed(row[0])]
stage = lean_project / ".lake" / f"rh-cache-{baseline[:12]}"
stage.mkdir(parents=True, exist_ok=True)
index = stage / "verified.json"
previous = json.loads(index.read_text()) if index.is_file() else {}
retained = previous.get("modules", {}) if previous.get("receipt") == record["candidate_head"] else {}
prior_archives = [
    Path(directory).resolve()
    for directory in os.environ.get("RH_SLICE_PRIOR_ARCHIVES", "").split(os.pathsep)
    if directory
]
prefix = subprocess.check_output(
    [str(Path.home() / ".elan/bin/lean"), "--print-prefix"], cwd=lean_project, text=True
).strip()
jobs = []
total = 0
reused_archives = 0


def archive_matches(path, digest):
    if not path.is_file():
        return False
    with path.open("rb") as file:
        return hashlib.file_digest(file, "sha256").hexdigest() == digest


print(f"Matched {baseline} to CI receipt {record['candidate_head']}", flush=True)
print(f"Restoring {len(rows)} of {len(closure)} project modules", flush=True)
for module, input_hash, artifact, sha256 in rows:
    path = stage / "artifacts" / artifact
    archive_valid = archive_matches(path, sha256)
    if not archive_valid:
        for directory in prior_archives:
            candidate = directory / artifact
            if archive_matches(candidate, sha256):
                path.parent.mkdir(exist_ok=True)
                shutil.copyfile(candidate, path)
                archive_valid = True
                reused_archives += 1
                break
    if (retained.get(module) == source_digests[module] and archive_valid
            and (stage / "lean" / (module.replace(".", "/") + ".olean")).is_file()):
        continue
    if not archive_valid:
        key = f"artifacts/{ci['REPOSITORY']}/{artifact.removesuffix('.ltar')}.art"
        payload = ci["fetch"](key, 64 << 20)
        if payload is None or ci["digest"](payload) != sha256:
            raise ValueError(f"invalid archive for {module}")
        if total + len(payload) > 512 << 20:
            raise ValueError("targeted download exceeds 512 MiB")
        path.parent.mkdir(exist_ok=True)
        path.write_bytes(payload)
        total += len(payload)
    parent = Path(*module.split(".")).parent
    bases = [stage / "lean" / parent, stage / "ir" / parent]
    for directory in bases:
        directory.mkdir(parents=True, exist_ok=True)
    jobs.append({"file": str(path), "hash": input_hash, "base": list(map(str, bases))})
if jobs:
    subprocess.run(
        [str(Path(prefix) / "bin/leantar"), "--jobs", "1", "-f", "-x", "-j", "-"],
        input=json.dumps(jobs), text=True, cwd=stage, check=True,
        env={**os.environ, "RUST_MIN_STACK": str(8 << 20)},
    )
paths = {**retained, **{module: source_digests[module] for module, *_ in rows}}
temporary = index.with_suffix(".tmp")
temporary.write_text(json.dumps({
    "baseline": baseline,
    "receipt": record["candidate_head"],
    "modules": paths,
}, indent=2) + "\n")
temporary.replace(index)
print(f"Downloaded {total} bytes. Restored cache at {stage}")
if reused_archives:
    print(f"Reused {reused_archives} archives matching the current receipt")
