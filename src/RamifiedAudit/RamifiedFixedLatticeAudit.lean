module

import Lean
import all Formalism.LocalToGlobal.Divisibility.RecBridge
import all Formalism.LocalToGlobal.GroupLattices.ServJointF
import all RamifiedShiftTransportAudit
import all RamifiedSymmetricPeriodAudit

open Lean Elab Command
open Module NumberField IsDedekindDomain
open Formalism.DivisionValues Formalism.L2.DIV
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.FrobeniusOrbits
open Formalism.MainNotions Formalism.MainNotions.G
open Formalism.MainNotions.OrbitPlaces Formalism.MainNotions.WeightDegreeSizes
open Formalism.MainNotions.WeilJacquetShalikaLaw
open Formalism.L2.G.ServJoint Formalism.L2.G.ServJointF Formalism.L2.G.Adm2InU
open RamifiedPeriodThresholdAudit RamifiedSymmetricPeriodAudit
open scoped BigOperators

namespace RamifiedFixedLatticeAudit

theorem divide_on_active_lattice {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L}
    {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs) (u : D.what₂.Word)
    (a : D.what₂.LL) (ha : a ≠ 0) (haFinite : (Function.support (fun z : HeightOneSpectrum (𝓞 D.what₂.LL) => vw z a)).Finite)
    (hcut : ∀ μ, Used D μ → CutUp D μ) (hN : NprimeDef D L)
    (hper : ∀ (w : D.what₂.places.Pl) (φ : (D.div.Nu u).V), φ ∈ L.NuLat u →
      ∀ F ∈ (D.what₂.Mtilde (D.what₂.muAt w)).carrier, F ∈ D.what₂.V0 (D.what₂.muAt w) →
        ∃ y : D.what₂.LL, D.what₂.embLL y = D.what₂.perCol u (D.what₂.muAt w) (D.jN u φ) F ∧
          (y = 0 ∨ sgRec L u (D.plEq w) + (vw (D.plEq w) a : ℝ) ≤ (vAdd (D.plEq w) y : ℝ))) :
    (D.div.Nu u).L.map ((a⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤ D.div.cc := by
  let s := sgRec L u
  let t (z : HeightOneSpectrum (𝓞 D.what₂.LL)) := s z + (vw z a : ℝ)
  have hround (z : HeightOneSpectrum (𝓞 D.what₂.LL)) :
      shiftZ t z = shiftZ s z + vw z a := Int.floor_add_intCast _ _
  have hs : (Function.support (shiftZ s)).Finite := (P.inp u).sg_fin
  have ht : (Function.support (shiftZ t)).Finite := by
    refine (hs.union haFinite).subset fun z hz => ?_
    by_contra hn
    have h₀ : shiftZ s z = 0 := by
      by_contra h
      exact hn (Or.inl h)
    have h₁ : vw z a = 0 := by
      by_contra h
      exact hn (Or.inr h)
    exact hz (by simp [hround, h₀, h₁])
  let B : ColBrF D := ⟨Rw.Bs, (Rw.fc P.Pk.Zs).Df1, (Rw.fc P.Pk.Zs).Dc, P.wU,
    (fun u x => P.eNu u x), P.tup, P.eV, P.Pk.core.cols.μ⟩
  have hn := nu_into L hN u (P.eNu u) (P.NuC (P.wU u)) (P.Nu u) (P.hNu u).lat (P.shift u)
  have hval (z : HeightOneSpectrum (𝓞 D.what₂.LL)) :
      ∀ φ ∈ P.Nu u, ∀ F ∈ (Rw.fc P.Pk.Zs).Df1.Mt (P.Pk.core.cols.μ z),
        (Rw.fc P.Pk.Zs).Dc.Pt (P.wU u) (P.Pk.core.cols.μ z) φ F = 0 ∨
          t z ≤ (vw z ((Rw.fc P.Pk.Zs).Dc.Pt (P.wU u) (P.Pk.core.cols.μ z) φ F) : ℝ) := by
    intro φ hφ F hF
    have hB : B.Tied := P.brTied
    have hmu : D.what₂.muAt (D.plEq.symm z) = B.tup (B.tz z) := by
      rw [hB.mu]
      simp
    have hUsed : Used D (B.tup (B.tz z)) :=
      Or.inr (Or.inr (Or.inr ⟨D.plEq.symm z, hmu.symm⟩))
    have key := perToVal2F D B hB u (B.tz z) (hcut _ hUsed) z (t z) (P.Nu u : Set _)
      (by
        intro x hx G hG hG0
        have h := hper (D.plEq.symm z) (P.eNu u x) (hn x hx)
        rw [hmu] at h
        simpa only [Equiv.apply_symm_apply] using h G hG hG0)
    exact key φ (Submodule.subset_span hφ) F hF
  have hshift := shiftEx D.what₂.LL _ (P.Nu u) (P.inp u).Nu_lat (shiftZ t) ht
  have hinto := P.Pk.core.cols.intoDual divIntoDualShift latticeGlue (P.hZs ▸ Rw.wf1)
    (P.wU u) (P.Nu u) (shiftLat (P.Nu u) t) t (shiftZ t) hval
    (fun z => Int.floor_le_ceil _) hshift.1
  change (D.div.Nu u).L.map ((a⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤ Formalism.HN.dualLat D.div.RR.L
  refine oneMap_of_coord (D.div.Nu u) D.div.RR (P.NuC (P.wU u)) P.Pk.core.cols.RR
    (P.eNu u) P.eRR (P.hNu u).lat P.hRR.lat _ (a⁻¹ • P.Pk.core.cols.col.B (P.wU u))
    (fun x y => by simp [P.hBk u x y]) ?_
  intro x hx
  rw [P.shift u] at hx
  have hx' := RamifiedShiftTransportAudit.inverse_smul_mem_shiftLat (P.Nu u) s t a ha hs ht
      (fun z => (hround z).ge) hx
  simpa only [map_smul, LinearMap.smul_apply] using hinto (a⁻¹ • x) hx'

private theorem sqrt_valuation_twice (D : D7) (z : HeightOneSpectrum (𝓞 D.what₂.LL)) :
    2 * vw z (D.embE D.host.sqrtMinusD) = vw z (D.host.d : D.what₂.LL) := by
  let a := D.embE D.host.sqrtMinusD
  have hd : (D.host.d : D.what₂.LL) ≠ 0 := Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
  have hs : a ^ 2 = -(D.host.d : D.what₂.LL) := sqrt_discriminant_sq D
  have ha : a ≠ 0 := by
    intro h
    simp [h, hd] at hs
  have hneg : vw z (-(D.host.d : D.what₂.LL)) = vw z (D.host.d : D.what₂.LL) := by
    rw [← vAdd_eq_vw _ _ (neg_ne_zero.mpr hd), ← vAdd_eq_vw _ _ hd]
    simp [vAdd]
  simpa [hs, hneg] using (shift_vw_pow z a ha 2).symm

theorem divide_by_sqrt_on_active_lattice {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L} {C Cabs : ℝ}
    (P : DivisionPackageFace Rw C Cabs) (u : D.what₂.Word)
    (h2 : LocalQuadraticParts.adm2 D L) (hcut : ∀ μ, Used D μ → CutUp D μ) (hN : NprimeDef D L)
    (hRam : ∀ (w : D.what₂.places.Pl), D.what₂.places.resChar w = D.host.d →
      ∀ (φ : (D.div.Nu u).V), φ ∈ L.NuLat u →
      ∀ F ∈ (D.what₂.Mtilde (D.what₂.muAt w)).carrier, F ∈ D.what₂.V0 (D.what₂.muAt w) →
        ∃ y : D.what₂.LL, D.what₂.embLL y = D.what₂.perCol u (D.what₂.muAt w) (D.jN u φ) F ∧
          (y = 0 ∨ sgRec L u (D.plEq w) + (D.what₂.places.ramIdx w : ℝ) / 2 ≤ (vAdd (D.plEq w) y : ℝ))) :
    (D.div.Nu u).L.map (((D.embE D.host.sqrtMinusD)⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤ D.div.cc := by
  let a := D.embE D.host.sqrtMinusD
  have ha : a ≠ 0 := by
    have hs : a ^ 2 = -(D.host.d : D.what₂.LL) := sqrt_discriminant_sq D
    have hd : (D.host.d : D.what₂.LL) ≠ 0 := Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
    intro h
    simp [h, hd] at hs
  have hfinite : (Function.support (fun z : HeightOneSpectrum (𝓞 D.what₂.LL) => vw z a)).Finite := by
    refine (place_sum_natural D.what₂.LL D.host.d D.host.hyp.2.1.pos).1.subset fun z hz => ?_
    have h := sqrt_valuation_twice D z
    rw [Function.mem_support] at hz ⊢
    refine mul_ne_zero (shift_lw_pos z).ne' ?_
    exact_mod_cast (h ▸ mul_ne_zero (by decide : (2 : ℤ) ≠ 0) hz)
  refine divide_on_active_lattice P u a ha hfinite hcut hN ?_
  intro w φ hφ F hF hV
  have h := sqrt_valuation_twice D (D.plEq w)
  rw [RamifiedShiftTransportAudit.discriminant_vw] at h
  by_cases hw : D.what₂.places.resChar w = D.host.d
  · rw [ite_eq_left hw] at h
    have hval : (vw (D.plEq w) a : ℝ) = (D.what₂.places.ramIdx w : ℝ) / 2 := by
      have hc : 2 * (vw (D.plEq w) a : ℝ) = (D.what₂.places.ramIdx w : ℝ) := by exact_mod_cast h
      linarith only [hc]
    simpa only [hval] using hRam w hw φ hφ F hF hV
  · rw [ite_eq_right hw] at h
    change 2 * vw (D.plEq w) a = 0 at h
    have hzero : vw (D.plEq w) a = 0 := by omega
    simpa only [hzero, Int.cast_zero, add_zero, sgRec, Equiv.symm_apply_apply] using h2 u w φ hφ F hF hV

theorem symmetric_gain_divides_active_map {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L}
    {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs) {E : Ent D} {Dx : DivX D} {T : TwForms D}
    {X : Inst D L} {K : Consts} {lev : LevelData D} {Xe : ErrX D} {c : ErrC}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hE : ErrDefs D L Xe lev K c) (hN : NuInM D L) (h0 : MemberChainIntegral D)
    (hT : TwistedPointIntegral D T) (hp0 : PeriodClassSumWeyl D) (hpT : TwistedPeriodAdmissible D Dx T)
    (h2 : LocalQuadraticParts.adm2 D L) (hcut : ∀ μ, Used D μ → CutUp D μ) (hPrime : NprimeDef D L)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) (u : D.what₂.Word)
    (hGain : (1 : ℝ) / 2 ≤ ∑ j ∈ SizeData₂.lifts D, liftCutoffGain E u j) :
    (D.div.Nu u).L.map (((D.embE D.host.sqrtMinusD)⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤ D.div.cc := by
  refine divide_by_sqrt_on_active_lattice P u h2 hcut hPrime ?_
  intro w hw φ hφ F hF1 hF0
  obtain ⟨y, hy, hv⟩ := actual_period_with_symmetric_gain (X := X) hshape hform hcomp hF hE hN h0 hT hp0 hpT
    u w hw hg φ hφ F hF1 hF0
  refine ⟨y, hy, hv.imp_right fun h => le_trans ?_ h⟩
  apply add_le_add le_rfl
  calc
    (D.what₂.places.ramIdx w : ℝ) / 2 = (1 / 2 : ℝ) * D.what₂.places.ramIdx w := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_right hGain (Nat.cast_nonneg _)

open Formalism.HN in
theorem sqrt_division_lowers_height (D : D7) {V W ι κ : Type}
    [AddCommGroup V] [Module D.what₂.LL V] [AddCommGroup W] [Module D.what₂.LL W]
    [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]
    (b : Basis ι D.what₂.LL V) (A : InfinitePlace D.what₂.LL → Matrix ι ι ℂ)
    (b' : Basis κ D.what₂.LL W) (A' : InfinitePlace D.what₂.LL → Matrix κ κ ℂ)
    (B : V →ₗ[D.what₂.LL] W) (hpl : 0 < Formalism.HN.nPl D.what₂.LL)
    (hB : ∀ v, 0 < opNormAt b A b' A' v B) :
    htMap b A b' A' (((D.embE D.host.sqrtMinusD)⁻¹) • B) =
      htMap b A b' A' B - Real.log (D.host.d : ℝ) := by
  let a := D.embE D.host.sqrtMinusD
  have hlocal (v : InfinitePlace D.what₂.LL) :
      Real.log (opNormAt b A b' A' v (a⁻¹ • B) ^ 2) =
        Real.log (opNormAt b A b' A' v B ^ 2) - Real.log (D.host.d : ℝ) := by
    have hm := Matrix.map_smul' v.embedding a⁻¹ (LinearMap.toMatrix b b' B) v.embedding.map_mul
    have hop : opNormAt b A b' A' v (a⁻¹ • B) = ‖v.embedding a‖⁻¹ * opNormAt b A b' A' v B := by
      simp only [opNormAt, map_smul, hm, Matrix.mul_smul, Matrix.smul_mul, norm_smul, map_inv₀, norm_inv]
    have ha : ‖v.embedding a‖ ^ 2 ≠ 0 := by
      rw [show ‖v.embedding a‖ ^ 2 = (D.host.d : ℝ) from sqrt_discriminant_arch_norm_sq D v]
      exact Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
    rw [hop, mul_pow, inv_pow, Real.log_mul (inv_ne_zero ha) (pow_ne_zero _ (hB v).ne'),
      Real.log_inv, show ‖v.embedding a‖ ^ 2 = (D.host.d : ℝ) from sqrt_discriminant_arch_norm_sq D v, sub_eq_add_neg]
    ring
  change htMap b A b' A' (a⁻¹ • B) = _
  simp only [htMap, hlocal, Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  rw [← Formalism.HN.nPl]
  have hne : (Formalism.HN.nPl D.what₂.LL : ℝ) ≠ 0 := by exact_mod_cast hpl.ne'
  field_simp [hne]

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``divide_on_active_lattice, ``divide_by_sqrt_on_active_lattice, ``symmetric_gain_divides_active_map,
      ``sqrt_division_lowers_height] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedFixedLatticeAudit
