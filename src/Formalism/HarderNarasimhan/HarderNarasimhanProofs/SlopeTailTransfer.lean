module

public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section

open Finset MeasureTheory

namespace Formalism.HN

noncomputable section

/-- The fraction of a finite family of slopes strictly below the threshold `s - t`. -/
def slopeTail {ι : Type*} [Fintype ι] (a : ι → ℝ) (s t : ℝ) : ℝ :=
  (∑ i, if t < s - a i then (1 : ℝ) else 0) / Fintype.card ι

theorem slopeTail_eq_card_filter {ι : Type*} [Fintype ι] (a : ι → ℝ) (s t : ℝ) :
    slopeTail a s t = ((univ.filter (fun i => a i < s - t)).card : ℝ) / Fintype.card ι := by
  unfold slopeTail
  rw [Finset.sum_boole, Finset.filter_congr (q := fun i => a i < s - t)
    (fun i _ => by constructor <;> intro h <;> linarith)]

theorem slopeTail_nonneg {ι : Type*} [Fintype ι] (a : ι → ℝ) (s t : ℝ) :
    0 ≤ slopeTail a s t := by
  rw [slopeTail_eq_card_filter]
  exact div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)

theorem slopeTail_sigma {ι : Type*} [Fintype ι] {κ : ι → Type*} [∀ i, Fintype (κ i)]
    (a : ∀ i, κ i → ℝ) (s t : ℝ) :
    slopeTail (fun j : Sigma κ => a j.1 j.2) s t =
      (∑ i, ((univ.filter (fun j => a i j < s - t)).card : ℝ)) /
        (∑ i, (Fintype.card (κ i) : ℝ)) := by
  unfold slopeTail
  rw [Fintype.sum_sigma, Fintype.card_sigma, Nat.cast_sum]
  congr 1
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Finset.sum_boole, Finset.filter_congr (q := fun j => a i j < s - t)
    (fun j _ => by
      change t < s - a i j ↔ a i j < s - t
      constructor <;> intro h <;> linarith)]

private theorem antitone_step (d : ℝ) : Antitone (fun t : ℝ => if t < d then (1 : ℝ) else 0) := by
  intro t₁ t₂ ht
  by_cases h₂ : t₂ < d
  · simp [h₂, lt_of_le_of_lt ht h₂]
  · by_cases h₁ : t₁ < d <;> simp [h₁, h₂]

private theorem antitone_slopeTail {ι : Type*} [Fintype ι] (a : ι → ℝ) (s : ℝ) :
    Antitone (slopeTail a s) := by
  intro t₁ t₂ ht
  exact div_le_div_of_nonneg_right (Finset.sum_le_sum fun i _ => antitone_step (s - a i) ht)
    (Nat.cast_nonneg _)

/-- The loss below `s` seen through the window of depths between `0` and `H`. -/
private def clippedDeficit (s H a : ℝ) : ℝ := min H (max 0 (s - a))

private theorem integral_step {d H : ℝ} (hH : 0 ≤ H) :
    (∫ t in (0 : ℝ)..H, if t < d then (1 : ℝ) else 0) = min H (max 0 d) := by
  set c := min H (max 0 d) with hc
  have hmem : c ∈ Set.Icc 0 H := ⟨le_min hH (le_max_left ..), min_le_left ..⟩
  calc
    _ = ∫ t in (0 : ℝ)..H, (Set.Iic c).indicator (fun _ => (1 : ℝ)) t := by
      have hne : ∀ᵐ t ∂(volume : Measure ℝ), t ≠ c := by simp [ae_iff]
      apply intervalIntegral.integral_congr_ae
      filter_upwards [hne] with t ht ht'
      rw [Set.uIoc_of_le hH] at ht'
      have hiff : t < d ↔ t ≤ c := by
        constructor
        · intro htd
          exact le_min ht'.2 (htd.le.trans (le_max_right ..))
        · intro htc
          have hmax := (lt_of_le_of_ne htc ht).trans_le (min_le_right H (max 0 d))
          rcases max_choice 0 d with h | h
          · exact (lt_asymm ht'.1 (h ▸ hmax)).elim
          · exact h ▸ hmax
      simp only [Set.indicator_apply, Set.mem_Iic, hiff]
    _ = ∫ _ in (0 : ℝ)..c, (1 : ℝ) := intervalIntegral.integral_indicator hmem
    _ = c := by simp

private theorem integral_slopeTail {ι : Type*} [Fintype ι] (a : ι → ℝ) (s : ℝ) {H : ℝ}
    (hH : 0 ≤ H) :
    (∫ t in (0 : ℝ)..H, slopeTail a s t) = (∑ i, clippedDeficit s H (a i)) / Fintype.card ι := by
  simp only [slopeTail, div_eq_mul_inv]
  rw [intervalIntegral.integral_mul_const, intervalIntegral.integral_finsetSum]
  · simp_rw [integral_step hH, clippedDeficit]
  · exact fun i _ => (antitone_step (s - a i)).intervalIntegrable

private theorem clippedDeficit_le {s u H a : ℝ} (hu : 0 ≤ u) (hH : 0 ≤ H) (ha : a ≤ s + u) :
    clippedDeficit s H a ≤ H / (u + H) * (s + u - a) := by
  by_cases h : u + H = 0
  · have : H = 0 := by linarith
    simp [clippedDeficit, this]
  have hp : 0 < u + H := lt_of_le_of_ne (add_nonneg hu hH) (Ne.symm h)
  rw [div_mul_eq_mul_div, le_div_iff₀ hp]
  by_cases hs : s ≤ a
  · rw [clippedDeficit, max_eq_left (sub_nonpos.mpr hs), min_eq_right hH, zero_mul]
    exact mul_nonneg hH (sub_nonneg.mpr ha)
  rw [clippedDeficit, max_eq_right (sub_nonneg.mpr (le_of_not_ge hs))]
  by_cases hcut : s - a ≤ H
  · rw [min_eq_right hcut]
    nlinarith only [mul_le_mul_of_nonneg_right hcut hu]
  · rw [min_eq_left (le_of_not_ge hcut)]
    exact mul_le_mul_of_nonneg_left (by linarith) hH

private theorem integral_slopeTail_le {ι : Type*} [Fintype ι] (a : ι → ℝ) {s u H : ℝ}
    (hR : 0 < Fintype.card ι) (hu : 0 ≤ u) (hH : 0 ≤ H)
    (hm : s * (Fintype.card ι : ℝ) ≤ ∑ i, a i) (ha : ∀ i, a i ≤ s + u) :
    (∫ t in (0 : ℝ)..H, slopeTail a s t) ≤ u * H / (u + H) := by
  have hR' : (0 : ℝ) < Fintype.card ι := Nat.cast_pos.mpr hR
  have hsum : ∑ i, (s + u - a i) ≤ (Fintype.card ι : ℝ) * u := by
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
    linarith
  rw [integral_slopeTail a s hH, div_le_iff₀ hR']
  calc
    _ ≤ ∑ i, H / (u + H) * (s + u - a i) :=
      Finset.sum_le_sum fun i _ => clippedDeficit_le hu hH (ha i)
    _ = H / (u + H) * ∑ i, (s + u - a i) := (Finset.mul_sum ..).symm
    _ ≤ H / (u + H) * ((Fintype.card ι : ℝ) * u) :=
      mul_le_mul_of_nonneg_left hsum (div_nonneg hH (add_nonneg hu hH))
    _ = _ := by ring

/-- Transfer a mean slope bound by integrating the actual source tail through the target window. -/
theorem mean_ge_of_slopeTail_le {ι κ : Type*} [Fintype ι] [Fintype κ]
    (a : ι → ℝ) (b : κ → ℝ) {s u H A B : ℝ}
    (hR : 0 < Fintype.card ι) (hD : 0 < Fintype.card κ) (hu : 0 ≤ u) (hH : 0 ≤ H) (hB : 0 ≤ B)
    (hm : s * (Fintype.card ι : ℝ) ≤ ∑ i, a i) (ha : ∀ i, a i ≤ s + u)
    (hb : ∀ j, s - H ≤ b j)
    (htail : ∀ t ∈ Set.Icc (0 : ℝ) H, slopeTail b s t ≤ A + B * slopeTail a s t) :
    s - (A * H + B * (u * H / (u + H))) ≤ (∑ j, b j) / Fintype.card κ := by
  have hD' : (0 : ℝ) < Fintype.card κ := Nat.cast_pos.mpr hD
  have hdeficit : s - (∑ j, b j) / Fintype.card κ ≤ ∫ t in (0 : ℝ)..H, slopeTail b s t := by
    rw [integral_slopeTail b s hH, sub_le_iff_le_add, ← add_div, le_div_iff₀ hD']
    have hsum : (∑ j, (s - b j)) ≤ ∑ j, clippedDeficit s H (b j) := by
      refine Finset.sum_le_sum fun j _ => ?_
      exact le_min (by linarith [hb j]) (le_max_right ..)
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, nsmul_eq_mul] at hsum
    linarith
  have haInt : IntervalIntegrable (slopeTail a s) volume 0 H :=
    (antitone_slopeTail a s).intervalIntegrable
  have htransfer : (∫ t in (0 : ℝ)..H, slopeTail b s t) ≤
      A * H + B * (∫ t in (0 : ℝ)..H, slopeTail a s t) := by
    calc
      _ ≤ ∫ t in (0 : ℝ)..H, A + B * slopeTail a s t :=
        intervalIntegral.integral_mono_on hH (antitone_slopeTail b s).intervalIntegrable
          (intervalIntegrable_const.add (haInt.const_mul B)) htail
      _ = _ := by
        rw [intervalIntegral.integral_add intervalIntegrable_const (haInt.const_mul B),
          intervalIntegral.integral_const, intervalIntegral.integral_const_mul, smul_eq_mul]
        ring
  linarith [hdeficit.trans htransfer, mul_le_mul_of_nonneg_left
    (integral_slopeTail_le a hR hu hH hm ha) hB]

/-- Compatibility with the log loss obtained from a separate worst-case bound at each depth. -/
theorem clipped_slope_loss_le_log {u H : ℝ} (hu : 0 ≤ u) (hH : 0 ≤ H) :
    u * H / (u + H) ≤ u * Real.log (1 + H / u) := by
  rcases hu.eq_or_lt with h | hu
  · simp [← h]
  have hpos : 0 < 1 + H / u := by linarith [div_nonneg hH hu.le]
  have hsum : 0 < u + H := add_pos_of_pos_of_nonneg hu hH
  have he : 1 - (1 + H / u)⁻¹ = H / (u + H) := by
    have hrew : 1 + H / u = (u + H) / u := by field_simp
    rw [hrew, inv_div]
    field_simp
    ring
  rw [mul_div_assoc, ← he]
  exact mul_le_mul_of_nonneg_left (Real.one_sub_inv_le_log_of_pos hpos) hu.le

end

end Formalism.HN
