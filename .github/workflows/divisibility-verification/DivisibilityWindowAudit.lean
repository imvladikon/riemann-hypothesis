module

import Lean
import all Formalism.SizeWindowBrackets.ChainSlopeWindows.LipschitzWeightAndMinimum
import all Development.AutomorphicArithmetic.PrimitiveCosets.LevelGmLeOnFamilyScales
import all Development.AutomorphicArithmetic.CharacterBoxes.ZeroFreeAllOfTopG

open Lean Elab Command Formalism.LFunctionChainParameters.ThickSetMeanBounds

noncomputable section

theorem previous_growth_size_bound :
    ∀ (C ε x : ℝ) (n nT nT2 m : ℕ) (b k aE Err Gx : ℝ), SizeWindows C ε x n nT nT2 m b k aE Err →
      (nT : ℝ) * m * b * (((nT2 : ℝ) / n) / 2) * (Gx - 4 * x ^ ((1 : ℝ) / 2 + ε)) ≤
        Err + 2 * (nT : ℝ) * m * b / x →
      Gx ≤ x ^ ((1 : ℝ) / 2 + (C + 3) * ε) :=
  proposition_size_bound

run_cmd do
  let dependencies := #[
    (``proposition_size_bound, ``SZ.divisibility_term_le),
    (``Deduction.ch_core, ``proposition_size_bound),
    (``UpperTheory.Comparison₂.core_gm, ``Deduction.ch_core),
    (``UpperTheory.Comparison₂.windowInequality_of_artinInputs, ``UpperTheory.Comparison₂.core_gm),
    (``UpperTheory.Comparison₂.level_gm_le_on_family_scales, ``UpperTheory.Comparison₂.windowInequality_of_artinInputs),
    (``UpperTheory.Top.zeroFreeAll_of_topG, ``UpperTheory.Comparison₂.level_gm_le_on_family_scales)]
  for (decl, dependency) in dependencies do
    let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
      | throwError "proof unavailable for {decl}"
    unless proof.getUsedConstants.contains dependency do throwError "{decl} omits {dependency}"
    logInfo m!"{decl} uses {dependency}"
  for decl in #[``previous_growth_size_bound, ``UpperTheory.Top.zeroFreeAll_of_topG] do
    let axioms ← collectAxioms decl
    for a in axioms do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains a do
        throwError "{decl} uses disallowed axiom {a}"
    logInfo m!"{decl} uses {axioms}"
