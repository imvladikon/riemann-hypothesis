module

import Lean
import all Formalism.PeriodIntegrals.OrbitalBoundsConclusion.EntAtD
import Mathlib.Algebra.MvPolynomial.PDeriv

open Lean Elab Command MvPolynomial
open PI.EntAtD PI.EntAtD.W
open scoped BigOperators

namespace RamifiedSymmetricCutoffAudit

private def flipLabel (H : Type) : Equiv.Perm (Bool × H) where
  toFun s := (!s.1, s.2)
  invFun s := (!s.1, s.2)
  left_inv := by rintro ⟨b, t⟩; cases b <;> rfl
  right_inv := by rintro ⟨b, t⟩; cases b <;> rfl

private def flipVariables (H : Type) (N0 N1 : ℕ) : XZ (Bool × H) N0 N1 → XZ (Bool × H) N0 N1 :=
  Sum.map (fun s => (flipLabel H s.1, s.2)) (fun s => (flipLabel H s.1, s.2))

private theorem flipVariables_involutive (H : Type) (N0 N1 : ℕ) :
    Function.Involutive (flipVariables H N0 N1) := by
  rintro (⟨⟨b, t⟩, r, a⟩ | ⟨⟨b, t⟩, a, c⟩) <;> cases b <;> rfl

private theorem rename_flip_lapT {H : Type} {N0 N1 : ℕ} (t : H) (P : PolyXZ H N0 N1) :
    rename (flipVariables H N0 N1) (lapT N0 N1 t P) =
      lapT N0 N1 t (rename (flipVariables H N0 N1) P) := by
  rw [lap_apply, lap_apply, map_sum]
  refine Finset.sum_congr rfl fun a _ => ?_
  rw [map_sum]
  refine Finset.sum_congr rfl fun b _ => ?_
  have hinj := (flipVariables_involutive H N0 N1).injective
  rw [← pderiv_rename hinj, ← pderiv_rename hinj]
  exact pderiv_pderiv_comm _ _ _

