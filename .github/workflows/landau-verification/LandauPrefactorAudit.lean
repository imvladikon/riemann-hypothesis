import Lean
import Main

open Lean Elab Command
open Filter Nat Real

namespace LandauPrefactorAudit

theorem previousLandau {E : ℝ → ℝ} {r : ℂ → ℂ} (h : New.IsPolar E r)
    {β : ℝ} (hβ : 0 < β) (hr : ∀ x : ℝ, β < x → 0 ≤ (r x).re)
    (hE_le : ∀ᶠ v : ℝ in atTop, E v ≤ Real.exp ((β - 1) * v))
    {ρ : ℂ} (hρ : β < ρ.re) : r ρ = 0 :=
  h.landau (A := 1) hβ hr (by simpa only [one_mul] using hE_le) hρ

theorem previousCriterion {q₀ : ℕ} [NeZero q₀] (hq₀ : 8 ∣ q₀) {d₀ : ℕ}
    (hd₀_mod : d₀ % 8 = 7) (hd₀_cop : d₀.Coprime q₀) {β : ℝ} (hβ : 1 / 2 < β)
    (h_bound : ∀ d : Primes, (d : ℕ) ≡ d₀ [MOD q₀] →
      ∀ᶠ x : ℝ in atTop, New.primeRemainder d q₀ x ≤ x ^ (β - 1))
    (ψ : DirichletCharacter ℂ q₀) {ρ : ℂ} (hρ_ne : ρ ≠ 1) (hρ_re : β < ρ.re) :
    ψ.LFunction ρ ≠ 0 :=
  New.LFunction_ne_zero_of_primeRemainder_le hq₀ hd₀_mod hd₀_cop hβ
    (fun d hd => ⟨1, by simpa only [one_mul] using h_bound d hd⟩) ψ hρ_ne hρ_re

theorem previousRemainderBound {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, New.primeRemainder d q₀ y ≤ y ^ (-1 / 2 + ε) := by
  let A : ℝ := 128 * q₀.totient + 32
  have hA : ∀ᶠ y : ℝ in atTop, A ≤ y ^ (ε / 2) :=
    (tendsto_rpow_atTop (half_pos hε)).eventually_ge_atTop A
  have hR := New.eventually_primeRemainder_le_mul_rpow hq₀ hd (half_pos hε)
  filter_upwards [hA, hR, eventually_ge_atTop (1 : ℝ)] with y hAy hRy hy
  have hy0 : 0 < y := zero_lt_one.trans_le hy
  calc
    New.primeRemainder d q₀ y ≤ A * y ^ (-1 / 2 + ε / 2) := hRy
    _ ≤ y ^ (ε / 2) * y ^ (-1 / 2 + ε / 2) :=
      mul_le_mul_of_nonneg_right hAy (Real.rpow_nonneg hy0.le _)
    _ = y ^ (-1 / 2 + ε) := by
      rw [← Real.rpow_add hy0, show ε / 2 + (-1 / 2 + ε / 2) = -1 / 2 + ε by ring]

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``New.exists_mul_exp_le, ``New.exists_measure_laplace_eq, ``New.IsPolar.landau,
      ``New.LFunction_ne_zero_of_primeRemainder_le, ``New.eventually_primeRemainder_le_mul_rpow,
      ``previousLandau, ``previousCriterion, ``previousRemainderBound, ``New.grh,
      ``riemannHypothesis, ``riemannZeta_eq_zero_re, ``LFunction_ne_zero_of_half_lt_re,
      ``LFunction_eq_zero_re, ``LFunction_eq_zero_re_of_isPrimitive] do
    let used ← collectAxioms decl
    for name in used do
      unless allowed.contains name do
        throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {used}"
  for (decl, required) in #[
      (``New.exists_measure_laplace_eq, ``New.exists_mul_exp_le),
      (``New.IsPolar.landau, ``New.exists_measure_laplace_eq),
      (``New.LFunction_ne_zero_of_primeRemainder_le, ``New.IsPolar.landau),
      (``New.grh, ``New.eventually_primeRemainder_le_mul_rpow),
      (``New.grh, ``New.LFunction_ne_zero_of_primeRemainder_le),
      (``LFunction_ne_zero_of_half_lt_re, ``New.grh)] do
    let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
      | throwError "no proof available for {decl}"
    unless proof.getUsedConstants.contains required do
      throwError "{decl} does not depend on {required}"
    logInfo m!"{decl} uses {required}"

end LandauPrefactorAudit
