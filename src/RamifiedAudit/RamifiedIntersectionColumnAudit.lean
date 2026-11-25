module

import Lean
import all Formalism.SharpRestriction.Divisibility.OrbitPlaces
import all Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses
import all RamifiedIntersectionCutoffAudit
import all RamifiedTopThinAudit

open Lean Elab Command
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.FrobeniusOrbits
open Formalism.MainNotions.G Formalism.MainNotions.OrbitPlaces
open Formalism.MainNotions.WeilJacquetShalikaLaw
open PI.EntAtD.W PI.SzCt.UnitaryGroupMassFormula RamifiedIntersectionCutoffAudit RamifiedTopThinAudit
open scoped BigOperators

namespace RamifiedIntersectionColumnAudit

theorem exists_top_thin_pair_of_more_top_places (D : D7) (hcard : D.host.T2.card < D.host.TT.card) :
    ∃ t : D.host.TT, D.host.IsThin (D.eTau (tauPl D (true, (t : HH D))) : D.R.GG) := by
  classical
  by_contra! hthin
  have hinj : Function.Injective D.R.tau2 := by
    intro s t h
    simpa [Formalism.HC.Frame.tau2, Formalism.HC.Frame.iota] using h
  have hsub : D.host.TT.image D.R.tau2 ⊆ D.host.thickPlaces := by
    intro z hz
    obtain ⟨t, ht, rfl⟩ := Finset.mem_image.mp hz
    have heq : (D.eTau (tauPl D (true, t)) : D.R.GG) = D.R.tau2 t := by
      rw [eTau_tauPl]
      simp [plGG]
    rw [← heq]
    exact ((placeFacts D).2.2.2 t).resolve_right (hthin ⟨t, ht⟩)
  have htop := Finset.card_le_card hsub
  rw [Finset.card_image_of_injective _ hinj] at htop
  have hthick : D.host.thickPlaces.card ≤ D.host.T2.card := Finset.card_image_le
  exact (not_lt_of_ge (htop.trans hthick)) hcard

theorem entries_at_discriminant_with_intersection_gain {D : D7} (E : Ent D) (Dx : DivX D)
    (hshape : ThetaKernelShapeAtD E Dx) (u : D.what₂.Word) (μ : D.what₂.Tup) (w : D.what₂.places.Pl)
    (hfree : LevelFree Dx u μ w) (hd : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD)
    (i : ℕ) (hi : i < D.R.m) :
    EntGe E u μ w i (-((∑ t : HH D, ctD D u (i + 1) t) / 2) + liftIntersectionGain E u (i + 1)) := by
  have hN : 0 < D.R.N i := by
    have := D.R.five_le_k
    unfold Ranks.N
    omega
  have hsum : (∑ t : HH D, (rowContractionBound (E.nu u i (false, t)) (E.nu u i (true, t)) : ℝ)) =
      ∑ t : HH D, ctD D u (i + 1) t :=
    Finset.sum_congr rfl fun t _ => rowContractionBound_eq_ctD D u i (E.nu u i) (E.nu_row u i hi) hN t
  have heq : -((∑ t : HH D, ctD D u (i + 1) t) / 2) + liftIntersectionGain E u (i + 1) =
      -((∑ t : HH D, (intersectionBound (E.nu u i (false, t)) (E.nu u i (true, t)) : ℝ)) / 2) := by
    unfold liftIntersectionGain
    simp only [Nat.add_sub_cancel, Finset.sum_sub_distrib]
    linarith only [hsum]
  rw [heq]
  intro a b
  exact kernel_bound_with_intersection_cutoff (HH D) (D.R.N i) (D.R.N (i + 1))
    (D.what₂.places.resChar w) (E.nu u i) (E.Th u μ w i a b) (hshape u μ w hfree hd i hi a b)

/-- The saved contractions increase the column valuation on the same source. -/
theorem ramified_column_with_intersection_gain {D : D7} {L : SizeData₂ D} {E : Ent D}
    {Dx : DivX D} {T : TwForms D}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hD : DGamDef D)
    (u : D.what₂.Word) (μ : D.what₂.Tup) (w : D.what₂.places.Pl) (hused : Used D μ)
    (hfree : LevelFree Dx u μ w) (hd : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD)
    (x : ((D.fm u).lat 0).V) (hx : x ∈ LT.Sram D u w) :
    ColGe T u μ w x
      (((∑ j ∈ SizeData₂.lifts D, (L.F j w - EatD D u j - vDG D u w)) + vDG D u w) +
        ∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j) := by
  let base (j : ℕ) := L.F j w - EatD D u j - vDG D u w
  let bounds (j : ℕ) := (base j + (if j = 1 then vDG D u w else 0)) + liftIntersectionGain E u j
  have hlift (i : ℕ) (hi : i < D.R.m) : KGe T u μ w i (bounds (i + 1)) := by
    have h := hform hD u μ w hused hfree i hi _
      (entries_at_discriminant_with_intersection_gain E Dx hshape u μ w hfree hd i hi)
    have hFram : L.F (i + 1) w = FRamD D (i + 1) := by
      rw [hF (i + 1) (succ_mem_lifts hi) w]
      simp only [Fval, FvalP, SizeData₂.gTypes, ite_eq_right hfree.2.1, ite_eq_left hd]
    have heq : -((∑ t : HH D, ctD D u (i + 1) t) / 2) + liftIntersectionGain E u (i + 1) -
        (if i = 0 then 1 - 1 else 1) * vDG D u w = bounds (i + 1) := by
      unfold bounds base
      rw [hFram, EatD]
      by_cases h0 : i = 0
      · simp [h0]
      · have hn : i + 1 ≠ 1 := by omega
        simp only [ite_eq_right h0, ite_eq_right hn]
        ring
    rwa [heq] at h
  have hcol := hcomp u μ w bounds hlift x hx.1
  unfold bounds at hcol
  rw [Finset.sum_add_distrib, sum_shape] at hcol
  exact hcol

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``exists_top_thin_pair_of_more_top_places, ``entries_at_discriminant_with_intersection_gain,
      ``ramified_column_with_intersection_gain] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedIntersectionColumnAudit
