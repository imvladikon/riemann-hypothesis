module

import Lean
import all Formalism.LocalRingCardinality.DataErr
import all Formalism.PeriodIntegrals.OrbitalBoundsConclusion.EntAtD
import all Formalism.SharpRestriction.Divisibility.ChainOperators.OrbitEntryBounds
import all Formalism.SharpRestriction.Divisibility.OrbitPlaces
import all Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses
import all Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.DivisionSecondComplementConstructedPoints

open Lean Elab Command
open Classical
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.FrobeniusOrbits Formalism.MainNotions.G
open PI.EntAtD PI.EntAtD.W GlobalTheory
open scoped BigOperators

namespace RamifiedRowCutoffAudit

theorem cPr_eq_rowContractionBound_add (α β : YoungDiagram) :
    cPr α β = rowContractionBound α β +
      (∑ r ∈ (insert 0 (α.cells.image Prod.fst)).erase 0, (α.rowLen r - β.rowLen 0)) := by
  let rows := insert 0 (α.cells.image Prod.fst)
  have h0 : 0 ∈ rows := Finset.mem_insert_self _ _
  have hcard : α.cells.card = ∑ r ∈ rows, α.rowLen r := by
    rw [Finset.card_eq_sum_card_fiberwise (f := Prod.fst) (t := rows)]
    · refine Finset.sum_congr rfl fun r _ => ?_
      rw [YoungDiagram.rowLen_eq_card]
      rfl
    · intro x hx
      exact Finset.mem_insert_of_mem (Finset.mem_image_of_mem Prod.fst hx)
  have htotal := Finset.sum_erase_add rows α.rowLen h0
  have hcut := Finset.sum_erase_add rows (fun r => min (α.rowLen r) (β.rowLen 0)) h0
  have hsplit :
      (∑ r ∈ rows.erase 0, min (α.rowLen r) (β.rowLen 0)) +
        (∑ r ∈ rows.erase 0, (α.rowLen r - β.rowLen 0)) =
      ∑ r ∈ rows.erase 0, α.rowLen r := by
    rw [← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun r _ => by omega
  change cPr α β = (∑ r ∈ rows, min (α.rowLen r) (β.rowLen 0)) +
    (∑ r ∈ rows.erase 0, (α.rowLen r - β.rowLen 0))
  rw [cPr, hcard, ← htotal, Nat.add_sub_cancel, ← hcut, ← hsplit]
  ac_rfl

theorem row_bound_strict (α β : YoungDiagram) (r : ℕ)
    (hr : r ∈ (insert 0 (α.cells.image Prod.fst)).erase 0) (h : β.rowLen 0 < α.rowLen r) :
    rowContractionBound α β < cPr α β := by
  rw [cPr_eq_rowContractionBound_add]
  have hs := Finset.single_le_sum (f := fun r => α.rowLen r - β.rowLen 0)
    (fun _ _ => Nat.zero_le _) hr
  omega

noncomputable def previousCtD (D : D7) (u : D.what₂.Word) (j : ℕ) (t : HH D) : ℝ :=
  nuAbs D u j (tauPl D (false, t)) -
    (if t ∈ D.host.TT then DV.nuRow D u j (tauPl D (false, t)) 0 - DV.nuRow D u j (tauPl D (false, t)) 1 else 0) +
    (if t ∈ D.host.TT then DV.nuRow D u j (tauPl D (true, t)) 0 else 0)

noncomputable def previousEatD (D : D7) (j : ℕ) : ℝ :=
  FRamD D j + (Finset.univ.sup' ⟨D.u₀, Finset.mem_univ _⟩ fun u : D.what₂.Word => ∑ t : HH D, previousCtD D u j t) / 2

theorem ctD_add_indicator_le_previous (D : D7) (u : D.what₂.Word) (j : ℕ)
    (hj : j ∈ SizeData₂.lifts D) (t : HH D) :
    ctD D u j t + (if t ∈ D.host.TT then 1 else 0) ≤ previousCtD D u j t := by
  by_cases ht : t ∈ D.host.TT
  · obtain ⟨hj1, hj2⟩ := Finset.mem_Icc.mp hj
    obtain ⟨i, rfl⟩ : ∃ i, j = i + 1 := ⟨j - 1, by lia⟩
    have hN : 1 < D.R.N i := by
      have hk := D.R.m_add_three_le_k
      unfold Ranks.N
      lia
    obtain ⟨n, hn, heq⟩ := nuRow_nat D u i (by lia) (tauPl D (false, t)) 1 hN
    have hrow : (1 : ℝ) ≤ DV.nuRow D u (i + 1) (tauPl D (false, t)) 1 := by
      rw [heq]
      exact_mod_cast hn
    simp only [previousCtD, ite_eq_left ht]
    linarith [ctD_le_nuAbs_sub_add D u (i + 1) t]
  · simpa only [previousCtD, ite_eq_right ht, sub_zero, add_zero] using ctD_le_nuAbs D u j t

theorem ctD_sum_le_previous_sub_card (D : D7) (u : D.what₂.Word) (j : ℕ)
    (hj : j ∈ SizeData₂.lifts D) :
    (∑ t : HH D, ctD D u j t) ≤ (∑ t : HH D, previousCtD D u j t) - (D.host.TT.card : ℝ) := by
  have hcard : (∑ t : HH D, if t ∈ D.host.TT then (1 : ℝ) else 0) = D.host.TT.card := by
    rw [Finset.sum_ite_mem, Finset.univ_inter, Finset.sum_const, nsmul_eq_mul, mul_one]
  have hsum := Finset.sum_le_sum (s := Finset.univ)
    fun t _ => ctD_add_indicator_le_previous D u j hj t
  rw [Finset.sum_add_distrib, hcard] at hsum
  linarith

theorem eatD_le_previous_sub_card (D : D7) (u : D.what₂.Word) (j : ℕ) (hj : j ∈ SizeData₂.lifts D) :
    EatD D u j ≤ previousEatD D j - (D.host.TT.card : ℝ) / 2 := by
  have hsum := ctD_sum_le_previous_sub_card D u j hj
  have hsup := Finset.le_sup' (fun v : D.what₂.Word => ∑ t : HH D, previousCtD D v j t) (Finset.mem_univ u)
  unfold EatD previousEatD
  linarith only [hsum, hsup]

theorem chain_ramified_margin (D : D7) (u : D.what₂.Word) (a : ℕ → ℝ) :
    (∑ j ∈ SizeData₂.lifts D, (a j - previousEatD D j)) +
      (D.R.m : ℝ) * (D.host.TT.card : ℝ) / 2 ≤
    ∑ j ∈ SizeData₂.lifts D, (a j - EatD D u j) := by
  have hsum : (∑ j ∈ SizeData₂.lifts D,
      (a j - previousEatD D j + (D.host.TT.card : ℝ) / 2)) ≤
      ∑ j ∈ SizeData₂.lifts D, (a j - EatD D u j) :=
    Finset.sum_le_sum fun j hj => by linarith only [eatD_le_previous_sub_card D u j hj]
  rw [Finset.sum_add_distrib, Finset.sum_const, nsmul_eq_mul] at hsum
  have hcard : ((SizeData₂.lifts D).card : ℝ) = D.R.m := by simp [SizeData₂.lifts]
  simpa only [hcard, mul_div_assoc] using hsum

def PreviousEntAtD : Prop :=
  ∀ (D : D7) (Dx : DivX D) (nu : D.what₂.Word → ℕ → Pl D → YoungDiagram),
    (∀ u i, i < D.R.m → ∀ z r, (((nu u i z).rowLen r : ℕ) : ℝ) =
      if r < D.R.N i then DV.nuRow D u (i + 1) (tauPl D z) r else 0) →
    (∀ u i z, (nu u i z).colLen 0 ≤ D.R.N i) →
    ∀ (Th : ∀ u μ (w : D.what₂.places.Pl) (i : ℕ), (D.chTw u μ).cls i → (D.chTw u μ).cls (i + 1) →
      MvPowerSeries (Pl D × Fin (D.R.N i) × Fin (D.R.N (i + 1))) ℂ_[D.what₂.places.resChar w]),
    (∀ u μ (w : D.what₂.places.Pl), LevelFree Dx u μ w → D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD →
      ∀ i < D.R.m, ∀ L L', ShapeD D (D.what₂.places.resChar w) (Th u μ w i L L')) →
    ∀ u μ (w : D.what₂.places.Pl), LevelFree Dx u μ w → D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD →
      ∀ i < D.R.m, ∀ (L : (D.chTw u μ).cls i) (L' : (D.chTw u μ).cls (i + 1)),
        KvalGe (D.R.N i) (D.R.N (i + 1)) (D.what₂.places.resChar w) (nu u i) (Th u μ w i L L')
          (-((∑ t : HH D, previousCtD D u (i + 1) t) / 2))

theorem entAtD_implies_previous (h : PI.EntAtD.EntAtD) : PreviousEntAtD := by
  intro D Dx nu hrow hcol Th hTh u μ w hfree hram i hi L L'
  have hj : i + 1 ∈ SizeData₂.lifts D := Finset.mem_Icc.mpr ⟨by lia, by lia⟩
  have hsum := ctD_sum_le_previous_sub_card D u (i + 1) hj
  have hp : (1 : ℝ) ≤ (D.what₂.places.resChar w : ℝ) := by
    exact_mod_cast (D.what₂.places.resChar_prime w).one_lt.le
  have hval := h D Dx nu hrow hcol Th hTh u μ w hfree hram i hi L L'
  unfold KvalGe at hval ⊢
  intro I m
  refine (hval I m).trans (Real.rpow_le_rpow_of_exponent_le hp ?_)
  linarith only [hsum, Nat.cast_nonneg (α := ℝ) D.host.TT.card]

theorem previous_jet_bound : PreviousEntAtD :=
  entAtD_implies_previous jet_bound_ramified_prime

theorem eval_at_discriminant {D : D7} (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC)
    (u : D.what₂.Word) (j : ℕ) (w : D.what₂.places.Pl)
    (hT : D.what₂.places.resChar w ≠ (D.mem u).A.T)
    (hg0 : D.what₂.places.resChar w ≠ D.host.g 0) (hg1 : D.what₂.places.resChar w ≠ D.host.g 1)
    (hd : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD) :
    Eval L X K c u j w =
      (padicValNat (D.what₂.places.resChar w) (D.mem u).C.DGam : ℝ) + EatD D u j := by
  simp [Eval, hT, hg0, hg1, hd]

private def checkUses (decl dependency : Name) : CommandElabM Unit := do
  let some proof := ((← getEnv).setExporting false).find? decl |>.bind (·.value? true)
    | throwError "no proof available for {decl}"
  unless proof.getUsedConstants.contains dependency do
    throwError "{decl} does not depend on {dependency}"
  logInfo m!"{decl} uses {dependency}"

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``cPr_eq_rowContractionBound_add, ``row_bound_strict, ``eatD_le_previous_sub_card, ``chain_ramified_margin,
      ``previous_jet_bound, ``eval_at_discriminant, ``rowContractionBound_eq_ctD, ``jet_bound_ramified_prime,
      ``Formalism.MainNotions.DIV.Lemmas.OrbitEntryBounds.entry_divisor_bound_holds,
      ``Formalism.MainNotions.OrbitPlaces.liftD_of,
      ``Formalism.MainNotions.OrbitPlaces.atD_of,
      ``Formalism.MainNotions.WeilJacquetShalikaLaw.Proof.first_clause_cases,
      ``Formalism.MainNotions.WeilJacquetShalikaLaw.Proof.statements_of_remaining_bound,
      ``Formalism.MainNotions.Pk.sum_over_primes_service,
      ``sz_constant_term,
      ``GlobalTheory.RamifiedOffD.offDiagonalRamified_bound_const_four,
      ``GlobalTheory.familySecondComplementInputs_of_tuSize_of_dGamSize] do
    let axioms ← collectAxioms decl
    for axiomName in axioms do
      unless allowed.contains axiomName do throwError "{decl} uses disallowed axiom {axiomName}"
    logInfo m!"{decl} uses {axioms}"
  checkUses ``jet_bound_ramified_prime ``PI.EntAtD.W.entAtD_of_all_rows
  checkUses ``PI.EntAtD.W.entAtD_of_all_rows ``PI.EntAtD.W.entAtD_of_core
  checkUses ``PI.EntAtD.W.entAtD_of_all_rows ``PI.EntAtD.W.core_of_rowContractionBound
  checkUses ``PI.EntAtD.W.entAtD_of_core ``PI.EntAtD.W.rowContractionBound_eq_ctD
  checkUses ``Formalism.MainNotions.DIV.Lemmas.OrbitEntryBounds.entry_divisor_bound_holds ``jet_bound_ramified_prime
  checkUses ``Formalism.MainNotions.OrbitPlaces.lift_bounds_of_kernelForm ``Formalism.MainNotions.OrbitPlaces.liftD_of
  checkUses ``Formalism.MainNotions.OrbitPlaces.lift_bounds_of_kernelForm ``Formalism.MainNotions.OrbitPlaces.atD_of
  checkUses ``Formalism.MainNotions.Pk.sum_over_primes_service ``Formalism.MainNotions.OrbitPlaces.lift_bounds_of_essential
  checkUses ``Formalism.MainNotions.WeilJacquetShalikaLaw.Proof.statements_of_remaining_bound
    ``Formalism.MainNotions.WeilJacquetShalikaLaw.Proof.first_clause_cases
  checkUses ``sz_constant_term ``PI.SzCt.UnitaryGroupMassFormula.szCt_of
  checkUses ``GlobalTheory.RamifiedOffD.offDiagonalRamified_bound_const_four ``GlobalTheory.RamifiedLoss.abs_EatD_le
  checkUses ``GlobalTheory.familySecondComplementInputs_of_tuSize_of_dGamSize
    ``GlobalTheory.RamifiedOffD.offDiagonalRamified_bound_along_family

end RamifiedRowCutoffAudit
