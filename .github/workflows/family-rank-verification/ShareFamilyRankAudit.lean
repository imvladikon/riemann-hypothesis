module

import Lean
import all Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import all Formalism.SharpRestriction.GlobalSchurBounds.LogXLowerFamilyOfTheorems

open Lean Elab Command
open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Lnk
open Formalism.MainNotions.Pk Formalism.MainNotions.Wire Formalism.MainNotions.GlobalTheoryTheory
open Formalism.L2.GlobalTheoryTheory

namespace ShareFamilyRankAudit

theorem previousFamilyTheoremsTwoAndFive {eps : ℝ} (Fm : FamP eps) (hW : FamU Fm fun D u => Nonempty (product_first_zeroth_parts.FreeT D u))
    (hμ : FamU Fm product_first_zeroth_parts.SlopeLine) (hI : FamU Fm LocalLatticeBases.HeckeIntegralLevelZero) (hR : FamU Fm LocalLatticeBases.HeckeRamifiedLevelZero) (hB : FamU Fm LocalLatticeBases.SecondBranchInclusionLength) :
    FamU Fm product_first_zeroth_parts.family_property_and ∧ FamU Fm LocalLatticeBases.CongruenceLatticeLengthBound :=
  family_theorems_two_and_five Fm hW hμ hI hR hB

variable {eps : ℝ} in
theorem previousLinkGLOBAL7Min (Fm : FamP eps) (Cabs CH C0 C5 : ℝ) (hCabs : 0 ≤ Cabs) (hCH : 0 < CH) (hC0 : 3 ≤ C0)

    (h2b : flipTwoThree.fam0 Fm StandardLattice.MassRatio₂) (h2v : flipTwoThree.fam0 Fm StandardLattice.BaseVolumeEqualsMass) (h3 : flipTwoThree.fam0 Fm StandardLattice.SigmaDegreeTwoSidedBoundOfGap)

    (hZa : flipTwoThree.FamilySlopeLowerOpenPart Fm) (hZb : flipTwoThree.FamilySlopeMaxOpenPart Fm C5)
    (tCV : ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (i : Fm.Ix x) u, Nonempty (flipTwoThree.ColVal (Fm.D x i) u))

    (hW : FamU Fm fun D u => Nonempty (product_first_zeroth_parts.FreeT D u)) (hμ : FamU Fm product_first_zeroth_parts.SlopeLine)

    (hI : FamU Fm LocalLatticeBases.HeckeIntegralLevelZero) (hR : FamU Fm LocalLatticeBases.HeckeRamifiedLevelZero) (hB : FamU Fm LocalLatticeBases.SecondBranchInclusionLength) :
    TuSize Fm → LinkGLOBAL7 Fm Cabs CH C0 Cabs 0 :=
  linkGLOBAL7_min Fm Cabs CH C0 C5 hCabs hCH hC0 h2b h2v h3 hZa hZb tCV hW hμ hI hR hB

theorem previousFamGLminMuRank {𝒞 : FamClass} {C5 : ℝ} (h : FamGLmin 𝒞 C5) (C0 : ℝ) (hC0 : 0 < C0) :
    Closed 𝒞 fun Fm CH => TuSize Fm → ChosenE Fm C0 CH → NuFullF Fm ∧ J.MuRank Fm :=
  h.muRank C0 hC0

run_cmd do
  for (decl, required) in #[
      (``linkGLOBAL7_min, ``family_theorems_two_and_five),
      (``linkGLOBAL7_min, ``linkGLOBAL7_items),
      (``FamGLmin.muRank, ``family_theorems_two_and_five),
      (``FamGLmin.muRank, ``muRank_items),
      (``muRank_items, ``muRank_min)] do
    let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
      | throwError "no proof available for {decl}"
    unless proof.getUsedConstants.contains required do
      throwError "{decl} does not use {required}"
    logInfo m!"{decl} uses {required}"
  for decl in #[``previousFamilyTheoremsTwoAndFive, ``previousLinkGLOBAL7Min, ``previousFamGLminMuRank,
      ``family_theorems_two_and_five, ``linkGLOBAL7_min, ``FamGLmin.muRank, ``FamGLmin.link8] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains name do
        throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end ShareFamilyRankAudit
