module

import Mathlib.Analysis.Complex.ExponentialBounds
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Data.Nat.ModEq
public import Mathlib.Data.Nat.Totient
import Mathlib.NumberTheory.Harmonic.Bounds
public import Mathlib.NumberTheory.PrimeCounting
import Lib.Analytic.PrimeProgressionSieve

/-!
# Logarithmically weighted primes in progressions

Dyadic intervals convert the sieve count above `m ^ 2` to a bound for
`m ∑ log p / p` in a class modulo `m`. The small numbers `m c ± 1` give a harmonic
bound with `c ≤ m`.
-/

noncomputable section

open Finset Real

namespace PrimeProgressionWeights

/-- A count bound on each dyadic upper endpoint bounds the weighted sum over that shell. -/
private theorem sum_log_div_le_of_dyadic_count (U : Finset ℕ) (x lower : ℕ) (hx : 0 < x)
    {scale bound : ℝ} (hs : 0 ≤ scale) (hb : 0 ≤ bound)
    (hU : ∀ p ∈ U, 0 < p ∧ lower ≤ p ∧ p ≤ x)
    (h_count : ∀ n : ℕ, lower < n →
      scale * (#{p ∈ U | p < n} : ℝ) * log n ≤ bound * n) :
    scale * ∑ p ∈ U, log p / p ≤ 3 * bound * (1 + log x) := by
  classical
  let w (p : ℕ) : ℝ := log p / p
  let bins := range (x.log2 + 1)
  have h_bin (p : ℕ) (hp : p ∈ U) : p.log2 ∈ bins := by
    obtain ⟨hp₀, _, hpx⟩ := hU p hp
    exact mem_range.mpr (Nat.lt_succ_of_le ((Nat.le_log2 hx.ne').2
      (((Nat.le_log2 hp₀.ne').1 le_rfl).trans hpx)))
  have h_shell (k : ℕ) : scale * ∑ p ∈ U with p.log2 = k, w p ≤ 2 * bound := by
    let shell := U.filter (fun p ↦ p.log2 = k)
    let lo : ℕ := 2 ^ k
    let hi : ℕ := 2 ^ (k + 1)
    change scale * ∑ p ∈ shell, w p ≤ 2 * bound
    by_cases hn : shell.Nonempty
    · have h_limits (p : ℕ) (hp : p ∈ shell) : lo ≤ p ∧ p < hi :=
        (Nat.log2_eq_iff (hU p (mem_filter.mp hp).1).1.ne').1 (mem_filter.mp hp).2
      obtain ⟨p, hp⟩ := hn
      have hhi : lower < hi := (hU p (mem_filter.mp hp).1).2.1.trans_lt (h_limits p hp).2
      have hlo : (0 : ℝ) < lo := by dsimp [lo]; positivity
      have hhi_pos : (0 : ℝ) < hi := by dsimp [hi]; positivity
      have h_weights : ∑ p ∈ shell, w p ≤ (#shell : ℝ) * (log hi / lo) := by
        rw [← nsmul_eq_mul, ← sum_const]
        apply sum_le_sum
        intro p hp
        have hp0 : (0 : ℝ) < p := by exact_mod_cast (hU p (mem_filter.mp hp).1).1
        have hp_lo : (lo : ℝ) ≤ p := by exact_mod_cast (h_limits p hp).1
        have hp_hi : (p : ℝ) ≤ hi := by exact_mod_cast (h_limits p hp).2.le
        apply div_le_div_of_nonneg_left (Real.log_natCast_nonneg p) hlo hp_lo |>.trans
        exact div_le_div_of_nonneg_right (Real.log_le_log hp0 hp_hi) hlo.le
      have h_card : (#shell : ℝ) ≤ (#{p ∈ U | p < hi} : ℝ) := by
        exact_mod_cast card_le_card (fun p hp ↦ mem_filter.mpr ⟨(mem_filter.mp hp).1, (h_limits p hp).2⟩)
      calc
        _ ≤ scale * ((#shell : ℝ) * (log hi / lo)) := mul_le_mul_of_nonneg_left h_weights hs
        _ = (scale * (#shell : ℝ) * log hi) / lo := by ring
        _ ≤ (bound * hi) / lo := by
          apply div_le_div_of_nonneg_right _ hlo.le
          exact (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left h_card hs)
            (Real.log_natCast_nonneg hi)).trans (h_count hi hhi)
        _ = _ := by dsimp [hi, lo]; push_cast [pow_succ]; field_simp
    · rw [not_nonempty_iff_eq_empty.mp hn, sum_empty, mul_zero]
      positivity
  have h_log2 : (x.log2 : ℝ) * log 2 ≤ log x := by
    have hx_pow : (2 : ℝ) ^ x.log2 ≤ x := by
      exact_mod_cast (Nat.le_log2 hx.ne').1 (le_refl x.log2)
    simpa only [Real.log_pow] using Real.log_le_log (by positivity) hx_pow
  have h_bins : (x.log2 : ℝ) ≤ (3 / 2 : ℝ) * log x := by
    have hlog : (2 / 3 : ℝ) ≤ log 2 := by linarith [Real.log_two_gt_d9]
    linarith [mul_le_mul_of_nonneg_left hlog (Nat.cast_nonneg x.log2)]
  change scale * ∑ p ∈ U, w p ≤ _
  rw [← sum_fiberwise_of_maps_to h_bin w, mul_sum]
  calc
    _ ≤ ∑ _k ∈ bins, 2 * bound := sum_le_sum fun k _ ↦ h_shell k
    _ = (2 * bound) * ((x.log2 : ℝ) + 1) := by simp [bins, mul_comm]
    _ ≤ _ := by
      have h := mul_le_mul_of_nonneg_left h_bins hb
      nlinarith only [h, hb]

/-- The weighted sum over one residue class above `m ^ 2` is logarithmic after
multiplication by `m`, for moduli with `φ(m) = m / 2`. -/
public theorem mul_sum_log_div_modEq_le_above_square (x m a : ℕ) (hm : 2 ≤ m)
    (hx : m ^ 2 ≤ x) (hφ : (m.totient : ℝ) = (m : ℝ) / 2) :
    (m : ℝ) * ∑ p ∈ (Ioc (m ^ 2) x).filter (fun p ↦ p ≡ a [MOD m] ∧ p.Prime), log p / p ≤
      864 * (1 + log x) := by
  classical
  let U := (Ioc (m ^ 2) x).filter (fun p ↦ p ≡ a [MOD m] ∧ p.Prime)
  have hm' : (2 : ℝ) ≤ m := by exact_mod_cast hm
  have hm₀ : (0 : ℝ) < m := by linarith
  have hx₀ : 0 < x := (pow_pos (by omega : 0 < m) 2).trans_le hx
  have hU (p : ℕ) (hp : p ∈ U) : 0 < p ∧ m ^ 2 ≤ p ∧ p ≤ x := by
    obtain ⟨hp₁, hp₂⟩ := mem_Ioc.mp (mem_filter.mp hp).1
    exact ⟨Nat.zero_le (m ^ 2) |>.trans_lt hp₁, hp₁.le, hp₂⟩
  have h_count (n : ℕ) (hn : m ^ 2 < n) :
      (m : ℝ) * (#{p ∈ U | p < n} : ℝ) * log n ≤ 288 * n := by
    have hn' : (m : ℝ) ^ 2 < n := by exact_mod_cast hn
    have hn₀ : (0 : ℝ) < n := (sq_nonneg (m : ℝ)).trans_lt hn'
    have hu : 1 < (n : ℝ) / m := by
      rw [lt_div_iff₀ hm₀, one_mul]
      exact (show (m : ℝ) ≤ (m : ℝ) ^ 2 by nlinarith).trans_lt hn'
    have h_log : log n ≤ 2 * log ((n : ℝ) / m) := by
      rw [Real.log_div hn₀.ne' hm₀.ne']
      have h := Real.log_le_log (sq_pos_of_pos hm₀) hn'.le
      rw [Real.log_pow, Nat.cast_ofNat] at h
      linarith
    have h_subset : U.filter (fun p ↦ p < n) ⊆ (range n).filter (fun p ↦ p ≡ a [MOD m] ∧ p.Prime) := by
      intro p hp
      exact mem_filter.mpr ⟨mem_range.mpr (mem_filter.mp hp).2, (mem_filter.mp (mem_filter.mp hp).1).2⟩
    have h_card := (show (#{p ∈ U | p < n} : ℝ) ≤
        (#{p ∈ range n | p ≡ a [MOD m] ∧ p.Prime} : ℝ) by exact_mod_cast card_le_card h_subset).trans
      (PrimeProgressionSieve.card_primes_progression_le_div_log_of_totient_eq_half
        n m a (by omega) hu hφ)
    have hl_pos := Real.log_pos hu
    calc
      _ ≤ (m : ℝ) * (144 * ((n : ℝ) / m) / log ((n : ℝ) / m)) * (2 * log ((n : ℝ) / m)) := by
        gcongr
      _ = _ := by field_simp [hm₀.ne', hl_pos.ne']; ring
  simpa only [U, show (3 : ℝ) * 288 = 864 by norm_num] using
    sum_log_div_le_of_dyadic_count U x (m ^ 2) hx₀ hm₀.le (by norm_num) hU h_count

/-- The small terms in the two progressions are bounded by a harmonic sum up to `m`. -/
public theorem mul_sum_log_div_le_below_square {m : ℕ} (hm : 2 ≤ m) (U : Finset ℕ)
    (hU : ∀ p ∈ U, 2 ≤ p ∧ p ≤ m ^ 2 ∧
      ∃ c : ℕ, 1 ≤ c ∧ (m * c - 1 = p ∨ m * c + 1 = p)) :
    (m : ℝ) * ∑ p ∈ U, Real.log p / p ≤ 8 * Real.log m * (1 + Real.log m) := by
  classical
  have hm_one : 1 ≤ m := by omega
  have hlog_m : 0 ≤ Real.log (m : ℝ) := Real.log_nonneg (by exact_mod_cast hm_one)
  let T := 4 * Real.log (m : ℝ)
  let J := Icc 1 m ×ˢ range 2
  let served (u : ℕ × ℕ) := if u.2 = 0 then m * u.1 - 1 else m * u.1 + 1
  have h_term (p : ℕ) (hp : p ∈ U) :
      (m : ℝ) * (Real.log p / p) ≤ ∑ u ∈ J with served u = p, T / u.1 := by
    obtain ⟨hp_two, hp_le, c, hc, h_eq⟩ := hU p hp
    have h_prod_le : m * c ≤ p + 1 := by rcases h_eq with h | h <;> omega
    have hc_le : c ≤ m := by
      by_contra! hlt
      have hmul := Nat.mul_le_mul_left m (Nat.succ_le_of_lt hlt)
      have h : m * m + m ≤ m * m + 1 := by
        simpa only [Nat.mul_succ, pow_two] using hmul.trans (h_prod_le.trans
          (Nat.add_le_add_right hp_le 1))
      omega
    obtain ⟨r, hr, h_served⟩ : ∃ r : ℕ, r < 2 ∧ served (c, r) = p := by
      rcases h_eq with h | h
      · exact ⟨0, by decide, by simpa [served] using h⟩
      · exact ⟨1, by decide, by simpa [served] using h⟩
    have hp_pos : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
    have hc_pos : (0 : ℝ) < c := by exact_mod_cast hc
    have h_log_p : Real.log (p : ℝ) ≤ 2 * Real.log (m : ℝ) := by
      have h := Real.log_le_log hp_pos (show (p : ℝ) ≤ (m : ℝ) ^ 2 by exact_mod_cast hp_le)
      simpa only [Real.log_pow, Nat.cast_ofNat] using h
    have h_ratio : (m : ℝ) / p ≤ 2 / c :=
      (div_le_div_iff₀ hp_pos hc_pos).2 (by exact_mod_cast (show m * c ≤ 2 * p by omega))
    calc
      _ = (m : ℝ) / p * Real.log p := by ring
      _ ≤ (2 / (c : ℝ)) * (2 * Real.log m) :=
        mul_le_mul h_ratio h_log_p (Real.log_nonneg (by exact_mod_cast (show 1 ≤ p by omega)))
          (by positivity)
      _ = T / c := by dsimp [T]; ring
      _ ≤ _ := single_le_sum (f := fun u : ℕ × ℕ ↦ T / u.1) (a := (c, r))
        (fun _ _ ↦ by positivity) (by simp [J, hc, hc_le, hr, h_served])
  have h_harmonic : ∑ c ∈ Icc 1 m, (c : ℝ)⁻¹ ≤ 1 + Real.log m := by
    simpa [harmonic_eq_sum_Icc] using harmonic_floor_le_one_add_log (m : ℝ) (by exact_mod_cast hm_one)
  calc
    _ = ∑ p ∈ U, (m : ℝ) * (Real.log p / p) := mul_sum _ _ _
    _ ≤ ∑ u ∈ J, T / u.1 := by
      grw [sum_le_sum fun p hp ↦ h_term p hp, sum_fiberwise_eq_sum_filter, filter_subset]
    _ = T * (2 * ∑ c ∈ Icc 1 m, (c : ℝ)⁻¹) := by simp [J, sum_product, division_def, ← mul_sum]
    _ ≤ T * (2 * (1 + Real.log m)) := by gcongr
    _ = _ := by dsimp [T]; ring

end PrimeProgressionWeights
