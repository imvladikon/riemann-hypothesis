module

import Lean
import Mathlib.LinearAlgebra.Matrix.Rank
import all Formalism.PeriodIntegrals.OrbitalBoundsConclusion.EntAtD
import all RamifiedFlagPullbackAudit

open Lean Elab Command Module MvPolynomial
open PI.EntAtD PI.EntAtD.W
open RamifiedFlagPullbackAudit (Raw rawLap rawLap_apply rawMinor rawFlag rawLap_pow_vanishes_above_intersection)
open scoped BigOperators

namespace RamifiedIntersectionCutoffAudit

def intersectionBound (α β : YoungDiagram) : ℕ := (α ⊓ β).cells.card

private theorem rowLen_inf (α β : YoungDiagram) (i : ℕ) :
    (α ⊓ β).rowLen i = min (α.rowLen i) (β.rowLen i) := by
  apply eq_of_forall_lt_iff
  intro j
  simp only [lt_min_iff, ← YoungDiagram.mem_iff_lt_rowLen, YoungDiagram.mem_inf]

private theorem intersectionBound_eq_sum {α β : YoungDiagram} {n : ℕ} (hα : α.colLen 0 ≤ n) :
    intersectionBound α β = ∑ i : Fin n, min (α.rowLen i) (β.rowLen i) := by
  have hzero (i : ℕ) (hi : n ≤ i) : (α ⊓ β).rowLen i = 0 := by
    apply Nat.eq_zero_of_not_pos
    intro h
    have hm : (i, 0) ∈ α ⊓ β := YoungDiagram.mem_iff_lt_rowLen.mpr h
    exact (not_lt_of_ge (hα.trans hi))
      (YoungDiagram.mem_iff_lt_colLen.mp (YoungDiagram.mem_inf.mp hm).1)
  rw [intersectionBound, card_cells_eq_sum_rowLen (α ⊓ β) n hzero,
    Fin.sum_univ_eq_sum_range (fun i => min (α.rowLen i) (β.rowLen i))]
  simp only [rowLen_inf]

private theorem intersectionBound_eq_row_sum (α β : YoungDiagram) :
    intersectionBound α β = ∑ r ∈ insert 0 (α.cells.image Prod.fst), min (α.rowLen r) (β.rowLen r) := by
  rw [intersectionBound,
    Finset.card_eq_sum_card_fiberwise (f := Prod.fst) (t := insert 0 (α.cells.image Prod.fst))]
  · apply Finset.sum_congr rfl
    intro i _
    change ((α ⊓ β).row i).card = _
    rw [← YoungDiagram.rowLen_eq_card, rowLen_inf]
  · intro x hx
    have hm : x ∈ α := (YoungDiagram.mem_inf.mp ((YoungDiagram.mem_cells _).mp hx)).1
    exact Finset.mem_insert_of_mem (Finset.mem_image_of_mem Prod.fst ((YoungDiagram.mem_cells _).mpr hm))

theorem intersectionBound_le_rowContractionBound (α β : YoungDiagram) :
    intersectionBound α β ≤ rowContractionBound α β := by
  rw [intersectionBound_eq_row_sum, rowContractionBound]
  exact Finset.sum_le_sum fun i _ => min_le_min_left _ (β.rowLen_anti 0 i (Nat.zero_le _))

theorem intersectionBound_lt_rowContractionBound_of_row (α β : YoungDiagram) (r : ℕ)
    (hα : β.rowLen r < α.rowLen r) (hβ : β.rowLen r < β.rowLen 0) :
    intersectionBound α β < rowContractionBound α β := by
  rw [intersectionBound_eq_row_sum, rowContractionBound]
  refine Finset.sum_lt_sum (fun i _ => min_le_min_left _ (β.rowLen_anti 0 i (Nat.zero_le _))) ?_
  have hm : (r, 0) ∈ α := YoungDiagram.mem_iff_lt_rowLen.mpr ((Nat.zero_le _).trans_lt hα)
  refine ⟨r, Finset.mem_insert_of_mem (Finset.mem_image_of_mem Prod.fst ((YoungDiagram.mem_cells _).mpr hm)), ?_⟩
  rw [min_eq_right hα.le, lt_min_iff]
  exact ⟨hα, hβ⟩

private def atPlace {H : Type} {N0 N1 : ℕ} (t : H) :
    RamifiedFlagPullbackAudit.XV N0 ⊕ RamifiedFlagPullbackAudit.ZV N0 N1 → XZ (Bool × H) N0 N1 :=
  Sum.map (fun s => ((s.1, t), s.2)) (fun s => ((s.1, t), s.2))

private theorem atPlace_injective {H : Type} {N0 N1 : ℕ} (t : H) :
    Function.Injective (atPlace (N0 := N0) (N1 := N1) t) := by
  apply Sum.map_injective.mpr
  constructor <;> intro x y h <;> exact Prod.ext (congrArg (fun s => s.1.1) h) (congrArg (fun s => s.2) h)

private theorem rename_lap_pow {H : Type} {N0 N1 : ℕ} (t : H) (j : ℕ) (p : Raw N0 N1) :
    rename (atPlace t) ((rawLap N0 N1 ^ j) p) =
      (lapT N0 N1 t ^ j) (rename (atPlace t) p) := by
  have hstep (q : Raw N0 N1) :
      rename (atPlace t) (rawLap N0 N1 q) = lapT N0 N1 t (rename (atPlace t) q) := by
    rw [rawLap_apply, lap_apply, map_sum]
    refine Finset.sum_congr rfl fun a _ => ?_
    rw [map_sum]
    refine Finset.sum_congr rfl fun b _ => ?_
    rw [← pderiv_rename (atPlace_injective t), ← pderiv_rename (atPlace_injective t)]
    rfl
  induction j with
  | zero => simp
  | succ j ih => simp only [pow_succ', mul_apply_eq_comp, hstep, ih]

private theorem rename_minor {H : Type} {N0 N1 : ℕ} (t : H) (s : Bool) (k : ℕ)
    (I : Fin k ↪o Fin N1) :
    rename (atPlace t) (rawMinor s k I : Raw N0 N1) = minorXZ N0 N1 (s, t) k I := by
  rw [rawMinor, minorXZ, AlgHom.map_det]
  congr 1
  apply Matrix.ext
  intro i j
  simp [map_sum, map_mul, atPlace]

private theorem minorXZ_zero_of_height {H : Type} {N0 N1 : ℕ} (s : Bool × H) (k : ℕ)
    (I : Fin k ↪o Fin N1) (hk : N0 < k) : minorXZ N0 N1 s k I = 0 := by
  let A : Matrix (Fin k) (Fin N0) (PolyXZ H N0 N1) := Matrix.of fun i a => X (.inl (s, i.val, a))
  let B : Matrix (Fin N0) (Fin k) (PolyXZ H N0 N1) := Matrix.of fun a j => X (.inr (s, a, I j))
  change (A * B).det = 0
  by_contra h
  have hle := (Matrix.rank_mul_le_left A B).trans (Matrix.rank_le_width A)
  rw [Matrix.rank_of_det_ne_zero h, Fintype.card_fin] at hle
  exact (not_le_of_gt hk) hle

private theorem lap_pow_mul_invariant {H : Type} {N0 N1 : ℕ} (t : H) (j : ℕ) (P Q : PolyXZ H N0 N1)
    (hQ : ∀ (s : Bool) (a : Fin N0) (b : Fin N1), pderiv (.inr ((s, t), a, b)) Q = 0) :
    (lapT N0 N1 t ^ j) (P * Q) = (lapT N0 N1 t ^ j) P * Q := by
  have hstep (p : PolyXZ H N0 N1) : lapT N0 N1 t (p * Q) = lapT N0 N1 t p * Q := by
    simp only [lap_apply, pderiv_mul, hQ, mul_zero, add_zero, Finset.sum_mul]
  induction j with
  | zero => simp
  | succ j ih => simp only [pow_succ', mul_apply_eq_comp, ih, hstep]

/-- Only cells common to the two diagrams can contribute to the order of the local Laplacian. -/
theorem laplacian_vanishes_above_intersection (H : Type) [Fintype H] [DecidableEq H]
    (N0 N1 : ℕ) (nu : Bool × H → YoungDiagram) (I : ColChoice N1 nu) (t : H) (j : ℕ)
    (hj : intersectionBound (nu (false, t)) (nu (true, t)) < j) :
    (lapT N0 N1 t ^ j) (Gxz N0 N1 nu I) = 0 := by
  let P : Bool × H → PolyXZ H N0 N1 := fun s => ∏ c : Fin ((nu s).rowLen 0),
    minorXZ N0 N1 s ((nu s).colLen c) (I s c)
  let R := ∏ s ∈ (Finset.univ.erase (false, t)).erase (true, t), P s
  have hmem : (true, t) ∈ Finset.univ.erase (false, t) := by simp
  have hG : Gxz N0 N1 nu I = (P (false, t) * P (true, t)) * R := by
    change (∏ s, P s) = _
    rw [← Finset.mul_prod_erase Finset.univ P (Finset.mem_univ (false, t)),
      ← Finset.mul_prod_erase (Finset.univ.erase (false, t)) P hmem, mul_assoc]
  have hR (s : Bool) (a : Fin N0) (b : Fin N1) :
      pderiv (.inr ((s, t), a, b)) R = 0 := by
    apply derivation_prod_eq_zero_of_forall'
    intro v hv
    apply derivation_prod_eq_zero_of_forall'
    intro c _
    apply heart_pderiv_minor N0 N1 v (s, t) _ _ (I v c) a b
    rintro rfl
    cases s
    · exact Finset.ne_of_mem_erase (Finset.mem_of_mem_erase hv) rfl
    · exact Finset.ne_of_mem_erase hv rfl
  rw [hG, lap_pow_mul_invariant t j _ R hR]
  suffices h : (lapT N0 N1 t ^ j) (P (false, t) * P (true, t)) = 0 by rw [h, zero_mul]
  have hzero (s : Bool × H) (hs : ¬ (nu s).colLen 0 ≤ N0) : P s = 0 := by
    have hpos : 0 < (nu s).rowLen 0 := YoungDiagram.mem_iff_lt_rowLen.mp
      (YoungDiagram.mem_iff_lt_colLen.mpr (Nat.zero_lt_of_lt (lt_of_not_ge hs)) : (0, 0) ∈ nu s)
    let c : Fin ((nu s).rowLen 0) := ⟨0, hpos⟩
    exact Finset.prod_eq_zero (Finset.mem_univ c) (minorXZ_zero_of_height s _ (I s c) (lt_of_not_ge hs))
  by_cases hα : (nu (false, t)).colLen 0 ≤ N0
  · by_cases hβ : (nu (true, t)).colLen 0 ≤ N0
    · rw [intersectionBound_eq_sum hα] at hj
      have hcut := rawLap_pow_vanishes_above_intersection (nu (false, t)) (nu (true, t)) hα hβ
        (fun c => I (false, t) c) (fun c => I (true, t) c) j hj
      have hrename := congrArg (rename (atPlace t)) hcut
      simpa only [rename_lap_pow, map_zero, map_mul, rawFlag, map_prod, rename_minor, P] using hrename
    · rw [hzero (true, t) hβ, mul_zero, map_zero]
  · rw [hzero (false, t) hα, zero_mul, map_zero]

theorem kernel_bound_with_intersection_cutoff (H : Type) [Fintype H] [DecidableEq H]
    (N0 N1 p : ℕ) [Fact p.Prime] (nu : Bool × H → YoungDiagram) (Th : MvPowerSeries (ZV H N0 N1) ℂ_[p])
    (hTh : ShapeH H p Th) :
    KvalGe N0 N1 p nu Th (-((∑ t : H, (intersectionBound (nu (false, t)) (nu (true, t)) : ℝ)) / 2)) := by
  refine core_of_cutoff (expand_of pExpCoeff) intersectionBound ?_ H N0 N1 p nu Th hTh
  intro H _ _ N0 N1 nu I m κ2 n t ht
  exact acon_eq_zero_of_lapT_pow pBridge pLapComm H N0 N1 nu I m κ2 n t
    (laplacian_vanishes_above_intersection H N0 N1 nu I t (n t) ht)

theorem previous_jet_bound_from_intersection : PI.EntAtD.EntAtD := by
  apply entAtD_of_core
  intro H _ _ N0 N1 p _ nu Th hTh I m
  have hp : (1 : ℝ) ≤ p := by exact_mod_cast (Fact.out : p.Prime).one_lt.le
  have hs : (∑ t : H, (intersectionBound (nu (false, t)) (nu (true, t)) : ℝ)) ≤
      ∑ t : H, (rowContractionBound (nu (false, t)) (nu (true, t)) : ℝ) := by
    exact Finset.sum_le_sum fun t _ => by exact_mod_cast
      intersectionBound_le_rowContractionBound (nu (false, t)) (nu (true, t))
  exact (kernel_bound_with_intersection_cutoff H N0 N1 p nu Th hTh I m).trans
    (Real.rpow_le_rpow_of_exponent_le hp (by linarith only [hs]))

private def alpha : YoungDiagram := YoungDiagram.ofRowLens [5, 2, 2] (by decide)
private def beta : YoungDiagram := YoungDiagram.ofRowLens [4, 4] (by decide)

theorem intersection_cutoff_can_save_two_beyond_both_row_bounds :
    rowContractionBound alpha beta = 8 ∧ rowContractionBound beta alpha = 8 ∧ intersectionBound alpha beta = 6 := by
  simp only [rowContractionBound, YoungDiagram.rowLen_eq_card, intersectionBound]
  decide +kernel

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``intersectionBound_le_rowContractionBound, ``intersectionBound_lt_rowContractionBound_of_row,
      ``laplacian_vanishes_above_intersection,
      ``kernel_bound_with_intersection_cutoff, ``previous_jet_bound_from_intersection,
      ``intersection_cutoff_can_save_two_beyond_both_row_bounds] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedIntersectionCutoffAudit
