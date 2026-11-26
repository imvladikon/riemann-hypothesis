module

public import Lib.Analytic.PrimeNumberTheorem.Tauberian
public import Lib.Analytic.PrimeNumberTheorem.ZeroFreeRegion
public import New.Reduction.Zeros.PrimeError

/-!
# The prime number theorem for the remainders `R_q`

Let `d` be a prime and `q ≥ 1`. The remainder `R_q(y)` is an integral of the error `𝓔_q(t)` in the
weighted count (`primeRemainder_eq_integral_countError_sub`), so it varies slowly. For odd `d` prime
to `q` its absolute value is at most `(log y) ^ (-B)` for all large `y`, for every natural number
`B`; so it tends to `0`, which characterises the constant `c_q` in its definition.

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

open ArithmeticFunction.vonMangoldt Complex Filter Finset MeasureTheory Nat Real Topology

namespace New

variable {d : ℕ} [Fact d.Prime] {q : ℕ} [NeZero q]

variable (d q) in
/-- The error `𝓔_q(t) = ∑_{n ≤ t} λ(n) - t / φ(q)` in the count with the weights
`λ = lambdaKResidueClass d q`, that is `λ(n) = Λ(n) (1 - (n/d))` for `n ≡ 1` mod `q` and `λ(n) = 0`
otherwise. -/
noncomputable def countError (t : ℝ) : ℝ := ∑ n ∈ Icc 0 ⌊t⌋₊, lambdaKResidueClass d q n - t / φ q

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

private lemma differentiableAt_and_norm_logDerivMean_div_le {s : ℂ} {C : ℝ} (h_half : 1 / 2 ≤ s.re)
    (h_char : ∀ ψ : DirichletCharacter ℂ q, entireL ψ s ≠ 0 ∧ ‖logDeriv (entireL ψ) s‖ ≤ C)
    (h_twist : ∀ ψ : DirichletCharacter ℂ q,
      entireL (quadTwist ψ d) s ≠ 0 ∧ ‖logDeriv (entireL (quadTwist ψ d)) s‖ ≤ C) :
    DifferentiableAt ℂ (fun z : ℂ ↦ logDerivMean d q z / z) s ∧
      ‖logDerivMean d q s / s‖ ≤ 4 * C + 2 := by
  obtain ⟨h_char_ne, h_char_le⟩ := forall_and.1 h_char
  obtain ⟨h_twist_ne, h_twist_le⟩ := forall_and.1 h_twist
  have hC : 0 ≤ C := (norm_nonneg _).trans (h_char_le 1)
  constructor
  · exact (analyticAt_logDerivMean h_char_ne h_twist_ne).differentiableAt.fun_div
      differentiableAt_id (ne_zero_of_re_pos (by linarith))
  · calc ‖logDerivMean d q s / s‖ ≤ (2 * C + 1) / (1 / 2) := by
          grw [norm_div, norm_logDerivMean_le h_char_le h_twist_le, ← re_le_norm s, ← h_half]
      _ = _ := by ring

/-- The classical strips for the two fixed moduli give a common strip for the transform. -/
lemma exists_eventually_norm_logDerivMean_div_le_on_log_strip :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ l : ℝ in atTop, ∀ s : ℂ,
      1 - a / l ≤ s.re → ‖s‖ ≤ rexp l →
        DifferentiableAt ℂ (fun z : ℂ ↦ logDerivMean d q z / z) s ∧
          ‖logDerivMean d q s / s‖ ≤ l ^ 3 := by
  obtain ⟨a₀, ha₀, ha₀_one, h₀⟩ := exists_eventually_entireL_ne_zero_log_strip (N := q)
  obtain ⟨a₁, ha₁, _, h₁⟩ := exists_eventually_entireL_ne_zero_log_strip (N := q * d)
  let a := min a₀ a₁
  have ha : 0 < a := lt_min ha₀ ha₁
  have ha_one : a ≤ 1 := (min_le_left _ _).trans ha₀_one
  obtain ⟨B, hB, h_bound⟩ := eventually_norm_logDeriv_entireL_le_of_log_strip ha ha_one
  refine ⟨a / 8, by positivity, by linarith, ?_⟩
  filter_upwards [h₀, h₁, h_bound, eventually_ge_atTop (2 : ℝ),
    tendsto_exp_atTop.eventually_ge_atTop (q : ℝ),
    tendsto_exp_atTop.eventually_ge_atTop ((q * d : ℕ) : ℝ),
    eventually_ge_atTop (4 * B + 2)] with l h_q h_twist h_deriv hl hq hd hB_l s hs hn
  have hl_pos : 0 < l := by linarith
  have h_small : a / 8 / l ≤ 1 / 2 := (div_le_iff₀ hl_pos).2 (by linarith)
  have hs_half : 1 / 2 ≤ s.re := by linarith
  rw [div_div] at hs
  have h_width {c : ℝ} (hc : a ≤ c) {w : ℂ} (hw : 1 - a / l ≤ w.re) : 1 - c / l ≤ w.re := by
    linarith only [hw, div_le_div_of_nonneg_right hc hl_pos.le]
  obtain ⟨h_diff, h_norm⟩ := differentiableAt_and_norm_logDerivMean_div_le (d := d) hs_half
    (fun χ ↦ h_deriv q χ s hq hs hn fun w hw ↦ h_q χ w (h_width (min_le_left _ _) hw))
    (fun χ ↦ h_deriv (q * d) (quadTwist χ d) s hd hs hn fun w hw ↦
      h_twist (quadTwist χ d) w (h_width (min_le_right _ _) hw))
  refine ⟨h_diff, h_norm.trans ?_⟩
  calc
    _ ≤ (4 * B + 2) * l ^ 2 := by nlinarith [one_le_pow₀ (n := 2) (show 1 ≤ l by linarith)]
    _ ≤ l * l ^ 2 := mul_le_mul_of_nonneg_right hB_l (sq_nonneg l)
    _ = _ := by ring

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

private lemma logDerivMean_div_transform (hd : d ≠ 2) (h_cop : q.Coprime d) (s : ℂ) (hs : 2 < s.re) :
    (logDerivMean d q s / s - logDerivMean d q 1 / 1) / (s - 1) =
      ∫ v : ℝ in Set.Ioi 0, (primeRemainder d q (rexp v) : ℂ) * cexp ((1 - s) * v) := by
  simp [integral_primeRemainder hd h_cop hs, ofReal_re_logDerivMean_one hd h_cop]

/-- A classical strip gives square-root exponential decay in logarithmic coordinates. -/
theorem exists_eventually_abs_primeRemainder_exp_le_sqrt (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ v : ℝ in atTop,
      |primeRemainder d q (rexp v)| ≤ rexp (-((a * v) ^ (1 / 2 : ℝ) / 32)) := by
  obtain ⟨a, ha, ha_one, hF⟩ := exists_eventually_norm_logDerivMean_div_le_on_log_strip (d := d) (q := q)
  refine ⟨a, ha, ha_one, ?_⟩
  have h_bound := eventually_abs_le_exp_rpow_of_transform_of_width
    (by fun_prop [primeRemainder, lambdaKSum]) (fun u v ↦ abs_primeRemainder_exp_sub_le)
    (logDerivMean_div_transform hd h_cop) ha ha_one (A := 1) (B := 3)
    (by simpa only [pow_one] using hF)
  simpa only [Nat.cast_one, one_add_one_eq_two] using h_bound

/-- At fixed moduli the weighted prime remainder decays with stretched exponential exponent
`1 / 10` in logarithmic coordinates. -/
theorem exists_eventually_abs_primeRemainder_exp_le_tenth (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ v : ℝ in atTop,
      |primeRemainder d q (rexp v)| ≤ rexp (-((a * v) ^ (1 / 10 : ℝ) / 32)) := by
  obtain ⟨a, ha, h_one, hF⟩ := exists_eventually_norm_logDerivMean_div_le_of_fixed_neighborhood (d := d) (q := q)
  refine ⟨a, ha, h_one, ?_⟩
  have h_bound := eventually_abs_le_exp_rpow_of_transform_of_width
    (by fun_prop [primeRemainder, lambdaKSum]) (fun u v ↦ abs_primeRemainder_exp_sub_le)
    (logDerivMean_div_transform hd h_cop) ha h_one (A := 9) (B := 10) hF
  simpa only [Nat.cast_ofNat, show (9 : ℝ) + 1 = 10 by norm_num] using h_bound

/-- The weighted prime remainder in logarithmic coordinates. -/
theorem eventually_abs_primeRemainder_exp_le_stretched {d q : ℕ} [Fact d.Prime] [NeZero q]
    (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∀ᶠ v : ℝ in atTop, |primeRemainder d q (rexp v)| ≤ rexp (-(v ^ (1 / 27 : ℝ) / 32)) := by
  have h_bound := eventually_abs_le_exp_rpow_of_transform
    (by fun_prop [primeRemainder, lambdaKSum]) (fun u v ↦ abs_primeRemainder_exp_sub_le)
    (logDerivMean_div_transform hd h_cop) (A := 26) eventually_norm_logDerivMean_div_le
  simpa only [Nat.cast_ofNat, show (26 : ℝ) + 1 = 27 by norm_num] using h_bound

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
