module

import Lean
import all Development.AutomorphicArithmetic.ThickFrames.topsGroup

open Classical Finset Lean Lean.Elab.Command
open UpperTheory.BernoulliSumsFrobeniusOrbits

namespace QuotientTopCountsAudit

theorem previous_shares_of_counts (A : Type) [Fintype A] [DecidableEq A] [AddCommGroup A]
    (A0 : AddSubgroup A) (T : Finset A) (δ η D : ℝ) (hδ : 0 < δ) (hη : η ≤ 1)
    (hD : 0 ≤ D) (hDη : 4 * A0.index * D ≤ η * (δ * Nat.card A0))
    (hc : ∀ γ : A, |((T.filter fun t => t - γ ∈ A0).card : ℝ) -
      (if γ ∈ A0 then δ else 3 / 4 * δ) * Nat.card A0| ≤ D) :
    δ * Fintype.card A / 2 ≤ (T.card : ℝ) ∧ (T.card : ℝ) ≤ 2 * δ * Fintype.card A ∧
      ∀ γ : A, |((T.filter fun t => t - γ ∈ A0).card : ℝ) -
        (if γ ∈ A0 then 4 else 3) / (3 * (A0.index : ℝ) + 1) * (T.card : ℝ)| ≤ η * T.card :=
  shares_of_counts A A0 T δ η D hδ hη hD hDη hc

theorem relative_top_count {x δ o n₀ r D : ℝ} (hx : 0 < x) (hδ : 0 < δ)
    (ho : 0 < o) (hn : 0 < n₀) (hCount : |r - (3 * o + 1) / 4 * δ * n₀| ≤ o * D)
    (hD : 4 * o * D ≤ x⁻¹ * (δ * n₀)) :
    |r / (δ * (o * n₀)) - (3 + 1 / o) / 4| ≤ 1 / (4 * o * x) := by
  have hMass : 0 < δ * (o * n₀) := by positivity
  rw [show r / (δ * (o * n₀)) - (3 + 1 / o) / 4 =
    (r - (3 * o + 1) / 4 * δ * n₀) / (δ * (o * n₀)) by
      field_simp [hδ.ne', ho.ne', hn.ne']]
  rw [abs_div, abs_of_pos hMass, div_le_iff₀ hMass]
  calc
    _ ≤ o * D := hCount
    _ ≤ x⁻¹ * (δ * n₀) / 4 := by linarith
    _ = _ := by field_simp [ho.ne', hx.ne']

theorem window_top_ratio {x eps n r : ℝ} (hx : 0 < x)
    (h : 3 / 4 * x ^ (-(eps / 8)) * n ≤ r) : n ≤ 4 / 3 * r * x ^ (eps / 8) := by
  have hScaled : n * x ^ (-(eps / 8)) ≤ 4 / 3 * r := by linarith
  calc
    n = n * x ^ (-(eps / 8)) * x ^ (eps / 8) := by
      rw [mul_assoc, ← Real.rpow_add hx, neg_add_cancel, Real.rpow_zero, mul_one]
    _ ≤ _ := mul_le_mul_of_nonneg_right hScaled (Real.rpow_nonneg hx.le _)

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for name in #[``previous_shares_of_counts, ``relative_top_count, ``window_top_ratio,
      ``shares_of_counts, ``topsGroup] do
    let axioms ← collectAxioms name
    for axiomName in axioms do
      unless allowed.contains axiomName do throwError "{name} uses disallowed axiom {axiomName}"
    logInfo m!"{name} uses {axioms}"
  let env := (← getEnv).setExporting false
  for (name, dependency) in #[(``shares_of_counts, ``Finset.card_eq_sum_card_fiberwise),
      (``topsGroup, ``shares_of_counts)] do
    let some value := env.find? name |>.bind (·.value? true)
      | throwError "no proof available for {name}"
    unless value.getUsedConstants.contains dependency do throwError "{name} does not use {dependency}"
    logInfo m!"{name} uses {dependency}"

end QuotientTopCountsAudit
