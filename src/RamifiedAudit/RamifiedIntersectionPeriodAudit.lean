module

import Lean
import all Formalism.LocalToGlobal.GroupLattices.AdmissibleAtGeneratorPlaces
import all Formalism.LocalToGlobal.GroupLattices.ServJointF
import all Formalism.SharpRestriction.Divisibility.WeightDegreeSizes
import all RamifiedIntersectionColumnAudit
import all RamifiedTopThinAudit
import all RamifiedPeriodThresholdAudit
import all RamifiedFixedLatticeAudit
import all RamifiedShiftTransportAudit

open Lean Elab Command
open Module NumberField IsDedekindDomain
open Formalism.DivisionValues Formalism.L2.DIV
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.FrobeniusOrbits
open Formalism.MainNotions Formalism.MainNotions.G Formalism.MainNotions.OrbitPlaces
open Formalism.MainNotions.WeightDegreeSizes Formalism.MainNotions.WeilJacquetShalikaLaw
open Formalism.L2.G.Adm2InU Formalism.L2.G.ServJoint Formalism.L2.G.ServJointF
open RamifiedIntersectionColumnAudit RamifiedTopThinAudit RamifiedPeriodThresholdAudit
open RamifiedFixedLatticeAudit
open scoped BigOperators

namespace RamifiedIntersectionPeriodAudit

private theorem column_base_eq_totS {D : D7} {L : SizeData₂ D}
    (X : Inst D L) (K : Consts) (Xe : ErrX D) (c : ErrC) (u : D.what₂.Word)
    (w : D.what₂.places.Pl) (hw : D.what₂.places.resChar w = D.host.d)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) :
    (∑ j ∈ SizeData₂.lifts D, (L.F j w - EatD D u j - vDG D u w)) + vDG D u w =
      totS X K Xe c 1 u w := by
  have hnotT : D.what₂.places.resChar w ≠ (D.mem u).A.T := hw.trans_ne (D.T_ne_d u).symm
  have hd : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD :=
    (primeClass_eq_ramD_iff D.host.toHostRaw).mpr hw
  rw [totS, one_mul]
  congr 1
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [(gains_vanish_at_discriminant X K j w hw).2]
  simp only [vDG, ES, Eval, ite_eq_right hnotT, ite_eq_right (hw.trans_ne (hg 0)),
    ite_eq_right (hw.trans_ne (hg 1)), ite_eq_left hd, zero_add]
  ring

/-- The saved contractions raise the order of the period on the active source lattice. -/
theorem actual_period_with_intersection_gain {D : D7} {L : SizeData₂ D} {E : Ent D}
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
      (y = 0 ∨ sgRec L u (D.plEq w) +
        (∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j) * D.what₂.places.ramIdx w ≤
        (vAdd (D.plEq w) y : ℝ)) := by
  have hnotT : D.what₂.places.resChar w ≠ (D.mem u).A.T := hw.trans_ne (D.T_ne_d u).symm
  have hnotG : D.what₂.places.resChar w ∉ ({D.host.g 0, D.host.g 1} : Finset ℕ) := by
    simp only [Finset.mem_insert, Finset.mem_singleton, hw]
    exact not_or.mpr ⟨hg 0, hg 1⟩
  have hQ := Dx.Qp_muAt w
  have hcol := ramified_column_with_intersection_gain hshape hform hcomp hF hE.dgam u (D.what₂.muAt w) w
    (used_muAt D w) ⟨hnotT, hnotG, hQ⟩ ((primeClass_eq_ramD_iff D.host.toHostRaw).mpr hw)
    (D.nuIn u φ) (nuIn_mem_Sram_loc u w φ (hN u w hnotT) hφ)
  rw [column_base_eq_totS X K Xe c u w hw hg] at hcol
  exact ramified_service_gain_transfers_to_period hF hE.edef h0 hT hp0 hpT hE.dgam u w hw hg φ _ hQ
    hcol F hF1 hF0

theorem divide_by_discriminant_power_on_active_lattice
    {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L} {C Cabs : ℝ}
    (P : DivisionPackageFace Rw C Cabs) (u : D.what₂.Word) (q : ℕ)
    (h2 : LocalQuadraticParts.adm2 D L) (hcut : ∀ μ, Used D μ → CutUp D μ) (hN : NprimeDef D L)
    (hRam : ∀ (w : D.what₂.places.Pl), D.what₂.places.resChar w = D.host.d →
      ∀ (φ : (D.div.Nu u).V), φ ∈ L.NuLat u →
      ∀ F ∈ (D.what₂.Mtilde (D.what₂.muAt w)).carrier, F ∈ D.what₂.V0 (D.what₂.muAt w) →
        ∃ y : D.what₂.LL, D.what₂.embLL y = D.what₂.perCol u (D.what₂.muAt w) (D.jN u φ) F ∧
          (y = 0 ∨ sgRec L u (D.plEq w) + (q : ℝ) * D.what₂.places.ramIdx w ≤ (vAdd (D.plEq w) y : ℝ))) :
    (D.div.Nu u).L.map ((((D.host.d : D.what₂.LL) ^ q)⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤
      D.div.cc := by
  let a := (D.host.d : D.what₂.LL) ^ q
  have hd : (D.host.d : D.what₂.LL) ≠ 0 := Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
  have hfinite : (Function.support (fun z : HeightOneSpectrum (𝓞 D.what₂.LL) => vw z a)).Finite := by
    refine (place_sum_natural D.what₂.LL D.host.d D.host.hyp.2.1.pos).1.subset fun z hz => ?_
    rw [Function.mem_support] at hz ⊢
    have hv : vw z (D.host.d : D.what₂.LL) ≠ 0 := fun h =>
      hz (by simp [a, shift_vw_pow _ _ hd, h])
    exact mul_ne_zero (shift_lw_pos z).ne' (by exact_mod_cast hv)
  refine divide_on_active_lattice P u a (pow_ne_zero _ hd) hfinite hcut hN ?_
  intro w φ hφ F hF hV
  have hv : vw (D.plEq w) a =
      (q : ℤ) * (if D.what₂.places.resChar w = D.host.d then (D.what₂.places.ramIdx w : ℤ) else 0) := by
    rw [show a = (D.host.d : D.what₂.LL) ^ q from rfl, shift_vw_pow _ _ hd,
      RamifiedShiftTransportAudit.discriminant_vw]
  by_cases hw : D.what₂.places.resChar w = D.host.d
  · rw [ite_eq_left hw] at hv
    have hr : (vw (D.plEq w) a : ℝ) = (q : ℝ) * D.what₂.places.ramIdx w := by exact_mod_cast hv
    simpa only [hr] using hRam w hw φ hφ F hF hV
  · rw [ite_eq_right hw, mul_zero] at hv
    simpa only [hv, Int.cast_zero, add_zero, sgRec, Equiv.symm_apply_apply] using h2 u w φ hφ F hF hV

theorem intersection_gain_divides_active_map {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L}
    {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs) {E : Ent D} {Dx : DivX D} {T : TwForms D}
    {X : Inst D L} {K : Consts} {lev : LevelData D} {Xe : ErrX D} {c : ErrC}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hE : ErrDefs D L Xe lev K c) (hN : NuInM D L) (h0 : MemberChainIntegral D)
    (hT : TwistedPointIntegral D T) (hp0 : PeriodClassSumWeyl D) (hpT : TwistedPeriodAdmissible D Dx T)
    (h2 : LocalQuadraticParts.adm2 D L) (hcut : ∀ μ, Used D μ → CutUp D μ) (hPrime : NprimeDef D L)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) (u : D.what₂.Word) (q : ℕ)
    (hGain : (q : ℝ) ≤ ∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j) :
    (D.div.Nu u).L.map ((((D.host.d : D.what₂.LL) ^ q)⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤
      D.div.cc := by
  refine divide_by_discriminant_power_on_active_lattice P u q h2 hcut hPrime ?_
  intro w hw φ hφ F hF1 hF0
  obtain ⟨y, hy, hv⟩ := actual_period_with_intersection_gain (X := X) hshape hform hcomp hF hE hN h0 hT hp0 hpT
    u w hw hg φ hφ F hF1 hF0
  exact ⟨y, hy, hv.imp_right fun h => (add_le_add le_rfl
    (mul_le_mul_of_nonneg_right hGain (Nat.cast_nonneg _))).trans h⟩

private theorem half_chain_length_cast (D : D7) : (↑(D.R.m / 2) : ℝ) = (D.R.m : ℝ) / 2 := by
  have hn := Nat.div_mul_cancel (even_iff_two_dvd.mp D.R.m_even)
  have hc : (↑(D.R.m / 2) : ℝ) * 2 = (D.R.m : ℝ) := by exact_mod_cast hn
  linarith only [hc]

theorem more_top_places_divide_active_map {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L}
    {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs) {E : Ent D} {Dx : DivX D} {T : TwForms D}
    {X : Inst D L} {K : Consts} {lev : LevelData D} {Xe : ErrX D} {c : ErrC}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hE : ErrDefs D L Xe lev K c) (hN : NuInM D L) (h0 : MemberChainIntegral D)
    (hT : TwistedPointIntegral D T) (hp0 : PeriodClassSumWeyl D) (hpT : TwistedPeriodAdmissible D Dx T)
    (h2 : LocalQuadraticParts.adm2 D L) (hcut : ∀ μ, Used D μ → CutUp D μ) (hPrime : NprimeDef D L)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) (hSize : SizesAt L) (hx : 3 ≤ L.sc.x)
    (hcard : D.host.T2.card < D.host.TT.card) (u : D.what₂.Word) :
    (D.div.Nu u).L.map ((((D.host.d : D.what₂.LL) ^ (D.R.m / 2))⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤
      D.div.cc := by
  obtain ⟨t, ht⟩ := exists_top_thin_pair_of_more_top_places D hcard
  refine intersection_gain_divides_active_map P (X := X) hshape hform hcomp hF hE hN h0 hT hp0 hpT h2
    hcut hPrime hg u (D.R.m / 2) ?_
  rw [half_chain_length_cast]
  exact top_thin_pair_saves_half_per_lift L E hSize hx t ht u

open Formalism.HN in
theorem power_division_lowers_height (D : D7) {V W ι κ : Type}
    [AddCommGroup V] [Module D.what₂.LL V] [AddCommGroup W] [Module D.what₂.LL W]
    [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]
    (b : Basis ι D.what₂.LL V) (A : InfinitePlace D.what₂.LL → Matrix ι ι ℂ)
    (b' : Basis κ D.what₂.LL W) (A' : InfinitePlace D.what₂.LL → Matrix κ κ ℂ)
    (B : V →ₗ[D.what₂.LL] W) (q : ℕ) (hpl : 0 < Formalism.HN.nPl D.what₂.LL)
    (hB : ∀ v, 0 < opNormAt b A b' A' v B) :
    htMap b A b' A' (((D.host.d : D.what₂.LL) ^ q)⁻¹ • B) =
      htMap b A b' A' B - 2 * (q : ℝ) * Real.log (D.host.d : ℝ) := by
  rw [← Nat.cast_pow, RamifiedShiftTransportAudit.height_of_divided_map b A b' A' B _
    (pow_pos D.host.hyp.2.1.pos _) hpl hB, Nat.cast_pow, Real.log_pow]
  ring

open Formalism.HN in
theorem half_chain_division_lowers_height (D : D7) {V W ι κ : Type}
    [AddCommGroup V] [Module D.what₂.LL V] [AddCommGroup W] [Module D.what₂.LL W]
    [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]
    (b : Basis ι D.what₂.LL V) (A : InfinitePlace D.what₂.LL → Matrix ι ι ℂ)
    (b' : Basis κ D.what₂.LL W) (A' : InfinitePlace D.what₂.LL → Matrix κ κ ℂ)
    (B : V →ₗ[D.what₂.LL] W) (hpl : 0 < Formalism.HN.nPl D.what₂.LL)
    (hB : ∀ v, 0 < opNormAt b A b' A' v B) :
    htMap b A b' A' ((((D.host.d : D.what₂.LL) ^ (D.R.m / 2))⁻¹) • B) =
      htMap b A b' A' B - (D.R.m : ℝ) * Real.log (D.host.d : ℝ) := by
  rw [power_division_lowers_height D b A b' A' B _ hpl hB, half_chain_length_cast]
  ring

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``actual_period_with_intersection_gain, ``divide_by_discriminant_power_on_active_lattice,
      ``intersection_gain_divides_active_map, ``more_top_places_divide_active_map,
      ``power_division_lowers_height, ``half_chain_division_lowers_height] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedIntersectionPeriodAudit
