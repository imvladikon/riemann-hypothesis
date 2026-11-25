module

import Lean
import all Development.AutomorphicArithmetic.CharacterBoxes.ObjCTrue

open Lean Elab Command
open Formalism.MainNotions Formalism.MainNotions.Inhab GlobalTheory.EX

namespace StandardThresholdsAudit

theorem large_sup_iff (C : FC) (K K0 : TransportedAlt) (CH : ℝ) :
    C.Large (K.sup K0) CH ↔ C.Large K CH ∧ C.Large K0 CH :=
  ⟨fc_large_of_sup, fun ⟨h, h0⟩ =>
    ⟨fun c hc => max_le (h.1 c hc) (h0.1 c hc), trivial,
      fun c hc => max_le (h.2.2.1 c hc) (h0.2.2.1 c hc),
      fun c hc => max_le (h.2.2.2 c hc) (h0.2.2.2 c hc)⟩⟩

theorem exists_std_large_pair (K K0 : TransportedAlt) (CT2 C8 : ℝ) (h8 : 1 ≤ C8) :
    ∃ C : FC, Std C ∧ C.CT2 = CT2 ∧ C.P.Cpde = C8 ∧
      C.Large K C.P.CF ∧ C.Large K0 C.P.CF ∧ C.GK.Nonneg := by
  obtain ⟨C, hStd, hCT2, hC8, hLarge, hGK⟩ := exists_std_large (K.sup K0) CT2 C8 h8
  exact ⟨C, hStd, hCT2, hC8, (fc_large_of_sup hLarge).1, (fc_large_of_sup hLarge).2, hGK⟩

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``large_sup_iff, ``exists_std_large_pair, ``GlobalTheory.EX.exists_std_large,
      ``UpperTheory.Top.designS] do
    let axioms ← collectAxioms decl
    for axiomName in axioms do
      unless allowed.contains axiomName do throwError "{decl} uses disallowed axiom {axiomName}"
    logInfo m!"{decl} uses {axioms}"
  let some proof := ((← getEnv).setExporting false).find? ``UpperTheory.Top.designS |>.bind (·.value? true)
    | throwError "no proof available for designS"
  for dependency in #[``GlobalTheory.EX.exists_std_large, ``GlobalTheory.EX.fc_large_of_sup] do
    unless proof.getUsedConstants.contains dependency do
      throwError "designS does not use {dependency}"
    logInfo m!"designS uses {dependency}"

end StandardThresholdsAudit
