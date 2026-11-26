import Main
import Lean

open Lean Elab Command
open New Filter Real

namespace FourthPowerAudit

private theorem absorbConstant {A B x t ε : ℝ} (hx : 0 < x) (hB : 0 ≤ B)
    (hAB : A ≤ 64 * B) (h64 : 64 ≤ x ^ ε) : A * x ^ t ≤ B * x ^ (t + ε) := calc
  _ ≤ (64 * B) * x ^ t := mul_le_mul_of_nonneg_right hAB (Real.rpow_nonneg hx.le _)
  _ ≤ (x ^ ε * B) * x ^ t :=
    mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right h64 hB) (Real.rpow_nonneg hx.le _)
  _ = _ := by rw [Real.rpow_add hx]; ring

private theorem previousStar {P : Parameters} (D : Data P) :
    D.m * D.totalRemainder ≤ D.f * D.a * D.logB ^ 5 := by
  have hlog : 128 ≤ D.logB := D.le_of_hasLogBound
  have ha : 0 < D.a := Data.HasLogBound.pos D
  calc D.m * D.totalRemainder ≤ 128 * (D.f * D.a * D.logB ^ 4) := star_inequality D
    _ ≤ D.logB * (D.f * D.a * D.logB ^ 4) := mul_le_mul_of_nonneg_right hlog (by positivity)
    _ = _ := by ring

private theorem previousDataBound {P : Parameters} (D : Data P) :
    primeRemainder P.d P.q₀ D.x ≤ P.q₀.totient * D.logB ^ 6 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  have hlog : 128 ≤ D.logB := D.le_of_hasLogBound
  have hlog_pos : 0 < D.logB := (by norm_num : (0 : ℝ) < 128).trans_le hlog
  have hm : (0 : ℝ) < D.m := Data.HasLogBound.pos D
  have hLeading : 128 * P.q₀.totient * D.logB ^ 5 / D.m ≤ P.q₀.totient * D.logB ^ 6 / D.m := calc
    _ = 128 * ((P.q₀.totient : ℝ) * D.logB ^ 5 / D.m) := by ring
    _ ≤ D.logB * ((P.q₀.totient : ℝ) * D.logB ^ 5 / D.m) :=
      mul_le_mul_of_nonneg_right hlog (by positivity)
    _ = _ := by ring
  exact D.primeRemainder_le.trans (add_le_add_right (add_le_add_right hLeading _) _)

private theorem previousIntegerBound (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) : ∀ᶠ x : ℕ in atTop,
    primeRemainder P.d P.q₀ x ≤ (64 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 6 * ε) := by
  have h64 : ∀ᶠ x : ℕ in atTop, (64 : ℝ) ≤ (x : ℝ) ^ ε :=
    ((tendsto_rpow_atTop hε).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop 64
  have hAB : (4096 * P.q₀.totient + 3 : ℝ) ≤ 64 * (64 * P.q₀.totient + 3 : ℝ) := by linarith
  filter_upwards [eventually_primeRemainder_natCast_le P hε hε_lt, h64, eventually_ge_atTop (1 : ℕ)]
    with x hx hx64 hx1
  have hxpos : (0 : ℝ) < x := Nat.cast_pos.2 (Nat.zero_lt_one.trans_le hx1)
  refine hx.trans ?_
  simpa only [show -1 / 2 + 5 * ε + ε = -1 / 2 + 6 * ε by ring] using
    (absorbConstant (t := -1 / 2 + 5 * ε) hxpos (by positivity) hAB hx64)

private theorem previousRealBound {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ y ≤ (128 * q₀.totient + 32) * y ^ (-1 / 2 + ε) := by
  have h64 : ∀ᶠ y : ℝ in atTop, (64 : ℝ) ≤ y ^ (ε / 2) :=
    (tendsto_rpow_atTop (half_pos hε)).eventually_ge_atTop 64
  have hAB : (8192 * q₀.totient + 32 : ℝ) ≤ 64 * (128 * q₀.totient + 32 : ℝ) := by linarith
  filter_upwards [eventually_primeRemainder_le_mul_rpow hq₀ hd (half_pos hε), h64,
    eventually_ge_atTop (1 : ℝ)] with y hy hy64 hy1
  refine hy.trans ?_
  simpa only [show -1 / 2 + ε / 2 + ε / 2 = -1 / 2 + ε by ring] using
    (absorbConstant (t := -1 / 2 + ε / 2) (zero_lt_one.trans_le hy1) (by positivity) hAB hy64)

run_cmd do
  for (decl, required) in #[
      (``star_inequality, ``Data.integral_forms_long),
      (``Data.primeRemainder_le, ``star_inequality),
      (``eventually_primeRemainder_natCast_le, ``Data.primeRemainder_le),
      (``eventually_primeRemainder_le_mul_rpow, ``eventually_primeRemainder_natCast_le),
      (``New.grh, ``eventually_primeRemainder_le_mul_rpow),
      (``New.grh, ``LFunction_ne_zero_of_primeRemainder_le),
      (``LFunction_ne_zero_of_half_lt_re, ``New.grh),
      (``riemannHypothesis, ``New.grh)] do
    let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
      | throwError "no proof available for {decl}"
    unless proof.getUsedConstants.contains required do
      throwError "{decl} does not use {required}"
    logInfo m!"{decl} uses {required}"
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``star_inequality, ``Data.primeRemainder_le,
      ``eventually_primeRemainder_natCast_le, ``eventually_primeRemainder_le_mul_rpow,
      ``previousStar, ``previousDataBound, ``previousIntegerBound, ``previousRealBound,
      ``riemannHypothesis, ``riemannZeta_eq_zero_re, ``LFunction_ne_zero_of_half_lt_re,
      ``LFunction_eq_zero_re, ``LFunction_eq_zero_re_of_isPrimitive] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end FourthPowerAudit
