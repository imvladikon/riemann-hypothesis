module

import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Data.Nat.ModEq
public import Mathlib.Data.Nat.Totient
import Mathlib.NumberTheory.AbelSummation
import Mathlib.NumberTheory.Harmonic.Bounds
public import Mathlib.NumberTheory.PrimeCounting
import Lib.Analytic.PrimeProgressionSieve

/-!
# Logarithmically weighted primes in progressions

Partial summation converts the sieve count above `m ^ 2` to a bound for
`m ∑ log p / p` in a class modulo `m`. The small numbers `m c ± 1` give a harmonic
bound with `c ≤ m`.
-/

noncomputable section

open Finset MeasureTheory Nat Real

namespace PrimeProgressionWeights

private def coefficient (m a p : ℕ) : ℝ :=
  if p ≡ a [MOD m] ∧ p.Prime then m else 0

private def weightedCount (m a : ℕ) (t : ℝ) : ℝ :=
  ∑ p ∈ Icc 0 ⌊t⌋₊, coefficient m a p

private lemma weightedCount_nonneg (m a : ℕ) (t : ℝ) : 0 ≤ weightedCount m a t := by
  apply sum_nonneg
  intro p _
  unfold coefficient
  positivity

private lemma weightedCount_le (m a : ℕ) (hm : 2 ≤ m) (hφ : (m.totient : ℝ) = (m : ℝ) / 2)
    {t : ℝ} (ht : (m : ℝ) ^ 2 ≤ t) : weightedCount m a t ≤ 864 * t / Real.log t := by
  let n := ⌊t⌋₊ + 1
  have hm' : (2 : ℝ) ≤ m := by exact_mod_cast hm
  have hm_pos : (0 : ℝ) < m := by linarith
  have ht₁ : 1 < t := by nlinarith
  have ht_pos := zero_lt_one.trans ht₁
  have htn : t ≤ (n : ℝ) := by
    simpa only [n, Nat.cast_add, Nat.cast_one] using (lt_floor_add_one t).le
  have hn_le : (n : ℝ) ≤ 2 * t := by
    dsimp [n]
    rw [Nat.cast_add, Nat.cast_one]
    linarith [Nat.floor_le ht_pos.le]
  have hn_pos : (0 : ℝ) < n := ht_pos.trans_le htn
  have hu : 1 < (n : ℝ) / m := by
    rw [lt_div_iff₀ hm_pos, one_mul]
    exact (show (m : ℝ) < (m : ℝ) ^ 2 by nlinarith).trans_le (ht.trans htn)
  have h_log : Real.log t / 2 ≤ Real.log ((n : ℝ) / m) := by
    rw [Real.log_div hn_pos.ne' hm_pos.ne']
    have hnm := Real.log_le_log (sq_pos_of_pos hm_pos) (ht.trans htn)
    rw [Real.log_pow, Nat.cast_ofNat] at hnm
    linarith [Real.log_le_log ht_pos htn]
  have hcount := PrimeProgressionSieve.card_primes_progression_le_div_log_of_totient_eq_half
    n m a (by omega) hu hφ
  have h_log_half_pos : 0 < Real.log t / 2 := div_pos (Real.log_pos ht₁) (by norm_num)
  calc
    weightedCount m a t = (#{p ∈ range n | p ≡ a [MOD m] ∧ p.Prime} : ℝ) * m := by
      simp only [n, weightedCount, coefficient, Nat.range_succ_eq_Icc_zero, ← sum_filter,
        sum_const, nsmul_eq_mul]
    _ ≤ (216 * ((n : ℝ) / m) / Real.log ((n : ℝ) / m)) * m :=
      mul_le_mul_of_nonneg_right hcount hm_pos.le
    _ = 216 * (n : ℝ) / Real.log ((n : ℝ) / m) := by
      field_simp [hm_pos.ne', (Real.log_pos hu).ne']
    _ ≤ 216 * (2 * t) / (Real.log t / 2) := by gcongr
    _ = _ := by ring

private lemma hasDerivAt_log_div {t : ℝ} (ht : 0 < t) :
    HasDerivAt (fun x : ℝ ↦ Real.log x / x) ((1 - Real.log t) / t ^ 2) t := by
  convert (Real.hasDerivAt_log ht.ne').div (hasDerivAt_id t) ht.ne' using 1
  · rfl
  · simp [inv_mul_cancel₀ ht.ne']

/-- The weighted sum over one residue class above `m ^ 2` is logarithmic after
multiplication by `m`, for moduli with `φ(m) = m / 2`. -/
public theorem mul_sum_log_div_modEq_le_above_square (x m a : ℕ) (hm : 2 ≤ m)
    (hx : m ^ 2 ≤ x) (hφ : (m.totient : ℝ) = (m : ℝ) / 2) :
    (m : ℝ) * ∑ p ∈ (Ioc (m ^ 2) x).filter (fun p ↦ p ≡ a [MOD m] ∧ p.Prime),
      Real.log p / p ≤ 864 * (1 + Real.log x) := by
  let lo := ((m ^ 2 : ℕ) : ℝ)
  let hi := (x : ℝ)
  let f (t : ℝ) := Real.log t / t
  let A (t : ℝ) := weightedCount m a t
  have hm' : (2 : ℝ) ≤ m := by exact_mod_cast hm
  have hlo_eq : lo = (m : ℝ) ^ 2 := by norm_cast
  have hlo₁ : 1 < lo := by rw [hlo_eq]; nlinarith
  have hlo := zero_lt_one.trans hlo₁
  have hle : lo ≤ hi := by
    unfold lo hi
    exact_mod_cast hx
  have hhi₁ := hlo₁.trans_le hle
  have hhi := hlo.trans_le hle
  have h_diff (t : ℝ) (ht : 0 < t) : DifferentiableAt ℝ f t :=
    (hasDerivAt_log_div ht).differentiableAt
  have h_deriv (t : ℝ) (ht : 0 < t) : deriv f t = (1 - Real.log t) / t ^ 2 :=
    (hasDerivAt_log_div ht).deriv
  have h_deriv_int : IntegrableOn (deriv f) (Set.Icc lo hi) := by
    apply ContinuousOn.integrableOn_Icc
    refine (show ContinuousOn (fun t : ℝ ↦ (1 - Real.log t) / t ^ 2) (Set.Icc lo hi) from ?_).congr ?_
    · intro t ht
      have ht_pos := hlo.trans_le ht.1
      apply ContinuousAt.continuousWithinAt
      fun_prop (disch := positivity)
    · intro t ht
      exact h_deriv t (hlo.trans_le ht.1)
  have h_abel := sum_mul_eq_sub_sub_integral_mul' (coefficient m a) hx
    (fun t ht ↦ h_diff t (hlo.trans_le ht.1)) h_deriv_int
  have h_weight :
      ∑ p ∈ Ioc (m ^ 2) x, f p * coefficient m a p =
        (m : ℝ) * ∑ p ∈ (Ioc (m ^ 2) x).filter (fun p ↦ p ≡ a [MOD m] ∧ p.Prime), f p := by
    simp only [coefficient, mul_ite, mul_zero, ← sum_filter]
    rw [mul_sum]
    exact sum_congr rfl fun p _ ↦ mul_comm _ _
  have h_A_nat (n : ℕ) : A n = ∑ p ∈ Icc 0 n, coefficient m a p := by
    simp only [A, weightedCount, Nat.floor_natCast]
  rw [h_weight, ← h_A_nat x, ← h_A_nat (m ^ 2)] at h_abel
  change _ = f hi * A hi - f lo * A lo -
    (∫ t in Set.Ioc lo hi, deriv f t * A t) at h_abel
  have h_nonneg_lo : 0 ≤ f lo * A lo :=
    mul_nonneg (div_nonneg (Real.log_nonneg hlo₁.le) hlo.le) (weightedCount_nonneg m a lo)
  have h_hi : f hi * A hi ≤ 864 := calc
    _ ≤ f hi * (864 * hi / Real.log hi) :=
      mul_le_mul_of_nonneg_left (weightedCount_le m a hm hφ (hlo_eq ▸ hle))
        (div_nonneg (Real.log_nonneg hhi₁.le) hhi.le)
    _ = _ := by dsimp [f]; field_simp [hhi.ne', (Real.log_pos hhi₁).ne']
  have h_product_int : IntegrableOn (fun t ↦ deriv f t * A t) (Set.Ioc lo hi) :=
    (integrableOn_mul_sum_Icc (coefficient m a) hlo.le h_deriv_int).mono_set Set.Ioc_subset_Icc_self
  have h_inverse_int : IntegrableOn (fun t : ℝ ↦ (864 : ℝ) / t) (Set.Ioc lo hi) := by
    apply IntegrableOn.mono_set _ Set.Ioc_subset_Icc_self
    apply ContinuousOn.integrableOn_Icc
    intro t ht
    have ht_pos := hlo.trans_le ht.1
    apply ContinuousAt.continuousWithinAt
    fun_prop (disch := exact ht_pos.ne')
  have h_neg_int : -(∫ t in Set.Ioc lo hi, deriv f t * A t) ≤
      ∫ t in Set.Ioc lo hi, (864 : ℝ) / t := by
    rw [← integral_neg]
    refine setIntegral_mono_on h_product_int.neg h_inverse_int measurableSet_Ioc fun t ht ↦ ?_
    have ht₁ := hlo₁.trans ht.1
    have ht_pos := zero_lt_one.trans ht₁
    have h_A := weightedCount_le m a hm hφ (hlo_eq ▸ ht.1.le)
    have h_d : -(deriv f t) ≤ Real.log t / t ^ 2 := by
      rw [h_deriv t ht_pos, ← neg_div]
      gcongr
      linarith
    calc
      _ = -(deriv f t) * A t := (neg_mul _ _).symm
      _ ≤ (Real.log t / t ^ 2) * A t :=
        mul_le_mul_of_nonneg_right h_d (weightedCount_nonneg m a t)
      _ ≤ (Real.log t / t ^ 2) * (864 * t / Real.log t) :=
        mul_le_mul_of_nonneg_left h_A (by positivity [Real.log_pos ht₁])
      _ = _ := by field_simp [ht_pos.ne', (Real.log_pos ht₁).ne']
  have h_inv_bound : (∫ t in Set.Ioc lo hi, (864 : ℝ) / t) ≤ 864 * Real.log hi := by
    calc
      _ = 864 * Real.log (hi / lo) := by
        rw [← intervalIntegral.integral_of_le hle]
        simp_rw [show ∀ t : ℝ, 864 / t = 864 * (1 / t) from fun t ↦ by simp [div_eq_mul_inv]]
        rw [intervalIntegral.integral_const_mul, integral_one_div_of_pos hlo hhi]
      _ ≤ _ := mul_le_mul_of_nonneg_left
        (Real.log_le_log (div_pos hhi hlo) (div_le_self hhi.le hlo₁.le)) (by norm_num)
  change _ ≤ 864 * (1 + Real.log hi)
  linarith only [h_abel, h_nonneg_lo, h_hi, h_neg_int, h_inv_bound]

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
