module

import Lean
import all Formalism.SharpRestriction.RamificationFrobenius.TotientGaloisClasses.TopWin
import all Development.AutomorphicArithmetic.CharacterBoxes.ZeroFreeAllOfTopG
import all Development.AutomorphicArithmetic.ThetaCorrespondence.ThetaPairLifts.ThirdPlaceSeries.TopPlug

open Lean hiding Level
open Lean.Elab Lean.Elab.Command
open Formalism.BasicNotions Formalism.MainNotions Formalism.HC GlobalTheory.EX UpperTheory.Top

namespace FamilyWindowZeroFreeAudit

variable {Fam : ℝ → Type 1} {core : ∀ {eps : ℝ}, Fam eps → FamCore eps}
  {Tied : ∀ {eps : ℝ}, Fam eps → (eD eL K cHH eK CL x : ℝ) → Prop}

theorem previousLevelOfTiedWin {Λ : Level} {la : ℝ}
    (h112 : ChebyshevInequalityOnWindows @core @Tied Λ) (hB : Λ.FormBAt la)
    (h : ChebyshevInequalityAtWindowScale @core @Tied la Λ) : Λ.ZeroFreeLevel :=
  level_of_tiedWin h112 hB h

theorem previousZeroFreeAllOfTopG {la : ℝ} (hla : 1 < la) (h : TopG)
    (hS : ∀ ψ : PChar, HostExW la (GChi ψ).req) : ZeroFreeAll :=
  zeroFreeAll_of_topG hla h hS

run_cmd do
  for (previous, current) in #[(``previousLevelOfTiedWin, ``level_of_tiedWin),
      (``previousZeroFreeAllOfTopG, ``zeroFreeAll_of_topG)] do
    let prior ← getConstInfo previous
    let actual ← getConstInfo current
    unless ← liftTermElabM (Meta.isDefEq prior.type actual.type) do
      throwError "{current} has a different theorem statement"
    logInfo m!"{current} has the original type"
  for decl in #[``level_of_small_window_bounds, ``level_of_family_window_bounds,
      ``level_of_tiedWin, ``zeroFreeAll_of_topG, ``UpperTheory.Top.zero_free_all_of_green_v_win] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains name do
        throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"
  for (decl, required) in #[
      (``level_of_small_window_bounds, ``Level.FormBAt),
      (``level_of_family_window_bounds, ``exists_small_eps),
      (``level_of_family_window_bounds, ``level_of_small_window_bounds),
      (``level_of_tiedWin, ``level_of_family_window_bounds),
      (``zeroFreeAll_of_topG, ``level_of_family_window_bounds),
      (``zeroFreeAll_of_topG, ``UpperTheory.Comparison₂.level_gm_le_on_family_scales),
      (``zeroFreeAll_of_topG, ``UpperTheory.Comparison₂.formB),
      (``zeroFreeAll_of_topG, ``zeroFreeOn_of_levels),
      (``UpperTheory.Top.zero_free_all_of_green_v_win, ``zeroFreeAll_of_topG)] do
    let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
      | throwError "no proof available for {decl}"
    unless proof.getUsedConstants.contains required do
      throwError "{decl} does not use {required}"
    logInfo m!"{decl} uses {required}"

end FamilyWindowZeroFreeAudit
