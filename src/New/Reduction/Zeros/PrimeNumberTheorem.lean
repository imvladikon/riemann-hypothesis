module

import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.MeasureTheory.Function.Floor
import Mathlib.NumberTheory.LSeries.SumCoeff
import TauCeti.NumberTheory.LSeries.LogBoundedCoeff
import TauCeti.NumberTheory.LSeries.SmoothedSum.ZeroFreeRegion
import Lib.Analytic.PrimeNumberTheorem.Tauberian
import Lib.Analytic.PrimeNumberTheorem.ZeroFreeRegion
public import New.Reduction.Zeros.PrimeError

/-!
# The prime number theorem for the remainders `R_q`

Let `d` be a prime and `q ≥ 1`. The remainder `R_q(y)` is an integral of the error `𝓔_q(t)` in the
weighted count (`primeRemainder_eq_integral_countError_sub`). For odd `d` prime to `q`,
Ingham's theorem supplies a square-root exponential error for the unsmoothed count. Partial
summation and dominated convergence give the normalization constant. The remainder is then the
negative integral of that error over the tail and tends to zero.

Notions from other files:
* `lambdaKResidueClass d q n` is `λ(n) = Λ(n) (1 - (n/d))` for `n ≡ 1` mod `q`, and `0` for other
  `n`.
* `entireL ψ` is `L(s, ψ)`, multiplied by `s - 1` if `ψ` is principal; `quadTwist ψ d` is the
  product of `ψ` and the Legendre symbol `(·/d)`.
* `logDerivMean d q` is the function `G_q` that continues `∑ λ(n) n ^ (-s) - s / (φ(q) (s - 1))`
  when `d` is odd and prime to `q`.
* `primeRemainder d q y` is `R_q(y) = ∑_{n ≤ y} λ(n) (1/n - 1/y) - log y / φ(q) - c_q` with
  `c_q = re G_q(1)`.

## Relation to the literature

Known result: Prime number theorem in arithmetic progressions with an error term that saves every
power of the logarithm. It is a case of the Siegel–Walfisz theorem. Source: Montgomery and Vaughan,
Multiplicative Number Theory I, 2007, Cor. 11.19. Form here: the modulus is fixed, and the count is
the smoothed sum `∑_{n ≤ y} λ(n) (1/n - 1/y)` over the prime powers `n ≡ 1` mod `q`; for `d ≡ 3` mod
`4` the primes that split in `ℚ(√-d)` have weight zero.
-/

@[expose] public section

open ArithmeticFunction.vonMangoldt Asymptotics Complex Filter Finset MeasureTheory Nat Real Topology

namespace New

variable {d : ℕ} [Fact d.Prime] {q : ℕ} [NeZero q]

variable (d q) in
/-- The error `𝓔_q(t) = ∑_{n ≤ t} λ(n) - t / φ(q)` in the count with the weights
`λ = lambdaKResidueClass d q`, that is `λ(n) = Λ(n) (1 - (n/d))` for `n ≡ 1` mod `q` and `λ(n) = 0`
otherwise. -/
noncomputable def countError (t : ℝ) : ℝ := ∑ n ∈ Icc 0 ⌊t⌋₊, lambdaKResidueClass d q n - t / φ q

omit [NeZero q] in
private lemma countError_eq_sum_Icc_one (t : ℝ) :
    countError d q t = (∑ n ∈ Icc 1 ⌊t⌋₊, lambdaKResidueClass d q n) - t / φ q := by
  have h_zero : lambdaKResidueClass d q 0 = 0 := by simp [lambdaKResidueClass, residueClass]
  simp [countError, Icc_eq_cons_Ioc (Nat.zero_le _), ← Icc_add_one_left_eq_Ioc, h_zero]

/-- Let `d` be a prime and `q ≠ 0`, and let `λ(n) = lambdaKResidueClass d q n` be `Λ(n) (1 - (n/d))`
for `n ≡ 1` mod `q` and `0` otherwise. The error `𝓔_q(t) = countError d q t`, that is
`∑_{n ≤ t} λ(n) - t / φ(q)`, satisfies `|𝓔_q(t)| ≤ 13 t` for `t ≥ 0`, by Chebyshev's bound. -/
lemma abs_countError_le {t : ℝ} (ht : 0 ≤ t) : |countError d q t| ≤ 13 * t := by
  have h_sum : ∑ n ∈ Icc 0 ⌊t⌋₊, lambdaKResidueClass d q n ≤ 2 * (6 * t) := by
    grw [lambdaKResidueClass_le_two_mul_vonMangoldt, ← mul_sum, ← Chebyshev.psi_eq_sum_Icc,
      Chebyshev.psi_le_const_mul_self ht]
    gcongr
    linarith [log_four_eq, log_two_lt_d9]
  grw [countError, abs_sub, abs_of_nonneg (sum_nonneg fun n _ ↦ lambdaKResidueClass_nonneg d q n),
    abs_of_nonneg (by positivity), h_sum,
    div_le_self ht (mod_cast totient_pos.2 (NeZero.pos q) : (1 : ℝ) ≤ φ q)]
  linarith

omit [NeZero q] in
/-- Let `d` be a prime and let `λ(n) = lambdaKResidueClass d q n` be `Λ(n) (1 - (n/d))` for `n ≡ 1`
mod `q` and `0` otherwise. For the error `𝓔_q(t) = countError d q t`, that is
`∑_{n ≤ t} λ(n) - t / φ(q)`, the function `𝓔_q(t) t⁻²` is integrable on every interval `[y, z]` with
`1 ≤ y ≤ z`. -/
lemma intervalIntegrable_countError_div_sq {y z : ℝ} (hy : 1 ≤ y) (hyz : y ≤ z) :
    IntervalIntegrable (fun t : ℝ ↦ countError d q t / t ^ 2) volume y z := by
  have h_ne (t : ℝ) (ht : t ∈ Set.Icc y z) : t ^ 2 ≠ 0 := by positivity [hy.trans ht.1]
  have h_sum : IntegrableOn (fun t : ℝ ↦ (t ^ 2)⁻¹ * ∑ n ∈ Icc 0 ⌊t⌋₊, lambdaKResidueClass d q n)
      (Set.Icc y z) := integrableOn_mul_sum_Icc _ (zero_le_one.trans hy)
    (ContinuousOn.integrableOn_Icc (by fun_prop (disch := assumption)))
  have h_main : IntegrableOn (fun t : ℝ ↦ t / φ q / t ^ 2) (Set.Icc y z) :=
    ContinuousOn.integrableOn_Icc (by fun_prop (disch := assumption))
  rw [intervalIntegrable_iff_integrableOn_Icc_of_le hyz]
  exact (h_sum.sub h_main).congr (.of_forall fun t ↦ by simp [countError, field])

