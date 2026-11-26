import New.Determinant.Twist.LongForms
import New.Reduction.ShortAndEnough

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
* `D.normalizedPoincare g`: the translate `g 𝔭` by `g : D.chosenGL` of a fixed linear map `𝔭` from
  the source `D.ramifiedSourceForms` to the target `D.targetForms`.
* `D.integralRamified`: the source forms that are integral at every `ι : PrimePadicIso`.
* `D.errorUnit`: the unit of loss `f a log³ b`.

## The inputs

* Theorem A: (a) `span_short_integralRamified_eq_top` (size) and (b) `indexLe_normalizedPoincare`
  (index).
* Theorem B: `exists_few_normalizedPoincare`.
* Theorem C: `integral_forms_long_with_completion_cost`, from a twist for each prime
  (`TwistedLattice.covolume_add_index_nonneg`) and the height of `Z(1) / Z(ξ_ι)`
  (`heightLe_chainDeterminant_one_div`).
* Hadamard's bound for the covolume: `TwistedLattice.covolumeLe_of_normSqAt_le`.
* The sign of the main amount: `mainAmount_nonneg`.

## What cancels, and where

* The main amount, between the upper and the lower bound: the comparison step of
  `star_inequality_with_completion_cost`.
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

| source   | where             | amount                              |
|----------|-------------------|-------------------------------------|
| size     | Theorem A (a)     | `f a log⁴ b`                        |
| index    | Theorems A (b), B | `20 f a log⁴ b`                     |
| covolume | Theorem C         | `f a log⁴ b + 2 b`                  |

Each missing dimension costs `2 x₁² b² + b`, so the greedy choice stops at the missing share
`1 / (1 + 2 x₁² b)`. The total completion cost is at most `dim · b`. The table includes the
doubled index. The family has `n ≥ (24 / 25) dim` members, and the sum is at most `24 f a log⁴ b`
per dimension. Therefore `m rem ≤ 25 f a log⁴ b`.

## Relation to the literature

Earlier bounds for sums over primes by size against divisibility: Pritsker, The Gelfond–Schnirelman
method in prime number theory, 2005; Granville–Stark, ABC implies no Siegel zeros for L-functions of
characters with negative discriminant, 2000; Bombieri, Counting points on curves over finite fields,
Sém. Bourbaki 430, 1973; van Frankenhuijsen, The Riemann hypothesis for function fields over a
finite field, 2008.
-/

namespace New

open Real Finset Data Module Submodule

/-- **Main inequality.** For the data `D` we have `m rem ≤ 25 f a log⁴ b`.

