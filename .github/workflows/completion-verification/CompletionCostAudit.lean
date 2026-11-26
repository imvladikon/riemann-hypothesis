import Main
import Lean

open Lean Elab Command
open New

namespace CompletionCostAudit

private theorem previousTheoremC {P : Parameters} {D : Data P} {n : ℕ}
    {y : Fin n → D.targetForms} {δ c : ℝ}
    (hy : LinearIndependent ℂ y) (hn : (1 - 4 / D.b ^ 2) * D.targetDim ≤ n)
    (hδ : D.targetLattice.IndexLe y δ) (hc : D.targetLattice.CovolumeLe y c) :
    D.targetDim * (D.mainAmount - 3 * (D.f * D.a * D.logB ^ 4)) ≤ c + 2 * δ :=
  Data.integral_forms_long hy hn hδ hc

private theorem fullRankCovolume {P : Parameters} {D : Data P}
    {y : Fin D.targetDim → D.targetForms} {δ c : ℝ}
    (hy : LinearIndependent ℂ y) (hδ : D.targetLattice.IndexLe y δ)
    (hc : D.targetLattice.CovolumeLe y c) :
    D.targetDim * (D.mainAmount - D.f * D.a * D.logB ^ 4 - D.b) ≤ c + 2 * δ := by
  simpa using Data.integral_forms_long_with_completion_cost hy hδ hc

run_cmd do
  let prior ← getConstInfo ``previousTheoremC
  let current ← getConstInfo ``Data.integral_forms_long
  unless ← liftTermElabM (Meta.isDefEq prior.type current.type) do
    throwError "Theorem C has a different statement"
  logInfo "Theorem C has the original type"
  for (decl, required) in #[
      (``Data.integral_forms_long, ``Data.integral_forms_long_with_completion_cost),
      (``Data.integral_forms_long_with_completion_cost, ``TwistedLattice.covolume_add_index_nonneg),
      (``star_inequality, ``Data.integral_forms_long),
      (``Data.primeRemainder_le, ``star_inequality),
      (``eventually_primeRemainder_natCast_le, ``Data.primeRemainder_le),
      (``eventually_primeRemainder_le_mul_rpow, ``eventually_primeRemainder_natCast_le),
      (``New.grh, ``eventually_primeRemainder_le_mul_rpow),
      (``LFunction_ne_zero_of_half_lt_re, ``New.grh),
      (``riemannHypothesis, ``New.grh)] do
    let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
      | throwError "no proof available for {decl}"
    unless proof.getUsedConstants.contains required do
      throwError "{decl} does not use {required}"
    logInfo m!"{decl} uses {required}"
  for decl in #[``Data.integral_forms_long_with_completion_cost, ``Data.integral_forms_long,
      ``fullRankCovolume, ``riemannHypothesis, ``riemannZeta_eq_zero_re,
      ``LFunction_ne_zero_of_half_lt_re, ``LFunction_eq_zero_re, ``LFunction_eq_zero_re_of_isPrimitive] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains name do
        throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end CompletionCostAudit