/-- For `y ≥ 1` the remainder `R_q = primeRemainder d q`, that is `R_q(y) = ∑_{n ≤ y} λ(n) (1/n -
1/y) - log y / φ(q) - c_q` with `c_q = re G_q(1)`, equals `∫₁^y 𝓔_q(t) t⁻² dt - c_q`, where
`𝓔_q(t) = countError d q t` is `∑_{n ≤ t} λ(n) - t / φ(q)`. -/
lemma primeRemainder_eq_integral_countError_sub {y : ℝ} (hy : 1 ≤ y) :
    primeRemainder d q y = (∫ t in 1..y, countError d q t / t ^ 2) - re (logDerivMean d q 1) := by
  have h_sq_ne (t : ℝ) (ht : t ∈ Set.Icc 1 y) : t ^ 2 ≠ 0 := by positivity [ht.1]
  have h_zero : lambdaKResidueClass d q 0 = 0 := by simp [lambdaKResidueClass, residueClass]
  have h_abel : ∑ n ∈ Icc 0 ⌊y⌋₊, lambdaKResidueClass d q n / n =
      (∑ n ∈ Icc 0 ⌊y⌋₊, lambdaKResidueClass d q n) / y +
        ∫ t in Set.Ioc 1 y, (∑ n ∈ Icc 0 ⌊t⌋₊, lambdaKResidueClass d q n) / t ^ 2 := by
    have h_int : IntegrableOn (deriv fun t : ℝ ↦ t⁻¹) (Set.Icc 1 y) := by
      rw [deriv_inv']
      exact ContinuousOn.integrableOn_Icc (by fun_prop (disch := assumption))
    simpa only [deriv_inv', neg_mul, integral_neg, sub_neg_eq_add, ← div_eq_inv_mul] using
      sum_mul_eq_sub_integral_mul₀ (lambdaKResidueClass d q) h_zero y
        (fun t ht ↦ differentiableAt_inv (by positivity [ht.1])) h_int
  have h_log : ∫ t in 1..y, t / φ q / t ^ 2 = y.log / φ q := by
    rw [← div_one y, ← integral_one_div_of_pos one_pos (by linarith), div_one,
      ← intervalIntegral.integral_div]
    exact intervalIntegral.integral_congr fun t _ ↦ by field
  have h_count : ∫ t in 1..y, countError d q t / t ^ 2 =
      (∫ t in 1..y, (∑ n ∈ Icc 0 ⌊t⌋₊, lambdaKResidueClass d q n) / t ^ 2) - y.log / φ q := by
    rw [← h_log, eq_sub_iff_add_eq,
      ← intervalIntegral.integral_add (intervalIntegrable_countError_div_sq le_rfl hy)
        (ContinuousOn.intervalIntegrable_of_Icc hy (by fun_prop (disch := assumption)))]
    simp only [countError, sub_div, sub_add_cancel]
  have h_sum (r : ℕ) : lambdaKSum d q r y =
      (∑ n ∈ Icc 0 ⌊y⌋₊, lambdaKResidueClass d q n / n * n ^ r) / y ^ r := by
    simp [lambdaKSum, Icc_eq_cons_Ioc (Nat.zero_le _), ← Icc_add_one_left_eq_Ioc]
  have h_div_mul_cancel (n : ℕ) : lambdaKResidueClass d q n / n * n = lambdaKResidueClass d q n :=
    div_mul_cancel_of_imp (by simp +contextual [h_zero])
  rw [primeRemainder, h_count, intervalIntegral.integral_of_le hy, h_sum, h_sum]
  simp only [pow_zero, mul_one, div_one, pow_one, h_div_mul_cancel, h_abel]
  ring

/-- Let `d` be a prime and `q ≠ 0`, and let `λ(n) = lambdaKResidueClass d q n` be `Λ(n) (1 - (n/d))`
for `n ≡ 1` mod `q` and `0` otherwise. The remainder `R_q = primeRemainder d q`, that is
`R_q(y) = ∑_{n ≤ y} λ(n) (1/n - 1/y) - log y / φ(q) - c_q`, varies slowly:
`|R_q(z) - R_q(y)| ≤ 13 (z - y) / y` for `1 ≤ y ≤ z`. -/
lemma abs_primeRemainder_sub_le {y z : ℝ} (hy : 1 ≤ y) (hyz : y ≤ z) :
    |primeRemainder d q z - primeRemainder d q y| ≤ 13 * ((z - y) / y) := by
  -- The difference is the integral over `[y, z]` of `𝓔_q(t) t⁻²`, which is at most `13 / y` there.
  have h_bound (t : ℝ) (ht : t ∈ Set.uIoc y z) : ‖countError d q t / t ^ 2‖ ≤ 13 / y := by
    obtain ⟨hyt, -⟩ : y < t ∧ t ≤ z := by rwa [Set.uIoc_of_le hyz] at ht
    have ht_pos : 0 < t := by linarith
    calc ‖countError d q t / t ^ 2‖ ≤ 13 * t / t ^ 2 := by
          grw [norm_eq_abs, abs_div, abs_countError_le ht_pos.le, abs_of_pos (pow_pos ht_pos 2)]
      _ ≤ 13 / y := by grw [hyt]; simp [field]
  calc |primeRemainder d q z - primeRemainder d q y| = ‖∫ t in y..z, countError d q t / t ^ 2‖ := by
        rw [primeRemainder_eq_integral_countError_sub hy,
          primeRemainder_eq_integral_countError_sub (hy.trans hyz),
          sub_sub_sub_cancel_right, intervalIntegral.integral_interval_sub_left
            (intervalIntegrable_countError_div_sq le_rfl (hy.trans hyz))
            (intervalIntegrable_countError_div_sq le_rfl hy), norm_eq_abs]
    _ ≤ 13 / y * |z - y| := intervalIntegral.norm_integral_le_of_norm_le_const h_bound
    _ = 13 * ((z - y) / y) := by rw [abs_of_nonneg (sub_nonneg.2 hyz)]; ring

/-- Let `d` be a prime and `q ≠ 0`. In the variable `v = log y` the remainder
`R_q = primeRemainder d q` is Lipschitz: `|R_q(e^v) - R_q(e^u)| ≤ 26 (v - u)` for
`0 ≤ u ≤ v ≤ u + 1`. -/
lemma abs_primeRemainder_exp_sub_le {u v : ℝ} (hu : 0 ≤ u) (huv : u ≤ v) (hvu : v ≤ u + 1) :
    |primeRemainder d q (rexp v) - primeRemainder d q (rexp u)| ≤ 26 * (v - u) := by
  have h_abs : |v - u| = v - u := abs_of_nonneg (sub_nonneg.2 huv)
  have h_exp : rexp (v - u) - 1 ≤ 2 * (v - u) := by
    linarith [abs_le.1 (abs_exp_sub_one_le (x := v - u) (by linarith))]
  calc |primeRemainder d q (rexp v) - primeRemainder d q (rexp u)| ≤ 13 *
         ((rexp v - rexp u) / rexp u) :=
        abs_primeRemainder_sub_le (one_le_exp hu) (exp_le_exp.2 huv)
    _ = 13 * (rexp (v - u) - 1) := by simp [Real.exp_sub, field]
    _ ≤ 26 * (v - u) := by linarith

/-- For a character `ψ` mod `q` let `L_ψ = entireL ψ` be `L(s, ψ)`, times `s - 1` if `ψ` is
principal, and let `ψ' = quadTwist ψ d` be `ψ (·/d)`. If all `logDeriv L_ψ` and `logDeriv L_ψ'` have
norm at most `C` at `s`, then `logDerivMean d q = (∑_ψ (logDeriv L_ψ' - logDeriv L_ψ) - 1) / φ(q)`
has norm at most `2 C + 1` at `s`, since there are `φ(q)` characters mod `q`. -/
lemma norm_logDerivMean_le {s : ℂ} {C : ℝ}
    (h_char : ∀ ψ : DirichletCharacter ℂ q, ‖logDeriv (entireL ψ) s‖ ≤ C)
    (h_twist : ∀ ψ : DirichletCharacter ℂ q, ‖logDeriv (entireL (quadTwist ψ d)) s‖ ≤ C) :
    ‖logDerivMean d q s‖ ≤ 2 * C + 1 := by
  have hφ : (1 : ℝ) ≤ φ q := mod_cast totient_pos.2 (NeZero.pos q)
  have h_sum := norm_sum_le_of_le univ fun ψ _ ↦ norm_sub_le_of_le (h_twist ψ) (h_char ψ)
  rw [logDerivMean, norm_div, Complex.norm_natCast, div_le_iff₀ (zero_lt_one.trans_le hφ)]
  refine (norm_sub_le_of_le h_sum norm_one.le).trans ?_
  rw [sum_const, nsmul_eq_mul, Finset.card_univ, ← Nat.card_eq_fintype_card,
    DirichletCharacter.card_eq_totient_of_hasEnoughRootsOfUnity]
  linarith

private lemma exists_eventually_norm_logDerivMean_le_on_log_strip :
    ∃ a B : ℝ, 0 < a ∧ a ≤ 1 ∧ 0 < B ∧ ∀ᶠ l : ℝ in atTop, ∀ s : ℂ,
      1 - a / l ≤ s.re → ‖s‖ ≤ rexp l →
        DifferentiableAt ℂ (logDerivMean d q) s ∧ ‖logDerivMean d q s‖ ≤ B * l ^ 2 := by
  obtain ⟨a₀, ha₀, ha₀_one, h₀⟩ := exists_eventually_entireL_ne_zero_log_strip (N := q)
  obtain ⟨a₁, ha₁, _, h₁⟩ := exists_eventually_entireL_ne_zero_log_strip (N := q * d)
  let a := min a₀ a₁
  have ha : 0 < a := lt_min ha₀ ha₁
  have ha_one : a ≤ 1 := (min_le_left _ _).trans ha₀_one
  obtain ⟨B, hB, h_bound⟩ := eventually_norm_logDeriv_entireL_le_of_log_strip ha ha_one
  refine ⟨a / 8, 2 * B + 1, by positivity, by linarith, by positivity, ?_⟩
  filter_upwards [h₀, h₁, h_bound, eventually_ge_atTop (1 : ℝ),
    tendsto_exp_atTop.eventually_ge_atTop (q : ℝ),
    tendsto_exp_atTop.eventually_ge_atTop ((q * d : ℕ) : ℝ)] with l h_q h_twist h_deriv hl hq hd s hs hn
  rw [div_div] at hs
  have h_width {c : ℝ} (hc : a ≤ c) {w : ℂ} (hw : 1 - a / l ≤ w.re) : 1 - c / l ≤ w.re := by
    linarith only [hw, div_le_div_of_nonneg_right hc (zero_le_one.trans hl)]
  have h_char (χ : DirichletCharacter ℂ q) :=
    h_deriv q χ s hq hs hn fun w hw ↦ h_q χ w (h_width (min_le_left _ _) hw)
  have h_tw (χ : DirichletCharacter ℂ q) :=
    h_deriv (q * d) (quadTwist χ d) s hd hs hn fun w hw ↦ h_twist (quadTwist χ d) w
      (h_width (min_le_right _ _) hw)
  refine ⟨(analyticAt_logDerivMean (fun χ ↦ (h_char χ).1) (fun χ ↦ (h_tw χ).1)).differentiableAt,
    (norm_logDerivMean_le (fun χ ↦ (h_char χ).2) (fun χ ↦ (h_tw χ).2)).trans ?_⟩
  nlinarith [one_le_pow₀ (n := 2) hl]

/-- The classical strips for the two fixed moduli give a common strip for the transform. -/
lemma exists_eventually_norm_logDerivMean_div_le_on_log_strip :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ l : ℝ in atTop, ∀ s : ℂ,
      1 - a / l ≤ s.re → ‖s‖ ≤ rexp l →
        DifferentiableAt ℂ (fun z : ℂ ↦ logDerivMean d q z / z) s ∧
          ‖logDerivMean d q s / s‖ ≤ l ^ 3 := by
  obtain ⟨a, B, ha, ha_one, hB, h⟩ := exists_eventually_norm_logDerivMean_le_on_log_strip (d := d) (q := q)
  refine ⟨a, ha, ha_one, ?_⟩
  filter_upwards [h, eventually_ge_atTop (2 : ℝ), eventually_ge_atTop (2 * B)] with l hl hl_two hl_B s hs hn
  have h_small : a / l ≤ 1 / 2 := (div_le_iff₀ (by linarith)).2 (by linarith)
  have hs_half : 1 / 2 ≤ s.re := by linarith
  obtain ⟨h_diff, h_bound⟩ := hl s hs hn
  refine ⟨h_diff.fun_div differentiableAt_id (ne_zero_of_re_pos (by linarith)), ?_⟩
  calc
    _ ≤ (B * l ^ 2) / (1 / 2) := by grw [norm_div, h_bound, ← re_le_norm s, ← hs_half]
    _ = (2 * B) * l ^ 2 := by ring
    _ ≤ l * l ^ 2 := mul_le_mul_of_nonneg_right hl_B (sq_nonneg l)
    _ = _ := by ring

private lemma exists_log_width_norm_logDerivMean_le_left :
    ∃ a C : ℝ, 0 < a ∧ 0 < C ∧ ∀ s : ℂ,
      1 - a / Real.log (|s.im| + 3) ≤ s.re → s.re ≤ 2 →
      DifferentiableAt ℂ (logDerivMean d q) s ∧
        ‖logDerivMean d q s‖ ≤ C * (Real.log (|s.im| + 3)) ^ 2 := by
  obtain ⟨a, C, ha, ha_one, hC, h⟩ := exists_eventually_norm_logDerivMean_le_on_log_strip (d := d) (q := q)
  obtain ⟨l₀, h_base⟩ := eventually_atTop.1 h
  let L := max l₀ 4
  let v₀ := Real.log 3
  let K := 1 + L / v₀
  have hL : 4 ≤ L := le_max_right _ _
  have hL_pos : 0 < L := by linarith
  have hv₀ : 0 < v₀ := Real.log_pos (by norm_num)
  have hK : 0 < K := by dsimp [K]; positivity
  refine ⟨a / K, C * K ^ 2, by positivity, by positivity, ?_⟩
  intro s hs hs_two
  let v := Real.log (|s.im| + 3)
  let l := L + v
  have hv_min : v₀ ≤ v := Real.log_le_log (by norm_num) (by linarith [abs_nonneg s.im])
  have hv : 0 < v := hv₀.trans_le hv_min
  have hl : L ≤ l := le_add_of_nonneg_right hv.le
  have hl_pos : 0 < l := hL_pos.trans_le hl
  have h_scale : l ≤ K * v := by
    dsimp only [l, K]
    rw [add_mul, one_mul]
    have h' := mul_le_mul_of_nonneg_left hv_min (div_nonneg hL_pos.le hv₀.le)
    rw [div_mul_cancel₀ _ hv₀.ne'] at h'
    linarith only [h']
  have h_width : (a / K) / v ≤ a / l := by
    rw [div_div]
    exact div_le_div_of_nonneg_left ha.le hl_pos h_scale
  have h_re : 1 - a / l ≤ s.re := by linarith only [hs, h_width]
  have h_nonneg : 0 ≤ s.re := by
    have h_small : a / l ≤ 1 := (div_le_iff₀ hl_pos).2 (by linarith only [ha_one, hL, hl])
    linarith only [h_re, h_small]
  have h_norm : ‖s‖ ≤ rexp l := calc
    _ ≤ |s.re| + |s.im| := norm_le_abs_re_add_abs_im s
    _ ≤ |s.im| + 3 := by rw [abs_of_nonneg h_nonneg]; linarith only [hs_two]
    _ = rexp v := (Real.exp_log (by linarith [abs_nonneg s.im])).symm
    _ ≤ _ := Real.exp_le_exp.2 (le_add_of_nonneg_left hL_pos.le)
  obtain ⟨h_diff, h_bound⟩ := h_base l ((le_max_left _ _).trans hl) s h_re h_norm
  exact ⟨h_diff, h_bound.trans (by rw [mul_assoc, ← mul_pow]; gcongr)⟩

/-- The unsmoothed count has a square-root exponential error by Ingham's transfer theorem. -/
private lemma exists_abs_countError_le_exp_neg_sqrt (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧ ∀ x : ℝ, 3 ≤ x →
      |countError d q x| ≤ C * x * rexp (-c * Real.sqrt (Real.log x)) := by
  obtain ⟨a, B, ha, hB, h_left⟩ := exists_log_width_norm_logDerivMean_le_left (d := d) (q := q)
  let η (t : ℝ) := a / Real.log t
  let r : ℂ := (φ q : ℂ)⁻¹
  let G (s : ℂ) := logDerivMean d q s + r
  let f (n : ℕ) : ℂ := lambdaKResidueClass d q n
  let U : Set ℂ := {s | 1 - η (|s.im| + 3) ≤ s.re}
  have hηc : ContinuousOn η (Set.Ici 3) :=
    continuousOn_const.div (continuousOn_log.mono fun t ht ↦ show t ≠ 0 by
      have h : 3 ≤ t := ht
      positivity) fun t ht ↦ (Real.log_pos (by linarith [show 3 ≤ t from ht])).ne'
  have hηa : AntitoneOn η (Set.Ici 3) := by
    intro t ht u hu htu
    exact div_le_div_of_nonneg_left ha.le (Real.log_pos (by linarith [show 3 ≤ t from ht]))
      (Real.log_le_log (by linarith [show 3 ≤ t from ht]) htu)
  have hηlow (t : ℝ) (ht : 3 ≤ t) : a * Real.log t ^ (-(1 : ℝ)) ≤ η t := by
    simp [η, Real.rpow_neg (Real.log_nonneg (by linarith)), div_eq_mul_inv]
  have hf (n : ℕ) (hn : 1 ≤ n) : ‖f n‖ ≤ 2 * Real.log (n + 1) := by
    have hn_pos : (0 : ℝ) < n := by exact_mod_cast zero_lt_one.trans_le hn
    simp only [f, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (lambdaKResidueClass_nonneg d q n)]
    exact (lambdaKResidueClass_le_two_mul_vonMangoldt (d := d) (q := q) n).trans
      (mul_le_mul_of_nonneg_left (ArithmeticFunction.vonMangoldt_le_log.trans (Real.log_le_log hn_pos (by linarith))) (by norm_num))
  have hφ : 1 ≤ (φ q : ℝ) := by exact_mod_cast totient_pos.2 (NeZero.pos q)
  have hr : ‖r‖ ≤ 1 := by
    dsimp only [r]
    rw [norm_inv, Complex.norm_natCast]
    exact inv_le_one_of_one_le₀ hφ
  have hLG (s : ℂ) (hs : 1 < s.re) : LSeries f s = G s + r / (s - 1) := by
    change LSeries (fun n ↦ (lambdaKResidueClass d q n : ℂ)) s = _
    rw [LSeries_lambdaKResidueClass_eq_add_logDerivMean hd h_cop hs]
    have hφ_ne : (φ q : ℂ) ≠ 0 := by exact_mod_cast (totient_pos.2 (NeZero.pos q)).ne'
    have hs_ne : s - 1 ≠ 0 := sub_ne_zero.2 (ne_of_apply_ne Complex.re (by simpa using hs.ne'))
    dsimp [G, r]
    field_simp
    ring
  have hG : DifferentiableOn ℂ G U := by
    intro s hs
    apply DifferentiableAt.differentiableWithinAt
    change DifferentiableAt ℂ (fun z ↦ logDerivMean d q z + r) s
    by_cases h : s.re ≤ 2
    · exact (h_left s hs h).1.add_const _
    · exact (analyticAt_logDerivMean_of_one_le_re d q (by linarith)).differentiableAt.add_const _
  have hGb (s : ℂ) (hs : s ∈ U) :
      ‖G s‖ ≤ (B + 13 / (Real.log 3) ^ 2) * Real.log (|s.im| + 3) ^ (2 : ℝ) := by
    let v := Real.log (|s.im| + 3)
    have hv₀ : 0 < Real.log 3 := Real.log_pos (by norm_num)
    have hv_min : Real.log 3 ≤ v := Real.log_le_log (by norm_num) (by linarith [abs_nonneg s.im])
    have h13 : 13 ≤ (13 / (Real.log 3) ^ 2) * v ^ 2 := by
      have h := (le_div_iff₀ (by positivity : 0 < (Real.log 3) ^ 2)).2
        (show 1 * (Real.log 3) ^ 2 ≤ v ^ 2 by simpa using pow_le_pow_left₀ hv₀.le hv_min 2)
      calc
        _ ≤ 13 * (v ^ 2 / (Real.log 3) ^ 2) := by simpa using mul_le_mul_of_nonneg_left h (by norm_num : (0 : ℝ) ≤ 13)
        _ = _ := by ring
    change ‖G s‖ ≤ (B + 13 / (Real.log 3) ^ 2) * v ^ (2 : ℝ)
    rw [show (2 : ℝ) = (2 : ℕ) by norm_num, Real.rpow_natCast]
    by_cases h : s.re ≤ 2
    · have hh := (norm_add_le (logDerivMean d q s) r).trans
        (add_le_add (h_left s hs h).2 hr)
      dsimp only [G] at *
      linarith only [hh, h13, mul_nonneg hB.le (sq_nonneg v),
        show (B + 13 / (Real.log 3) ^ 2) * v ^ 2 = B * v ^ 2 + (13 / (Real.log 3) ^ 2) * v ^ 2 by ring]
    · have hre : 2 ≤ s.re := (lt_of_not_ge h).le
      have hL : ‖LSeries f s‖ ≤ 12 := by
        refine (TauCeti.LSeries.norm_LSeries_le_of_norm_le_mul_log_of_lt
          hf (ε := 1 / 2) (by norm_num) (by norm_num) (by linarith : 1 + 1 / 2 < s.re)).trans ?_
        have h_inv : 1 / (s.re - 1 / 2 - 1) ≤ 2 := by
          have hp : 0 < s.re - 1 / 2 - 1 := by linarith
          rw [div_le_iff₀ hp]
          linarith
        linarith only [h_inv]
      have hnorm : 1 ≤ ‖s - 1‖ := by
        have h_re := re_le_norm (s - 1)
        simp only [sub_re, one_re] at h_re
        linarith
      have hpole : ‖r / (s - 1)‖ ≤ 1 := by
        rw [norm_div, div_le_iff₀ (one_pos.trans_le hnorm), one_mul]
        exact hr.trans hnorm
      have hG_eq : G s = LSeries f s - r / (s - 1) := by
        rw [hLG s (by linarith)]
        ring
      calc
        ‖G s‖ ≤ 13 := by grw [hG_eq, norm_sub_le, hL, hpole]; norm_num
        _ ≤ (13 / (Real.log 3) ^ 2) * v ^ 2 := h13
        _ ≤ _ := by gcongr; linarith
  obtain ⟨c, hc, C, h⟩ := TauCeti.LSeries.norm_sum_sub_mul_le_of_zeroFreeRegion
    hηc hηa (A := 1) ha hηlow hf (U := U) (G := G) (r := r) (fun _ hs ↦ hs) hG hLG hGb
  refine ⟨c * Real.sqrt a, max C 1, by positivity, lt_of_lt_of_le one_pos (le_max_right _ _), ?_⟩
  intro x hx
  have h_ω : Real.sqrt a * Real.sqrt (Real.log x) ≤ TauCeti.inghamExponent η x := by
    rw [Real.sqrt_eq_rpow, Real.sqrt_eq_rpow]
    simpa only [show (1 : ℝ) + 1 = 2 by norm_num] using
      TauCeti.le_inghamExponent_of_mul_log_rpow_le ha.le (A := 1) zero_le_one hηlow (by linarith)
  have h_error : (countError d q x : ℂ) = ∑ n ∈ Icc 1 ⌊x⌋₊, f n - r * x := by
    rw [countError_eq_sum_Icc_one]
    simp [f, r, div_eq_mul_inv, mul_comm]
  calc
    _ = ‖∑ n ∈ Icc 1 ⌊x⌋₊, f n - r * x‖ := by rw [← h_error]; simp
    _ ≤ C * x * rexp (-c * TauCeti.inghamExponent η x) := h x hx
    _ ≤ max C 1 * x * rexp (-c * TauCeti.inghamExponent η x) :=
      mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_right (le_max_left _ _) (by linarith)) (exp_pos _).le
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (Real.exp_le_exp.2 (by nlinarith only [mul_le_mul_of_nonneg_left h_ω hc.le]))
        (mul_nonneg (zero_le_one.trans (le_max_right _ _)) (by linarith))

/-- A narrower strip and weaker growth bound follow from the classical estimate. -/
lemma exists_eventually_norm_logDerivMean_div_le_of_fixed_neighborhood :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ l : ℝ in atTop, ∀ s : ℂ,
      1 - a / l ^ 9 ≤ s.re → ‖s‖ ≤ rexp l →
        DifferentiableAt ℂ (fun z : ℂ ↦ logDerivMean d q z / z) s ∧
          ‖logDerivMean d q s / s‖ ≤ l ^ 10 := by
  obtain ⟨a, ha, ha_one, h_strip⟩ :=
    exists_eventually_norm_logDerivMean_div_le_on_log_strip (d := d) (q := q)
  refine ⟨a, ha, ha_one, ?_⟩
  filter_upwards [h_strip, eventually_ge_atTop (1 : ℝ)] with l h hl s hs hn
  have h_width : a / l ^ 9 ≤ a / l :=
    div_le_div_of_nonneg_left ha.le (zero_lt_one.trans_le hl) (le_self_pow₀ hl (by decide))
  exact (h s (by linarith) hn).imp_right
    (·.trans (pow_le_pow_right₀ hl (by decide : (3 : ℕ) ≤ 10)))

/-- The logarithmic derivative mean on the strip with width `l⁻²⁶`. -/
lemma eventually_norm_logDerivMean_div_le : ∀ᶠ l : ℝ in atTop, ∀ s : ℂ,
    1 - 1 / l ^ 26 ≤ s.re → ‖s‖ ≤ rexp l →
      DifferentiableAt ℂ (fun z : ℂ ↦ logDerivMean d q z / z) s ∧
        ‖logDerivMean d q s / s‖ ≤ l ^ 26 := by
  obtain ⟨a, ha, _, hF⟩ := exists_eventually_norm_logDerivMean_div_le_of_fixed_neighborhood (d := d) (q := q)
  filter_upwards [hF, eventually_ge_atTop (1 : ℝ), eventually_ge_atTop (1 / a)] with l hl hl_one hl_a s hs hnorm
  have hl_pos : 0 < l := one_pos.trans_le hl_one
  have h_inv : 1 / l ≤ a := (div_le_iff₀ hl_pos).2 (by
    simpa only [mul_comm] using (div_le_iff₀ ha).1 hl_a)
  have h_width : 1 / l ^ 26 ≤ a / l ^ 9 := calc
    _ ≤ 1 / l ^ 10 := one_div_pow_le_one_div_pow_of_le hl_one (by decide)
    _ = (1 / l) / l ^ 9 := by field
    _ ≤ _ := div_le_div_of_nonneg_right h_inv (by positivity)
  have hs' : 1 - a / l ^ 9 ≤ s.re := by linarith
  exact (hl s hs' hnorm).imp_right
    (·.trans (pow_le_pow_right₀ hl_one (by decide : (10 : ℕ) ≤ 26)))

variable (d q) in
/-- The unsmoothed error divided by the scale, in logarithmic coordinates. -/
private noncomputable def logCountError (v : ℝ) : ℝ :=
  countError d q (rexp v) / rexp v

omit [NeZero q] in
private lemma measurable_logCountError : Measurable (logCountError d q) := by
  have h_sum : Measurable (fun n : ℕ ↦ ∑ k ∈ Icc 1 n, lambdaKResidueClass d q k) :=
    measurable_of_countable _
  change Measurable (fun v : ℝ ↦ countError d q (rexp v) / rexp v)
  simp_rw [countError_eq_sum_Icc_one]
  exact ((h_sum.comp (Nat.measurable_floor.comp Real.continuous_exp.measurable)).sub
    (Real.continuous_exp.measurable.div_const _)).div Real.continuous_exp.measurable

private lemma exists_abs_logCountError_le_exp_neg_sqrt (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ c C : ℝ, 0 < c ∧ 0 < C ∧ ∀ v ≥ 0,
      |logCountError d q v| ≤ C * rexp (-c * Real.sqrt v) := by
  obtain ⟨c, C, hc, hC, h⟩ := exists_abs_countError_le_exp_neg_sqrt hd h_cop
  let D := max C (13 * rexp (c * Real.sqrt (Real.log 3)))
  refine ⟨c, D, hc, hC.trans_le (le_max_left _ _), ?_⟩
  intro v hv
  rw [logCountError, abs_div, abs_of_pos (exp_pos v), div_le_iff₀ (exp_pos v)]
  by_cases h_v : Real.log 3 ≤ v
  · have h_large : 3 ≤ rexp v := by
      rw [← Real.exp_log (by norm_num : 0 < (3 : ℝ))]
      exact Real.exp_le_exp.2 h_v
    have h_inst := h (rexp v) h_large
    rw [Real.log_exp] at h_inst
    calc
      _ ≤ C * rexp v * rexp (-c * Real.sqrt v) := h_inst
      _ ≤ D * rexp v * rexp (-c * Real.sqrt v) :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right (le_max_left _ _) (exp_pos _).le)
          (exp_pos _).le
      _ = _ := by ring
  · have h_K : 13 ≤ D * rexp (-c * Real.sqrt v) := calc
      _ = (13 * rexp (c * Real.sqrt v)) * rexp (-c * Real.sqrt v) := by
        rw [mul_assoc, ← Real.exp_add]
        simp
      _ ≤ _ := mul_le_mul_of_nonneg_right
        ((mul_le_mul_of_nonneg_left (Real.exp_le_exp.2
          (mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt (le_of_not_ge h_v)) hc.le)) (by norm_num)).trans
          (le_max_right _ _)) (exp_pos _).le
    exact (abs_countError_le (exp_pos v).le).trans (mul_le_mul_of_nonneg_right h_K (exp_pos _).le)

private lemma integrableOn_exp_neg_mul_sqrt {c : ℝ} (hc : 0 < c) :
    IntegrableOn (fun v : ℝ ↦ rexp (-c * Real.sqrt v)) (Set.Ioi 0) := by
  simpa only [Real.sqrt_eq_rpow, Real.rpow_zero, one_mul] using
    integrableOn_rpow_mul_exp_neg_mul_rpow (s := 0) (p := 1 / 2) (by norm_num) (by norm_num) hc

private lemma re_logDerivMean_div_eq_integral_logCountError
    (hd : d ≠ 2) (h_cop : q.Coprime d) (h_int : IntegrableOn (logCountError d q) (Set.Ioi 0))
    {s : ℝ} (hs : 1 < s) :
    (logDerivMean d q (s : ℂ)).re / s =
      ∫ v in Set.Ioi (0 : ℝ), logCountError d q v * rexp ((1 - s) * v) := by
  let r : ℝ := 1 / φ q
  let A (t : ℝ) : ℝ := ∑ n ∈ Icc 1 ⌊t⌋₊, lambdaKResidueClass d q n
  let k (v : ℝ) := rexp ((1 - s) * v)
  have hs_c : 1 < (s : ℂ).re := by simpa using hs
  have hs_pos : 0 < s := zero_lt_one.trans hs
  have h_sum : (fun n : ℕ ↦ ∑ i ∈ Icc 1 n, lambdaKResidueClass d q i) =O[atTop]
      fun n ↦ (n : ℝ) ^ (1 : ℝ) := by
    refine .of_bound 14 (Filter.Eventually.of_forall fun n ↦ ?_)
    rw [Real.norm_eq_abs, abs_of_nonneg (sum_nonneg fun i _ ↦ lambdaKResidueClass_nonneg d q i),
      Real.rpow_one, Real.norm_of_nonneg (Nat.cast_nonneg _)]
    have h_error := (le_abs_self (countError d q n)).trans (abs_countError_le (Nat.cast_nonneg n))
    rw [countError_eq_sum_Icc_one, Nat.floor_natCast] at h_error
    have h_main : (n : ℝ) / φ q ≤ n := div_le_self (Nat.cast_nonneg n)
      (mod_cast totient_pos.2 (NeZero.pos q) : (1 : ℝ) ≤ φ q)
    linarith only [h_error, h_main]
  have h_partial := LSeries_eq_mul_integral_of_nonneg (lambdaKResidueClass d q)
    (r := (1 : ℝ)) zero_le_one hs_c h_sum (lambdaKResidueClass_nonneg d q)
  have h_term (v : ℝ) :
      rexp v • ((A (rexp v) : ℂ) * (rexp v : ℂ) ^ (-((s : ℂ) + 1))) =
        (((logCountError d q v + r) * k v : ℝ) : ℂ) := by
    have h_cast : (rexp v : ℂ) ^ (-((s : ℂ) + 1)) =
        ((rexp (v * (-(s + 1))) : ℝ) : ℂ) := by
      rw [Complex.cpow_def_of_ne_zero (by exact_mod_cast (exp_pos v).ne'),
        ← Complex.ofReal_log (exp_pos v).le, Real.log_exp, Complex.ofReal_exp]
      push_cast
      rfl
    have h_count : logCountError d q v + r = A (rexp v) / rexp v := by
      simp only [logCountError, countError_eq_sum_Icc_one, r, A]
      field
    rw [h_cast, Complex.real_smul, h_count]
    norm_cast
    dsimp only [k]
    have h_exp : rexp v * rexp (v * -(s + 1)) = rexp ((1 - s) * v) / rexp v := by
      rw [← Real.exp_add, ← Real.exp_sub]
      congr 1
      ring
    rw [mul_left_comm (rexp v), h_exp]
    ring
  have h_series : (LSeries (fun n ↦ (lambdaKResidueClass d q n : ℂ)) (s : ℂ)).re =
      s * ∫ v in Set.Ioi (0 : ℝ), (logCountError d q v + r) * k v := by
    rw [h_partial, ← Real.exp_zero, ← integral_comp_exp_Ioi]
    simp_rw [← Complex.ofReal_sum]
    change ((s : ℂ) * ∫ v in Set.Ioi (0 : ℝ),
      rexp v • ((A (rexp v) : ℂ) * (rexp v : ℂ) ^ (-((s : ℂ) + 1)))).re = _
    simp_rw [h_term, integral_complex_ofReal, ← Complex.ofReal_mul, Complex.ofReal_re]
  have h_k_int : IntegrableOn k (Set.Ioi 0) := integrableOn_exp_mul_Ioi (by linarith) 0
  have h_gk_int : IntegrableOn (fun v ↦ logCountError d q v * k v) (Set.Ioi 0) := by
    refine h_int.norm.mono' (((measurable_logCountError (d := d) (q := q)).mul (by fun_prop : Measurable k)).aestronglyMeasurable) ?_
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with v hv
    have hk : k v ≤ 1 := Real.exp_le_one_iff.2 (mul_nonpos_of_nonpos_of_nonneg (by linarith) hv.le)
    rw [norm_mul, Real.norm_of_nonneg (exp_pos _).le]
    exact mul_le_of_le_one_right (norm_nonneg _) hk
  have h_split : (∫ v in Set.Ioi (0 : ℝ), (logCountError d q v + r) * k v) =
      (∫ v in Set.Ioi (0 : ℝ), logCountError d q v * k v) + r / (s - 1) := by
    simp_rw [add_mul]
    rw [integral_add h_gk_int (h_k_int.const_mul _), integral_const_mul]
    have hk_val : (∫ v in Set.Ioi (0 : ℝ), k v) = 1 / (s - 1) := by
      rw [integral_exp_mul_Ioi (by linarith : 1 - s < 0), mul_zero, Real.exp_zero]
      field_simp [(by linarith : 1 - s ≠ 0), sub_ne_zero.2 hs.ne']
      ring
    rw [hk_val]
    ring
  have h_pole : s / ((φ q : ℝ) * (s - 1)) = s * (r / (s - 1)) := by
    have hφ : (φ q : ℝ) ≠ 0 := by exact_mod_cast (totient_pos.2 (NeZero.pos q)).ne'
    dsimp only [r]
    field_simp [hφ, sub_ne_zero.2 hs.ne']
  have h_identity := congrArg Complex.re (LSeries_lambdaKResidueClass_eq_add_logDerivMean hd h_cop hs_c)
  rw [h_series, h_split] at h_identity
  have hc : (s : ℂ) / ((φ q : ℂ) * ((s : ℂ) - 1)) =
      ((s / ((φ q : ℝ) * (s - 1)) : ℝ) : ℂ) := by push_cast; rfl
  rw [Complex.add_re, hc, Complex.ofReal_re, h_pole, mul_add] at h_identity
  exact (div_eq_iff hs_pos.ne').2 (by linarith only [h_identity])

private lemma re_logDerivMean_one_eq_integral_logCountError
    (hd : d ≠ 2) (h_cop : q.Coprime d) (h_int : IntegrableOn (logCountError d q) (Set.Ioi 0)) :
    (logDerivMean d q 1).re = ∫ v in Set.Ioi (0 : ℝ), logCountError d q v := by
  have h_meas := measurable_logCountError (d := d) (q := q)
  have h_integral : Tendsto (fun s : ℝ ↦
      ∫ v in Set.Ioi (0 : ℝ), logCountError d q v * rexp ((1 - s) * v))
      (𝓝[>] (1 : ℝ)) (𝓝 (∫ v in Set.Ioi (0 : ℝ), logCountError d q v)) := by
    apply tendsto_integral_filter_of_dominated_convergence (fun v ↦ ‖logCountError d q v‖)
    · exact Eventually.of_forall fun s ↦
        (h_meas.mul (by fun_prop)).aestronglyMeasurable
    · filter_upwards [self_mem_nhdsWithin] with s hs
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with v hv
      rw [norm_mul, Real.norm_of_nonneg (exp_pos _).le]
      exact mul_le_of_le_one_right (norm_nonneg _) (Real.exp_le_one_iff.2
        (mul_nonpos_of_nonpos_of_nonneg (sub_nonpos.2 (le_of_lt hs)) (le_of_lt hv)))
    · exact h_int.norm
    · apply ae_of_all
      intro v
      have h_cont : ContinuousAt (fun s : ℝ ↦ logCountError d q v * rexp ((1 - s) * v)) 1 := by
        fun_prop
      simpa using h_cont.tendsto.mono_left nhdsWithin_le_nhds
  have h_mean_cont : ContinuousAt (fun s : ℝ ↦ (logDerivMean d q (s : ℂ)).re / s) 1 := by
    apply ContinuousAt.div _ continuousAt_id one_ne_zero
    have h_mean : ContinuousAt (logDerivMean d q) ((1 : ℝ) : ℂ) :=
      (analyticAt_logDerivMean_of_one_le_re d q (by simp)).continuousAt
    exact continuous_re.continuousAt.comp (h_mean.comp continuous_ofReal.continuousAt)
  have h_eq : (fun s : ℝ ↦ (logDerivMean d q (s : ℂ)).re / s) =ᶠ[𝓝[>] (1 : ℝ)]
      fun s ↦ ∫ v in Set.Ioi (0 : ℝ), logCountError d q v * rexp ((1 - s) * v) := by
    filter_upwards [self_mem_nhdsWithin] with s hs
    exact re_logDerivMean_div_eq_integral_logCountError hd h_cop h_int hs
  have h_other := (h_mean_cont.tendsto.mono_left
    (nhdsWithin_le_nhds : 𝓝[>] (1 : ℝ) ≤ 𝓝 (1 : ℝ))).congr' h_eq
  simpa using tendsto_nhds_unique h_other h_integral

private lemma primeRemainder_exp_eq_neg_integral_logCountError
    (hd : d ≠ 2) (h_cop : q.Coprime d) (h_int : IntegrableOn (logCountError d q) (Set.Ioi 0))
    {v : ℝ} (hv : 0 ≤ v) :
    primeRemainder d q (rexp v) = -(∫ u in Set.Ioi v, logCountError d q u) := by
  let F (t : ℝ) := countError d q t / t ^ 2
  have h_shift (u : ℝ) : rexp u • F (rexp u) = logCountError d q u := by
    simp only [smul_eq_mul, F, logCountError]
    field_simp [(exp_pos u).ne']
  have h_int' : IntegrableOn F (Set.Ioi 1) := by
    rw [← Real.exp_zero, ← integrableOn_comp_exp_Ioi]
    simpa only [h_shift] using h_int
  have h_mean : (logDerivMean d q 1).re = ∫ t in Set.Ioi (1 : ℝ), F t := by
    rw [← Real.exp_zero, ← integral_comp_exp_Ioi]
    simpa only [h_shift] using re_logDerivMean_one_eq_integral_logCountError hd h_cop h_int
  have hv' : 1 ≤ rexp v := one_le_exp hv
  calc
    primeRemainder d q (rexp v) = (∫ t in 1..rexp v, F t) - (logDerivMean d q 1).re :=
      primeRemainder_eq_integral_countError_sub hv'
    _ = -(∫ t in Set.Ioi (rexp v), F t) := by
      rw [h_mean, ← intervalIntegral.integral_interval_add_Ioi h_int'
        (h_int'.mono_set (Set.Ioi_subset_Ioi hv'))]
      ring
    _ = _ := by rw [← integral_comp_exp_Ioi]; simp_rw [h_shift]

private lemma exists_eventually_abs_primeRemainder_exp_le_of_ingham
    (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ v : ℝ in atTop,
      |primeRemainder d q (rexp v)| ≤ rexp (-c * Real.sqrt v) := by
  obtain ⟨c, C, hc, hC, h⟩ := exists_abs_logCountError_le_exp_neg_sqrt hd h_cop
  have h_int : IntegrableOn (logCountError d q) (Set.Ioi 0) := by
    refine ((integrableOn_exp_neg_mul_sqrt hc).const_mul C).mono'
      (measurable_logCountError (d := d) (q := q)).aestronglyMeasurable ?_
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with v hv
    simpa only [Real.norm_eq_abs] using h v (le_of_lt hv)
  let M (u : ℝ) := C * rexp (-(c / 2) * Real.sqrt u)
  have h_M : IntegrableOn M (Set.Ioi 0) := (integrableOn_exp_neg_mul_sqrt (half_pos hc)).const_mul C
  let D := max 1 (∫ u in Set.Ioi (0 : ℝ), M u)
  have hD : 0 < D := one_pos.trans_le (le_max_left _ _)
  have h_tail (v : ℝ) (hv : 0 ≤ v) :
      |primeRemainder d q (rexp v)| ≤ rexp (-(c / 2) * Real.sqrt v) * D := by
    rw [primeRemainder_exp_eq_neg_integral_logCountError hd h_cop h_int hv, abs_neg, ← Real.norm_eq_abs]
    have h_M_v : IntegrableOn M (Set.Ioi v) := h_M.mono_set (Set.Ioi_subset_Ioi hv)
    calc
      _ ≤ ∫ u in Set.Ioi v, rexp (-(c / 2) * Real.sqrt v) * M u := by
        apply norm_integral_le_of_norm_le (h_M_v.const_mul _)
        filter_upwards [ae_restrict_mem measurableSet_Ioi] with u hu
        have h_sqrt : Real.sqrt v ≤ Real.sqrt u := Real.sqrt_le_sqrt (le_of_lt hu)
        calc
          ‖logCountError d q u‖ ≤ C * rexp (-c * Real.sqrt u) := by
            simpa only [Real.norm_eq_abs] using h u (hv.trans (le_of_lt hu))
          _ ≤ C * rexp (-(c / 2) * Real.sqrt v + -(c / 2) * Real.sqrt u) :=
            mul_le_mul_of_nonneg_left (Real.exp_le_exp.2 (by
              nlinarith only [mul_le_mul_of_nonneg_left h_sqrt (half_pos hc).le])) hC.le
          _ = _ := by dsimp only [M]; rw [Real.exp_add]; ring
      _ = rexp (-(c / 2) * Real.sqrt v) * ∫ u in Set.Ioi v, M u := by rw [integral_const_mul]
      _ ≤ _ := by
        apply mul_le_mul_of_nonneg_left _ (exp_pos _).le
        refine le_trans ?_ (le_max_right _ _)
        exact setIntegral_mono_set h_M (ae_of_all _ fun u ↦ by dsimp [M]; positivity)
          (ae_of_all _ fun _ hu ↦ Set.Ioi_subset_Ioi hv hu)
  let e := c / 4
  have he : 0 < e := by dsimp [e]; positivity
  have h_e : Tendsto (fun v : ℝ ↦ e * Real.sqrt v) atTop atTop := by
    simp_rw [Real.sqrt_eq_rpow]
    exact (tendsto_rpow_atTop (by norm_num : 0 < (1 / 2 : ℝ))).const_mul_atTop he
  refine ⟨e, he, ?_⟩
  filter_upwards [eventually_ge_atTop (0 : ℝ), h_e.eventually_ge_atTop (Real.log D)] with v hv h_large
  refine (h_tail v hv).trans ?_
  have hD_le : D ≤ rexp (e * Real.sqrt v) := (Real.log_le_iff_le_exp hD).1 h_large
  calc
    _ ≤ rexp (-(c / 2) * Real.sqrt v) * rexp (e * Real.sqrt v) :=
      mul_le_mul_of_nonneg_left hD_le (exp_pos _).le
    _ = _ := by rw [← Real.exp_add]; dsimp only [e]; congr 1; ring

/-- A classical strip gives square-root exponential decay in logarithmic coordinates. -/
theorem exists_eventually_abs_primeRemainder_exp_le_sqrt (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ v : ℝ in atTop,
      |primeRemainder d q (rexp v)| ≤ rexp (-((a * v) ^ (1 / 2 : ℝ) / 32)) := by
  obtain ⟨c, hc, h⟩ := exists_eventually_abs_primeRemainder_exp_le_of_ingham hd h_cop
  let a := min 1 ((32 * c) ^ 2)
  have ha : 0 < a := lt_min one_pos (by positivity)
  have h_sqrt : Real.sqrt a ≤ 32 * c :=
    (Real.sqrt_le_sqrt (min_le_right _ _)).trans_eq (Real.sqrt_sq (by positivity))
  refine ⟨a, ha, min_le_left _ _, ?_⟩
  filter_upwards [h, eventually_ge_atTop (0 : ℝ)] with v hv hv_nonneg
  refine hv.trans (Real.exp_le_exp.2 ?_)
  rw [← Real.sqrt_eq_rpow, Real.sqrt_mul ha.le]
  linarith only [mul_le_mul_of_nonneg_right h_sqrt (Real.sqrt_nonneg v)]

/-- At fixed moduli the weighted prime remainder decays with stretched exponential exponent
`1 / 10` in logarithmic coordinates. -/
theorem exists_eventually_abs_primeRemainder_exp_le_tenth (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ v : ℝ in atTop,
      |primeRemainder d q (rexp v)| ≤ rexp (-((a * v) ^ (1 / 10 : ℝ) / 32)) := by
  obtain ⟨a, ha, ha_one, h⟩ := exists_eventually_abs_primeRemainder_exp_le_sqrt hd h_cop
  refine ⟨a, ha, ha_one, ?_⟩
  filter_upwards [h, eventually_ge_atTop (1 / a)] with v hv h_large
  have h_av : 1 ≤ a * v := by
    simpa only [mul_comm] using (div_le_iff₀ ha).1 h_large
  have h_power := Real.rpow_le_rpow_of_exponent_le h_av (by norm_num : (1 / 10 : ℝ) ≤ 1 / 2)
  exact hv.trans (Real.exp_le_exp.2 (by linarith only [h_power]))

/-- The weighted prime remainder in logarithmic coordinates. -/
theorem eventually_abs_primeRemainder_exp_le_stretched {d q : ℕ} [Fact d.Prime] [NeZero q]
    (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∀ᶠ v : ℝ in atTop, |primeRemainder d q (rexp v)| ≤ rexp (-(v ^ (1 / 27 : ℝ) / 32)) := by
  obtain ⟨a, ha, _, h⟩ := exists_eventually_abs_primeRemainder_exp_le_sqrt hd h_cop
  let p : ℝ := 1 / 2 - 1 / 27
  have h_large := (tendsto_rpow_atTop (by dsimp [p]; norm_num : 0 < p)).eventually_ge_atTop
    (1 / a ^ (1 / 2 : ℝ))
  filter_upwards [h, h_large, eventually_gt_atTop (0 : ℝ)] with v hv h_v hv_pos
  have ha_root : 0 < a ^ (1 / 2 : ℝ) := by positivity
  have h_mul : 1 ≤ a ^ (1 / 2 : ℝ) * v ^ p := by
    simpa only [mul_comm] using (div_le_iff₀ ha_root).1 h_v
  have h_power : v ^ (1 / 27 : ℝ) ≤ (a * v) ^ (1 / 2 : ℝ) := calc
    _ ≤ (a ^ (1 / 2 : ℝ) * v ^ p) * v ^ (1 / 27 : ℝ) :=
      le_mul_of_one_le_left (by positivity) h_mul
    _ = _ := by rw [mul_assoc, ← Real.rpow_add hv_pos, show p + 1 / 27 = 1 / 2 by dsimp [p]; ring,
        Real.mul_rpow ha.le hv_pos.le]
  exact hv.trans (Real.exp_le_exp.2 (by linarith only [h_power]))

/-- Every inverse power of `log y` bounds the prime remainder for all large `y`. -/
theorem eventually_abs_primeRemainder_le (hd : d ≠ 2) (h_cop : q.Coprime d) (B : ℕ) :
    ∀ᶠ y : ℝ in atTop, |primeRemainder d q y| ≤ 1 / y.log ^ B := by
  have h_bound : ∀ᶠ v : ℝ in atTop, |primeRemainder d q (rexp v)| ≤ 1 / v ^ B := by
    filter_upwards [eventually_abs_primeRemainder_exp_le_stretched hd h_cop,
      eventually_exp_neg_rpow_div_le_inv_pow (show 0 < (1 / 27 : ℝ) by norm_num) B]
      with v hv h_exp
    exact hv.trans h_exp
  filter_upwards [tendsto_log_atTop.eventually h_bound, eventually_gt_atTop 0] with y hy hy_pos
  rwa [Real.exp_log hy_pos] at hy

end New
