module

public import Statements
public import New.Reduction.Data.AdmissibleData
public import New.Reduction.Data.Subexponential
public import New.Reduction.PrimeSums
import New.Reduction.Data.Magnitudes
import New.Reduction.MainInequality
import New.Reduction.Zeros.Criterion
import New.Reduction.Zeros.PrimeNumberTheorem
public import TauCeti.NumberTheory.DirichletCharacter.LFunction.ZeroReflection -- shake: keep (`New.Main` uses it)

/-!
# The one-sided bound, and the theorem in half-plane form

For admissible data at an integer `x`, the main inequality gives a remainder term
proportional to `φ(q₀) (#Φ_a / #Φ_b) log b / m`. The Behrend count bounds the ratio of place
counts, while the logarithmic weight and auxiliary cutoff use polynomial scales in `log x`.
Both prime remainders at `x₁` are at most `x ^ (-2)`. The resulting error is absorbed in
any positive exponent slack. Passage to real arguments gives the one-sided criterion
for non-vanishing of Dirichlet `L`-functions in `re s > 1/2`.

Notions from other files:
* `Parameters`: a multiple `q₀ = P.q₀` of `18480` and a prime `d = P.d ≡ q₀ / 2 - 1` modulo `q₀`.
* `primeRemainder d q x`: the remainder `R_q(x) = ∑_{n ≤ x} λ(n) (1/n - 1/x) - log x / φ(q) - c_q`.
  Here `λ(n) = Λ(n) (1 - chiK d n)` for `n ≡ 1` modulo `q` and `0` otherwise, with `chiK d` the
  Legendre symbol modulo `d`; for odd `d` prime to `q`, `c_q` is the constant with `R_q(x) → 0`.
* `Data P`: admissible data, among them the scales `x`, `x₁`, `b`, `a = x b`, the number of lifts
  `m` and two finite sets of places of a number field, `Φ_a = D.aPlaces` and `Φ_b = D.bPlaces`.
-/

@[expose] public section

open DirichletCharacter Filter Finset Real ZMod

namespace New

