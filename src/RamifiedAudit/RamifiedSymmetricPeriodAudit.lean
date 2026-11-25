module

import Lean
import all Formalism.SharpRestriction.Divisibility.OrbitPlaces
import all Formalism.LocalToGlobal.GroupLattices.AdmissibleAtGeneratorPlaces
import all RamifiedPeriodThresholdAudit
import all RamifiedSymmetricCutoffAudit

open Lean Elab Command
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.FrobeniusOrbits
open Formalism.MainNotions.G Formalism.MainNotions.WeightDegreeSizes
open Formalism.MainNotions.OrbitPlaces Formalism.MainNotions.WeilJacquetShalikaLaw
open Formalism.L2.G.Adm2InU
open RamifiedSymmetricCutoffAudit RamifiedPeriodThresholdAudit
open scoped BigOperators

namespace RamifiedSymmetricPeriodAudit

noncomputable def liftCutoffGain {D : D7} (E : Ent D) (u : D.what₂.Word) (j : ℕ) : ℝ :=
  (∑ t : HH D, ((PI.EntAtD.W.rowContractionBound (E.nu u (j - 1) (false, t)) (E.nu u (j - 1) (true, t)) : ℝ) -
    (twoSidedBound (E.nu u (j - 1) (false, t)) (E.nu u (j - 1) (true, t)) : ℝ))) / 2

theorem one_strict_pair_gives_half_step {D : D7} (E : Ent D) (u : D.what₂.Word) (j : ℕ)
    (hj : j ∈ SizeData₂.lifts D) (t : HH D)
    (hstrict : PI.EntAtD.W.rowContractionBound (E.nu u (j - 1) (true, t)) (E.nu u (j - 1) (false, t)) <
      PI.EntAtD.W.rowContractionBound (E.nu u (j - 1) (false, t)) (E.nu u (j - 1) (true, t))) :
    (1 : ℝ) / 2 ≤ ∑ k ∈ SizeData₂.lifts D, liftCutoffGain E u k := by
  let forward (k : ℕ) (s : HH D) := PI.EntAtD.W.rowContractionBound (E.nu u (k - 1) (false, s)) (E.nu u (k - 1) (true, s))
  let backward (k : ℕ) (s : HH D) := PI.EntAtD.W.rowContractionBound (E.nu u (k - 1) (true, s)) (E.nu u (k - 1) (false, s))
  let loss (k : ℕ) (s : HH D) : ℝ := (forward k s : ℝ) - (min (forward k s) (backward k s) : ℕ)
  have hnonneg (k : ℕ) (s : HH D) : 0 ≤ loss k s := by
    apply sub_nonneg.mpr
    exact_mod_cast min_le_left (forward k s) (backward k s)
  have hgap : (1 : ℝ) ≤ loss j t := by
    have h : ((backward j t : ℕ) : ℝ) + 1 ≤ (forward j t : ℝ) := by
      exact_mod_cast Nat.succ_le_of_lt hstrict
    unfold loss
    rw [min_eq_right hstrict.le]
    linarith only [h]
  have hpoint : (1 : ℝ) / 2 ≤ liftCutoffGain E u j := by
    have hsum := Finset.single_le_sum (f := loss j) (fun s _ => hnonneg j s) (Finset.mem_univ t)
    change (1 : ℝ) / 2 ≤ (∑ s : HH D, loss j s) / 2
    linarith only [hsum, hgap]
  exact hpoint.trans (Finset.single_le_sum (f := liftCutoffGain E u)
    (fun k _ => div_nonneg (Finset.sum_nonneg fun s _ => hnonneg k s) two_pos.le) hj)

theorem entries_at_discriminant_with_symmetric_gain {D : D7} (E : Ent D) (Dx : DivX D)
    (hshape : ThetaKernelShapeAtD E Dx) (u : D.what₂.Word) (μ : D.what₂.Tup) (w : D.what₂.places.Pl)
    (hfree : LevelFree Dx u μ w) (hd : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD)
    (i : ℕ) (hi : i < D.R.m) :
    EntGe E u μ w i (-((∑ t : HH D, ctD D u (i + 1) t) / 2) + liftCutoffGain E u (i + 1)) := by
  have hN : 0 < D.R.N i := by
    have := D.R.m_add_three_le_k
    unfold Ranks.N
    omega
  have hsum : (∑ t : HH D, (PI.EntAtD.W.rowContractionBound (E.nu u i (false, t)) (E.nu u i (true, t)) : ℝ)) =
      ∑ t : HH D, ctD D u (i + 1) t :=
    Finset.sum_congr rfl fun t _ => PI.EntAtD.W.rowContractionBound_eq_ctD D u i (E.nu u i) (E.nu_row u i hi) hN t
  have hgain : -((∑ t : HH D, ctD D u (i + 1) t) / 2) + liftCutoffGain E u (i + 1) =
      -((∑ t : HH D, (twoSidedBound (E.nu u i (false, t)) (E.nu u i (true, t)) : ℝ)) / 2) := by
    unfold liftCutoffGain
    simp only [Nat.add_sub_cancel, Finset.sum_sub_distrib]
    linarith only [hsum]
  rw [hgain]
  intro a b
  exact kernel_bound_with_two_sided_cutoff (HH D) (D.R.N i) (D.R.N (i + 1))
    (D.what₂.places.resChar w) (E.nu u i) (E.Th u μ w i a b) (hshape u μ w hfree hd i hi a b)

theorem ramified_column_with_symmetric_gain {D : D7} {L : SizeData₂ D} {E : Ent D}
    {Dx : DivX D} {T : TwForms D} {X : Inst D L} {K : Consts} {lev : LevelData D} {Xe : ErrX D} {c : ErrC}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hE : ErrDefs D L Xe lev K c)
    (u : D.what₂.Word) (μ : D.what₂.Tup) (w : D.what₂.places.Pl) (hused : Used D μ)
    (hfree : LevelFree Dx u μ w) (hd : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD)
    (x : ((D.fm u).lat 0).V) (hx : x ∈ LT.Sram D u w) :
    ColGe T u μ w x (totS X K Xe c 1 u w + ∑ j ∈ SizeData₂.lifts D, liftCutoffGain E u j) := by
  let base (j : ℕ) : ℝ := L.F j w - EatD D u j - vDG D u w
  let bounds (j : ℕ) : ℝ := (base j + (if j = 1 then vDG D u w else 0)) + liftCutoffGain E u j
  have hlift (i : ℕ) (hi : i < D.R.m) : KGe T u μ w i (bounds (i + 1)) := by
    have h := hform hE.dgam u μ w hused hfree i hi _
      (entries_at_discriminant_with_symmetric_gain E Dx hshape u μ w hfree hd i hi)
    have hFram : L.F (i + 1) w = FRamD D (i + 1) := by
      rw [hF (i + 1) (succ_mem_lifts hi) w]
      simp only [Fval, FvalP, SizeData₂.gTypes, ite_eq_right hfree.2.1, ite_eq_left hd]
    have heq : -((∑ t : HH D, ctD D u (i + 1) t) / 2) + liftCutoffGain E u (i + 1) -
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
  have hsum : (∑ j ∈ SizeData₂.lifts D, bounds j) =
      totS X K Xe c 1 u w + ∑ j ∈ SizeData₂.lifts D, liftCutoffGain E u j := by
    unfold bounds
    rw [Finset.sum_add_distrib, sum_shape, totS, one_mul]
    congr 2
    refine Finset.sum_congr rfl fun j _ => ?_
    have hw := (primeClass_eq_ramD_iff D.host.toHostRaw).mp hd
    have hn : ¬ (D.what₂.places.resChar w = D.host.g 0 ∨ D.what₂.places.resChar w = D.host.g 1) := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hfree.2.1
    rw [(gains_vanish_at_discriminant X K j w hw).2]
    simp only [base, vDG, ES, Eval, ite_eq_right hfree.1, ite_eq_right (fun h => hn (Or.inl h)),
      ite_eq_right (fun h => hn (Or.inr h)), ite_eq_left hd, zero_add]
    ring
  rwa [hsum] at hcol

theorem actual_period_with_symmetric_gain {D : D7} {L : SizeData₂ D} {E : Ent D}
    {Dx : DivX D} {T : TwForms D} {X : Inst D L} {K : Consts} {lev : LevelData D} {Xe : ErrX D} {c : ErrC}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hE : ErrDefs D L Xe lev K c) (hN : NuInM D L) (h0 : MemberChainIntegral D)
    (hT : TwistedPointIntegral D T) (hp0 : PeriodClassSumWeyl D) (hpT : TwistedPeriodAdmissible D Dx T)
    (u : D.what₂.Word) (w : D.what₂.places.Pl) (hw : D.what₂.places.resChar w = D.host.d)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i)
    (φ : (D.div.Nu u).V) (hφ : φ ∈ L.NuLat u)
    (F : D.what₂.Amb (D.what₂.muAt w)) (hF1 : F ∈ (D.what₂.Mtilde (D.what₂.muAt w)).carrier)
    (hF0 : F ∈ D.what₂.V0 (D.what₂.muAt w)) :
    ∃ y : D.what₂.LL, D.what₂.embLL y = D.what₂.perCol u (D.what₂.muAt w) (D.jN u φ) F ∧
      (y = 0 ∨ Formalism.L2.DIV.sgRec L u (D.plEq w) +
        (∑ j ∈ SizeData₂.lifts D, liftCutoffGain E u j) * D.what₂.places.ramIdx w ≤
        (vAdd (D.plEq w) y : ℝ)) := by
  have hnotT : D.what₂.places.resChar w ≠ (D.mem u).A.T := hw.trans_ne (D.T_ne_d u).symm
  have hnotG : D.what₂.places.resChar w ∉ ({D.host.g 0, D.host.g 1} : Finset ℕ) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, hw]
    exact not_or.mpr ⟨hg 0, hg 1⟩
  have hQ := Dx.Qp_muAt w
  have hcol := ramified_column_with_symmetric_gain (X := X) hshape hform hcomp hF hE u (D.what₂.muAt w) w
    (used_muAt D w) ⟨hnotT, hnotG, hQ⟩ ((primeClass_eq_ramD_iff D.host.toHostRaw).mpr hw)
    (D.nuIn u φ) (nuIn_mem_Sram_loc u w φ (hN u w hnotT) hφ)
  exact ramified_service_gain_transfers_to_period hF hE.edef h0 hT hp0 hpT hE.dgam u w hw hg φ _ hQ hcol F hF1 hF0

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``one_strict_pair_gives_half_step, ``entries_at_discriminant_with_symmetric_gain, ``ramified_column_with_symmetric_gain,
      ``actual_period_with_symmetric_gain] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedSymmetricPeriodAudit
