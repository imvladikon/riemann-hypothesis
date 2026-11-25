module

import Lean
import all Formalism.LocalRingCardinality.CoeNeZeroOfNotMem
import all Formalism.SharpRestriction.Divisibility.OrbitPlaces
import all Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses
import all RamifiedIntersectionCutoffAudit

open Lean Elab Command
open Formalism.BasicNotions Formalism.BasicNotions.RowWeightLemmas
open Formalism.MainNotions.G Formalism.MainNotions.OrbitPlaces
open PI.EntAtD.W PI.SzCt.UnitaryGroupMassFormula RamifiedIntersectionCutoffAudit
open scoped BigOperators

namespace RamifiedTopThinAudit

private theorem nuRow_head_real (D : D7) (u : D.what₂.Word) (i : ℕ) (hi : i < D.R.m)
    (τ : D.what₂.Tau) (r : ℕ) (hr : r < D.R.k) :
    DV.nuRow D u (i + 1) τ r =
      (((D.hcW u τ).u ⟨r, hr⟩ : ℚ) : ℝ) + wj D (i + 1) τ -
      (2 * (D.R.N i : ℝ) + (D.R.t : ℝ) - 2 * (r : ℝ)) / 2 := by
  rw [nuRow_head D u i hi τ r hr]
  simp only [wj, Nat.add_sub_cancel, dite_eq_left hi, D.hcW_e]
  push_cast
  rfl

private theorem first_row_gt_second_off_top {D : D7} (L : SizeData₂ D) (u : D.what₂.Word)
    (i : ℕ) (hi : i < D.R.m) (τ : D.what₂.Tau) (ht : (D.eTau τ : D.R.GG) ∉ D.host.topPlaces) :
    DV.nuRow D u (i + 1) τ 1 < DV.nuRow D u (i + 1) τ 0 := by
  have hk := D.R.five_le_k
  let v₀ : Fin (D.R.k - 1) := ⟨0, by omega⟩
  let v₁ : Fin (D.R.k - 1) := ⟨1, by omega⟩
  have hv : (D.hc τ).v v₁ < (D.hc τ).v v₀ :=
    lt_trans ((D.hc τ).u_gt_v v₁) ((D.hc τ).v_gt_u v₀)
  have hv₁ : (0 : ℚ) ≤ (D.hc τ).v v₁ := by
    exact_mod_cast (L.cloud_v τ v₁).1
  obtain ⟨z, hz⟩ := (D.hc τ).v_int v₀
  have hzpos : 0 < z := by exact_mod_cast (hz ▸ lt_of_le_of_lt hv₁ hv)
  have hv₀ : (1 : ℝ) ≤ (((D.hc τ).v v₀ : ℚ) : ℝ) := by
    rw [hz]
    exact_mod_cast (show 1 ≤ z by omega)
  have hSc := hv₀.trans (L.cloud_v τ v₀).2
  have hgap := (L.cloud_gap τ (by omega) ht).1
  change L.Sc ≤ (((D.hc τ).u ⟨0, by omega⟩ - (D.hc τ).v v₀ : ℚ) : ℝ) at hgap
  push_cast at hgap
  have hvu := (D.hcW u τ).v_gt_u v₀
  rw [D.hcW_v] at hvu
  have hvu' : (((D.hcW u τ).u ⟨1, by omega⟩ : ℚ) : ℝ) < (((D.hc τ).v v₀ : ℚ) : ℝ) := by
    exact_mod_cast hvu
  rw [nuRow_head_real D u i hi τ 1 (by omega), nuRow_head_real D u i hi τ 0 (by omega), D.hcW_first]
  push_cast
  linarith

/-- A top place with a thin partner saves at least one contraction in the second row. -/
theorem top_thin_pair_saves_cutoff {D : D7} (L : SizeData₂ D) (E : Ent D)
    (hSize : Formalism.MainNotions.SizesAt L) (hx : 3 ≤ L.sc.x) (t : D.host.TT)
    (hthin : D.host.IsThin (D.eTau (tauPl D (true, (t : HH D))) : D.R.GG))
    (u : D.what₂.Word) (i : ℕ) (hi : i < D.R.m) :
    intersectionBound (E.nu u i (false, t)) (E.nu u i (true, t)) <
      rowContractionBound (E.nu u i (false, t)) (E.nu u i (true, t)) := by
  let τm := tauPl D (false, (t : HH D))
  let τp := tauPl D (true, (t : HH D))
  have hk := D.R.five_le_k
  have hkR : (5 : ℝ) ≤ D.R.k := by exact_mod_cast hk
  have hn : 1 < D.R.N i := by unfold Ranks.N; omega
  have hxpos : 0 < L.sc.x := by linarith
  have hbpos : 0 < L.sc.b' := by
    exact div_pos (mul_pos hxpos (Real.exp_pos _)) (Real.exp_pos _)
  obtain ⟨_, hη, hSc, hW, _, _, _⟩ := sizeFacts D L hSize hx
  have hW3 : L.sc.w'' D.R.n ≤ L.sc.b' / 3 :=
    hW.trans (div_le_div_of_nonneg_left hbpos.le (by norm_num) hx)
  have hη3 : L.etaSz * 3 ≤ L.sc.w'' D.R.n :=
    (mul_le_mul_of_nonneg_left hx L.etaSz_pos.le).trans ((le_div_iff₀ hxpos).mp hη)
  have hSc5 : 5 * L.Sc ≤ L.sc.w'' D.R.n :=
    (mul_le_mul_of_nonneg_right hkR L.Sc_pos.le).trans hSc
  have hTop := (L.win_top (i + 1) (by omega) (by omega) τm t ((placeFacts D).1 t)).1
  have hThin := (L.win_thin (i + 1) (by omega) (by omega) τp hthin).2
  have hGap : L.Sc < wj D (i + 1) τm - wj D (i + 1) τp := by
    linarith [L.bT_ge t]
  have hm := (L.cloud_u u τm ⟨1, by omega⟩ (Nat.le_refl 1) (by change 2 < D.R.k; omega)).1
  have hp := (L.cloud_u u τp ⟨1, by omega⟩ (Nat.le_refl 1) (by change 2 < D.R.k; omega)).2
  have hCross : DV.nuRow D u (i + 1) τp 1 < DV.nuRow D u (i + 1) τm 1 := by
    rw [nuRow_head_real D u i hi τp 1 (by omega), nuRow_head_real D u i hi τm 1 (by omega)]
    linarith
  have hHead := first_row_gt_second_off_top L u i hi τp hthin.2.1
  refine intersectionBound_lt_rowContractionBound_of_row _ _ 1 ?_ ?_
  · have h := hCross
    have hp' := E.nu_row u i hi (true, t) 1
    have hm' := E.nu_row u i hi (false, t) 1
    rw [ite_eq_left hn] at hp' hm'
    rw [← hp', ← hm'] at h
    exact_mod_cast h
  · have hp' := E.nu_row u i hi (true, t) 1
    have h0 := E.nu_row u i hi (true, t) 0
    rw [ite_eq_left hn] at hp'
    rw [ite_eq_left (Nat.zero_lt_of_lt hn)] at h0
    rw [← hp', ← h0] at hHead
    exact_mod_cast hHead

noncomputable def liftIntersectionGain {D : D7} (E : Ent D) (u : D.what₂.Word) (j : ℕ) : ℝ :=
  (∑ s : HH D, ((rowContractionBound (E.nu u (j - 1) (false, s)) (E.nu u (j - 1) (true, s)) : ℝ) -
    (intersectionBound (E.nu u (j - 1) (false, s)) (E.nu u (j - 1) (true, s)) : ℝ))) / 2

/-- One top–thin pair works at every lift of every word. -/
theorem top_thin_pair_saves_half_per_lift {D : D7} (L : SizeData₂ D) (E : Ent D)
    (hSize : Formalism.MainNotions.SizesAt L) (hx : 3 ≤ L.sc.x) (t : D.host.TT)
    (hthin : D.host.IsThin (D.eTau (tauPl D (true, (t : HH D))) : D.R.GG))
    (u : D.what₂.Word) :
    (D.R.m : ℝ) / 2 ≤ ∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j := by
  have hhalf (j : ℕ) (hj : j ∈ SizeData₂.lifts D) : (1 : ℝ) / 2 ≤ liftIntersectionGain E u j := by
    have hj' := Finset.mem_Icc.mp hj
    have hi : j - 1 < D.R.m := by omega
    let f (s : HH D) := rowContractionBound (E.nu u (j - 1) (false, s)) (E.nu u (j - 1) (true, s))
    let g (s : HH D) := intersectionBound (E.nu u (j - 1) (false, s)) (E.nu u (j - 1) (true, s))
    let loss (s : HH D) := (f s : ℝ) - (g s : ℝ)
    have hnonneg (s : HH D) : 0 ≤ loss s := by
      apply sub_nonneg.mpr
      exact_mod_cast intersectionBound_le_rowContractionBound (E.nu u (j - 1) (false, s)) (E.nu u (j - 1) (true, s))
    have hstrict : g t < f t := top_thin_pair_saves_cutoff L E hSize hx t hthin u (j - 1) hi
    have hgap : (1 : ℝ) ≤ loss t := by
      have h : (g t : ℝ) + 1 ≤ f t := by exact_mod_cast Nat.succ_le_of_lt hstrict
      exact le_sub_iff_add_le.mpr (by simpa only [add_comm] using h)
    have hsum := Finset.single_le_sum (f := loss) (fun s _ => hnonneg s) (Finset.mem_univ (t : HH D))
    change (1 : ℝ) / 2 ≤ (∑ s : HH D, loss s) / 2
    linarith only [hgap, hsum]
  calc
    _ = ∑ _j ∈ SizeData₂.lifts D, (1 : ℝ) / 2 := by
      simp [SizeData₂.lifts, Nat.card_Icc, div_eq_mul_inv]
    _ ≤ _ := Finset.sum_le_sum hhalf

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``top_thin_pair_saves_cutoff, ``top_thin_pair_saves_half_per_lift] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedTopThinAudit
