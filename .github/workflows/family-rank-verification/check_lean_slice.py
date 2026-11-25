"""Build selected RH modules from source, serially, using the pinned Mathlib cache."""

import hashlib
import json
import os
from pathlib import Path
import runpy
import subprocess
import sys
import tomllib

analysis = Path(__file__).resolve().parent
project = Path(os.environ.get("RH_SLICE_PROJECT", analysis.parent / "riemann-hypothesis")).resolve()
src = project / "src"
deps = analysis / "lean"
cache_setting = os.environ.get("RH_SLICE_BASE_CACHE")
cache = Path(cache_setting).resolve() if cache_setting else None
cache_record = json.loads((cache / "verified.json").read_text()) if cache else None
module_timeout = int(os.environ.get("RH_SLICE_MODULE_TIMEOUT_SECONDS", "240"))
if module_timeout <= 0:
    raise SystemExit("RH_SLICE_MODULE_TIMEOUT_SECONDS must be positive")
default_build = deps / ".lake" / (f"rh-slice-{cache_record['baseline'][:12]}" if cache_record else "rh-slice")
build = Path(os.environ.get("RH_SLICE_BUILD", default_build)).resolve()
previous_builds = [
    Path(directory).resolve()
    for directory in os.environ.get("RH_SLICE_PRIOR_BUILD", "").split(os.pathsep)
    if directory
]
if build in previous_builds:
    raise SystemExit("prior and current build directories must be distinct")
quick = runpy.run_path(str(project / "scripts/quick-check.py"))
lake = str(Path.home() / ".elan/bin/lake")
config = tomllib.loads((project / "lakefile.toml").read_text())


def lean_options(table, prefix=""):
    for name, value in table.items():
        key = prefix + name
        if isinstance(value, dict):
            yield from lean_options(value, key + ".")
        else:
            yield f"-D{key}={str(value).lower()}"


options = list(lean_options(config["leanOptions"]))
config_files = ("lean-toolchain", "lakefile.toml", "lake-manifest.json")
pins = b"".join((project / file).read_bytes() for file in config_files)
if cache_record:
    cached_pins = b"".join(subprocess.check_output(
        ["git", "-C", str(project), "show", f"{cache_record['baseline']}:{file}"]
    ) for file in config_files)
    if cached_pins != pins:
        raise SystemExit("repository build configuration differs from the CI cache baseline")
if (deps / "lean-toolchain").read_bytes() != (project / "lean-toolchain").read_bytes():
    raise SystemExit("Lean toolchain differs from the project")
expected = json.loads((project / "lake-manifest.json").read_text())["packages"]
cached = json.loads((deps / "lake-manifest.json").read_text())["packages"]
if expected != cached:
    raise SystemExit("dependency manifest differs from the project")
lean_path = subprocess.check_output(
    [lake, "env", "/usr/bin/printenv", "LEAN_PATH"],
    cwd=deps,
    env={**os.environ, "LEAN_PATH": str(build)},
    text=True,
).strip()
lean = str(Path(lake).with_name("lean"))
compiler = [lean, "-j1", *config["moreLeanArgs"], *options, "-R", str(src)]


def source(module):
    return src / (module.replace(".", "/") + ".lean")


seen = {}
active = set()


def compile_module(module):
    if module in seen:
        return seen[module]
    if module in active:
        raise ValueError(f"import cycle at {module}")
    path = source(module)
    active.add(module)
    imported = [dep for dep in quick["imports"](path) if source(dep).is_file()]
    closure_keys = [compile_module(dep) for dep in imported]
    active.remove(module)
    content = path.read_bytes()
    key = hashlib.sha256(pins + content + b"".join(closure_keys)).digest()
    olean = build / (module.replace(".", "/") + ".olean")
    suffixes = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig", ".ilean")
    if (cache and cache_record["modules"].get(module) == hashlib.sha256(content).hexdigest()
            and all(dep in using_cache for dep in imported)):
        cached_olean = cache / "lean" / olean.relative_to(build)
        if not cached_olean.is_file():
            raise ValueError(f"receipt cache missing Lean output for {module}")
        olean.parent.mkdir(parents=True, exist_ok=True)
        # Lean resolves one search root for a module prefix. Keep all RH artifacts under that root.
        for suffix in suffixes:
            original = cached_olean.with_suffix(suffix)
            output = olean.with_suffix(suffix)
            if original.is_file():
                if output.exists() and not output.samefile(original):
                    raise ValueError(f"build path already contains another output for {module}")
                if not output.exists():
                    os.link(original, output)
        using_cache.add(module)
        seen[module] = key
        return key
    stamp = olean.with_suffix(".inputs")
    if not olean.is_file() or not stamp.is_file() or stamp.read_bytes() != key:
        for previous_build in previous_builds:
            previous_olean = previous_build / olean.relative_to(build)
            previous_stamp = previous_olean.with_suffix(".inputs")
            if (previous_olean.is_file() and previous_stamp.is_file()
                    and previous_stamp.read_bytes() == key):
                olean.parent.mkdir(parents=True, exist_ok=True)
                stamp.unlink(missing_ok=True)
                for suffix in suffixes:
                    output = olean.with_suffix(suffix)
                    original = previous_olean.with_suffix(suffix)
                    output.unlink(missing_ok=True)
                    if original.is_file():
                        os.link(original, output)
                stamp.write_bytes(key)
                using_previous_build.add(module)
                seen[module] = key
                return key
        print("Building", module, flush=True)
        stamp.unlink(missing_ok=True)
        olean.parent.mkdir(parents=True, exist_ok=True)
        for suffix in suffixes:
            output = olean.with_suffix(suffix)
            if output.is_file() and output.stat().st_nlink > 1:
                output.unlink()
        extra = []
        if module.startswith(("GroundTheory.LocalFields.", "GroundTheory.GlobalFields.")):
            extra.append("-DsynthInstance.maxHeartbeats=400000")
        subprocess.run(
            [*compiler, *extra, "-o", str(olean), str(path)],
            cwd=deps,
            env={**os.environ, "LEAN_PATH": lean_path, "LEAN_ABORT_ON_PANIC": "1"},
            timeout=module_timeout,
            check=True,
        )
        if path.read_bytes() != content:
            raise ValueError(f"source changed while checking {module}")
        stamp.write_bytes(key)
    seen[module] = key
    return key


targets = sys.argv[1:]
using_cache = set()
using_previous_build = set()
if not targets or not all(quick["ci"].MODULE.fullmatch(module) for module in targets):
    raise SystemExit("pass one or more dotted Lean module names")
for target in targets:
    compile_module(target)
print(f"Checked {len(seen)} project modules ({len(using_cache)} from matching CI cache, "
      f"{len(using_previous_build)} from matching prior inputs)")