private lemma Data.primeRemainder_le_of_loss {P : Parameters} (D : Data P) {loss density : ℝ}
    (h_density : D.placeCountRatio ≤ density)
    (h_loss : 0 ≤ loss) (h_bound : D.m * D.totalRemainder ≤ D.f * D.a * loss) :
    primeRemainder P.d P.q₀ D.x ≤ P.q₀.totient * (density * loss) / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + density * |primeRemainder P.d 1 D.x₁| := by
  have hm : (0 : ℝ) < D.m := Data.HasLogBound.pos D
  have ha : (0 : ℝ) < D.a := Data.HasLogBound.pos D
  have hb := D.card_bPlaces_pos
  have h_ratio : 0 ≤ D.placeCountRatio := by unfold Data.placeCountRatio; positivity
  have h_main : D.totalRemainder ≤ D.f * D.a * loss / D.m := (le_div_iff₀' hm).2 h_bound
  calc primeRemainder P.d P.q₀ D.x
      = D.totalRemainder / (D.a * #D.bPlaces) + primeRemainder P.d P.q₀ D.x₁ -
          D.placeCountRatio * primeRemainder P.d 1 D.x₁ := by
        rw [D.totalRemainder_eq, Data.placeCountRatio]
        field
    _ ≤ D.f * D.a * loss / D.m / (D.a * #D.bPlaces) + |primeRemainder P.d P.q₀ D.x₁| +
          D.placeCountRatio * |primeRemainder P.d 1 D.x₁| := by
        grw [h_main, le_abs_self (primeRemainder P.d P.q₀ D.x₁), sub_eq_add_neg, ← mul_neg,
          neg_le_abs]
    _ = P.q₀.totient * (D.placeCountRatio * loss) / D.m +
          |primeRemainder P.d P.q₀ D.x₁| +
          D.placeCountRatio * |primeRemainder P.d 1 D.x₁| := by
        rw [D.f_eq_card_aPlaces_mul, Nat.cast_mul, Data.placeCountRatio]
        field
    _ ≤ _ := by grw [h_density]

/-- The linear main inequality gives separate factors for the density and the logarithmic weight. -/
lemma Data.primeRemainder_le_linear_with_density {P : Parameters} (D : Data P) {density : ℝ}
    (h_density : D.placeCountRatio ≤ density) :
    primeRemainder P.d P.q₀ D.x ≤
      1700000 * P.q₀.totient * (density * D.logB) / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + density * |primeRemainder P.d 1 D.x₁| := by
  have hB : 0 < D.logB := Data.HasLogBound.pos D
  have h_bound : D.m * D.totalRemainder ≤ D.f * D.a * (1700000 * D.logB) := by
    calc
      _ ≤ 1700000 * (D.f * D.a * D.logB) := star_inequality_linear D
      _ = _ := by ring
  convert D.primeRemainder_le_of_loss h_density (by positivity) h_bound using 1
  ring

/-- The one-sided prime remainder bound from the linear main inequality. -/
lemma Data.primeRemainder_le_linear {P : Parameters} (D : Data P)
    (h_density : D.placeCountRatio ≤ D.logB) :
    primeRemainder P.d P.q₀ D.x ≤
      1700000 * P.q₀.totient * D.logB ^ 2 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  simpa only [pow_two] using D.primeRemainder_le_linear_with_density h_density

/-- The one-sided prime remainder bound from the quadratic main inequality. -/
lemma Data.primeRemainder_le_quadratic {P : Parameters} (D : Data P)
    (h_density : D.placeCountRatio ≤ D.logB) :
    primeRemainder P.d P.q₀ D.x ≤ 27 * P.q₀.totient * D.logB ^ 3 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  have h_bound : D.m * D.totalRemainder ≤ D.f * D.a * (27 * D.logB ^ 2) := by
    calc
      _ ≤ 27 * (D.f * D.a * D.logB ^ 2) := star_inequality_quadratic D
      _ = _ := by ring
  convert D.primeRemainder_le_of_loss h_density (by positivity) h_bound using 1
  ring

/-- The one-sided prime remainder bound using the weighted valuation loss. -/
lemma Data.primeRemainder_le_weighted_loss {P : Parameters} (D : Data P)
    (h_density : D.placeCountRatio ≤ D.logB) :
    primeRemainder P.d P.q₀ D.x ≤ 90 * P.q₀.totient * (D.logB ^ 3 * D.logX₁ ^ 2) / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  have h_bound : D.m * D.totalRemainder ≤ D.f * D.a * (90 * (D.logB ^ 2 * D.logX₁ ^ 2)) := by
    calc _ ≤ 90 * (D.f * D.a * D.logB ^ 2 * D.logX₁ ^ 2) := star_inequality_with_weighted_loss D
      _ = _ := by ring
  convert D.primeRemainder_le_of_loss h_density (by positivity) h_bound using 1
  ring

/-- The one-sided prime remainder bound with the error expressed using cubic units. -/
lemma Data.primeRemainder_le_cubic {P : Parameters} (D : Data P)
    (h_density : D.placeCountRatio ≤ D.logB) :
    primeRemainder P.d P.q₀ D.x ≤ 20 * P.q₀.totient * D.logB ^ 4 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  have h_logB : 0 < D.logB := Data.HasLogBound.pos D
  have h_bound : D.m * D.totalRemainder ≤ D.f * D.a * (20 * D.logB ^ 3) := by
    calc _ ≤ 20 * D.errorUnit := star_inequality_with_polynomial_completion D
      _ = _ := by unfold Data.errorUnit; ring
  convert D.primeRemainder_le_of_loss h_density (by positivity) h_bound using 1
  ring

/-- The prime remainder with the sixth-power error. -/
lemma Data.primeRemainder_le {P : Parameters} (D : Data P)
    (h_density : D.placeCountRatio ≤ D.logB) :
    primeRemainder P.d P.q₀ D.x ≤ P.q₀.totient * D.logB ^ 6 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  have h_scale : 20 ≤ D.logB ^ 2 := D.le_of_hasLogBound
  have h_power : 20 * D.logB ^ 4 ≤ D.logB ^ 6 := calc
    _ ≤ D.logB ^ 2 * D.logB ^ 4 := mul_le_mul_of_nonneg_right h_scale (by positivity)
    _ = _ := by ring
  refine (D.primeRemainder_le_cubic h_density).trans (add_le_add (add_le_add ?_ le_rfl) le_rfl)
  calc
    _ = (P.q₀.totient : ℝ) * (20 * D.logB ^ 4) / D.m := by ring
    _ ≤ _ := by gcongr

/-- Let `0 < ε < 1/100`. A term `D : Data P` (admissible data) bundles all the choices that the main
inequality needs, among them integer scales `x`, `x₁`, `b` with `x ^ 10⁶ ≤ x₁` and `x₁ ^ 10⁶ ≤ b`
(`D.logX₁ = log x₁`, `D.logB = log b`) and a power of two `m = D.m` in `[√x, 2 √x]`. For every large
integer `x` such data exist with `D.x = x`, `log b ≤ 2 x ^ ε`, `√x ≤ m` and
`x ^ (ε / 12) ≤ log x₁`. -/
lemma eventually_exists_data_scales (P : Parameters) {ε : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop, ∃ D : Data P, D.x = x ∧ D.logB ≤ 2 * (x : ℝ) ^ ε ∧
      (x : ℝ) ^ (1 / 2 : ℝ) ≤ D.m ∧ (x : ℝ) ^ (ε / 12) ≤ D.logX₁ := by
  have h_two : ∀ᶠ x : ℕ in atTop, (2 : ℝ) ≤ (x : ℝ) ^ (ε / 12) :=
    ((tendsto_rpow_atTop (by positivity)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop 2
  filter_upwards [eventually_exists_data P hε hε_lt, h_two, eventually_ge_atTop 1]
    with x ⟨D, hx, _, _, _, _, hx₁_ge, _, hb_le⟩ hx_two hx_one
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_eq : D.x = x := by rw [← hx, ← D.exp_logX]
  refine ⟨D, hx_eq, by linarith [one_le_rpow hx_ge hε.le], ?_, ?_⟩
  · rw [← hx_eq, Data.x, ← exp_mul, mul_one_div]
    exact (Set.mem_Icc.1 D.m_mem).1
  · have h_sq : (x : ℝ) ^ (ε / 6) = (x : ℝ) ^ (ε / 12) * (x : ℝ) ^ (ε / 12) := by
      rw [← rpow_add (by positivity)]
      ring_nf
    nlinarith

/-- Let `q₀ = P.q₀` and `d = P.d` be the modulus and the prime of the parameters `P`, and let
`ε > 0`. Let `R_q(y) = primeRemainder d q y = ∑_{n ≤ y} λ(n) (1/n - 1/y) - log y / φ(q) - c_q`. For
all large integers `x` and all `l ≥ x ^ (ε / 12)`, the values `|R_{q₀}(exp l)|` and `|R₁(exp l)|`
are at most `x ^ (-2)`, by the prime number theorem. -/
lemma eventually_abs_primeRemainder_exp_le (P : Parameters) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x : ℕ in atTop, ∀ l : ℝ, (x : ℝ) ^ (ε / 12) ≤ l →
      |primeRemainder P.d P.q₀ (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) := by
  obtain ⟨B, hB⟩ : ∃ B : ℕ, 24 / ε ≤ B := exists_nat_ge (24 / ε)
  have hd : P.d ≠ 2 := by linarith [P.sixty_four_lt_d]
  have h_cop : P.q₀.Coprime P.d := (P.coprime_q₁_d 0).coprime_mul_right
  obtain ⟨Y, hY⟩ : ∃ Y : ℝ, ∀ y ≥ Y,
      |primeRemainder P.d P.q₀ y| ≤ 1 / log y ^ B ∧ |primeRemainder P.d 1 y| ≤ 1 / log y ^ B :=
    eventually_atTop.1 ((eventually_abs_primeRemainder_le hd h_cop B).and
      (eventually_abs_primeRemainder_le hd P.d.coprime_one_left B))
  have h_large : ∀ᶠ x : ℕ in atTop, Y ≤ (x : ℝ) ^ (ε / 12) :=
    ((tendsto_rpow_atTop (by positivity)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop Y
  filter_upwards [h_large, eventually_ge_atTop 1] with x hY_le hx_one l hl
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_pos : (0 : ℝ) < x := one_pos.trans_le hx_ge
  have h_exp : -(ε / 12 * B) ≤ -2 := by linarith [(div_le_iff₀ hε).1 hB]
  have h_small : 1 / log (exp l) ^ B ≤ (x : ℝ) ^ (-2 : ℝ) :=
    calc 1 / log (exp l) ^ B ≤ 1 / ((x : ℝ) ^ (ε / 12)) ^ B := by grw [log_exp, ← hl]
      _ = (x : ℝ) ^ (-(ε / 12 * B)) := by
        rw [← rpow_mul_natCast hx_pos.le, rpow_neg hx_pos.le, one_div]
      _ ≤ (x : ℝ) ^ (-2 : ℝ) := rpow_le_rpow_of_exponent_le hx_ge h_exp
  exact (hY (exp l) (by linarith [add_one_le_exp l])).imp h_small.trans' h_small.trans'

/-- A logarithmic cutoff of order `(log x) ^ 27` suffices to make each tail at most `x ^ (-2)`. -/
private lemma eventually_abs_primeRemainder_exp_le_of_polylog_cutoff {d q : ℕ} [Fact d.Prime] [NeZero q]
    (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∀ᶠ x : ℝ in atTop, ∀ v : ℝ, (64 * Real.log x) ^ (27 : ℕ) ≤ v →
      |primeRemainder d q (rexp v)| ≤ x ^ (-2 : ℝ) := by
  obtain ⟨t, ht⟩ := eventually_atTop.1 (eventually_abs_primeRemainder_exp_le_stretched hd h_cop)
  have h_log : Tendsto (fun x : ℝ ↦ 64 * Real.log x) atTop atTop :=
    Real.tendsto_log_atTop.const_mul_atTop (by norm_num)
  have h_cutoff : Tendsto (fun x : ℝ ↦ (64 * Real.log x) ^ (27 : ℕ)) atTop atTop :=
    (tendsto_pow_atTop (by decide : (27 : ℕ) ≠ 0)).comp h_log
  filter_upwards [h_cutoff.eventually_ge_atTop t, eventually_ge_atTop 1] with x hx hx_one v hv
  have hx_pos : 0 < x := one_pos.trans_le hx_one
  have h_log_nonneg : 0 ≤ 64 * Real.log x := mul_nonneg (by norm_num) (Real.log_nonneg hx_one)
  have h_root : 64 * Real.log x ≤ v ^ (1 / 27 : ℝ) := calc
    _ = ((64 * Real.log x) ^ (27 : ℕ)) ^ (1 / 27 : ℝ) := by
      rw [← Real.rpow_natCast_mul h_log_nonneg]
      norm_num
    _ ≤ v ^ (1 / 27 : ℝ) := Real.rpow_le_rpow (by positivity) hv (by norm_num)
  calc |primeRemainder d q (rexp v)| ≤ rexp (-(v ^ (1 / 27 : ℝ) / 32)) := ht v (hx.trans hv)
    _ ≤ rexp (-(2 * Real.log x)) := Real.exp_le_exp.2 (by linarith)
    _ = x ^ (-2 : ℝ) := by rw [Real.rpow_def_of_pos hx_pos]; congr 1; ring

/-- The one-sided remainder uses the product of the density bound and the logarithmic weight. -/
theorem eventually_primeRemainder_natCast_le_with_polynomial_weight (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let y := log (x : ℝ)
      let Q := subexponentialWeightBound y
      let J := polynomialWeightScale y
      primeRemainder P.d P.q₀ x ≤ (1700000 * P.q₀.totient + 2) *
        ((x : ℝ) ^ (-1 / 2 : ℝ) * (Q * (J + 1))) := by
  have hd : P.d ≠ 2 := by linarith [P.sixty_four_lt_d]
  have h_cop : P.q₀.Coprime P.d := (P.coprime_q₁_d 0).coprime_mul_right
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  have hQ_one : ∀ᶠ x : ℕ in atTop, 1 ≤ subexponentialWeightBound (log x) := by
    simpa only [pow_zero, mul_one] using
      h_log.eventually (eventually_mul_pow_le_subexponentialWeightBound 1 0)
  filter_upwards [eventually_exists_data_with_polynomial_weight P, hQ_one, eventually_ge_atTop 1,
    tendsto_natCast_atTop_atTop.eventually (eventually_abs_primeRemainder_exp_le_of_polylog_cutoff hd h_cop),
    tendsto_natCast_atTop_atTop.eventually (eventually_abs_primeRemainder_exp_le_of_polylog_cutoff hd P.d.coprime_one_left)]
    with x ⟨D, hx, _, hm, h_cutoff, hb, h_card⟩ hQ hx_one h_q₀ h_one
  let y := log (x : ℝ)
  let Q := subexponentialWeightBound y
  let B := polynomialWeightScale y + 1
  let Z := (x : ℝ) ^ (-1 / 2 : ℝ)
  have h_Rq₀ := h_q₀ D.logX₁ h_cutoff
  have h_Rone := h_one D.logX₁ h_cutoff
  have h_density : D.placeCountRatio ≤ Q := D.placeCountRatio_le_of_card_bound h_card
  have hB_one : 1 ≤ B := le_add_of_nonneg_left
    (pow_nonneg (log_natCast_nonneg x) _)
  have hB_nonneg : 0 ≤ D.logB := (Data.HasLogBound.pos D).le
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_pos : (0 : ℝ) < x := one_pos.trans_le hx_ge
  have hZ_inv : Z = ((x : ℝ) ^ (1 / 2 : ℝ))⁻¹ := by
    dsimp [Z]
    rw [show (-1 / 2 : ℝ) = -(1 / 2 : ℝ) by ring, rpow_neg hx_pos.le]
  have hz : 0 ≤ Z := by positivity
  have hsmall : (x : ℝ) ^ (-2 : ℝ) ≤ Z := rpow_le_rpow_of_exponent_le hx_ge (by norm_num)
  have h_tail_q₀ : |primeRemainder P.d P.q₀ D.x₁| ≤ Z * (Q * B) :=
    (h_Rq₀.trans hsmall).trans (le_mul_of_one_le_right hz (one_le_mul_of_one_le_of_one_le hQ hB_one))
  have h_tail_one : Q * |primeRemainder P.d 1 D.x₁| ≤ Z * (Q * B) := calc
    _ ≤ Q * Z := mul_le_mul_of_nonneg_left (h_Rone.trans hsmall) (zero_le_one.trans hQ)
    _ = Z * Q := mul_comm _ _
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (le_mul_of_one_le_right (zero_le_one.trans hQ) hB_one) hz
  rw [sqrt_eq_rpow] at hm
  calc primeRemainder P.d P.q₀ x
      ≤ 1700000 * P.q₀.totient * (Q * D.logB) / D.m +
          |primeRemainder P.d P.q₀ D.x₁| + Q * |primeRemainder P.d 1 D.x₁| := by
        simpa only [hx] using D.primeRemainder_le_linear_with_density h_density
    _ ≤ 1700000 * P.q₀.totient * (Q * B) / (x : ℝ) ^ (1 / 2 : ℝ) +
          Z * (Q * B) + Z * (Q * B) := by
        refine add_le_add (add_le_add ?_ h_tail_q₀) h_tail_one
        grw [← hm, hb.2]
    _ = _ := by
      rw [div_eq_mul_inv, ← hZ_inv]
      ring

/-- The leading term in the subexponential correction comes from the density bound. -/
theorem eventually_primeRemainder_natCast_le_with_polynomial_weight_exponent (P : Parameters)
    {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x : ℕ in atTop,
      let y := log (x : ℝ)
      primeRemainder P.d P.q₀ x ≤ (1700000 * P.q₀.totient + 2) *
        ((x : ℝ) ^ (-1 / 2 : ℝ) * exp ((2 + ε) * sqrt (22 * y * log (5184 * y)))) := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_primeRemainder_natCast_le_with_polynomial_weight P,
    h_log.eventually (eventually_log_subexponentialWeightBound_le_behrend (half_pos hε)),
    h_log.eventually (eventually_log_polynomialWeightScale_add_one_le_behrend (half_pos hε))]
    with x h_R h_logQ h_logB
  let y := log (x : ℝ)
  let Q := subexponentialWeightBound y
  let B := polynomialWeightScale y + 1
  have hQ : 0 < Q := exp_pos _
  have hB : 0 < B := add_pos_of_nonneg_of_pos (pow_nonneg (log_natCast_nonneg x) _) one_pos
  have h_product : Q * B ≤ exp ((2 + ε) * sqrt (22 * y * log (5184 * y))) := calc
    _ = exp (log (Q * B)) := (exp_log (mul_pos hQ hB)).symm
    _ ≤ _ := exp_le_exp.2 (by
      rw [log_mul hQ.ne' hB.ne']
      linarith only [h_logQ, h_logB])
  exact h_R.trans (by gcongr)

/-- The remainder also satisfies the estimate with two factors of the density bound. -/
theorem eventually_primeRemainder_natCast_le_with_weightBound (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let Q := subexponentialWeightBound (log x)
      primeRemainder P.d P.q₀ x ≤
        (3400000 * P.q₀.totient + 2) * ((x : ℝ) ^ (-1 / 2 : ℝ) * Q ^ 2) := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_primeRemainder_natCast_le_with_polynomial_weight P,
    h_log.eventually eventually_polynomialWeightScale_add_one_le_subexponentialWeightBound] with x h_R hB
  refine h_R.trans ?_
  rw [pow_two]
  have h_coefficient : (1700000 * P.q₀.totient + 2 : ℝ) ≤ 3400000 * P.q₀.totient + 2 := by
    linarith only [Nat.cast_nonneg (α := ℝ) P.q₀.totient]
  have hQ : 0 ≤ subexponentialWeightBound (log (x : ℝ)) := exp_nonneg _
  have h_poly : 0 ≤ polynomialWeightScale (log (x : ℝ)) + 1 :=
    add_nonneg (pow_nonneg (log_natCast_nonneg x) _) zero_le_one
  gcongr

/-- The prime remainder also satisfies the bound in terms of the rounded prime-window width. -/
theorem eventually_primeRemainder_natCast_le_with_subexponential_width (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let W := P.subexponentialWindowWidth (log x)
      primeRemainder P.d P.q₀ x ≤
        (3400000 * P.q₀.totient + 2) * ((x : ℝ) ^ (-1 / 2 : ℝ) * W ^ 4) := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_primeRemainder_natCast_le_with_weightBound P,
    h_log.eventually P.eventually_weightBound_le_subexponentialWindowWidth_sq] with x h_R h_weight
  refine h_R.trans ?_
  rw [show (4 : ℕ) = 2 * 2 by decide, pow_mul]
  gcongr
  exact exp_nonneg _

/-- The leading subexponential correction in the one-sided prime remainder is the Behrend scale
times four. -/
theorem eventually_primeRemainder_natCast_le_with_behrend_exponent (P : Parameters)
    {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x : ℕ in atTop,
      let y := log (x : ℝ)
      primeRemainder P.d P.q₀ x ≤ (3400000 * P.q₀.totient + 2) *
        ((x : ℝ) ^ (-1 / 2 : ℝ) * exp ((4 + ε) * sqrt (22 * y * log (5184 * y)))) := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_primeRemainder_natCast_le_with_weightBound P,
    h_log.eventually (eventually_log_subexponentialWeightBound_le_behrend (half_pos hε))]
    with x h_R h_weight
  let y := log (x : ℝ)
  let Q := subexponentialWeightBound y
  have hQ : 0 < Q := exp_pos _
  refine h_R.trans ?_
  change _ * (_ * Q ^ 2) ≤ _
  gcongr
  rw [show Q ^ 2 = exp (2 * log Q) by rw [two_mul, exp_add, exp_log hQ, pow_two]]
  exact exp_le_exp.2 (by linarith only [h_weight])

private lemma eventually_primeRemainder_natCast_le_of_density
    (P : Parameters) {s C : ℝ} (hs : 0 < s) (hC : 0 < C) :
    ∀ᶠ x : ℕ in atTop, primeRemainder P.d P.q₀ x ≤ C * (x : ℝ) ^ (-1 / 2 + s) := by
  let A : ℝ := 1700000 * P.q₀.totient + 2
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_primeRemainder_natCast_le_with_polynomial_weight P,
    h_log.eventually (eventually_log_subexponentialWeightBound_le (show 0 < s / 4 by positivity)),
    h_log.eventually (eventually_log_polynomialWeightScale_add_one_le (show 0 < s / 4 by positivity)),
    ((tendsto_rpow_atTop (half_pos hs)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop (A / C),
    eventually_ge_atTop 1] with x h_bound h_logQ h_logB h_coeff hx_one
  let y := log (x : ℝ)
  let Q := subexponentialWeightBound y
  let B := polynomialWeightScale y + 1
  have hx_pos : (0 : ℝ) < x := by exact_mod_cast (Nat.zero_lt_one.trans_le hx_one)
  have hQ : 0 < Q := exp_pos _
  have hB : 0 < B := add_pos_of_nonneg_of_pos (pow_nonneg (log_natCast_nonneg x) _) one_pos
  have h_power : Q * B ≤ (x : ℝ) ^ (s / 2) := calc
    _ = exp (log (Q * B)) := (exp_log (mul_pos hQ hB)).symm
    _ ≤ exp (s / 2 * log x) := exp_le_exp.2 (by
      rw [log_mul hQ.ne' hB.ne']
      linarith only [h_logQ, h_logB])
    _ = _ := by rw [rpow_def_of_pos hx_pos]; congr 1; ring
  have hA : A ≤ C * (x : ℝ) ^ (s / 2) := by
    change A / C ≤ (x : ℝ) ^ (s / 2) at h_coeff
    exact ((div_le_iff₀ hC).1 h_coeff).trans_eq (mul_comm _ _)
  calc primeRemainder P.d P.q₀ x ≤ A * ((x : ℝ) ^ (-1 / 2 : ℝ) * (Q * B)) := h_bound
    _ ≤ (C * (x : ℝ) ^ (s / 2)) * ((x : ℝ) ^ (-1 / 2 : ℝ) * (x : ℝ) ^ (s / 2)) := by
      gcongr
    _ = C * ((x : ℝ) ^ (-1 / 2 : ℝ) * ((x : ℝ) ^ (s / 2) * (x : ℝ) ^ (s / 2))) := by ring
    _ = _ := by rw [← rpow_add hx_pos, add_halves, ← rpow_add hx_pos]

section IntegerBounds

-- Preserve the named upper bound on ε in the existing integer statements.
set_option linter.unusedVariables false

/-- The one-sided bound at integers with exponent `-1/2 + 2 ε`. -/
lemma eventually_primeRemainder_natCast_le_linear (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤
        ((5400 * 10 ^ 6) * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 2 * ε) := by
  exact eventually_primeRemainder_natCast_le_of_density (s := 2 * ε) P (by positivity) (by positivity)

/-- The one-sided bound at integers. Let `q₀ = P.q₀` and `d = P.d` be the modulus and the prime of
the parameters `P`, and let `0 < ε < 1/100`. Let
`R(y) = primeRemainder d q₀ y = ∑_{n ≤ y} λ(n) (1/n - 1/y) - log y / φ(q₀) - c`, where
`λ(n) = Λ(n) (1 - (n/d))` for `n ≡ 1` modulo `q₀` and `0` otherwise, `(·/d)` is the Legendre symbol,
and `c` is the constant with `R(y) → 0`. The bound has exponent `-1/2 + 3 ε` for all large integers `x`. -/
lemma eventually_primeRemainder_natCast_le_quadratic (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤
        (216 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 3 * ε) := by
  exact eventually_primeRemainder_natCast_le_of_density (s := 3 * ε) P (by positivity) (by positivity)

/-- The integer remainder bound with exponent `-1/2 + (10/3) ε`. -/
lemma eventually_primeRemainder_natCast_le_weighted_loss (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤
        (1440 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + (10 / 3) * ε) := by
  exact eventually_primeRemainder_natCast_le_of_density (s := (10 / 3) * ε) P (by positivity) (by positivity)

/-- The integer remainder bound with exponent `-1/2 + 4 ε`. -/
lemma eventually_primeRemainder_natCast_le_cubic (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (320 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 4 * ε) := by
  exact eventually_primeRemainder_natCast_le_of_density (s := 4 * ε) P (by positivity) (by positivity)

/-- The integer bound with coefficient `64 φ(q₀) + 3` and exponent `-1/2 + 6 ε`. -/
lemma eventually_primeRemainder_natCast_le (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (64 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 6 * ε) := by
  exact eventually_primeRemainder_natCast_le_of_density (s := 6 * ε) P (by positivity) (by positivity)

end IntegerBounds

/-- Let `d` be a prime, `q > 0`, and `R_q(y) = primeRemainder d q y = ∑_{n ≤ y} λ(n) (1/n - 1/y) -
log y / φ(q) - c_q`. Then `R_q(y) - R_q(⌊y⌋) ≤ 26 / y` for `y ≥ 2`. -/
lemma primeRemainder_sub_primeRemainder_floor_le {d : ℕ} [Fact d.Prime] {q : ℕ} [NeZero q] {y : ℝ}
    (hy : 2 ≤ y) : primeRemainder d q y - primeRemainder d q ⌊y⌋₊ ≤ 26 / y := by
  have h_le : (⌊y⌋₊ : ℝ) ≤ y := Nat.floor_le (zero_le_two.trans hy)
  have h_half := Nat.div_two_lt_floor (one_le_two.trans hy)
  calc primeRemainder d q y - primeRemainder d q ⌊y⌋₊ ≤ 13 * ((y - ⌊y⌋₊) / ⌊y⌋₊) :=
        (le_abs_self _).trans (abs_primeRemainder_sub_le (by linarith) h_le)
    _ ≤ 13 * (1 / (y / 2)) := by gcongr; linarith [Nat.self_sub_floor_lt_one y]
    _ = 26 / y := by field

/-- For `y ≥ 2` and `-1 ≤ t ≤ 0` we have `⌊y⌋ ^ t ≤ 2 y ^ t`, since `y / 2 ≤ ⌊y⌋`. -/
lemma natFloor_rpow_le_two_mul_rpow {y t : ℝ} (hy : 2 ≤ y) (ht_ge : -1 ≤ t) (ht_le : t ≤ 0) :
    (⌊y⌋₊ : ℝ) ^ t ≤ 2 * y ^ t := by
  have hy_pos : 0 < y := two_pos.trans_le hy
  calc (⌊y⌋₊ : ℝ) ^ t ≤ (y / 2) ^ t :=
    rpow_le_rpow_of_nonpos (half_pos hy_pos) (Nat.div_two_lt_floor (one_le_two.trans hy)).le ht_le
    _ = y ^ t / 2 ^ t := div_rpow hy_pos.le zero_le_two t
    _ ≤ y ^ t / 2 ^ (-1 : ℝ) := by
        gcongr
        exact one_le_two
    _ = 2 * y ^ t := by
        rw [rpow_neg_one]
        field

/-- If `q₀ > 0` is even and `d ≡ q₀ / 2 - 1` modulo `q₀`, then `q₀` divides `2 (d + 1)` but not
`d + 1`. This is the form of the congruence in `Parameters`. -/
lemma dvd_two_mul_succ_and_not_dvd_succ {q₀ d : ℕ} (hq₀_pos : 0 < q₀) (hq₀_even : 2 ∣ q₀)
    (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) : q₀ ∣ 2 * (d + 1) ∧ ¬q₀ ∣ d + 1 := by
  obtain ⟨q, rfl⟩ := hq₀_even
  have h_half : 2 * q / 2 - 1 + 1 = q := by omega
  have hd_succ : ((d + 1 : ℕ) : ZMod (2 * q)) = q := by
    rw [natCast_eq_natCast_iff]
    simpa only [h_half] using hd.add_right 1
  constructor
  · rw [← natCast_eq_zero_iff, Nat.cast_mul, hd_succ, ← Nat.cast_mul, natCast_self]
  · rw [← natCast_eq_zero_iff, hd_succ, natCast_eq_zero_iff]
    exact Nat.not_dvd_of_pos_of_lt (by omega) (by omega)

/-- **One-sided bound.** Let `q₀ > 0` be a multiple of `18480`, let `d ≡ q₀ / 2 - 1` modulo `q₀` be
a prime, and let `ε > 0`. Then `R = primeRemainder d q₀` satisfies
`R(y) ≤ (128 φ(q₀) + 32) y ^ (-1/2 + ε)` for all large real `y`. -/
theorem eventually_primeRemainder_le_mul_rpow {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [hd_prime : Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ y ≤ (128 * q₀.totient + 32) * y ^ (-1 / 2 + ε) := by
  let P : Parameters :=
    { q₀ := q₀
      d := d
      dvd_q₀ := hq₀
      d_prime := hd_prime.out
      q₀_dvd_and_not_dvd := dvd_two_mul_succ_and_not_dvd_succ (NeZero.pos q₀) (by omega) hd }
  let s := min (1 / 4 : ℝ) ε
  have hs : 0 < s := lt_min (by norm_num) hε
  have hs_le : s ≤ ε := min_le_right _ _
  set C : ℝ := 64 * q₀.totient + 3
  set t : ℝ := -1 / 2 + s with ht
  have ht_ge : -1 ≤ t := by linarith
  have ht_le : t ≤ 0 := by linarith [min_le_left (1 / 4 : ℝ) ε]
  have h_integer_bound : ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ ⌊y⌋₊ ≤ C * (⌊y⌋₊ : ℝ) ^ t :=
    tendsto_nat_floor_atTop.eventually
      (eventually_primeRemainder_natCast_le_of_density (C := C) P hs (by dsimp [C]; positivity))
  filter_upwards [h_integer_bound, eventually_ge_atTop 2] with y hy_floor hy
  have hy_one : 1 ≤ y := one_le_two.trans hy
  calc primeRemainder d q₀ y
      ≤ primeRemainder d q₀ ⌊y⌋₊ + 26 / y :=
        sub_le_iff_le_add'.1 (primeRemainder_sub_primeRemainder_floor_le hy)
    _ ≤ C * (⌊y⌋₊ : ℝ) ^ t + 26 * y ^ (-1 : ℝ) := by grw [hy_floor, rpow_neg_one, div_eq_mul_inv]
    _ ≤ C * (2 * y ^ t) + 26 * y ^ t := by
        gcongr
        exact natFloor_rpow_le_two_mul_rpow hy ht_ge ht_le
    _ = (128 * q₀.totient + 32) * y ^ t := by dsimp [C]; ring
    _ ≤ (128 * q₀.totient + 32) * y ^ (-1 / 2 + ε) :=
      mul_le_mul_of_nonneg_left (rpow_le_rpow_of_exponent_le hy_one (by linarith [ht]))
          (by positivity)

/-- **Main theorem**, in half-plane form: no Dirichlet `L`-function vanishes in `re s > 1/2`
(with `s ≠ 1` for a principal character). -/
theorem grh : DirichletLNonvanishingRightOfHalf := by
  -- Apply the one-sided criterion to the character modulo `q₀ = 18480 q` induced by `χ`, with
  -- `d₀ = q₀ / 2 - 1 = 9240 q - 1` and an exponent `β` between `1 / 2` and `re ρ`.
  intro q _ χ ρ hρ h_pole
  -- The case `ρ = 1` is Dirichlet's theorem.
  obtain rfl | hρ_ne := eq_or_ne ρ 1
  · exact χ.LFunction_ne_zero_of_one_le_re h_pole le_rfl
  obtain ⟨β, hβ, hβρ⟩ : ∃ β : ℝ, 1 / 2 < β ∧ β < ρ.re := exists_between hρ
  have hq_pos : 0 < q := NeZero.pos q
  obtain ⟨d₀, hd₀⟩ : ∃ d₀ : ℕ, d₀ + 1 = 9240 * q := ⟨9240 * q - 1, by omega⟩
  -- `d₀` is odd and `q₀ = 2 (d₀ + 1)`.
  have hd₀_cop : d₀.Coprime (18480 * q) := by
    have h_two : d₀.Coprime 2 := (Nat.odd_iff.2 (by omega)).coprime_two_right
    have h_eq : 18480 * q = 2 * (d₀ + 1) := by omega
    rw [h_eq]
    exact h_two.mul_right (by simp)
  -- The one-sided bound is the hypothesis of the criterion.
  have h_criterion_bound (d : Nat.Primes) (hd : (d : ℕ) ≡ d₀ [MOD 18480 * q]) :
      ∃ A : ℝ, ∀ᶠ x : ℝ in atTop, primeRemainder d (18480 * q) x ≤ A * x ^ (β - 1) := by
    refine ⟨128 * (18480 * q).totient + 32, ?_⟩
    have hd₀_eq : d₀ = 18480 * q / 2 - 1 := by omega
    have h_criterion_exponent : β - 1 = -1 / 2 + (β - 1 / 2) := by ring
    rw [hd₀_eq] at hd
    rw [h_criterion_exponent]
    exact eventually_primeRemainder_le_mul_rpow (dvd_mul_right 18480 q) hd (sub_pos.2 hβ)
  have h_induced_nonvanishing : (χ.changeLevel (dvd_mul_left q 18480)).LFunction ρ ≠ 0 :=
    LFunction_ne_zero_of_primeRemainder_le (by omega) (by omega) hd₀_cop hβ
      h_criterion_bound _ hρ_ne hβρ
  -- Inducing multiplies `L(s, χ)` by finitely many factors `1 - χ(p) p ^ (-s)`.
  rw [LFunction_changeLevel _ χ h_pole] at h_induced_nonvanishing
  exact left_ne_zero_of_mul h_induced_nonvanishing

end New