private theorem rename_flip_lapT_pow {H : Type} {N0 N1 : ℕ} (t : H) (n : ℕ) (P : PolyXZ H N0 N1) :
    rename (flipVariables H N0 N1) ((lapT N0 N1 t ^ n) P) =
      (lapT N0 N1 t ^ n) (rename (flipVariables H N0 N1) P) := by
  induction n with
  | zero => simp
  | succ n ih => simp only [pow_succ', mul_apply_eq_comp, rename_flip_lapT, ih]

private theorem rename_flip_minor {H : Type} {N0 N1 : ℕ} (s : Bool × H) (k : ℕ) (I : Fin k ↪o Fin N1) :
    rename (flipVariables H N0 N1) (minorXZ N0 N1 s k I) = minorXZ N0 N1 (flipLabel H s) k I := by
  rw [minorXZ, minorXZ, AlgHom.map_det]
  congr 1
  ext i j
  simp [map_sum, map_mul, flipVariables]

private theorem rename_flip_minors {H : Type} [Fintype H] [DecidableEq H] {N0 N1 : ℕ}
    (nu : Bool × H → YoungDiagram) (I : ColChoice N1 nu) :
    rename (flipVariables H N0 N1) (Gxz N0 N1 (nu ∘ flipLabel H) (fun s c => I (flipLabel H s) c)) =
      Gxz N0 N1 nu I := by
  unfold Gxz
  simp only [map_prod, rename_flip_minor, Function.comp_apply]
  exact Equiv.prod_comp (flipLabel H) (fun s : Bool × H =>
    ∏ c : Fin ((nu s).rowLen 0), minorXZ N0 N1 s ((nu s).colLen c) (I s c))

/-- Taking the smaller row estimate from the two sides gives the Laplacian cutoff. -/
def twoSidedBound (α β : YoungDiagram) : ℕ :=
  min (rowContractionBound α β) (rowContractionBound β α)

theorem laplacian_vanishes_above_two_sided_bound (H : Type) [Fintype H] [DecidableEq H]
    (N0 N1 : ℕ) (nu : Bool × H → YoungDiagram) (I : ColChoice N1 nu) (t : H) (n : ℕ)
    (hn : twoSidedBound (nu (false, t)) (nu (true, t)) < n) : (lapT N0 N1 t ^ n) (Gxz N0 N1 nu I) = 0 := by
  rcases min_lt_iff.mp hn with hf | ht
  · exact lapT_pow_Gxz_eq_zero_of_rowContractionBound H N0 N1 nu I t n hf
  · have h := lapT_pow_Gxz_eq_zero_of_rowContractionBound H N0 N1 (nu ∘ flipLabel H)
      (fun s c => I (flipLabel H s) c) t n ht
    simpa only [rename_flip_lapT_pow, rename_flip_minors, map_zero] using
      congrArg (rename (flipVariables H N0 N1)) h

theorem kernel_bound_with_two_sided_cutoff (H : Type) [Fintype H] [DecidableEq H] (N0 N1 p : ℕ)
    [Fact p.Prime] (nu : Bool × H → YoungDiagram) (Th : MvPowerSeries (ZV H N0 N1) ℂ_[p])
    (hTh : ShapeH H p Th) :
    KvalGe N0 N1 p nu Th (-((∑ t : H, (twoSidedBound (nu (false, t)) (nu (true, t)) : ℝ)) / 2)) := by
  refine core_of_cutoff (expand_of pExpCoeff) twoSidedBound ?_ H N0 N1 p nu Th hTh
  intro H _ _ N0 N1 nu I m κ2 n t ht
  exact acon_eq_zero_of_lapT_pow pBridge pLapComm H N0 N1 nu I m κ2 n t
    (laplacian_vanishes_above_two_sided_bound H N0 N1 nu I t (n t) ht)

theorem kernel_bound_saves_cutoff_gap (H : Type) [Fintype H] [DecidableEq H] (N0 N1 p : ℕ)
    [Fact p.Prime] (nu : Bool × H → YoungDiagram) (Th : MvPowerSeries (ZV H N0 N1) ℂ_[p])
    (hTh : ShapeH H p Th) (q : ℝ)
    (hq : 2 * q ≤ ∑ t : H, ((rowContractionBound (nu (false, t)) (nu (true, t)) : ℝ) -
      (twoSidedBound (nu (false, t)) (nu (true, t)) : ℝ))) :
    KvalGe N0 N1 p nu Th (-((∑ t : H, (rowContractionBound (nu (false, t)) (nu (true, t)) : ℝ)) / 2) + q) := by
  have hp : (1 : ℝ) ≤ p := by exact_mod_cast (Fact.out : p.Prime).one_lt.le
  rw [Finset.sum_sub_distrib] at hq
  intro I m
  exact (kernel_bound_with_two_sided_cutoff H N0 N1 p nu Th hTh I m).trans
    (Real.rpow_le_rpow_of_exponent_le hp (by linarith only [hq]))

theorem previous_jet_bound_from_two_sides : PI.EntAtD.EntAtD := by
  apply entAtD_of_core
  intro H _ _ N0 N1 p _ nu Th hTh
  have hq : 2 * (0 : ℝ) ≤ ∑ t : H, ((rowContractionBound (nu (false, t)) (nu (true, t)) : ℝ) -
      (twoSidedBound (nu (false, t)) (nu (true, t)) : ℝ)) := by
    rw [mul_zero]
    refine Finset.sum_nonneg fun t _ => sub_nonneg.mpr ?_
    exact_mod_cast min_le_left (rowContractionBound (nu (false, t)) (nu (true, t)))
      (rowContractionBound (nu (true, t)) (nu (false, t)))
  simpa only [add_zero] using kernel_bound_saves_cutoff_gap H N0 N1 p nu Th hTh 0 hq

private def column : YoungDiagram := YoungDiagram.ofRowLens [1, 1, 1] (by decide)
private def row : YoungDiagram := YoungDiagram.ofRowLens [2] (by decide)

theorem two_sided_cutoff_can_save_two :
    rowContractionBound column row = 3 ∧ twoSidedBound column row = 1 := by
  simp only [twoSidedBound, rowContractionBound, YoungDiagram.rowLen_eq_card]
  decide +kernel

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``laplacian_vanishes_above_two_sided_bound, ``kernel_bound_with_two_sided_cutoff,
      ``kernel_bound_saves_cutoff_gap, ``previous_jet_bound_from_two_sides, ``two_sided_cutoff_can_save_two] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedSymmetricCutoffAudit
