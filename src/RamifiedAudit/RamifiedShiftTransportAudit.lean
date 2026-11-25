module

import Lean
import all Formalism.LocalToGlobal.Divisibility.RecBridge
import all Formalism.QuotientMetricDivisors.FinalW
import all Formalism.QuotientMetricDivisors.HermitianTwistDivisors.PlaceSumSquares
import all Formalism.LocalRingCardinality.SpanPowerMembership.PlOver
import all Formalism.LocalToGlobal.GroupLattices.JointServices.VAddEqVw
import all Formalism.QuotientMetricDivisors.HermitianTwistDivisors.VwEqZeroOfNotMem
import all RamifiedRowCutoffAudit

open Lean Elab Command
open Module NumberField IsDedekindDomain
open Formalism.DivisionValues Formalism.L2.DIV Formalism.HN
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.MainNotions
open Formalism.MainNotions.G Formalism.MainNotions.OrbitPlaces
open Formalism.HermitianLatticesTheory Formalism.LFunctionChainParameters.slopeLatticeData
open scoped BigOperators

namespace RamifiedShiftTransportAudit

section LocalShifts

variable {K : Type} [Field K] [NumberField K] [StarRing K]

private theorem ideal_le_of_counts {I J : FractionalIdeal (nonZeroDivisors (𝓞 K)) K}
    (hI : I ≠ 0) (hJ : J ≠ 0)
    (h : ∀ w, FractionalIdeal.count K w J ≤ FractionalIdeal.count K w I) : I ≤ J := by
  have hfinite (L : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) :
      (Function.mulSupport (fun w : HeightOneSpectrum (𝓞 K) =>
        (w.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) ^ FractionalIdeal.count K w L)).Finite := by
    have hL := FractionalIdeal.finite_factors (K := K) L
    rw [Filter.eventually_cofinite] at hL
    refine hL.subset fun w hw hz => hw ?_
    simp [hz]
  rw [← FractionalIdeal.finprod_heightOneSpectrum_factorization' K hI,
    ← FractionalIdeal.finprod_heightOneSpectrum_factorization' K hJ]
  refine finprod_le_finprod (hfinite I) (hfinite J) fun w => ?_
  have hw : (w.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) ≠ 0 :=
    FractionalIdeal.coeIdeal_ne_zero.mpr w.ne_bot
  have hnonneg : 0 ≤ (w.asIdeal : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) := zero_le
  exact zpow_le_zpow_right_of_le_one₀ (lt_of_le_of_ne hnonneg hw.symm)
    FractionalIdeal.coeIdeal_le_one (h w)

theorem principal_shift_iff (σ τ : HeightOneSpectrum (𝓞 K) → ℤ)
    (hσ : (Function.support σ).Finite) (hτ : (Function.support τ).Finite)
    (a : K) (ha : a ≠ 0) :
    FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K)) a⁻¹ * shiftIdeal σ ≤ shiftIdeal τ ↔
      ∀ w, σ w + vw w a ≤ τ w := by
  let A := FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K)) a⁻¹
  have hA : A ≠ 0 := FractionalIdeal.spanSingleton_ne_zero_iff.mpr (inv_ne_zero ha)
  have hI := shift_shiftIdeal_ne_zero σ
  have hJ := shift_shiftIdeal_ne_zero τ
  have hcount w : FractionalIdeal.count K w (shiftIdeal τ) ≤
      FractionalIdeal.count K w (A * shiftIdeal σ) ↔ σ w + vw w a ≤ τ w := by
    have hAcount : FractionalIdeal.count K w A = -vw w a := by
      change FractionalIdeal.count K w (FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K)) a⁻¹) = _
      rw [← FractionalIdeal.spanSingleton_inv, FractionalIdeal.count_inv]
      rfl
    rw [FractionalIdeal.count_mul K w hA hI, hAcount,
      shift_count_shiftIdeal _ hσ, shift_count_shiftIdeal _ hτ]
    constructor <;> intro h <;> linarith only [h]
  change A * shiftIdeal σ ≤ shiftIdeal τ ↔ _
  constructor
  · intro h w
    exact (hcount w).1 (FractionalIdeal.count_mono K w (mul_ne_zero hA hI) h)
  · intro h
    exact ideal_le_of_counts (mul_ne_zero hA hI) hJ (fun w => (hcount w).2 (h w))

theorem inverse_smul_mem_shiftLat {r : ℕ} (N : Submodule (𝓞 K) (Fin r → K))
    (s t : HeightOneSpectrum (𝓞 K) → ℝ) (a : K) (ha : a ≠ 0)
    (hs : (Function.support (shiftZ s)).Finite) (ht : (Function.support (shiftZ t)).Finite)
    (h : ∀ w, shiftZ s w + vw w a ≤ shiftZ t w)
    {x : Fin r → K} (hx : x ∈ shiftLat N s) : a⁻¹ • x ∈ shiftLat N t := by
  have hincl := (principal_shift_iff (shiftZ s) (shiftZ t) hs ht a ha).2 h
  unfold shiftLat at hx ⊢
  refine smul_mem_idealSmul a⁻¹ (fun c hc => ?_) hx
  exact hincl (FractionalIdeal.mul_mem_mul (FractionalIdeal.mem_spanSingleton_self _ _) hc)

theorem shift_mean_slopes_pay_for_principal_factor [NumberField.IsTotallyComplex K]
    {r : ℕ} (hr : 0 < r) (N : Submodule (𝓞 K) (Fin r → K)) (hN : Submodule.IsFullLattice K N)
    (X : InfinitePlace K → Matrix (Fin r) (Fin r) ℂ) (hX : ∀ v, IsUnit (X v).det)
    (s t : HeightOneSpectrum (𝓞 K) → ℝ)
    (hs : (Function.support (shiftZ s)).Finite) (ht : (Function.support (shiftZ t)).Finite)
    (d : ℕ) (hd : 0 < d) (h : ∀ w, shiftZ s w + vw w (d : K) ≤ shiftZ t w) :
    muDef (Pi.basisFun K (Fin r)) X (shiftLat N s) + 2 * Real.log (d : ℝ) ≤
      muDef (Pi.basisFun K (Fin r)) X (shiftLat N t) := by
  have hshiftS := shiftEx K r N hN (shiftZ s) hs
  have hshiftT := shiftEx K r N hN (shiftZ t) ht
  have hmuS := ((shiftMu K r X hX N (shiftLat N s) hN hshiftS.2.1
    (shiftZ s) hshiftS.1).2 hr).2
  have hmuT := ((shiftMu K r X hX N (shiftLat N t) hN hshiftT.2.1
    (shiftZ t) hshiftT.1).2 hr).2
  obtain ⟨hfinD, hlog, -⟩ := place_sum_natural K d hd
  let f := fun w : HeightOneSpectrum (𝓞 K) => lw w * (shiftZ s w : ℝ)
  let g := fun w : HeightOneSpectrum (𝓞 K) => lw w * (vw w (d : K) : ℝ)
  let k := fun w : HeightOneSpectrum (𝓞 K) => lw w * (shiftZ t w : ℝ)
  have hf : (Function.support f).Finite := hs.subset fun w hw hz => hw (by simp [f, hz])
  have hk : (Function.support k).Finite := ht.subset fun w hw hz => hw (by simp [k, hz])
  have hfg : (Function.support (fun w => f w + g w)).Finite := by
    refine (hf.union hfinD).subset fun w hw => ?_
    by_contra hn
    have hz : f w = 0 := by
      by_contra hne
      exact hn (Or.inl hne)
    have hz' : g w = 0 := by
      by_contra hne
      exact hn (Or.inr hne)
    exact hw (by simp [hz, hz'])
  have hpt : (fun w => f w + g w) ≤ k := by
    intro w
    dsimp [f, g, k]
    rw [← mul_add]
    exact mul_le_mul_of_nonneg_left (by exact_mod_cast h w) (shift_lw_pos w).le
  have hsum := finsum_le_finsum hfg hk hpt
  rw [finsum_add_distrib hf hfinD, hlog] at hsum
  dsimp [f, k] at hsum
  linarith only [hmuS, hmuT, hsum]

end LocalShifts

section Height

variable {K V W ι κ : Type} [Field K] [NumberField K]
variable [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
variable [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

theorem height_of_divided_map (b : Basis ι K V) (A : InfinitePlace K → Matrix ι ι ℂ)
    (b' : Basis κ K W) (A' : InfinitePlace K → Matrix κ κ ℂ) (B : V →ₗ[K] W)
    (n : ℕ) (hn : 0 < n) (hpl : 0 < Formalism.HN.nPl K) (hB : ∀ v, 0 < opNormAt b A b' A' v B) :
    htMap b A b' A' (((n : K)⁻¹) • B) = htMap b A b' A' B - 2 * Real.log (n : ℝ) := by
  have hn' : (0 : ℝ) < n := by exact_mod_cast hn
  have hlocal (v : InfinitePlace K) :
      Real.log (opNormAt b A b' A' v (((n : K)⁻¹) • B) ^ 2) =
        Real.log (opNormAt b A b' A' v B ^ 2) - 2 * Real.log (n : ℝ) := by
    have hm := Matrix.map_smul' v.embedding ((n : K)⁻¹) (LinearMap.toMatrix b b' B) v.embedding.map_mul
    have hop : opNormAt b A b' A' v (((n : K)⁻¹) • B) = (n : ℝ)⁻¹ * opNormAt b A b' A' v B := by
      simp only [opNormAt, map_smul, hm, Matrix.mul_smul, Matrix.smul_mul, norm_smul,
        map_inv₀, map_natCast, norm_inv, Complex.norm_natCast]
    rw [hop, mul_pow, Real.log_mul (pow_ne_zero _ (inv_ne_zero hn'.ne')) (pow_ne_zero _ (hB v).ne'),
      inv_pow, Real.log_inv, Real.log_pow]
    ring
  simp only [htMap, hlocal, Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  rw [← Formalism.HN.nPl]
  have hpl' : (Formalism.HN.nPl K : ℝ) ≠ 0 := by exact_mod_cast hpl.ne'
  field_simp [hpl']

end Height

section Normalization

variable {K W κ : Type} [Field K] [NumberField K] [AddCommGroup W] [Module K W]
variable [Fintype κ] [DecidableEq κ]

theorem normalized_archimedean_term_le [StarRing K] [NumberField.IsTotallyComplex K]
    {r : ℕ} (hr : 0 < r) (N : Submodule (𝓞 K) (Fin r → K)) (hN : Submodule.IsFullLattice K N)
    (A : InfinitePlace K → Matrix (Fin r) (Fin r) ℂ) (hA : ∀ v, IsUnit (A v).det)
    (s t : HeightOneSpectrum (𝓞 K) → ℝ)
    (hs : (Function.support (shiftZ s)).Finite) (ht : (Function.support (shiftZ t)).Finite)
    (b' : Basis κ K W) (A' : InfinitePlace K → Matrix κ κ ℂ) (B : (Fin r → K) →ₗ[K] W)
    (n : ℕ) (hn : 0 < n) (hpl : 0 < Formalism.HN.nPl K)
    (hB : ∀ v, 0 < opNormAt (Pi.basisFun K (Fin r)) A b' A' v B)
    (h : ∀ w, shiftZ s w + vw w (n : K) ≤ shiftZ t w) :
    muDef (Pi.basisFun K (Fin r)) A (shiftLat N s) -
        htMap (Pi.basisFun K (Fin r)) A b' A' (((n : K)⁻¹) • B) ≤
      muDef (Pi.basisFun K (Fin r)) A (shiftLat N t) - htMap (Pi.basisFun K (Fin r)) A b' A' B := by
  rw [height_of_divided_map _ _ _ _ B n hn hpl hB]
  linarith only [shift_mean_slopes_pay_for_principal_factor hr N hN A hA s t hs ht n hn h]

end Normalization

section RealizedWords

/-- The pre-cutoff threshold at the discriminant for the same size data. -/
private noncomputable def previousSg {D : D7} (L : SizeData₂ D) (u : D.what₂.Word)
    (z : D.what₂.places.Pl) : ℝ :=
  if D.what₂.places.resChar z = D.host.d then
    ∑ j ∈ SizeData₂.lifts D, (L.gainD j z + L.F j z -
      (padicValNat (D.what₂.places.resChar z) (D.mem u).C.DGam : ℝ) -
      RamifiedRowCutoffAudit.previousEatD D j)
  else L.sg u z

noncomputable def previousSgRec {D : D7} (L : SizeData₂ D) (u : D.what₂.Word)
    (w : HeightOneSpectrum (𝓞 D.what₂.LL)) : ℝ :=
  (⌊ur D (D.plEq.symm w) (previousSg L u (D.plEq.symm w))⌋ : ℤ)

private theorem discriminant_vw (D : D7) (z : D.what₂.places.Pl) :
    vw (D.plEq z) (D.host.d : D.what₂.LL) =
      if D.what₂.places.resChar z = D.host.d then (D.what₂.places.ramIdx z : ℤ) else 0 := by
  let : Fact D.host.d.Prime := ⟨D.host.hyp.2.1⟩
  by_cases hz : D.what₂.places.resChar z = D.host.d
  · rw [ite_eq_left hz, ← hz]
    have hnz : (D.what₂.places.resChar z : D.what₂.LL) ≠ 0 :=
      Nat.cast_ne_zero.mpr (D.what₂.places.resChar_prime z).ne_zero
    have hv := D.val_eq z _ hnz
    rw [D.what₂.places.val_resChar, Formalism.L2.G.ServJoint.vAdd_eq_vw _ _ hnz] at hv
    exact_mod_cast hv.symm
  · rw [ite_eq_right hz]
    have hm : (D.host.d : 𝓞 D.what₂.LL) ∉ (D.plEq z).asIdeal :=
      fun h => hz ((Formalism.BasicNotions.Examples₂.PlOver.resChar_eq_iff D D.host.d z).mpr h)
    simpa using Formalism.DivisionValues.ValuationZeroReduction.vw_eq_zero_of_not_mem
      (D.plEq z) (D.host.d : 𝓞 D.what₂.LL) hm

theorem previous_shift_bounds {D : D7} {L : SizeData₂ D} (X : ErrX D) (K : Consts) (c : ErrC)
    (hE : L.EDef X K c) (hg : TypePrimeNotDiscriminant D)
    (q : ℕ) (hq : (q : ℝ) ≤ (D.R.m : ℝ) * D.host.TT.card / 2)
    (u : D.what₂.Word) (hfin : (Function.support (shiftZ (sgRec L u))).Finite) :
    (Function.support (shiftZ (previousSgRec L u))).Finite ∧
      ∀ w, shiftZ (previousSgRec L u) w + (q : ℤ) * vw w (D.host.d : D.what₂.LL) ≤
        shiftZ (sgRec L u) w := by
  have hv (w : HeightOneSpectrum (𝓞 D.what₂.LL)) :
      vw w (D.host.d : D.what₂.LL) =
        if D.what₂.places.resChar (D.plEq.symm w) = D.host.d then
          (D.what₂.places.ramIdx (D.plEq.symm w) : ℤ) else 0 := by
    simpa using discriminant_vw D (D.plEq.symm w)
  have hvalFin : (Function.support (fun w : HeightOneSpectrum (𝓞 D.what₂.LL) =>
      vw w (D.host.d : D.what₂.LL))).Finite :=
    (place_sum_natural D.what₂.LL D.host.d D.host.hyp.2.1.pos).1.subset fun w hw =>
      mul_ne_zero (shift_lw_pos w).ne' (by exact_mod_cast hw)
  constructor
  · refine (hfin.union hvalFin).subset fun w hw => ?_
    by_cases h : D.what₂.places.resChar (D.plEq.symm w) = D.host.d
    · refine Or.inr ?_
      rw [Function.mem_support, hv, ite_eq_left h]
      exact_mod_cast (D.what₂.places.ramIdx_pos (D.plEq.symm w)).ne'
    · exact Or.inl (by simpa [Function.mem_support, previousSgRec, previousSg, sgRec, shiftZ, h] using hw)
  · intro w
    let z := D.plEq.symm w
    by_cases h : D.what₂.places.resChar z = D.host.d
    · have hT : D.what₂.places.resChar z ≠ (D.mem u).A.T := by rw [h]; exact (D.T_ne_d u).symm
      have h₀ : D.what₂.places.resChar z ≠ D.host.g 0 := by rw [h]; exact (hg 0).symm
      have h₁ : D.what₂.places.resChar z ≠ D.host.g 1 := by rw [h]; exact (hg 1).symm
      have hd : D.host.cls (D.what₂.places.resChar z) = PrimeClass.ramD :=
        (primeClass_eq_ramD_iff D.host.toHostRaw).mpr h
      let a := fun j : ℕ => L.gainD j z + L.F j z -
        (padicValNat (D.what₂.places.resChar z) (D.mem u).C.DGam : ℝ)
      have hsg : L.sg u z = ∑ j ∈ SizeData₂.lifts D, (a j - EatD D u j) := by
        unfold SizeData₂.sg
        apply Finset.sum_congr rfl
        intro j hj
        rw [hE u j hj z]
        simp only [Eval, a, ite_eq_right hT, ite_eq_right h₀, ite_eq_right h₁, ite_eq_left hd]
        ring
      have hgap : previousSg L u z + (q : ℝ) ≤ L.sg u z := by
        rw [previousSg, ite_eq_left h, hsg]
        change (∑ j ∈ SizeData₂.lifts D, (a j - RamifiedRowCutoffAudit.previousEatD D j)) + (q : ℝ) ≤ _
        linarith only [RamifiedRowCutoffAudit.chain_ramified_margin D u a, hq]
      have hreal : ur D z (previousSg L u z) + ((D.what₂.places.ramIdx z * q : ℕ) : ℝ) ≤
          ur D z (L.sg u z) := by
        simpa [ur, mul_add, Nat.cast_mul] using
          mul_le_mul_of_nonneg_left hgap (Nat.cast_nonneg (α := ℝ) (D.what₂.places.ramIdx z))
      have hrounded := Int.floor_mono hreal
      rw [Int.floor_add_natCast, Nat.cast_mul, mul_comm (D.what₂.places.ramIdx z : ℤ)] at hrounded
      simpa [shiftZ, previousSgRec, sgRec, hv, z, h] using hrounded
    · simp [shiftZ, previousSgRec, previousSg, sgRec, hv, z, h]

theorem divide_on_previous_lattice {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L}
    {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs)
    (h2 : Formalism.MainNotions.LocalQuadraticParts.adm2 D L)
    (hcut : ∀ μ, Used D μ → Formalism.L2.G.ServJoint.CutUp D μ) (hN : NprimeDef D L)
    (X : ErrX D) (K : Consts) (c : ErrC) (hE : L.EDef X K c)
    (hg : TypePrimeNotDiscriminant D)
    (q : ℕ) (hq : (q : ℝ) ≤ (D.R.m : ℝ) * D.host.TT.card / 2) (u : D.what₂.Word) :
    ((shiftLat (P.Nu u) (previousSgRec L u)).map
      ((P.eNu u).toLinearMap.restrictScalars (𝓞 D.what₂.LL))).map
      ((((D.host.d : D.what₂.LL) ^ q)⁻¹ • D.div.Bk u).restrictScalars (𝓞 D.what₂.LL)) ≤ D.div.cc := by
  have hfin := (P.inp u).sg_fin
  obtain ⟨hbefore, hstep⟩ := previous_shift_bounds X K c hE hg q hq u hfin
  have hd : (D.host.d : D.what₂.LL) ≠ 0 := Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
  rintro y ⟨x, ⟨v, hv, rfl⟩, rfl⟩
  let a := (D.host.d : D.what₂.LL) ^ q
  have hprincipal w : shiftZ (previousSgRec L u) w + vw w a ≤ shiftZ (sgRec L u) w := by
    dsimp only [a]
    rw [shift_vw_pow _ _ hd]
    exact hstep w
  have hv' := inverse_smul_mem_shiftLat (P.Nu u) (previousSgRec L u) (sgRec L u) a
    (pow_ne_zero _ hd) hbefore hfin hprincipal hv
  have hsource : P.eNu u (a⁻¹ • v) ∈ (D.div.Nu u).L := by
    rw [(P.hNu u).lat, P.shift u]
    exact Submodule.mem_map_of_mem hv'
  have hmap := (P.wordFacts h2 hcut hN u).1 (Submodule.mem_map_of_mem hsource)
  change D.div.Bk u (P.eNu u (a⁻¹ • v)) ∈ D.div.cc at hmap
  change (a⁻¹ • D.div.Bk u) (P.eNu u v) ∈ D.div.cc
  simpa only [LinearMap.smul_apply, LinearEquiv.map_smul, LinearMap.map_smul] using hmap

theorem previous_coordinate_slope_loss {D : D7} [NumberField.IsTotallyComplex D.what₂.LL]
    {L : SizeData₂ D} {Rw : DivisionRowsFace L} {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs)
    (X : ErrX D) (K : Consts) (c : ErrC) (hE : L.EDef X K c)
    (hg : TypePrimeNotDiscriminant D)
    (q : ℕ) (hq : (q : ℝ) ≤ (D.R.m : ℝ) * D.host.TT.card / 2) (u : D.what₂.Word)
    (hr : 0 < (Rw.fc P.Pk.Zs).Dc.a (P.wU u)) :
    muDef (Pi.basisFun D.what₂.LL (Fin ((Rw.fc P.Pk.Zs).Dc.a (P.wU u))))
        ((Rw.fc P.Pk.Zs).Dc.Xc (P.wU u)) (shiftLat (P.Nu u) (previousSgRec L u)) +
        2 * (q : ℝ) * Real.log (D.host.d : ℝ) ≤
      muDef (Pi.basisFun D.what₂.LL (Fin ((Rw.fc P.Pk.Zs).Dc.a (P.wU u))))
        ((Rw.fc P.Pk.Zs).Dc.Xc (P.wU u)) (P.NuC (P.wU u)) := by
  have hfin := (P.inp u).sg_fin
  obtain ⟨hbefore, hstep⟩ := previous_shift_bounds X K c hE hg q hq u hfin
  have hd : (D.host.d : D.what₂.LL) ≠ 0 := Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
  have hprincipal w : shiftZ (previousSgRec L u) w + vw w ((D.host.d ^ q : ℕ) : D.what₂.LL) ≤
      shiftZ (sgRec L u) w := by
    rw [Nat.cast_pow, shift_vw_pow _ _ hd]
    exact hstep w
  have hX : ∀ v, IsUnit (((Rw.fc P.Pk.Zs).Dc.Xc (P.wU u)) v).det := fun v =>
    Formalism.MainNotions.DIV.HookProducts.RBTie.frame_unit_of_tie _ _ _ _ v (P.hNu u).metric (D.div_good.2 u v)
  have h := shift_mean_slopes_pay_for_principal_factor hr (P.Nu u) (P.inp u).Nu_lat _
    hX (previousSgRec L u) (sgRec L u) hbefore hfin (D.host.d ^ q) (pow_pos D.host.hyp.2.1.pos _) hprincipal
  rw [Nat.cast_pow, Real.log_pow, ← P.shift u] at h
  simpa only [mul_assoc] using h

end RealizedWords

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for name in #[``principal_shift_iff, ``inverse_smul_mem_shiftLat, ``shift_mean_slopes_pay_for_principal_factor,
      ``height_of_divided_map, ``normalized_archimedean_term_le,
      ``previous_shift_bounds, ``divide_on_previous_lattice, ``previous_coordinate_slope_loss] do
    let axioms ← collectAxioms name
    for axiomName in axioms do
      unless allowed.contains axiomName do throwError "{name} uses disallowed axiom {axiomName}"
    logInfo m!"{name} uses {axioms}"

end RamifiedShiftTransportAudit
