module

import Lean
import all Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.DivisionSecondComplementConstructedPoints
import all Formalism.LocalToGlobal.ClassOfRecordOfChoice

open Lean Elab Command
open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.G
open Formalism.MainNotions.WeightDegreeSizes GlobalTheory.RamifiedOffD

namespace DecayingDiscriminantOffsetAudit

theorem previous_pointwise_bound {D : D7} {L : SizeData₂ D}
    (h : SizesAt L) (P : ParameterChoice' D L) (hx : 2 ≤ L.sc.x) :
    DiscriminantOffsetBound D L 4 := by
  have hxpos : 0 < L.sc.x := by linarith
  have hs : (1 : ℝ) ≤ Real.sqrt L.sc.x := by
    simpa only [Real.sqrt_one] using (Real.sqrt_le_sqrt (show 1 ≤ L.sc.x by linarith))
  have hcoef : 3 / Real.sqrt L.sc.x ≤ (4 : ℝ) := by
    rw [div_le_iff₀ (Real.sqrt_pos.2 hxpos)]
    linarith
  have hB₀ : 0 ≤ L.B0 := by
    unfold SizeData₂.B0 sizeBudget bSize
    positivity
  intro j hj
  exact (offDiagonalRamified_bound_sqrt h P hx j hj).trans (mul_le_mul_of_nonneg_right hcoef hB₀)

theorem previous_family_bound {eps : ℝ} (Fm : FamP eps) (_ : 0 < eps) (_ : eps < 1 / 52) :
    ∃ C x0 : ℝ, 0 ≤ C ∧ ∀ x, x0 ≤ x → ∀ _hx : Fm.x1 < x, ∀ i : Fm.Ix x,
      DiscriminantOffsetBound (Fm.D x i) (Fm.L x i) C := by
  exact ⟨1, max 2 ((3 / (1 : ℝ)) ^ 2), zero_le_one, fun _ hx₀ hx i =>
    offDiagonalRamified_bound_along_family Fm (C := 1) one_pos hx₀ hx i⟩

theorem half_bound_after_36 {eps : ℝ} (Fm : FamP eps) {x : ℝ} (hx36 : 36 ≤ x)
    (hx : Fm.x1 < x) (i : Fm.Ix x) :
    DiscriminantOffsetBound (Fm.D x i) (Fm.L x i) (1 / 2) := by
  exact offDiagonalRamified_bound_along_family Fm (C := 1 / 2) (by norm_num)
    (by
      convert hx36 using 1
      norm_num [max_def]) hx i

private def requireDependency (decl dependency : Name) : CommandElabM Unit := do
  let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
    | throwError "no proof available for {decl}"
  unless proof.getUsedConstants.contains dependency do
    throwError "{decl} does not depend on {dependency}"
  logInfo m!"{decl} uses {dependency}"

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``offDiagonalRamified_bound_sqrt, ``offDiagonalRamified_bound_along_family,
      ``GlobalTheory.familySecondComplementInputs_of_tuSize_of_dGamSize,
      ``GlobalTheory.Fc.ClassTwoEntries.divisionSecondComplement_constructedPoints,
      ``Formalism.L2.Top3.complement_two_of_items, ``previous_pointwise_bound, ``previous_family_bound,
      ``half_bound_after_36] do
    let axioms ← collectAxioms decl
    for axiomName in axioms do
      unless allowed.contains axiomName do throwError "{decl} uses disallowed axiom {axiomName}"
    logInfo m!"{decl} uses {axioms}"
  requireDependency ``offDiagonalRamified_bound_sqrt ``Formalism.MainNotions.Lnk.m_ge
  requireDependency ``offDiagonalRamified_bound_sqrt ``GlobalTheory.RamifiedLoss.abs_EatD_le
  requireDependency ``offDiagonalRamified_bound_along_family ``offDiagonalRamified_bound_sqrt
  requireDependency ``GlobalTheory.familySecondComplementInputs_of_tuSize_of_dGamSize
    ``offDiagonalRamified_bound_along_family
  requireDependency ``GlobalTheory.admissibleConstants_closed_under_sizeBounds
    ``GlobalTheory.familySecondComplementInputs_of_tuSize_of_dGamSize
  requireDependency ``GlobalTheory.Fc.ClassTwoEntries.divisionSecondComplement_constructedPoints
    ``GlobalTheory.admissibleConstants_closed_under_sizeBounds
  requireDependency ``Formalism.L2.Top3.complement_two_of_items ``secondComplement_family_of_inputs

end DecayingDiscriminantOffsetAudit
