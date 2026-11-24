module

public import Formalism.SharpRestriction.Divisibility.LocalQuadraticParts
public import Formalism.SharpRestriction.ParamsHeightRankConstant
public import Formalism.SharpRestriction.Divisibility.HookProducts.CardLiftsEq
public import Formalism.SharpRestriction.Divisibility.HookProducts.LwPNonneg
public import Formalism.SharpRestriction.Divisibility.SlopeExcess.HeightBoundOfComponentBounds
public import Formalism.LocalToGlobal.ClassOfRecordOfChoice
public import Formalism.SharpRestriction.GlobalSchurBounds.LinkTied
public import Formalism.LocalToGlobal.GlobalTheory.CoordinateLengths.SecondBranchAllMembers
public import Formalism.LocalToGlobal.GlobalTheory.UnramifiedTrace.HeckeRamifiedZeroAll
public import Formalism.PeriodIntegrals.OrbitalBoundsConclusion.IntegralAtT0Lattice
import Formalism.LocalRingCardinality.CoeNeZeroOfNotMem
import Formalism.LocalToGlobal.ProjectiveLattices.VAddIntNonneg
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Combinatorics.Enumerative.DyckWord
import Mathlib.Combinatorics.SimpleGraph.Triangle.Removal
import Mathlib.Data.NNRat.Floor
import Mathlib.Geometry.Euclidean.Volume.Basic
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.NumberTheory.LucasLehmer
import Mathlib.NumberTheory.SelbergSieve
import Mathlib.RingTheory.Radical.NatInt
import Mathlib.Tactic.Echelon.Zsqrtd
import Mathlib.Tactic.Inclusion.Extension.Core.Core
import Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses
import Mathlib.Tactic.NormNum.Irrational
import Mathlib.Tactic.NormNum.IsCoprime
import Mathlib.Tactic.NormNum.IsSquare
import Mathlib.Tactic.NormNum.LegendreSymbol
import Mathlib.Tactic.NormNum.ModEq
import Mathlib.Tactic.NormNum.NatFib
import Mathlib.Tactic.NormNum.NatLog
import Mathlib.Tactic.NormNum.NatSqrt
import Mathlib.Tactic.NormNum.Ordinal
import Mathlib.Tactic.NormNum.Parity
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.NormNum.RealSqrt
import Mathlib.Topology.Sheaves.Init
import Formalism.LocalToGlobal.GlobalTheory.PlacesMin
import Formalism.LocalToGlobal.GlobalTheory.PlacesP

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Formalism.SharpRestriction.Divisibility.HookProducts.GaugeFormBoundOfUniformSize, Formalism.LocalToGlobal.Divisibility.DivisibilityRemainder.NoColumnCase.LvlWire

-- ===== clump member: Formalism.SharpRestriction.Divisibility.HookProducts.GaugeFormBoundOfUniformSize =====
-- clump-header: {"m": "Formalism.SharpRestriction.Divisibility.HookProducts.GaugeFormBoundOfUniformSize", "h": "module\n\npublic import Formalism.SharpRestriction.Divisibility.LocalQuadraticParts\npublic import Formalism.SharpRestriction.ParamsHeightRankConstant\npublic import Formalism.SharpRestriction.Divisibility.HookProducts.CardLiftsEq\npublic import Formalism.SharpRestriction.Divisibility.HookProducts.LwPNonneg\nimport Formalism.LocalRingCardinality.CoeNeZeroOfNotMem\nimport Formalism.LocalToGlobal.ProjectiveLattices.VAddIntNonneg\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace Formalism.MainNotions.DIV.HookProducts.HookProductWeightBounds

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.G Formalism.MainNotions.DIV.Proofs.HHParts

variable {D : D7} {L : SizeData₂ D}

open Formalism.BasicNotions.DV NumberField in
private theorem vNN_nonneg (X : ErrX D) (i : Fin 2) (u : D.what₂.Word) (j : ℕ)
    (hRow : ∀ τ, ∀ r ∈ Finset.range (D.R.N (j - 1)), 0 ≤ nuRow D u j τ r)
    (w : D.what₂.places.Pl) : 0 ≤ vNN X i u j w := by
  have hPi : (X.piG i : D.host.E) ≠ 0 := by
    intro h
    have hn := X.piG_norm i
    rw [h, zero_mul] at hn
    exact (Nat.cast_ne_zero.mpr (D.host.g_prime i).ne_zero) hn.symm
  unfold vNN
  refine div_nonneg (Finset.sum_nonneg fun τ _ => mul_nonneg (Finset.sum_nonneg (hRow τ)) ?_) (Nat.cast_nonneg _)
  let σ := D.embE.comp ((D.host.sigmaOf (D.eTau τ : D.R.GG)).toRingHom.comp (D.host.conj : D.host.E →+* D.host.E))
  have hInt : IsIntegral ℤ (σ (X.piG i : D.host.E)) :=
    IsIntegral.map σ.toIntAlgHom (X.piG i).isIntegral_coe
  exact_mod_cast Formalism.L2.Pj.vAdd_int_nonneg (D.plEq w) (a := ⟨_, hInt⟩) ((map_ne_zero σ).2 hPi)

open Formalism.BasicNotions.DV in
private theorem sum_ctD_nonneg (u : D.what₂.Word) (j : ℕ)
    (hRow : ∀ τ, ∀ r ∈ Finset.range (D.R.N (j - 1)), 0 ≤ nuRow D u j τ r) :
    0 ≤ ∑ t : HH D, ctD D u j t := by
  have h0 : 0 ∈ Finset.range (D.R.N (j - 1)) := Finset.mem_range.2 (D.R.N_pos _)
  refine Finset.sum_nonneg fun t _ => ?_
  have hFirst := Finset.single_le_sum (hRow (tauPl D (false, t))) h0
  have hMin := le_min (hRow (tauPl D (false, t)) 0 h0) (hRow (tauPl D (true, t)) 0 h0)
  unfold ctD nuAbs
  linarith

private theorem inert_errors_nonneg (K : Consts) (c : ErrC) (hc : c.Large) (hK : K.Nonneg) (j p : ℕ)
    (hp : p.Prime) (hW : ∀ τ, 0 ≤ wj D j τ) : 0 ≤ EatC L c j p ∧ 0 ≤ EatI L K c j p := by
  obtain ⟨-, -, -, -, -, -, -, -, -, -, -, hdl1, hdl2, -, -⟩ := hK
  have hc6 : 0 ≤ c.c6 := by linarith [hc.1]
  have hdig : 0 ≤ c.dig := by linarith [hc.2.1]
  have hp1 : (1 : ℝ) < (p : ℝ) := by exact_mod_cast hp.one_lt
  have hd : 0 ≤ (p : ℝ) ^ 2 - 1 := sub_nonneg.mpr (one_le_pow₀ hp1.le)
  have hgam : 0 ≤ gam p := div_nonneg (Nat.cast_nonneg _) hd
  have hb := one_le_b L
  have ha : 1 ≤ L.sc.a := by unfold Scale.a; nlinarith [L.sc.one_lt_alt.le]
  have hNm : 1 ≤ Nm D := by
    unfold Nm
    exact_mod_cast D.R.N_pos D.R.m
  have hnP : (1 : ℝ) ≤ (nP D p : ℝ) := by
    exact_mod_cast (show 0 < nP D p by
      unfold nP
      split_ifs
      · exact Nat.mul_pos two_pos (addOrderOf_pos _)
      · exact addOrderOf_pos _)
  have hSc := L.Sc_pos.le
  have hEta := L.etaSz_pos.le
  have hk : (0 : ℝ) ≤ (D.R.k : ℝ) - 1 := by
    have := D.R.m_add_three_le_k
    have hk : 1 ≤ D.R.k := by omega
    exact sub_nonneg.mpr (by exact_mod_cast hk)
  have hw (S : Finset (Bool × HH D)) : 0 ≤ ∑ z ∈ S, wPl D j z :=
    Finset.sum_nonneg fun z _ => hW (tauPl D z)
  have hW' : 0 ≤ ∑ τ : D.what₂.Tau, wj D j τ := Finset.sum_nonneg fun τ _ => hW τ
  have hlog := Real.logb_nonneg hp1 ha
  have hlog₂ : 0 ≤ Real.logb p (2 * L.sc.a) := Real.logb_nonneg hp1 (by linarith)
  have hlog₄ : 0 ≤ Real.logb p (4 * (nP D p : ℝ) * Nm D * L.sc.a) := by
    apply Real.logb_nonneg hp1
    exact one_le_mul_of_one_le_of_one_le (one_le_mul_of_one_le_of_one_le
      (one_le_mul_of_one_le_of_one_le (by norm_num) hnP) hNm) ha
  have hX : 0 ≤ EatX L c j p := by
    unfold EatX
    split_ifs
    · have := hw (kindBC D p)
      positivity
    · exact le_rfl
  constructor
  · unfold EatC
    positivity
  · have := hw (kindBC D p)
    unfold EatI
    positivity

open Formalism.BasicNotions.DV in
private theorem F_sub_E_le (X : ErrX D) (K : Consts) (c : ErrC) (hFD : L.FDef) (hED : L.EDef X K c)
    (hc : c.Large) (hK : K.Nonneg) (hS : SizesAt L) (u : D.what₂.Word) (j : ℕ) (hj : j ∈ SizeData₂.lifts D)
    (w : D.what₂.places.Pl) :
    L.F j w - L.E u j w ≤ gC L (16 * Formalism.MainNotions.DIV.Proofs.szPol L ^ 7 * L.sc.b)
      (D.what₂.places.resChar w) := by
  classical
  let p := D.what₂.places.resChar w
  have hF := F_le hFD hS j hj w
  have hb := one_le_b L
  have hP := one_le_szPol L
  have hg := gC_nonneg L (p := p) (by positivity :
    0 ≤ 16 * Formalism.MainNotions.DIV.Proofs.szPol L ^ 7 * L.sc.b)
  rw [hED u j hj w]
  by_cases hT : p = (D.mem u).A.T
  · have he : 0 ≤ EatT D u w := by
      unfold EatT
      split_ifs
      · unfold Nm
        positivity
      · exact le_rfl
    rw [Eval, ite_eq_left hT]
    exact (sub_le_self _ he).trans hF
  obtain ⟨j₁, j₂⟩ := Finset.mem_Icc.1 hj
  have hRow (τ : D.what₂.Tau) (r : ℕ) (hr : r ∈ Finset.range (D.R.N (j - 1))) :
      0 ≤ nuRow D u j τ r := by
    have h := (RowWeightLemmas.nuRow_pos D u (j - 1) (by omega) τ r (Finset.mem_range.1 hr)).le
    rwa [show j - 1 + 1 = j by omega] at h
  have hDen : 0 ≤ (padicValNat p (D.mem u).C.DGam : ℝ) := Nat.cast_nonneg _
  have hG (i : Fin 2) (hi : p = D.host.g i)
      (he : Eval L X K c u j w = (padicValNat p (D.mem u).C.DGam : ℝ) + EatG L X c i u j w) :
      L.F j w - Eval L X K c u j w ≤ 0 := by
    have hp : p ∈ L.gTypes := by fin_cases i <;> simp [SizeData₂.gTypes, hi]
    have hVal := vNN_nonneg X i u j hRow w
    have hcG : 0 ≤ c.g := by linarith [hc.2.2]
    have hEta := L.etaSz_pos.le
    have hTerm : 0 ≤ c.g * (D.R.f : ℝ) * (Nm D ^ 2 + (D.R.m : ℝ) ^ 2 * L.etaSz) := by positivity
    rw [he, hFD j hj w, Fval, FvalP, ite_eq_left hp, EatG]
    linarith only [hVal, hDen, hTerm]
  by_cases h0 : p = D.host.g 0
  · exact (hG 0 h0 (by rw [Eval, ite_eq_right hT, ite_eq_left h0])).trans hg
  by_cases h1 : p = D.host.g 1
  · exact (hG 1 h1 (by rw [Eval, ite_eq_right hT, ite_eq_right h0, ite_eq_left h1])).trans hg
  by_cases hd : D.host.cls p = PrimeClass.ramD
  · have hng : p ∉ L.gTypes := by simp [SizeData₂.gTypes, h0, h1]
    have hJet := sum_ctD_nonneg u j hRow
    rw [Eval, ite_eq_right hT, ite_eq_right h0, ite_eq_right h1, ite_eq_left hd, hFD j hj w,
      Fval, FvalP, ite_eq_right hng, ite_eq_left hd, EatD]
    exact (by linarith only [hDen, hJet] : _ ≤ (0 : ℝ)).trans hg
  have hW (τ : D.what₂.Tau) : 0 ≤ wj D j τ := by
    obtain ⟨hN, -, hK', -, -, -, -, -, hLa, -, hBot, -, -, hEta, -⟩ := hS
    exact (wj_bounds hN hK' hLa hBot hEta j τ).1
  obtain ⟨hC, hI⟩ := inert_errors_nonneg K c hc hK j p (D.what₂.places.resChar_prime w) hW
  apply le_trans ?_ hF
  apply sub_le_self
  rw [Eval, ite_eq_right hT, ite_eq_right h0, ite_eq_right h1, ite_eq_right hd]
  refine add_nonneg hDen ?_
  split_ifs <;> first | exact hC | exact hI | exact le_rfl

theorem fo_sub_ee_le_pol (X : ErrX D) (K : Consts) (c : ErrC) (hFD : L.FDef) (hED : L.EDef X K c)
    (hc : c.Large) (hK : K.Nonneg) (hS : SizesAt L) (hM : Formalism.MainNotions.CornerGLContinuity.MertensBound D)
    (u : D.what₂.Word) :
    L.Fo - L.Ee u ≤ 256 * Formalism.MainNotions.DIV.Proofs.szPol L ^ 9 * L.sc.b := by
  unfold SizeData₂.Fo SizeData₂.Ee
  rw [← Finset.sum_sub_distrib]
  simp only [← Finset.sum_sub_distrib]
  have he (j : ℕ) (w : D.what₂.places.Pl) :
      SizeData₂.sz w (L.F j w) - SizeData₂.sz w (L.E u j w) =
        SizeData₂.sz w (L.F j w - L.E u j w) := by
    unfold SizeData₂.sz
    ring
  simp only [he]
  exact sum_lifts_le_pol hS hM _ (fun j hj w => F_sub_E_le X K c hFD hED hc hK hS u j hj w)

theorem fo_sub_ee_pow {eps : ℝ} (Fm : FamP eps) :
    ∃ x0 : ℝ, ∀ x ≥ x0, Fm.x1 < x → ∀ (i : Fm.Ix x) u,
      (Fm.L x i).Fo - (Fm.L x i).Ee u ≤ x ^ (9 * (max Fm.Ct 5 + 3) + 1) * (Fm.L x i).sc.b := by
  refine ⟨256, fun x hx hx1 i u => ?_⟩
  let e := Fm.ex x hx1 i
  exact (fo_sub_ee_le_pol e.errX Fm.GK Fm.cX.err e.fdef e.err.edef e.err.large Fm.GK_nonneg
    (Fm.sizes x hx1 i) (Formalism.MainNotions.G.Joints.Lit.mertens_bound _) u).trans
    (ninth_polynomial_to_power Fm hx hx1 i)

end Formalism.MainNotions.DIV.HookProducts.HookProductWeightBounds

namespace Formalism.MainNotions.DIV.HookProducts.Row4C

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.DIV.Proofs.HHParts

variable {D : D7} {L : SizeData₂ D}

theorem negEe_le (C : ℝ) (h2 : Formalism.MainNotions.LocalQuadraticParts.adm11 D L C) (u : D.what₂.Word) :
    -(L.Ee u) ≤ C * D.R.m * L.B0 := by
  have ha : 0 < L.sc.a := by
    unfold Scale.a Scale.b
    exact mul_pos (by linarith [L.sc.one_lt_alt]) (Real.exp_pos _)
  have hP : 0 ≤ (∑ t : D.host.TT, (L.aT t : ℝ)) * Real.log (∏ g ∈ L.gTypes, (g : ℝ)) := by
    apply mul_nonneg
    · apply Finset.sum_nonneg
      intro t _
      exact le_trans ha.le (L.aT_win t).1
    · rw [← Nat.cast_prod]
      rcases Nat.eq_zero_or_pos (∏ g ∈ L.gTypes, g) with h | h
      · rw [h]; simp
      · exact Real.log_nonneg (Nat.one_le_cast.mpr h)
  have hCenter := mul_nonneg (Nat.cast_nonneg (α := ℝ) D.R.m) hP
  have hLower := (abs_le.mp (h2 u)).1
  rw [← mul_assoc] at hCenter
  linarith

def EcHH (l : List ℝ) : ℝ := 9 * (max (l.headD 0) 5 + 3) + 2

theorem gauge_form_bound_of_uniform_size {eps : ℝ} (Fm : FamP eps) :
    ∃ x0 : ℝ, ∀ x ≥ x0, Fm.x1 < x → ∀ (i : Fm.Ix x) u,
      (Fm.L x i).Ga + (Fm.L x i).Fo - (Fm.L x i).Ee u ≤ (Fm.L x i).sc.x ^ EcHH Fm.cOut * (Fm.L x i).sc.b := by
  obtain ⟨xg, hg⟩ := Formalism.MainNotions.DIV.HookProducts.Row4.ga_pow Fm
  obtain ⟨xf, hf⟩ := Formalism.MainNotions.DIV.HookProducts.HookProductWeightBounds.fo_sub_ee_pow Fm
  refine ⟨max xg (max xf 2), fun x hx hx1 i u => ?_⟩
  simp only [max_le_iff] at hx
  obtain ⟨hxg, hxf, hx2⟩ := hx
  have hx0 : 0 < x := by linarith
  have hxone : 1 ≤ x := by linarith
  let M := max Fm.Ct 5 + 3
  have hM0 : 0 ≤ M := by dsimp [M]; linarith [le_max_right Fm.Ct 5]
  have hb : 0 ≤ (Fm.L x i).sc.b := (Real.exp_pos _).le
  have hGa := (hg x hxg hx1 i).trans (mul_le_mul_of_nonneg_right
    (Real.rpow_le_rpow_of_exponent_le hxone (show 4 * M + 1 ≤ 9 * M + 1 by linarith)) hb)
  have hFoEe := hf x hxf hx1 i u
  rw [Fm.L_x x i hx1]
  unfold EcHH
  simp only [FamP.cOut, List.headD_cons]
  change _ ≤ x ^ (9 * M + 2) * (Fm.L x i).sc.b
  rw [show 9 * M + 2 = (9 * M + 1) + 1 by ring, Real.rpow_add hx0, Real.rpow_one]
  have h := mul_le_mul_of_nonneg_right hx2
    (mul_nonneg (Real.rpow_nonneg hx0.le (9 * M + 1)) hb)
  linarith only [hGa, hFoEe, h]

end Formalism.MainNotions.DIV.HookProducts.Row4C

end
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.Divisibility.HookProducts.GaugeFormBoundOfUniformSize =====

-- ===== clump member: Formalism.LocalToGlobal.Divisibility.DivisibilityRemainder.NoColumnCase.LvlWire =====
-- clump-header: {"m": "Formalism.LocalToGlobal.Divisibility.DivisibilityRemainder.NoColumnCase.LvlWire", "h": "module\n\npublic import Formalism.SharpRestriction.Divisibility.HookProducts.GaugeFormBoundOfUniformSize\npublic import Formalism.SharpRestriction.Divisibility.SlopeExcess.HeightBoundOfComponentBounds\npublic import Formalism.LocalToGlobal.ClassOfRecordOfChoice\npublic import Formalism.SharpRestriction.GlobalSchurBounds.LinkTied\npublic import Formalism.LocalToGlobal.GlobalTheory.CoordinateLengths.SecondBranchAllMembers\nimport Formalism.LocalToGlobal.GlobalTheory.PlacesMin\nimport Formalism.LocalToGlobal.GlobalTheory.PlacesP\npublic import Formalism.LocalToGlobal.GlobalTheory.UnramifiedTrace.HeckeRamifiedZeroAll\npublic import Formalism.PeriodIntegrals.OrbitalBoundsConclusion.IntegralAtT0Lattice\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace Formalism.L2.DIV.LvlWire

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Lnk Formalism.MainNotions.GlobalTheoryTheory Formalism.L2.GlobalTheoryTheory Formalism.MainNotions.RT

variable {eps : ℝ}

theorem ramified_level_zero_holds (Fm : FamP eps) (tT : FamU Fm ConcreteFormsLevelZero) : FamU Fm LocalLatticeBases.HeckeRamifiedLevelZero :=
  tT.mono fun D u hS h => UnramifiedTrace.hecke_ramified_zero_all D u hS h

theorem transposed_slope_of_form_tie (Fm : FamP eps) (tT : FamU Fm ConcreteFormsLevelZero) : FamU Fm product_first_zeroth_parts.family_property_and :=
  let r := slope_free_branch_family Fm tT freeTT_holds slopeLineT_holds LemB.second_branch_all_members
  (r.1.and r.2.1).mono fun _ _ hS h => by obtain ⟨⟨W⟩, hm⟩ := h; exact product_first_zeroth_parts.division_side_conditions_at_sizeData hS W hm

theorem slope_no_collision_of_form_tie (Fm : FamP eps) (tT : FamU Fm ConcreteFormsLevelZero) : FamU Fm LocalLatticeBases.CongruenceLatticeLengthBound :=
  let r := slope_free_branch_family Fm tT freeTT_holds slopeLineT_holds LemB.second_branch_all_members
  (r.2.2.and ((hI_tied Fm tT PI.IntegralAtBasePointLattice.integral_at_t0_lattice).and (ramified_level_zero_holds Fm tT))).mono
    fun _ _ hS h => LocalLatticeBases.congruence_no_kernel_minimal hS h.1 h.2.1 h.2.2

theorem level_lines_of_form_tie (Fm : FamP eps) (tT : FamU Fm ConcreteFormsLevelZero) (hTu : TuSize Fm) : J.LvlF Fm :=
  lvlF_of Fm (Formalism.L2.GlobalTheoryTheory.Places.settingF_of Fm hTu) (transposed_slope_of_form_tie Fm tT) (slope_no_collision_of_form_tie Fm tT)

theorem lvlF_of_ties (Fm : FamP eps) (t : RealPlaceSecondLayerConditions Fm) (hTu : TuSize Fm) : J.LvlF Fm :=
  level_lines_of_form_tie Fm (family_conditions_of_layer_two Fm t).2.2 hTu

theorem slope_lemma_division_side (Fm : FamP eps) (hE : J.LvlF Fm) (hTu : TuSize Fm) (hrk : J.MuRank Fm) (lG : LinkG Fm) (lMu : LinkMu Fm) :
    LocalQuadraticParts.SlopeLemmaFamily Fm := by
  obtain ⟨C, x0, -, h⟩ := Lnk.slopesNF_of Fm
    (Formalism.L2.GlobalTheoryTheory.Places.placesF_min' Fm (J.lemma_five_one_of_theorem_two Fm hTu hE) (nuCommensF_min Fm hE) hTu hrk lG lMu)
  exact ⟨C, x0, fun x hx i _ u => h x hx i u⟩

theorem nuFullF_of_lvl (Fm : FamP eps) (hE : J.LvlF Fm) : NuFullF Fm := nuFullF_of Fm (nuCommensF_min Fm hE)

theorem muRank_of_lvl (Fm : FamP eps) {C0 : ℝ} (hC0 : 0 < C0) (cPr : ChosenProviso Fm C0) (hE : J.LvlF Fm) (hTu : TuSize Fm) :
    J.MuRank Fm :=
  muRank_min Fm hC0 cPr (nuFullF_of_lvl Fm hE) hE (Formalism.L2.GlobalTheoryTheory.Places.settingF_of Fm hTu)

theorem hh_of_lvl (Fm : FamP eps) (CH : ℝ) (Eb CF0 : List ℝ → ℝ)
    (hL : Fm.Large (Formalism.MainNotions.DIV.Proofs.thrHH Eb Formalism.MainNotions.DIV.HookProducts.Row4C.EcHH CF0) CH)
    (hE : J.LvlF Fm) (hTu : TuSize Fm) (hrk : J.MuRank Fm)
    (lG : LinkG Fm) (lMu : LinkMu Fm)
    (hb : ∃ x0 : ℝ, ∀ x ≥ x0, Fm.x1 < x → ∀ (i : Fm.Ix x) u,
      (((Fm.D x i).fm u).lat 0).muMax ≤ (Fm.L x i).sc.x ^ Eb Fm.cOut * (Fm.L x i).sc.b)
    (he : ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (_ : Fm.x1 < x) (i : Fm.Ix x),
      (Fm.D x i).div.RR.muMax + DV.meanE (Fm.D x i) (fun e => Real.log ((Fm.X x i).kapR e)) ≤
        (Fm.L x i).sc.x ^ CF0 Fm.cOut * (Fm.L x i).sc.b) :
    LocalQuadraticParts.FrameNumberBoundFamily Fm Fm.Csz CH :=
  Formalism.MainNotions.DIV.Proofs.height_bound_of_component_bounds Fm CH Eb Formalism.MainNotions.DIV.HookProducts.Row4C.EcHH CF0 hL
    (slope_lemma_division_side Fm hE hTu hrk lG lMu) hrk (nuFullF_of_lvl Fm hE) hb (Formalism.MainNotions.DIV.HookProducts.Row4C.gauge_form_bound_of_uniform_size Fm) hTu he

theorem proviso_of_working_class {𝒜 : FamClass} {C0 : ℝ} (Fm : FamP eps) (hc : Formalism.L2.Top3.D3 C0 𝒜 Fm) : ChosenProviso Fm C0 := by
  obtain ⟨CH, C5, c6, Cb, -, -, -, -, -, -, -, -, cPr, -⟩ := hc.2.1
  exact cPr

end Formalism.L2.DIV.LvlWire

end

set_option pp.fullNames true
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.LocalToGlobal.Divisibility.DivisibilityRemainder.NoColumnCase.LvlWire =====
