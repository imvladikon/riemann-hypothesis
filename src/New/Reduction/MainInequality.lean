module

import Mathlib.Data.Rat.Cast.OfScientific
public import New.Reduction.PrimeSums
import New.Determinant.Twist.LongForms
import New.Reduction.ShortAndEnough
import New.UpperBound.Divisibility.LocalDivisibility

/-!
# The main inequality

One covolume, corrected by an index, is bounded from both sides. Write `dim` for the dimension of
the target (`targetDim`), `mainAmount` for the main amount and `rem` for the total remainder
(`totalRemainder`), weighted sums over primes less their expected values. Theorems A and B give a
family of `n ≤ dim` target forms, a bound `V` for the logarithm of the squared covolume of its lifts
(`TwistedLattice.CovolumeLe`) and a bound `δ` for its index (`TwistedLattice.IndexLe`). Up to
errors,

    mainAmount ≤ (V + 2 δ) / dim ≤ mainAmount - (n / dim) m rem,

where the lower bound is Theorem C. The main amount cancels.

Notions from other files:

* `Data P`: the data for the parameters `P` (a modulus `q₀` and a prime `d`). They bundle
  scales `x`, `x₁`, `b` in prescribed ranges (`D.logB = log b`), the number `D.m` of lifts, a set
  of places of the CM field `D.E`, the `b`-places, which carry the weight `b`, and primes for the
  levels. `D.a = x b`, and `D.f` is the number of infinite places of `D.E`.
* `D.normalizedPoincareWithLoss D.valuationLoss g`: the translate `g 𝔭` of a fixed linear map `𝔭`
  from the source `D.ramifiedSourceForms` to the target `D.targetForms`.
* `D.integralRamified`: the source forms that are integral at every `ι : PrimePadicIso`.
* `D.errorUnit`: the unit of loss `f a log³ b`.

## The inputs

* Theorem A: (a) `span_short_integralRamified_eq_top_linear` (size) and
  (b) `indexLe_normalizedPoincare_with_valuationLoss` (index), both in `New.Reduction.ShortAndEnough`.
* Theorem B: `exists_few_normalizedPoincareWithLoss` in `New.Reduction.ShortAndEnough`.
* Theorem C: `integral_forms_long_with_linear_error` in `New.Determinant.Twist.LongForms`,
  from a twist for each prime
  (`TwistedLattice.covolume_add_index_nonneg`) and the height of `Z(1) / Z(ξ_ι)`
  (`heightLe_chainDeterminant_one_div_of_bound`).
* Hadamard's bound for the covolume: `TwistedLattice.covolumeLe_of_normSqAt_le`.
* The sign of the main amount: `mainAmount_nonneg`.

## What cancels, and where

* The main amount cancels in `star_inequality_linear`.
* The gains `∑ gain_l log l` in the size of the chain, against `log c_B`:
  `span_short_integralRamified_eq_top`.
* The constant `c₁ = (logDerivMean d 1 1).re`, between the period and the expected value
  `a (log (a / κ̄) + c₁)` of the prime sums:
  `jetSize_sub_mainPrimeSum_le`.
* The excesses `a log (κ̄ M rd_E / 2π)` of the `m` lifts, against `a log N`, up to `O(a log b)`.
  Here `κ̄` is the geometric mean of the weights `κ` over the `f` places and `rd_E` is the root
  discriminant of `E`:
  `mul_jetSize_sub_mainPrimeSum_sub_le`.
* The main terms `log x`, `log x₁` and `c₁` of the prime sums, against their expected value:
  `totalRemainder_eq`.
* A constant that depends on `q₀`, between the two cut-offs: `sum_aPlaces_primeSum`.

## The errors per dimension

| source   | where             | amount                             |
|----------|-------------------|------------------------------------|
| size     | Theorem A (a)     | `f a (log b)² (3 + 64 (log x₁)²)`  |
| index    | Theorems A (b), B | `2 f a (log x₁)³`                  |
| covolume | Theorem C         | `17 f a (log b)² + 2 b`            |