The parameters `P` are a multiple `q₀` of `18480` and a prime `d ≡ q₀/2 - 1 mod q₀`. The scales are
integers with `(log b) ^ 100 ≤ x`, `x ^ 10⁶ ≤ x₁`, `x₁ ^ 10⁶ ≤ b` and
`log log b ≥ 10¹² P.constantBound`. -/
theorem star_inequality_with_completion_cost {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ 25 * (D.f * D.a * D.logB ^ 4) := by
  let denominator : ℝ := 1 + 2 * D.x₁ ^ 2 * D.b
  let share : ℝ := denominator⁻¹
  have hden_pos : 0 < denominator := by
    dsimp [denominator]
    positivity
  have hden_sq : 4 * denominator ≤ D.b ^ 2 := by
    dsimp [denominator]
    exact D.le_of_hasLogBound
  have hshare_ge : 4 / D.b ^ 2 ≤ share := by
    dsimp only [share]
    rw [← one_div]
    exact (div_le_div_iff₀ (by positivity) hden_pos).2 (by simpa using hden_sq)
  have hshare_small : share ≤ 1 / 25 := by
    have hden_large : 25 ≤ denominator := by
      dsimp [denominator]
      exact D.le_of_hasLogBound
    dsimp only [share]
    rw [← one_div]
    exact (div_le_div_iff₀ hden_pos (by norm_num)).2 (by simpa using hden_large)
  have hshare_lt : share < 1 := hshare_small.trans_lt (by norm_num)
  obtain ⟨t, ht_card, h_fill⟩ := D.exists_few_normalizedPoincare hshare_ge hshare_lt
  rw [show share⁻¹ = denominator by simp [share]] at ht_card
  have h_log : 1 + log denominator ≤ 2 * D.logB := by
    have h_mul : 3 * denominator ≤ D.b ^ 2 :=
      (mul_le_mul_of_nonneg_right (by norm_num) hden_pos.le).trans hden_sq
    have h := log_le_log (by positivity : 0 < 3 * denominator) h_mul
    rw [log_mul (by norm_num) hden_pos.ne', log_pow, Data.b, log_exp, Nat.cast_ofNat] at h
    have h_three : 1 ≤ log 3 :=
      (le_log_iff_exp_le (by norm_num)).2 exp_one_lt_three.le
    linarith
  have ht_count : #t * finrank ℂ D.ramifiedSourceForms ≤ 5 * D.targetDim * D.logB := by
    calc #t * finrank ℂ D.ramifiedSourceForms ≤
        5 / 2 * (1 + log denominator) * D.targetDim := ht_card
      _ ≤ 5 / 2 * (2 * D.logB) * D.targetDim := by gcongr
      _ = 5 * D.targetDim * D.logB := by ring
  let loss : ℝ := D.f * D.a * D.logB ^ 4
  let logNormSq : ℝ := D.mainAmount - D.m * D.totalRemainder + loss
  let short : Set D.ramifiedSourceForms :=
    {φ ∈ D.integralRamified | ∀ (g : D.chosenGL) (σ : ℂ ≃+* ℂ),
      (D.Θ 1 (D.normalizedPoincare g φ)).normSqAt σ ≤ exp logNormSq}
  have h_span : span ℂ short = ⊤ := D.span_short_integralRamified_eq_top
  -- The family: among the forms `D.normalizedPoincare g φ` with `g ∈ t` and `φ` short, a basis of
  -- their span.
  obtain ⟨n, y, h_indep, h_many, hy⟩ : ∃ (n : ℕ) (y : Fin n → D.targetForms),
      LinearIndependent ℂ y ∧ (1 - share) * D.targetDim ≤ n ∧
      ∀ i : Fin n, ∃ g ∈ t, y i ∈ D.normalizedPoincare g '' short := by
    let images : Set D.targetForms := ⋃ g ∈ t, D.normalizedPoincare g '' short
    have span_eq : span ℂ images = ⨆ g ∈ t, (D.normalizedPoincare g).range := by
      simp only [images, span_iUnion₂, span_image, h_span, Submodule.map_top]
    obtain ⟨y, hy_mem, -, h_indep⟩ := exists_fun_fin_finrank_span_eq ℂ images
    refine ⟨finrank ℂ (span ℂ images), y, h_indep, by rwa [span_eq], fun i ↦ ?_⟩
    simpa only [images, Set.mem_iUnion, exists_prop] using hy_mem i
  have hn_le : (n : ℝ) ≤ D.targetDim := by simpa using h_indep.fintype_card_le_finrank
  -- Covolume: each form has squared length at most `exp logNormSq`.
  have h_cov : D.targetLattice.CovolumeLe y (n * logNormSq) := by
    refine TwistedLattice.covolumeLe_of_normSqAt_le fun i σ ↦ ?_
    obtain ⟨g, -, φ, ⟨-, hφ_short⟩, hφ_eq⟩ := hy i
    rw [normSqAt_targetLattice, ← hφ_eq]
    exact hφ_short g σ
  -- Index: each translate in `t` contributes `2 · errorUnit` per dimension of the source.
  have h_errorUnit_nonneg : 0 ≤ D.errorUnit := (HasLogBound.pos D).le
  have h_index : D.targetLattice.IndexLe y (D.targetDim * (10 * loss)) := by
    have hy_int (i : Fin n) : ∃ g ∈ t, y i ∈ D.normalizedPoincare g '' D.integralRamified := by
      obtain ⟨g, hg, φ, ⟨hφ_int, -⟩, hφ_eq⟩ := hy i
      exact ⟨g, hg, φ, hφ_int, hφ_eq⟩
    refine (D.indexLe_normalizedPoincare t hy_int).mono ?_
    calc #t * finrank ℂ D.ramifiedSourceForms * (2 * D.errorUnit)
        ≤ 5 * D.targetDim * D.logB * (2 * D.errorUnit) := by grw [ht_count]
      _ = D.targetDim * (10 * loss) := by
        dsimp [loss, Data.errorUnit]
        ring
  have h_completion : ((D.targetDim : ℝ) - n) * (2 * D.x₁ ^ 2 * D.b ^ 2 + D.b) ≤
      D.targetDim * D.b := by
    have h_cost : share * (2 * D.x₁ ^ 2 * D.b ^ 2 + D.b) = D.b := by
      have h_factor : 2 * D.x₁ ^ 2 * D.b ^ 2 + D.b = denominator * D.b := by
        dsimp [denominator]
        ring
      dsimp only [share]
      rw [h_factor, ← mul_assoc, inv_mul_cancel₀ hden_pos.ne', one_mul]
    calc ((D.targetDim : ℝ) - n) * (2 * D.x₁ ^ 2 * D.b ^ 2 + D.b)
        ≤ (share * D.targetDim) * (2 * D.x₁ ^ 2 * D.b ^ 2 + D.b) :=
          mul_le_mul_of_nonneg_right (by linarith [h_many]) (by positivity)
      _ = D.targetDim * (share * (2 * D.x₁ ^ 2 * D.b ^ 2 + D.b)) := by ring
      _ = D.targetDim * D.b := by rw [h_cost]
  have h_long := integral_forms_long_with_completion_cost h_indep h_index h_cov
  have h_loss_pos : 0 < loss := HasLogBound.pos D
  have h_main : n * (D.mainAmount + loss) ≤ D.targetDim * (D.mainAmount + loss) :=
    mul_le_mul_of_nonneg_right hn_le (add_nonneg D.mainAmount_nonneg h_loss_pos.le)
  have h_b : (D.targetDim : ℝ) * D.b ≤ D.targetDim * loss :=
    mul_le_mul_of_nonneg_left D.le_of_hasLogBound D.targetDim.cast_nonneg
  have h_rem : n * (D.m * D.totalRemainder) ≤ D.targetDim * (24 * loss) := by
    change D.targetDim * (D.mainAmount - loss - D.b) ≤
      n * (D.mainAmount - D.m * D.totalRemainder + loss) + 2 * (D.targetDim * (10 * loss)) +
        ((D.targetDim : ℝ) - n) * (2 * D.x₁ ^ 2 * D.b ^ 2 + D.b) at h_long
    linarith only [h_long, h_completion, h_main, h_b]
  have h_rank : (24 / 25 : ℝ) * D.targetDim ≤ n := by
    grw [show (24 / 25 : ℝ) ≤ 1 - share by linarith, h_many]
  have hn_pos : (0 : ℝ) < n :=
    (mul_pos (by norm_num) (Nat.cast_pos.2 D.targetDim_pos)).trans_le h_rank
  refine le_of_mul_le_mul_left ?_ hn_pos
  calc n * (D.m * D.totalRemainder) ≤ D.targetDim * (24 * loss) := h_rem
    _ = (24 * D.targetDim) * loss := by ring
    _ ≤ (25 * n) * loss := mul_le_mul_of_nonneg_right (by linarith) h_loss_pos.le
    _ = n * (25 * loss) := by ring

/-- The fourth-power bound with the earlier coefficient. -/
theorem star_inequality {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ 128 * (D.f * D.a * D.logB ^ 4) :=
  (star_inequality_with_completion_cost D).trans
    (mul_le_mul_of_nonneg_right (by norm_num) (HasLogBound.pos D).le)

end New