Each missing dimension costs `(1 + 2 x²⁰²) b`, so the greedy choice stops at the missing share
`1 / (1 + 2 x²⁰²)`. The total completion cost is at most `dim · b`. The table includes the
doubled index. The family has `n ≥ (49 / 50) dim` members, and the sum is at most
`88 f a (log b)² (log x₁)²` per dimension, so `m rem ≤ 90 f a (log b)² (log x₁)²`.

## Relation to the literature

Earlier bounds for sums over primes by size against divisibility: Pritsker, The Gelfond–Schnirelman
method in prime number theory, 2005; Granville–Stark, ABC implies no Siegel zeros for L-functions of
characters with negative discriminant, 2000; Bombieri, Counting points on curves over finite fields,
Sém. Bourbaki 430, 1973; van Frankenhuijsen, The Riemann hypothesis for function fields over a
finite field, 2008.
-/

@[expose] public section

namespace New

open Real Finset Data Module Submodule

private noncomputable def completionFactor {P : Parameters} (D : Data P) : ℝ := 1 + 2 * D.x ^ 202

private lemma one_add_log_completionFactor_le {P : Parameters} (D : Data P) :
    1 + log (completionFactor D) ≤ 205 * D.logX := by
  have hx_pow : 1 ≤ D.x ^ 202 := D.le_of_hasLogBound
  have h_factor : completionFactor D ≤ 3 * D.x ^ 202 := by
    dsimp only [completionFactor]
    linarith only [hx_pow]
  have h := log_le_log (show 0 < completionFactor D by unfold completionFactor; positivity) h_factor
  rw [log_mul (by norm_num) (by positivity), log_pow, Nat.cast_ofNat, Data.x, log_exp] at h
  have h_three := log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 3)
  have hx : 1 ≤ D.logX := by
    linarith [D.constantBound_le, D.mul_log_logB_le_logX, (le_constantBound (P := P)).1]
  linarith only [h, h_three, hx]

private lemma translateColengthLoss_le_cutoffCube {P : Parameters} (D : Data P) :
    5 * (1 + log (completionFactor D)) * D.colengthLossSumBound ≤ D.f * D.a * D.logX₁ ^ 3 := by
  have h_logX : 0 ≤ D.logX := by
    linarith [D.constantBound_le, D.mul_log_logB_le_logX, (le_constantBound (P := P)).1]
  have h_scale : 31775 * D.logX ≤ D.logX₁ := by linarith only [D.logX_le_logX₁, h_logX]
  calc 5 * (1 + log (completionFactor D)) * D.colengthLossSumBound
    _ ≤ 5 * (205 * D.logX) * D.colengthLossSumBound := by
      gcongr
      exact one_add_log_completionFactor_le D
    _ = (31775 * D.logX) * (D.f * D.a * D.logX₁ ^ 2) := by unfold colengthLossSumBound; ring
    _ ≤ D.logX₁ * (D.f * D.a * D.logX₁ ^ 2) := mul_le_mul_of_nonneg_right h_scale (by positivity)
    _ = _ := by ring

/-- The main inequality with linear errors at every step.

The parameters `P` are a multiple `q₀` of `18480` and a prime `d ≡ q₀/2 - 1 mod q₀`. The scales are
integers with `(log b) ^ 100 ≤ x`, `x ^ 10⁶ ≤ x₁`, `x₁ ^ 10⁶ ≤ b` and
`log log b ≥ 10¹² P.constantBound`. -/
theorem star_inequality_linear {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ (1350 * 10 ^ 6) * (D.f * D.a * D.logB) := by
  let denominator := completionFactor D
  let share : ℝ := denominator⁻¹
  have hden_pos : 0 < denominator := by
    dsimp [denominator, completionFactor]
    positivity
  have hden_sq : 4 * denominator ≤ D.b ^ 2 := by
    dsimp [denominator, completionFactor]
    exact D.le_of_hasLogBound
  have hshare_ge : 4 / D.b ^ 2 ≤ share := by
    dsimp only [share]
    rw [← one_div]
    exact (div_le_div_iff₀ (by positivity) hden_pos).2 (by simpa using hden_sq)
  have hshare_small : share ≤ 1 / 50 := by
    have hden_large : 50 ≤ denominator := by
      dsimp [denominator, completionFactor]
      exact D.le_of_hasLogBound
    dsimp only [share]
    rw [← one_div]
    exact (div_le_div_iff₀ hden_pos (by norm_num)).2 (by simpa using hden_large)
  have hshare_lt : share < 1 := hshare_small.trans_lt (by norm_num)
  obtain ⟨t, ht_card, h_fill⟩ := D.exists_few_normalizedPoincareWithLoss D.valuationLoss hshare_ge hshare_lt
  rw [show share⁻¹ = denominator by simp [share]] at ht_card
  let normalized := D.normalizedPoincareWithLoss D.valuationLoss
  let sizeLoss : ℝ := 684 * D.linearErrorUnit
  let logNormBound : ℝ := D.mainAmount - D.m * D.totalRemainder + sizeLoss
  let short : Set D.ramifiedSourceForms :=
    {φ ∈ D.integralRamified | ∀ (g : D.chosenGL) (σ : ℂ ≃+* ℂ),
      (D.Θ 1 (normalized g φ)).normSqAt σ ≤ exp logNormBound}
  have h_short_span : span ℂ short = ⊤ := D.span_short_integralRamified_eq_top_linear
  -- Take a basis from the forms `normalized g φ` with `g ∈ t` and `φ` short.
  obtain ⟨n, y, h_indep, h_near_full_rank, h_image_short⟩ : ∃ (n : ℕ) (y : Fin n → D.targetForms),
      LinearIndependent ℂ y ∧ (1 - share) * D.targetDim ≤ n ∧
      ∀ i : Fin n, ∃ g ∈ t, y i ∈ normalized g '' short := by
    let images : Set D.targetForms := ⋃ g ∈ t, normalized g '' short
    have span_eq : span ℂ images = ⨆ g ∈ t, (normalized g).range := by
      simp only [images, span_iUnion₂, span_image, h_short_span, Submodule.map_top]
    obtain ⟨y, hy_mem, -, h_indep⟩ := exists_fun_fin_finrank_span_eq ℂ images
    refine ⟨finrank ℂ (span ℂ images), y, h_indep, by rwa [span_eq], fun i ↦ ?_⟩
    simpa only [images, Set.mem_iUnion, exists_prop] using hy_mem i
  have hn_le : (n : ℝ) ≤ D.targetDim := by simpa using h_indep.fintype_card_le_finrank
  -- Covolume: each form has squared length at most `exp logNormBound`.
  have h_covolume_upper : D.targetLattice.CovolumeLe y (n * logNormBound) := by
    refine TwistedLattice.covolumeLe_of_normSqAt_le fun i σ ↦ ?_
    obtain ⟨g, -, φ, ⟨-, hφ_short⟩, hφ_eq⟩ := h_image_short i
    rw [normSqAt_targetLattice, ← hφ_eq]
    exact hφ_short g σ
  -- Index: each translate in `t` contributes twice the weighted colength loss per source dimension.
  let indexBudgetPerDim : ℝ := D.f * D.a * D.logX₁ ^ 3
  have h_loss : 0 ≤ D.colengthLossSumBound := by simpa using D.sum_colengthLoss_mul_log_le ∅
  have h_index_upper : D.targetLattice.IndexLe y (D.targetDim * indexBudgetPerDim) := by
    have hy_int (i : Fin n) : ∃ g ∈ t, y i ∈ normalized g '' D.integralRamified := by
      obtain ⟨g, hg, φ, ⟨hφ_int, -⟩, hφ_eq⟩ := h_image_short i
      exact ⟨g, hg, φ, hφ_int, hφ_eq⟩
    refine (D.indexLe_normalizedPoincare_with_valuationLoss t hy_int).mono ?_
    calc #t * finrank ℂ D.ramifiedSourceForms * (2 * D.colengthLossSumBound)
        ≤ (5 / 2 * (1 + log denominator) * D.targetDim) * (2 * D.colengthLossSumBound) :=
          mul_le_mul_of_nonneg_right ht_card (by positivity)
      _ = D.targetDim * (5 * (1 + log denominator) * D.colengthLossSumBound) := by ring
      _ ≤ D.targetDim * indexBudgetPerDim :=
        mul_le_mul_of_nonneg_left (translateColengthLoss_le_cutoffCube D) D.targetDim.cast_nonneg
  have h_completion : ((D.targetDim : ℝ) - n) * (denominator * D.b) ≤ D.targetDim * D.b := by
    calc ((D.targetDim : ℝ) - n) * (denominator * D.b)
        ≤ (share * D.targetDim) * (denominator * D.b) :=
          mul_le_mul_of_nonneg_right (by linarith only [h_near_full_rank]) (by positivity)
      _ = D.targetDim * ((share * denominator) * D.b) := by ring
      _ = D.targetDim * D.b := by rw [inv_mul_cancel₀ hden_pos.ne', one_mul]
  -- Apply C to the same family. The index contributes to both Gram variables.
  have h_volume_index_lower :=
    integral_forms_long_with_linear_error h_indep h_index_upper h_covolume_upper
  have hB : 0 < D.logB := HasLogBound.pos D
  have h_size_nonneg : 0 ≤ sizeLoss := by
    dsimp [sizeLoss, linearErrorUnit]
    positivity
  have h_main_comparison : n * (D.mainAmount + sizeLoss) ≤
      D.targetDim * (D.mainAmount + sizeLoss) :=
    mul_le_mul_of_nonneg_right hn_le (add_nonneg D.mainAmount_nonneg h_size_nonneg)
  have h_b : (D.targetDim : ℝ) * D.b ≤ D.targetDim * D.linearErrorUnit :=
    mul_le_mul_of_nonneg_left D.le_of_hasLogBound D.targetDim.cast_nonneg
  have h_index_cost : 2 * (D.targetDim * indexBudgetPerDim) ≤
      D.targetDim * (2 * D.linearErrorUnit) := by
    have h_cutoff : D.logX₁ ^ 3 ≤ D.logB := D.le_of_hasLogBound
    dsimp [indexBudgetPerDim, linearErrorUnit]
    have h_cost := mul_le_mul_of_nonneg_left h_cutoff
      (show (0 : ℝ) ≤ D.targetDim * D.f * D.a by positivity)
    linarith only [h_cost]
  have h_main_cancelled : n * (D.m * D.totalRemainder) ≤
      D.targetDim * ((1300 * 10 ^ 6 + 688) * D.linearErrorUnit) := by
    change D.targetDim * (D.mainAmount - (1300 * 10 ^ 6) * D.linearErrorUnit - D.b) ≤
      n * (D.mainAmount - D.m * D.totalRemainder + sizeLoss) +
        2 * (D.targetDim * indexBudgetPerDim) + ((D.targetDim : ℝ) - n) * (denominator * D.b)
      at h_volume_index_lower
    dsimp only [sizeLoss] at h_volume_index_lower h_main_comparison
    linarith only [h_volume_index_lower, h_completion, h_main_comparison, h_b, h_index_cost]
  have h_rank : (49 / 50 : ℝ) * D.targetDim ≤ n := by
    grw [show (49 / 50 : ℝ) ≤ 1 - share by linarith, h_near_full_rank]
  have hn_pos : (0 : ℝ) < n :=
    (mul_pos (by norm_num) (Nat.cast_pos.2 D.targetDim_pos)).trans_le h_rank
  refine le_of_mul_le_mul_left ?_ hn_pos
  have h_coeff : 1300 * 10 ^ 6 + 688 ≤
      (49 / 50 : ℝ) * (1350 * 10 ^ 6) := by
    norm_num
  have h_rank_cost : (D.targetDim : ℝ) * (1300 * 10 ^ 6 + 688) ≤ n * (1350 * 10 ^ 6) := calc
    _ ≤ D.targetDim * ((49 / 50 : ℝ) * (1350 * 10 ^ 6)) :=
      mul_le_mul_of_nonneg_left h_coeff D.targetDim.cast_nonneg
    _ = ((49 / 50 : ℝ) * D.targetDim) * (1350 * 10 ^ 6) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_right h_rank (by positivity)
  calc n * (D.m * D.totalRemainder)
    _ ≤ D.targetDim * ((1300 * 10 ^ 6 + 688) * D.linearErrorUnit) := h_main_cancelled
    _ = (D.targetDim * (1300 * 10 ^ 6 + 688)) * D.linearErrorUnit := by ring
    _ ≤ (n * (1350 * 10 ^ 6)) * D.linearErrorUnit :=
      mul_le_mul_of_nonneg_right h_rank_cost (by unfold linearErrorUnit; positivity)
    _ = _ := by unfold linearErrorUnit; ring

/-- The main inequality expressed in quadratic units. -/
theorem star_inequality_quadratic {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ 27 * (D.f * D.a * D.logB ^ 2) := by
  refine (star_inequality_linear D).trans ?_
  have h_loss := D.mul_linearErrorUnit_le_quadraticErrorUnit
    (D.le_of_hasLogBound : (1350 * 10 ^ 6 : ℝ) ≤ D.logB)
  linarith only [h_loss, show 0 ≤ (D.f * D.a * D.logB ^ 2 : ℝ) by positivity]

/-- The main inequality expressed with the earlier weighted valuation budget. -/
theorem star_inequality_with_weighted_loss {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ 90 * (D.f * D.a * D.logB ^ 2 * D.logX₁ ^ 2) := by
  have h_logX₁ : 1 ≤ D.logX₁ := by
    linarith [D.constantBound_le, D.mul_log_logB_le_logX, D.logX_le_logX₁,
      (le_constantBound (P := P)).1]
  have h_coeff : 27 ≤ 90 * D.logX₁ ^ 2 := by nlinarith
  calc
    _ ≤ 27 * D.quadraticErrorUnit := star_inequality_quadratic D
    _ ≤ (90 * D.logX₁ ^ 2) * D.quadraticErrorUnit :=
      mul_le_mul_of_nonneg_right h_coeff (by unfold quadraticErrorUnit; positivity)
    _ = _ := by unfold quadraticErrorUnit; ring

/-- The main inequality with the colength budget expressed in cubic units. -/
theorem star_inequality_with_colength_budget {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ 18 * D.errorUnit := by
  have h_scale : 5 * D.logX₁ ^ 2 ≤ D.logB := D.le_of_hasLogBound
  calc D.m * D.totalRemainder ≤ 90 * (D.f * D.a * D.logB ^ 2 * D.logX₁ ^ 2) :=
      star_inequality_with_weighted_loss D
    _ = 18 * (D.quadraticErrorUnit * (5 * D.logX₁ ^ 2)) := by unfold quadraticErrorUnit; ring
    _ ≤ 18 * (D.quadraticErrorUnit * D.logB) := by gcongr
    _ = 18 * D.errorUnit := by unfold quadraticErrorUnit Data.errorUnit; ring

/-- The main inequality with a polynomial completion factor and a cubic error. -/
theorem star_inequality_with_polynomial_completion {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ 20 * D.errorUnit :=
  (star_inequality_with_colength_budget D).trans
    (mul_le_mul_of_nonneg_right (by norm_num) (HasLogBound.pos D).le)

/-- The main inequality with the fifth-power error. -/
theorem star_inequality {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ D.f * D.a * D.logB ^ 5 := by
  have h_scale : 20 ≤ D.logB ^ 2 := D.le_of_hasLogBound
  calc
    _ ≤ 20 * D.errorUnit := star_inequality_with_polynomial_completion D
    _ ≤ D.logB ^ 2 * D.errorUnit :=
      mul_le_mul_of_nonneg_right h_scale (HasLogBound.pos D).le
    _ = _ := by unfold Data.errorUnit; ring

end New
