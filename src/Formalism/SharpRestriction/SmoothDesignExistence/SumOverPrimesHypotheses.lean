module

public import Formalism.SharpRestriction.Divisibility.OrbitPlaces
public import Formalism.LocalRingCardinality.RhoDetPrimeEqMuTildeMulChiPow
public import Formalism.SharpRestriction.GrowthBounds.WeilJacquetShalikaLaw
public import Formalism.LocalRingCardinality.HostCls
public import Formalism.SharpRestriction.GrowthBounds.LatticeSystems
public import Formalism.SharpRestriction.GrowthBounds.TopChoiceBounds
public import Formalism.SharpRestriction.GrowthBounds.Joints
public import Formalism.SharpRestriction.GrowthBounds.FormalGroupSystem
public import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.NdBNonneg
public import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.PriceLinearCombinationLe
public import Formalism.LocalRingCardinality.CoeNeZeroOfNotMem
public import Formalism.SharpRestriction.ParamsHeightRankConstant
public import Formalism.SharpRestriction.AdmissibleParameterJoins.DIVfromGLm
public import Formalism.SharpRestriction.CuspSpanNormBounds.StandingHypothesesHoldFamily
public import Formalism.SharpRestriction.Divisibility.ChainOperators.GenericFramesLetters
public import Formalism.SharpRestriction.Divisibility.ChainOperators.OrbitEntryBounds
public import Formalism.SharpRestriction.Divisibility.JetPolynomialLogs.LocalBoundElevenComparison
public import Formalism.SharpRestriction.Divisibility.LocalNonemptiness.OrbitAdmissibleOfSplitBound
public import Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.FirstTermSizeBound
public import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.PrvAndKernelCommutationUpToUnitsOfRests
public import Formalism.SharpRestriction.GrowthBounds.PlaneCountTheoremWithConstants
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
import Mathlib.Analysis.Normed.Algebra.GelfandRadius
import Formalism.SharpRestriction.CuspSpanNormBounds.SBridge
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ReduceModChar
import Std.Tactic.BVDecide.Normalize.Prop
import Aesop.Frontend.Tactic
import Mathlib.Tactic.Linter.Style

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Formalism.SharpRestriction.AdmissibleParameterJoins.GandSab, Formalism.SharpRestriction.CuspSpanNormBounds.NonemptyParameterModels.SixteenLeMulOfStdOfHypOfHyp0, Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.StatementsOfRemainingBound, Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.RemainingPrimesOfAdmitted, Formalism.SharpRestriction.GrowthBounds.JointsTw, Formalism.SharpRestriction.GrowthBounds.MultisetValuation.StmtNumFEx, Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses

-- ===== clump member: Formalism.SharpRestriction.AdmissibleParameterJoins.GandSab =====
-- clump-header: {"m": "Formalism.SharpRestriction.AdmissibleParameterJoins.GandSab", "h": "module\n\npublic import Formalism.SharpRestriction.Divisibility.OrbitPlaces\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace Formalism.MainNotions.J

open Formalism.BasicNotions Formalism.MainNotions.G

variable {D : D7} {L : SizeData₂ D}

theorem four_orbit_conditions_of_proof {X : Inst D L} {K : Consts} {Dx : DivX D} {T : TwForms D} {E : Formalism.MainNotions.OrbitPlaces.Ent D}
    {lev : LevelData D} {Xe : ErrX D} {ce : ErrC} {sp C : ℝ} (h : Formalism.MainNotions.OrbitPlaces.Conclusion₂ D L X K Dx T E lev Xe ce sp C) :
    Formalism.MainNotions.WeilJacquetShalikaLaw.OrbitsWithoutOperator D L X K Dx T lev Xe ce sp ∧ Formalism.MainNotions.WeilJacquetShalikaLaw.MediumInertPrimeLengthBound D L K Dx T lev Xe ce sp ∧
      Formalism.MainNotions.WeilJacquetShalikaLaw.LossAtDiscriminant D L K Dx T lev Xe ce sp ∧ Formalism.MainNotions.WeilJacquetShalikaLaw.IsotypicPartsInternalDirectSum D Dx T sp := by
  obtain ⟨_, _, _, _, _, _, _, _, _, _, _, _, _, _, h1, h2, h3, h4⟩ := h
  exact ⟨h1, h2, h3, h4⟩

end Formalism.MainNotions.J
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.AdmissibleParameterJoins.GandSab =====

-- ===== clump member: Formalism.SharpRestriction.CuspSpanNormBounds.NonemptyParameterModels.SixteenLeMulOfStdOfHypOfHyp0 =====
-- clump-header: {"m": "Formalism.SharpRestriction.CuspSpanNormBounds.NonemptyParameterModels.SixteenLeMulOfStdOfHypOfHyp0", "h": "module\n\npublic import Formalism.LocalRingCardinality.RhoDetPrimeEqMuTildeMulChiPow\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Formalism.SharpRestriction.CuspSpanNormBounds.SBridge\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace Formalism.MainNotions.S.Inh

section a5

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.S Formalism.MainNotions.S.Bridge Formalism.MainNotions.S.ThB

theorem tau_index_set_nonempty (D : D7) : Nonempty D.what₂.Tau := by
  first
  | exact D.eTau.nonempty

variable {eps : ℝ}

end a5

end Formalism.MainNotions.S.Inh
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.CuspSpanNormBounds.NonemptyParameterModels.SixteenLeMulOfStdOfHypOfHyp0 =====

-- ===== clump member: Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.StatementsOfRemainingBound =====
-- clump-header: {"m": "Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.StatementsOfRemainingBound", "h": "module\n\npublic import Formalism.SharpRestriction.GrowthBounds.WeilJacquetShalikaLaw\npublic import Formalism.LocalRingCardinality.HostCls\npublic import Formalism.SharpRestriction.GrowthBounds.LatticeSystems\npublic import Formalism.SharpRestriction.GrowthBounds.TopChoiceBounds\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open scoped BigOperators
open NumberField IsDedekindDomain Formalism.FrobeniusOrbits Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.MainNotions.G Formalism.MainNotions Formalism.MainNotions.WeilJacquetShalikaLaw

namespace Formalism.MainNotions.WeilJacquetShalikaLaw.Proof

variable {D : D7} {L : SizeData₂ D} {X : Inst D L} {Y : LatInst D} {K : Consts} {c : LatCmp D} {Dx : DivX D} {T : TwForms D}
  {lev : LevelData D} {Xe : ErrX D} {ce : ErrC} {sp : ℝ}

def RestElse (D : D7) (Dx : DivX D) (T : TwForms D) (sp : ℝ) : Prop :=
  ∀ u (w : D.what₂.places.Pl), D.what₂.places.resChar w ≠ (D.mem u).A.T →
    D.what₂.places.resChar w ≠ D.host.d → D.what₂.places.resChar w ∉ ({D.host.g 0, D.host.g 1} : Finset ℕ) →
    ∀ μ, DV.Used D μ → D.what₂.places.resChar w ∉ Dx.Qp μ → ∀ x ∈ LT.Sram D u w,
      ColGe T u μ w x (-(((SizeData₂.lifts D).card : ℝ) - sp) * vDG D u w)

theorem notInert_of' (p : ℕ) (hp : p.Prime) (h3 : p ∣ D.host.condN) : ¬ (IsResidueClassZero D p ∨ IsSg D p) := by
  rintro (h | h)
  · exact not_dvd_conductor_of_inert hp h h3
  · exact not_dvd_of_signal hp h h3

theorem first_clause_cases
    (hNo : OrbitsWithoutOperator D L X K Dx T lev Xe ce sp) (hC : MediumInertPrimeLengthBound D L K Dx T lev Xe ce sp)
    (hD : LossAtDiscriminant D L K Dx T lev Xe ce sp)
    (hElse : DGamDef D → RestElse D Dx T sp) :
    ColumnValuationAwayFromTypePrimes D L K Dx T lev Xe ce sp := by
  intro hF hE u w hw hg μ hUs hμ x hx
  have hp := D.what₂.places.resChar_prime w
  have h0 : D.what₂.places.resChar w ≠ D.host.g 0 := fun h => hg (by simp [h])
  have h1 : D.what₂.places.resChar w ≠ D.host.g 1 := fun h => hg (by simp [h])
  by_cases h2 : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD
  · have h := hD hF hE u w hw h2 μ hUs hμ x hx
    have e : lowS L Xe K ce sp u w =
        (∑ j ∈ SizeData₂.lifts D, (L.F j w - EatD D u j - vDG D u w)) + sp * vDG D u w := by
      unfold lowS ES Eval vDG
      congr 1
      refine Finset.sum_congr rfl fun j _ => ?_
      simp only [if_neg hw, if_neg h0, if_neg h1, if_pos h2]
      ring
    rw [e]; exact h
  by_cases h3 : (IsResidueClassZero D (D.what₂.places.resChar w) ∨ IsSg D (D.what₂.places.resChar w)) ∧
      (D.what₂.places.resChar w : ℝ) ≤ L.sc.X'' D.R.n
  · have hExc : ¬ Exc D (D.what₂.places.resChar w) := by
      intro hE'
      unfold Exc at hE'
      rcases (Nat.Prime.dvd_mul hp).1 hE' with h | h
      · rcases (Nat.Prime.dvd_mul hp).1 h with h | h
        · exact notInert_of' _ hp h h3.1
        · exact h0 ((Nat.prime_dvd_prime_iff_eq hp (D.host.g_prime 0)).1 h)
      · exact h1 ((Nat.prime_dvd_prime_iff_eq hp (D.host.g_prime 1)).1 h)
    by_cases h4 : IsResidueClassZero D (D.what₂.places.resChar w) ∧ hP D (D.what₂.places.resChar w) = 0
    · have h := hC hF hE u w hw h4.1 h4.2 hExc h3.2 μ hUs hμ x hx
      have e : lowS L Xe K ce sp u w =
          (∑ j ∈ SizeData₂.lifts D, (L.F j w - EatC L ce j (D.what₂.places.resChar w) - vDG D u w)) + sp * vDG D u w := by
        unfold lowS ES Eval vDG
        congr 1
        refine Finset.sum_congr rfl fun j _ => ?_
        simp only [if_neg hw, if_neg h0, if_neg h1, if_neg h2, if_pos h3, if_pos h4]
        ring
      rw [e]; exact h
    · have hcl : (IsResidueClassZero D (D.what₂.places.resChar w) ∧ hP D (D.what₂.places.resChar w) ≠ 0) ∨
          IsSg D (D.what₂.places.resChar w) := by
        rcases h3.1 with h | h
        · exact Or.inl ⟨h, fun h' => h4 ⟨h, h'⟩⟩
        · exact Or.inr h
      have h := hNo hF hE u w hw hcl hExc h3.2 μ hUs hμ x hx
      refine ColGe_mono ?_ h
      have : 0 ≤ ∑ j ∈ SizeData₂.lifts D, g0S X K (D.what₂.places.resChar w) j :=
        Finset.sum_nonneg fun _ _ => by
          unfold g0S
          split_ifs
          · exact le_rfl
          · exact Finset.sum_nonneg fun _ _ => le_max_right _ _
      linarith
  · have hd : D.what₂.places.resChar w ≠ D.host.d := by
      intro hd
      apply h2
      rw [hd]
      exact primeClass_d D.host.toHostRaw
    have h := hElse hE.dgam u w hw hd hg μ hUs hμ x hx
    have e : lowS L Xe K ce sp u w = -(((SizeData₂.lifts D).card : ℝ) - sp) * vDG D u w := by
      unfold lowS ES Eval vDG
      have : ∀ j ∈ SizeData₂.lifts D, L.F j w = 0 := by
        intro j hj
        rw [hF j hj w]
        unfold Fval FvalP SizeData₂.gTypes
        rw [if_neg hg, if_neg h2, if_neg h3]
      rw [Finset.sum_congr rfl fun j hj => by rw [this j hj]]
      simp only [if_neg hw, if_neg h0, if_neg h1, if_neg h2, if_neg h3]
      simp [Finset.sum_const]
      ring
    rw [e]; exact h

theorem not_exc_of_inert {p : ℕ} (hp : p.Prime) (hin : IsResidueClassZero D p ∨ IsSg D p) (h0 : p ≠ D.host.g 0) (h1 : p ≠ D.host.g 1) :
    ¬ Exc D p := by
  intro hE'
  unfold Exc at hE'
  rcases (Nat.Prime.dvd_mul hp).1 hE' with h | h
  · rcases (Nat.Prime.dvd_mul hp).1 h with h | h
    · exact notInert_of' _ hp h hin
    · exact h0 ((Nat.prime_dvd_prime_iff_eq hp (D.host.g_prime 0)).1 h)
  · exact h1 ((Nat.prime_dvd_prime_iff_eq hp (D.host.g_prime 1)).1 h)

theorem not_exc_of_gIdx {Tu p : ℕ} (hg : GIdx D.host Tu p) : ¬ Exc D p :=
  not_exc_of_inert hg.1 (Or.inl hg.2.2.1) (fun h => hg.2.2.2.2.1 (h ▸ D.host.g_level 0))
    (fun h => hg.2.2.2.2.1 (h ▸ D.host.g_level 1))

theorem first_in_local_models (W : TwLoc D Y) (hU : unitBoundAtTwistedPlaces D L X Y K Dx W lev Xe ce sp) : TupleLatticeValuation D L X Y K Dx W lev Xe ce sp := by
  classical
  intro hE μ hUs hT hTied u w hg hμ
  have hU1 := hU hE μ hUs hT hTied u w hg hμ
  set Y' := W.Yt μ with hY'
  set p := D.what₂.places.resChar w with hp
  set G := D.gat u w hg with hG
  have hsub := TopChoiceBounds.bg_VV_sub X K (aL L) (bL L) p
  have hne : (reps X p).Nonempty := by
    unfold reps
    exact (Finset.univ_nonempty (α := HH D)).image _
  obtain ⟨t1, _⟩ := hne
  have hfr : IsFractionRing G.O G.Kf := (G.P.setting (Y'.vOf u w hg t1)).frac_O
  have hp0 : (p : G.O) ≠ 0 := by
    intro h0
    exact LatticeSystems.kp_p_ne_zero G (Y'.vOf u w hg t1) (by rw [h0, map_zero])
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible G.O
  have kz : (Y'.Ch u w hg).chainK D.R.m (0 : G.Fn) = 0 := map_zero ((Y'.Ch u w hg).chainK D.R.m)
  have ka : ∀ A B : G.Fn, (Y'.Ch u w hg).chainK D.R.m (A + B) =
      (Y'.Ch u w hg).chainK D.R.m A + (Y'.Ch u w hg).chainK D.R.m B :=
    fun A B => map_add ((Y'.Ch u w hg).chainK D.R.m) A B
  have ks : ∀ (c : G.O) (A : G.Fn), (Y'.Ch u w hg).chainK D.R.m (c • A) = c • (Y'.Ch u w hg).chainK D.R.m A :=
    fun c A => LinearMap.map_smul_of_tower ((Y'.Ch u w hg).chainK D.R.m) c A
  intro F hF
  have hF1 := hF.1.1
  clear hF
  unfold LatInst.vKge
  rw [TopChoiceBounds.bg_vGe_iff G hϖ]
  induction hF1 using Submodule.span_induction with
  | mem F' h' =>
    obtain ⟨VV', hV', F0, hF0, rfl⟩ := h'
    rw [← TopChoiceBounds.bg_vGe_iff G hϖ, TopChoiceBounds.bg_yProd_smul, ks]
    have h1 := hU1 _ VV' hsub hV' F0 hF0
    have h2 := TopChoiceBounds.bg_vGe_smul G hp0 _ _ _
      (∑ t0 ∈ VV X K (aL L) (bL L) p \ VV', ⌈Sv X K (aL L) (bL L) p t0⌉.toNat) h1
    refine TopChoiceBounds.bg_vGe_mono G _ _ ?_ h2
    have := TopChoiceBounds.bg_gain_le X K (aL L) (bL L) p VV' hV'
    linarith
  | zero => rw [kz]; exact Submodule.zero_mem _
  | add a b _ _ ha hb => rw [ka]; exact Submodule.add_mem _ ha hb
  | smul c a _ ha => rw [ks]; exact Submodule.smul_mem _ c ha

theorem totS_eq (u : D.what₂.Word) (w : D.what₂.places.Pl) :
    totS X K Xe ce sp u w =
      (∑ j ∈ SizeData₂.lifts D, gainS X K (D.what₂.places.resChar w) j) + lowS L Xe K ce sp u w := by
  unfold totS lowS
  simp only [sub_eq_add_neg, Finset.sum_add_distrib]
  ring

theorem baseChange_preserves_unitary_of (W : TwLoc D Y) (hV : CmpV c Dx T W) (hG : TupleLatticeValuation D L X Y K Dx W lev Xe ce sp)
    (hNo : OrbitsWithoutOperator D L X K Dx T lev Xe ce sp) (hc : ColumnValuationAwayFromTypePrimes D L K Dx T lev Xe ce sp) :
    Conclusion1 D L X Y K c Dx T lev Xe ce sp := by
  classical
  intro ht hE u w hw hg' μ hUs hμ x hin
  rcases hin with ⟨hg, hx⟩ | ⟨hVV, hx⟩
  · exact kernel_valuation_served W hV hG ht hE u w hg (not_exc_of_gIdx hg) μ hUs hμ x hx
  · have hlow := hc ht.fdef hE u w hw hg' μ hUs hμ x hx
    rw [totS_eq]
    by_cases h1 : (IsResidueClassZero D (D.what₂.places.resChar w) ∨ IsSg D (D.what₂.places.resChar w)) ∧ ¬ Exc D (D.what₂.places.resChar w)
    swap
    · have : ∑ j ∈ SizeData₂.lifts D, gainS X K (D.what₂.places.resChar w) j = 0 :=
        Finset.sum_eq_zero fun j _ => by rw [gainS, if_neg h1]
      rw [this, zero_add]; exact hlow
    by_cases h2 : (IsResidueClassZero D (D.what₂.places.resChar w) ∧ hP D (D.what₂.places.resChar w) = 0) ∨
        L.sc.X'' D.R.n < (D.what₂.places.resChar w : ℝ)
    · have : ∑ j ∈ SizeData₂.lifts D, gainS X K (D.what₂.places.resChar w) j = 0 :=
        Finset.sum_eq_zero fun j _ => by rw [gainS, if_pos h1, gainP, if_pos h2, ite_self]
      rw [this, zero_add]; exact hlow
    · have hcl : (IsResidueClassZero D (D.what₂.places.resChar w) ∧ hP D (D.what₂.places.resChar w) ≠ 0) ∨
          IsSg D (D.what₂.places.resChar w) := by
        rcases h1.1 with h | h
        · exact Or.inl ⟨h, fun h' => h2 (Or.inl ⟨h, h'⟩)⟩
        · exact Or.inr h
      have hX : (D.what₂.places.resChar w : ℝ) ≤ L.sc.X'' D.R.n := not_lt.1 fun h => h2 (Or.inr h)
      have h := hNo ht.fdef hE u w hw hcl h1.2 hX μ hUs hμ x hx
      have e : ∑ j ∈ SizeData₂.lifts D, gainS X K (D.what₂.places.resChar w) j =
          ∑ j ∈ SizeData₂.lifts D, g0S X K (D.what₂.places.resChar w) j :=
        Finset.sum_congr rfl fun j _ => by
          rw [gainS, if_pos h1, g0S, gainP, if_neg h2, hVV, Finset.sum_empty, zero_add, Finset.sdiff_empty]
      rw [e]; exact h

end Formalism.MainNotions.WeilJacquetShalikaLaw.Proof

end
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.StatementsOfRemainingBound =====

-- ===== clump member: Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.RemainingPrimesOfAdmitted =====
-- clump-header: {"m": "Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.RemainingPrimesOfAdmitted", "h": "module\n\npublic import Formalism.SharpRestriction.GrowthBounds.WeilJacquetShalikaLaw\nimport Aesop.Frontend.Tactic\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open scoped BigOperators
open NumberField IsDedekindDomain Formalism.FrobeniusOrbits Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.MainNotions.G Formalism.MainNotions.WeilJacquetShalikaLaw

namespace Formalism.MainNotions.WeilJacquetShalikaLaw.Proof

theorem mem_intW_of (D : D7) (w : D.what₂.places.Pl) {x : D.what₂.LL} (hx : x ≠ 0) (h : 0 ≤ vAdd (D.plEq w) x) :
    x ∈ intW D.what₂.places w := by
  show (0 : WithTop ℤ) ≤ D.what₂.places.val w x
  rw [D.val_eq w x hx]
  exact_mod_cast h

theorem vAdd_one (D : D7) (w : D.what₂.places.Pl) : vAdd (D.plEq w) (1 : D.what₂.LL) = 0 := by
  first
  | rfl
  | (simp [vAdd]; done)

theorem div_mem_intW (D : D7) (w : D.what₂.places.Pl) {a b : D.what₂.LL} (ha : a ≠ 0) (hb : b ≠ 0)
    (h : vAdd (D.plEq w) a ≤ vAdd (D.plEq w) b) : b / a ∈ intW D.what₂.places w := by
  have hq : b / a ≠ 0 := div_ne_zero hb ha
  refine mem_intW_of D w hq ?_
  have h1 : vAdd (D.plEq w) (a * (b / a)) = vAdd (D.plEq w) a + vAdd (D.plEq w) (b / a) := vAdd_mul' _ ha hq
  rw [mul_div_cancel₀ b ha] at h1
  omega

section VGeLemmas

variable {D : D7} {w : D.what₂.places.Pl} {V : Type} [AddCommGroup V] [Module D.what₂.LL V] [Module (𝓞 D.what₂.LL) V]
  {Λ : Submodule (𝓞 D.what₂.LL) V}

theorem VGe_zero (s : ℝ) : VGe D w Λ (0 : V) s := by
  exact ⟨0, 0, zero_mem _, by simp, Or.inl rfl⟩

theorem VGe_of_mem {z : V} (hz : z ∈ locW D.what₂.places w Λ) : VGe D w Λ z 0 := by
  refine ⟨1, z, hz, (one_smul _ _).symm, Or.inr ?_⟩
  rw [vAdd_one]
  first
  | (simp [ur]; done)

theorem valuation_ge_add_of_le {a1 a2 : D.what₂.LL} {z1 z2 : V} {s : ℝ} (h1 : a1 ≠ 0) (h2 : a2 ≠ 0)
    (hz1 : z1 ∈ locW D.what₂.places w Λ) (hz2 : z2 ∈ locW D.what₂.places w Λ)
    (hv : ur D w s ≤ (vAdd (D.plEq w) a1 : ℝ)) (hle : vAdd (D.plEq w) a1 ≤ vAdd (D.plEq w) a2) :
    VGe D w Λ (a1 • z1 + a2 • z2) s := by
  refine ⟨a1, z1 + (⟨a2 / a1, div_mem_intW D w h1 h2 hle⟩ : intW D.what₂.places w) • z2,
    Submodule.add_mem _ hz1 (Submodule.smul_mem _ _ hz2), ?_, Or.inr hv⟩
  rw [Subring.smul_def, smul_add, smul_smul, mul_div_cancel₀ a2 h1]

theorem VGe_add {y1 y2 : V} {s : ℝ} (h1 : VGe D w Λ y1 s) (h2 : VGe D w Λ y2 s) : VGe D w Λ (y1 + y2) s := by
  obtain ⟨a1, z1, hz1, rfl, ha1⟩ := h1
  obtain ⟨a2, z2, hz2, rfl, ha2⟩ := h2
  by_cases e1 : a1 = 0
  · subst e1
    rw [zero_smul, zero_add]
    exact ⟨a2, z2, hz2, rfl, ha2⟩
  by_cases e2 : a2 = 0
  · subst e2
    rw [zero_smul, add_zero]
    exact ⟨a1, z1, hz1, rfl, ha1⟩
  have hv1 := ha1.resolve_left e1
  have hv2 := ha2.resolve_left e2
  rcases le_total (vAdd (D.plEq w) a1) (vAdd (D.plEq w) a2) with h | h
  · exact valuation_ge_add_of_le e1 e2 hz1 hz2 hv1 h
  · rw [add_comm]
    exact valuation_ge_add_of_le e2 e1 hz2 hz1 hv2 h

theorem VGe_smul_int {y : V} {s : ℝ} (r : intW D.what₂.places w) (h : VGe D w Λ y s) :
    VGe D w Λ ((r : D.what₂.LL) • y) s := by
  obtain ⟨a, z, hz, rfl, ha⟩ := h
  refine ⟨a, r • z, Submodule.smul_mem _ _ hz, ?_, ha⟩
  rw [Subring.smul_def, smul_smul, smul_smul, mul_comm]

theorem VGe_smul {y : V} {s s' : ℝ} {b : D.what₂.LL} (hb : b = 0 ∨ ur D w s' ≤ (vAdd (D.plEq w) b : ℝ))
    (h : VGe D w Λ y s) : VGe D w Λ (b • y) (s' + s) := by
  obtain ⟨a, z, hz, rfl, ha⟩ := h
  refine ⟨b * a, z, hz, by rw [smul_smul], ?_⟩
  by_cases e1 : b = 0
  · left; rw [e1, zero_mul]
  by_cases e2 : a = 0
  · left; rw [e2, mul_zero]
  right
  have hv1 := hb.resolve_left e1
  have hv2 := ha.resolve_left e2
  rw [vAdd_mul' _ e1 e2]
  push_cast
  have h1 : ur D w (s' + s) = ur D w s' + ur D w s := by unfold ur; ring
  linarith

end VGeLemmas

section Chain

variable {D : D7} {hc : D.what₂.Tau → HCParam D.R} {C : ColumnChain D.R D.what₂.Tau hc} {A : ColumnsAtT D.R C}
  {P : PeriodMap D.R C} (M : MemberForms D.what₂.LL D.what₂.embLL D.what₂.places D.what₂.Tau hc C A P)
  (w : D.what₂.places.Pl)

theorem step_loc (i : ℕ) (s : ℝ)
    (hstep : ∀ x ∈ (M.lat i).L, ∃ y, M.emb (i + 1) y = C.K i (M.emb i x) ∧ VGe D w (M.lat (i + 1)).L y s)
    (z : (M.lat i).V) (hz : z ∈ locW D.what₂.places w (M.lat i).L) :
    ∃ y, M.emb (i + 1) y = C.K i (M.emb i z) ∧ VGe D w (M.lat (i + 1)).L y s := by
  unfold BasicNotions.locW at hz
  induction hz using Submodule.span_induction with
  | mem x hx => exact hstep x hx
  | zero =>
    refine ⟨0, ?_, VGe_zero s⟩
    show M.emb (i + 1) 0 = C.Klin i (M.emb i 0)
    rw [map_zero, map_zero, map_zero]
  | add a b _ _ ha hb =>
    obtain ⟨ya, hya, hva⟩ := ha
    obtain ⟨yb, hyb, hvb⟩ := hb
    refine ⟨ya + yb, ?_, VGe_add hva hvb⟩
    show M.emb (i + 1) (ya + yb) = C.Klin i (M.emb i (a + b))
    rw [map_add (f := _), map_add (f := _), map_add (f := _), hya, hyb]
    rfl
  | smul r a _ ha =>
    obtain ⟨ya, hya, hva⟩ := ha
    refine ⟨(r : D.what₂.LL) • ya, ?_, VGe_smul_int r hva⟩
    show M.emb (i + 1) ((r : D.what₂.LL) • ya) = C.Klin i (M.emb i (r • a))
    rw [Subring.smul_def, LinearMap.map_smulₛₗ, LinearMap.map_smulₛₗ, LinearMap.map_smul, hya]
    rfl

theorem step_ge (i : ℕ) (s s0 : ℝ)
    (hstep : ∀ x ∈ (M.lat i).L, ∃ y, M.emb (i + 1) y = C.K i (M.emb i x) ∧ VGe D w (M.lat (i + 1)).L y s)
    (x : (M.lat i).V) (hx : VGe D w (M.lat i).L x s0) :
    ∃ y, M.emb (i + 1) y = C.K i (M.emb i x) ∧ VGe D w (M.lat (i + 1)).L y (s0 + s) := by
  obtain ⟨a, z, hz, rfl, ha⟩ := hx
  obtain ⟨y, hy, hv⟩ := step_loc M w i s hstep z hz
  refine ⟨a • y, ?_, VGe_smul ha hv⟩
  show M.emb (i + 1) (a • y) = C.Klin i (M.emb i (a • z))
  rw [LinearMap.map_smulₛₗ, LinearMap.map_smulₛₗ, LinearMap.map_smul, hy]
  rfl

theorem chain_ge (s : ℕ → ℝ) (n : ℕ)
    (hstep : ∀ i < n, ∀ x ∈ (M.lat i).L, ∃ y, M.emb (i + 1) y = C.K i (M.emb i x) ∧
      VGe D w (M.lat (i + 1)).L y (s i))
    (x : (M.lat 0).V) (hx : x ∈ locW D.what₂.places w (M.lat 0).L) :
    ∀ i ≤ n, ∃ y, M.emb i y = Formalism.ThetaLiftIndependence.chainOpM C.wt C.Kmap i (M.emb 0 x) ∧
      VGe D w (M.lat i).L y (∑ j ∈ Finset.range i, s j) := by
  intro i
  induction i with
  | zero =>
    intro _
    exact ⟨x, rfl, by simpa using VGe_of_mem hx⟩
  | succ i ih =>
    intro hi
    obtain ⟨y, hy, hv⟩ := ih (by omega)
    obtain ⟨y', hy', hv'⟩ := step_ge M w i (s i) _ (hstep i (by omega)) y hv
    refine ⟨y', ?_, by rw [Finset.sum_range_succ]; exact hv'⟩
    rw [hy', hy]
    rfl

end Chain

theorem sum_bounds (m : ℕ) (hm : 1 ≤ m) (sp v : ℝ) :
    ∑ j ∈ Finset.range m, (-((if j = 0 then 1 - sp else 1) * v)) = -((m : ℝ) - sp) * v := by
  obtain ⟨k, rfl⟩ : ∃ k, m = k + 1 := ⟨m - 1, by omega⟩
  rw [Finset.sum_range_succ']
  simp
  ring

theorem card_lifts (D : D7) : ((SizeData₂.lifts D).card : ℝ) = (D.R.m : ℝ) := by
  first
  | rfl
  | (simp [SizeData₂.lifts]; done)

theorem base_map_mem_local_lattice {D : D7} (T : TwForms D) (u : D.what₂.Word) (μ : D.what₂.Tup) (w : D.what₂.places.Pl)
    (x : ((D.fm u).lat 0).V) (hx : x ∈ locW D.what₂.places w ((D.fm u).lat 0).L) :
    T.e0 u μ x ∈ locW D.what₂.places w ((T.fm u μ).lat 0).L := by
  unfold BasicNotions.locW at hx
  induction hx using Submodule.span_induction with
  | mem x hx => exact Submodule.subset_span ((T.twist_preserves_base_lattice u μ x).1 hx)
  | zero => rw [map_zero]; exact Submodule.zero_mem _
  | add a b _ _ ha hb => rw [map_add (f := _)]; exact Submodule.add_mem _ ha hb
  | smul r a _ ha =>
    rw [Subring.smul_def, map_smul, ← Subring.smul_def]
    exact Submodule.smul_mem _ r ha

theorem remaining_primes_of_admitted {D : D7} {Dx : DivX D} {T : TwForms D} {sp : ℝ} (hI : IsotypicPartsInternalDirectSum D Dx T sp) (hD : DGamDef D) :
    ∀ u (w : D.what₂.places.Pl), D.what₂.places.resChar w ≠ (D.mem u).A.T →
      D.what₂.places.resChar w ≠ D.host.d → D.what₂.places.resChar w ∉ ({D.host.g 0, D.host.g 1} : Finset ℕ) →
      ∀ μ, DV.Used D μ → D.what₂.places.resChar w ∉ Dx.Qp μ → ∀ x ∈ LT.Sram D u w,
        ColGe T u μ w x (-(((SizeData₂.lifts D).card : ℝ) - sp) * vDG D u w) := by
  intro u w hw hd hg μ hUs hμ x hx
  have hx0 : x ∈ locW D.what₂.places w ((D.fm u).lat 0).L := hx.1
  have hm : 1 ≤ D.R.m := le_trans (by norm_num) D.R.two_le_m
  rw [card_lifts, ← sum_bounds D.R.m hm sp (vDG D u w)]
  refine ⟨fun _ => ?_, fun hne => ?_⟩
  · exact chain_ge (D.fm u) w _ D.R.m (fun i hi => (hI hD u w hd hg hw i hi).1) x hx0 D.R.m le_rfl
  · obtain ⟨y, hy, hv⟩ := chain_ge (T.fm u μ) w _ D.R.m (fun i hi => (hI hD u w hd hg hw i hi).2 μ hUs hne hμ)
      (T.e0 u μ x) (base_map_mem_local_lattice T u μ w x hx0) D.R.m le_rfl
    refine ⟨y, ?_, hv⟩
    rw [hy, T.embed_mul_block_embedding]
    rfl

end Formalism.MainNotions.WeilJacquetShalikaLaw.Proof

end
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.RemainingPrimesOfAdmitted =====

-- ===== clump member: Formalism.SharpRestriction.GrowthBounds.JointsTw =====
-- clump-header: {"m": "Formalism.SharpRestriction.GrowthBounds.JointsTw", "h": "module\n\npublic import Formalism.SharpRestriction.GrowthBounds.WeilJacquetShalikaLaw\npublic import Formalism.SharpRestriction.GrowthBounds.Joints\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section
open Formalism.BasicNotions Formalism.MainNotions.G

namespace Formalism.MainNotions.G.Joints

def SysUAt (D : D7) (L : SizeData₂ D) (X : Inst D L) (Y : LatInst D) (u : D.what₂.Word) (w : D.what₂.places.Pl)
    (hg : GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)) (low : ℝ) : Prop :=
  ∃ (_ : Fact (D.what₂.places.resChar w).Prime) (std : _) (vp : _) (unif : _) (eO : _) (eO_spec : _) (dG : _)
    (dG_spec : _) (om : _) (Y5 : Formalism.MainNotions.FormalGroupSystem.Pend (Formalism.MainNotions.FormalGroupSystem.Sys.mk (D.gat u w hg) (Y.Fl u w hg) (Y.Lv u w hg)
      (Y.Ch u w hg) std vp unif eO eO_spec dG dG_spec om)),
    Formalism.MainNotions.FormalGroupSystem.VolumeRatio₂ D _ Y5 ∧ Formalism.MainNotions.FormalGroupSystem.adm11 D _ Y5 ∧ Formalism.MainNotions.FormalGroupSystem.LowTermBound D _ Y5 ∧
    Function.Injective (algebraMap (D.gat u w hg).O (D.gat u w hg).Kf) ∧
    ∃ Fn : Fin (D.gat u w hg).P.nV → ℕ → ℝ,
      (∀ v, v ∉ (reps X (D.what₂.places.resChar w)).image (Y.vOf u w hg) → ∀ j < D.R.m, Y5.LowAt j v (Fn v (j + 1))) ∧
      low ≤ (∑ j ∈ Finset.Icc 1 D.R.m, ∑ v ∈ Finset.univ \ (reps X (D.what₂.places.resChar w)).image (Y.vOf u w hg),
        Fn v j) - ∑ j ∈ Finset.range D.R.m, (dG j : ℝ)


open Classical in
theorem UAt_of (D : D7) (L : SizeData₂ D) (X : Inst D L) (Y : LatInst D) (K : Consts) (low : ℝ)
    (hT : GatTies D) (hLT : LatTied hT X Y) (u : D.what₂.Word) (w : D.what₂.places.Pl)
    (hg : GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)) (hPuw : SysUAt D L X Y u w hg low)
    (hNum : Formalism.MainNotions.FormalGroupSystem.SmallResidueCharComparison D L X Y K)
    (hLarge : ∀ (w : D.what₂.places.Pl), Real.logb (D.what₂.places.resChar w) (2 * L.sc.a) < 1 →
      ∀ t0 ∈ reps X (D.what₂.places.resChar w), ∀ j ∈ SizeData₂.lifts D,
        gU X K (aL L) (bL L) (D.what₂.places.resChar w) j t0 - Pr X K (bL L) (D.what₂.places.resChar w) j t0 ≤ 0 ∧
        g0 X K (aL L) (bL L) (D.what₂.places.resChar w) j t0 ≤ 0) :
    Formalism.MainNotions.WeilJacquetShalikaLaw.UAt X Y K low u w hg := by
  intro VVs VV' hVVs hVV' F hF
  set p := D.what₂.places.resChar w with hpdef
  obtain ⟨hFact, std, vp, unif, eO, eO_spec, dG, dG_spec, om, Y5, hU2, h11, h5D, hinjK, Fn, hFn, hdiv⟩ := hPuw
  obtain ⟨hmm, -, -, -, hinj, -⟩ := hLT u w hg
  set vOf := Y.vOf u w hg with hvOf
  have hVVr : VV' ⊆ reps X p := hVV'.trans hVVs
  set A : Prop := 1 ≤ Real.logb p (2 * L.sc.a) with hA
  let Gn : Fin (D.gat u w hg).P.nV → ℕ → ℝ := fun v j =>
    if h : ∃ t0 ∈ VV', vOf t0 = v then
      (if A then gU X K (aL L) (bL L) p j (Classical.choose h) else min (Formalism.MainNotions.FormalGroupSystem.gB p (Y.Fl u w hg).t ((Y.Fl u w hg).TT v) ((D.gat u w hg).P.lam0 v) ((Y.Fl u w hg).w v) j) (Formalism.MainNotions.FormalGroupSystem.Pr (Y.Fl u w hg).t (D.gat u w hg).P.r ((D.gat u w hg).P.lam0 v) ((Y.Fl u w hg).w v) j)) else 0
  let PRn : Fin (D.gat u w hg).P.nV → ℕ → ℝ := fun v j =>
    if h : ∃ t0 ∈ VV', vOf t0 = v then (if A then Pr X K (bL L) p j (Classical.choose h) else Formalism.MainNotions.FormalGroupSystem.Pr (Y.Fl u w hg).t (D.gat u w hg).P.r ((D.gat u w hg).P.lam0 v) ((Y.Fl u w hg).w v) j) else 0
  let G0n : Fin (D.gat u w hg).P.nV → ℕ → ℝ := fun v j =>
    if h : ∃ t0 ∈ reps X p, vOf t0 = v then
      (if A then max (g0 X K (aL L) (bL L) p j (Classical.choose h)) 0 else 0) else Fn v j
  let S : Fin (D.gat u w hg).P.nV → ℝ := fun v => ∑ j ∈ Finset.Icc 1 (Y.Fl u w hg).mm, max (Gn v j - PRn v j - G0n v j) 0
  let BB := VV'.image vOf
  have chV : ∀ t0 ∈ VV', ∀ h : ∃ t1 ∈ VV', vOf t1 = vOf t0, Classical.choose h = t0 := by
    intro t0 ht0 h
    obtain ⟨h1, h2⟩ := Classical.choose_spec h
    exact hinj (hVVr h1) (hVVr ht0) h2
  have chR : ∀ t0 ∈ reps X p, ∀ h : ∃ t1 ∈ reps X p, vOf t1 = vOf t0, Classical.choose h = t0 := by
    intro t0 ht0 h
    obtain ⟨h1, h2⟩ := Classical.choose_spec h
    exact hinj h1 ht0 h2
  have hlift : ∀ j, j ∈ SizeData₂.lifts D ↔ j ∈ Finset.Icc 1 (Y.Fl u w hg).mm := by
    intro j; rw [hmm]; rfl

  have hI : ∀ t0 ∈ VV', ∀ j ∈ SizeData₂.lifts D,
      max (gU X K (aL L) (bL L) p j t0 - Pr X K (bL L) p j t0) (max (g0 X K (aL L) (bL L) p j t0) 0) ≤
        max (Gn (vOf t0) j - PRn (vOf t0) j) (G0n (vOf t0) j) := by
    intro t0 ht0 j hj
    have h : ∃ t1 ∈ VV', vOf t1 = vOf t0 := ⟨t0, ht0, rfl⟩
    have h' : ∃ t1 ∈ reps X p, vOf t1 = vOf t0 := ⟨t0, hVVr ht0, rfl⟩
    simp only [Gn, PRn, G0n, dif_pos h, dif_pos h', chV t0 ht0 h, chR t0 (hVVr ht0) h']
    by_cases hAA : A
    · simp only [if_pos hAA]; exact le_rfl
    · simp only [if_neg hAA]
      obtain ⟨h1, h2⟩ := hLarge w (lt_of_not_ge hAA) t0 (hVVr ht0) j hj
      have : max (g0 X K (aL L) (bL L) p j t0) 0 = 0 := max_eq_right h2
      rw [this]
      exact le_trans (max_le h1 le_rfl) (le_max_right _ _)
  have hII : ∀ t0 ∈ reps X p, ∀ j ∈ SizeData₂.lifts D, max (g0 X K (aL L) (bL L) p j t0) 0 ≤ G0n (vOf t0) j := by
    intro t0 ht0 j hj
    have h' : ∃ t1 ∈ reps X p, vOf t1 = vOf t0 := ⟨t0, ht0, rfl⟩
    simp only [G0n, dif_pos h', chR t0 ht0 h']
    by_cases hAA : A
    · simp only [if_pos hAA]; exact le_rfl
    · simp only [if_neg hAA]; exact (max_eq_right (hLarge w (lt_of_not_ge hAA) t0 ht0 j hj).2).le

  have c1 : ∀ v ∈ BB, ∀ j ∈ Finset.Icc 1 (Y.Fl u w hg).mm, Gn v j ≤ Formalism.MainNotions.FormalGroupSystem.gB p (Y.Fl u w hg).t ((Y.Fl u w hg).TT v) ((D.gat u w hg).P.lam0 v) ((Y.Fl u w hg).w v) j := by
    intro v hv j hj
    obtain ⟨t0, ht0, rfl⟩ := Finset.mem_image.1 hv
    have h : ∃ t1 ∈ VV', vOf t1 = vOf t0 := ⟨t0, ht0, rfl⟩
    simp only [Gn, dif_pos h, chV t0 ht0 h]
    by_cases hAA : A
    · simp only [if_pos hAA]; exact (hNum hT hLT u w hg hAA t0 (hVVr ht0) j ((hlift j).2 hj)).1
    · simp only [if_neg hAA]; exact min_le_left _ _
  have c2 : ∀ v, ∀ j < (Y.Fl u w hg).mm, Y5.LowAt j v (G0n v (j + 1)) := by
    intro v j hj
    by_cases h : ∃ t0 ∈ reps X p, vOf t0 = v
    · obtain ⟨t0, ht0, rfl⟩ := h
      refine Formalism.MainNotions.FormalGroupSystem.lowAt_max D _ Y5 hU2 h11 (vOf t0) j hj _ ?_
      have h' : ∃ t1 ∈ reps X p, vOf t1 = vOf t0 := ⟨t0, ht0, rfl⟩
      simp only [G0n, dif_pos h', chR t0 ht0 h']
      by_cases hAA : A
      · simp only [if_pos hAA]
        exact max_le_max ((hNum hT hLT u w hg hAA t0 ht0 (j + 1)
          ((hlift (j + 1)).2 (Finset.mem_Icc.2 ⟨by omega, by omega⟩))).2.1) le_rfl
      · simp only [if_neg hAA]; exact le_max_right _ _
    · simp only [G0n, dif_neg h]
      refine hFn v (fun hv => h ?_) j (by rw [← hmm]; exact hj)
      obtain ⟨t0, ht0, h0⟩ := Finset.mem_image.1 hv
      exact ⟨t0, ht0, h0⟩
  have c3 : ∀ v ∈ BB, ∀ j ∈ Finset.Icc 1 (Y.Fl u w hg).mm, Formalism.MainNotions.FormalGroupSystem.Pr (Y.Fl u w hg).t (D.gat u w hg).P.r ((D.gat u w hg).P.lam0 v) ((Y.Fl u w hg).w v) j ≤ PRn v j := by
    intro v hv j hj
    obtain ⟨t0, ht0, rfl⟩ := Finset.mem_image.1 hv
    have h : ∃ t1 ∈ VV', vOf t1 = vOf t0 := ⟨t0, ht0, rfl⟩
    simp only [PRn, dif_pos h, chV t0 ht0 h]
    by_cases hAA : A
    · simp only [if_pos hAA]; exact (hNum hT hLT u w hg hAA t0 (hVVr ht0) j ((hlift j).2 hj)).2.2
    · simp only [if_neg hAA]; exact le_rfl
  have hnodup : (VV'.toList.map vOf).Nodup :=
    List.Nodup.map_on (fun a ha b hb hab => hinj (hVVr (Finset.mem_toList.1 ha)) (hVVr (Finset.mem_toList.1 hb)) hab)
      (Finset.nodup_toList VV')
  have hmem : yProd Y u w hg VV' F ∈ (Formalism.MainNotions.FormalGroupSystem.Sys.mk (D.gat u w hg) (Y.Fl u w hg) (Y.Lv u w hg) (Y.Ch u w hg) std vp unif eO eO_spec dG
      dG_spec om).Iprod S BB := by
    apply Submodule.subset_span
    have heq : yProd Y u w hg VV' F =
        (VV'.toList.map vOf).foldr (fun v F' => ((D.gat u w hg).yv v)^[(Y.Fl u w hg).mm] F') F := by
      unfold yProd
      rw [foldr_map_comp, foldr_map', hmm]
    refine ⟨BB, subset_refl _, VV'.toList.map vOf, hnodup, by ext; simp [BB], F, ?_, heq⟩
    rw [Finset.sdiff_self, Finset.sum_empty, zpow_zero]
    exact ⟨F, hF, one_smul (D.gat u w hg).Kf F⟩
  have hv := h5D Gn G0n PRn S BB c1 c2 c3 (fun v _ => le_rfl) _ hmem
  have hv2 : (Y.Ch u w hg).chainK (Y.Fl u w hg).mm (yProd Y u w hg VV' F) ∈
      scale ((algebraMap (D.gat u w hg).O (D.gat u w hg).Kf vp) ^
        ⌈(∑ j ∈ Finset.Icc 1 (Y.Fl u w hg).mm, (∑ v ∈ BB, max (Gn v j - PRn v j) (G0n v j) +
            ∑ v ∈ Finset.univ \ BB, G0n v j) - ∑ j ∈ Finset.range (Y.Fl u w hg).mm, (dG j : ℝ)) * (eO : ℝ)⌉)
        ((Y.Lv u w hg).Int (Y.Fl u w hg).mm) := hv
  rw [hmm] at hv2

  have hj : ∀ j ∈ SizeData₂.lifts D, (∑ t0 ∈ VV', max (gU X K (aL L) (bL L) p j t0 - Pr X K (bL L) p j t0)
        (max (g0 X K (aL L) (bL L) p j t0) 0)) + (∑ t0 ∈ VVs \ VV', max (g0 X K (aL L) (bL L) p j t0) 0) +
        ∑ t0 ∈ reps X p \ VVs, max (g0 X K (aL L) (bL L) p j t0) 0 + ∑ v ∈ Finset.univ \ (reps X p).image vOf, Fn v j ≤
      ∑ v ∈ BB, max (Gn v j - PRn v j) (G0n v j) + ∑ v ∈ Finset.univ \ BB, G0n v j := by
    intro j hjl
    have e1 : ∑ t0 ∈ VV', max (gU X K (aL L) (bL L) p j t0 - Pr X K (bL L) p j t0) (max (g0 X K (aL L) (bL L) p j t0) 0) ≤
        ∑ v ∈ BB, max (Gn v j - PRn v j) (G0n v j) := by
      rw [Finset.sum_image (fun a ha b hb hab => hinj (hVVr ha) (hVVr hb) hab)]
      exact Finset.sum_le_sum fun t0 ht0 => hI t0 ht0 j hjl
    have hunion : (VVs \ VV') ∪ (reps X p \ VVs) = reps X p \ VV' := by
      ext t; simp only [Finset.mem_union, Finset.mem_sdiff]
      constructor
      · rintro (⟨h1, h2⟩ | ⟨h1, h2⟩)
        · exact ⟨hVVs h1, h2⟩
        · exact ⟨h1, fun h => h2 (hVV' h)⟩
      · rintro ⟨h1, h2⟩
        by_cases h : t ∈ VVs
        · exact Or.inl ⟨h, h2⟩
        · exact Or.inr ⟨h1, h⟩
    have hdisj : Disjoint (VVs \ VV') (reps X p \ VVs) := by
      rw [Finset.disjoint_left]
      intro t h1 h2
      exact (Finset.mem_sdiff.1 h2).2 (Finset.mem_sdiff.1 h1).1
    have e2 : (∑ t0 ∈ VVs \ VV', max (g0 X K (aL L) (bL L) p j t0) 0) +
        ∑ t0 ∈ reps X p \ VVs, max (g0 X K (aL L) (bL L) p j t0) 0 =
        ∑ t0 ∈ reps X p \ VV', max (g0 X K (aL L) (bL L) p j t0) 0 := by
      rw [← Finset.sum_union hdisj, hunion]
    have hinjR : Set.InjOn vOf ↑(reps X p \ VV') :=
      fun a ha b hb hab => hinj (Finset.mem_sdiff.1 ha).1 (Finset.mem_sdiff.1 hb).1 hab
    have e3 : ∑ t0 ∈ reps X p \ VV', max (g0 X K (aL L) (bL L) p j t0) 0 +
        ∑ v ∈ Finset.univ \ (reps X p).image vOf, Fn v j ≤ ∑ v ∈ Finset.univ \ BB, G0n v j := by
      have h1 : ∑ t0 ∈ reps X p \ VV', max (g0 X K (aL L) (bL L) p j t0) 0 ≤
          ∑ v ∈ (reps X p \ VV').image vOf, G0n v j := by
        rw [Finset.sum_image hinjR]
        exact Finset.sum_le_sum fun t0 ht0 => hII t0 (Finset.mem_sdiff.1 ht0).1 j hjl
      have h2 : ∑ v ∈ Finset.univ \ (reps X p).image vOf, Fn v j =
          ∑ v ∈ Finset.univ \ (reps X p).image vOf, G0n v j := by
        refine Finset.sum_congr rfl fun v hv => ?_
        have hn : ¬ ∃ t0 ∈ reps X p, vOf t0 = v := fun ⟨t0, ht0, h0⟩ =>
          (Finset.mem_sdiff.1 hv).2 (Finset.mem_image.2 ⟨t0, ht0, h0⟩)
        simp only [G0n, dif_neg hn]
      have hsplit : Finset.univ \ BB = ((reps X p \ VV').image vOf) ∪ (Finset.univ \ (reps X p).image vOf) := by
        ext v
        simp only [Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_union, Finset.mem_image, BB]
        constructor
        · intro hv
          by_cases h : ∃ t0 ∈ reps X p, vOf t0 = v
          · obtain ⟨t0, ht0, rfl⟩ := h
            exact Or.inl ⟨t0, ⟨ht0, fun h' => hv ⟨t0, h', rfl⟩⟩, rfl⟩
          · exact Or.inr h
        · rintro (⟨t0, ⟨ht0, hn⟩, rfl⟩ | h)
          · rintro ⟨t1, ht1, h1⟩
            exact hn (hinj (hVVr ht1) ht0 h1 ▸ ht1)
          · rintro ⟨t1, ht1, rfl⟩
            exact h ⟨t1, hVVr ht1, rfl⟩
      have hdisj2 : Disjoint ((reps X p \ VV').image vOf) (Finset.univ \ (reps X p).image vOf) := by
        rw [Finset.disjoint_left]
        intro v h1 h2
        obtain ⟨t0, ht0, rfl⟩ := Finset.mem_image.1 h1
        exact (Finset.mem_sdiff.1 h2).2 (Finset.mem_image.2 ⟨t0, (Finset.mem_sdiff.1 ht0).1, rfl⟩)
      rw [hsplit, Finset.sum_union hdisj2, h2]
      linarith
    linarith
  have hTB : (∑ j ∈ SizeData₂.lifts D, ((∑ t0 ∈ VV', max (gU X K (aL L) (bL L) p j t0 - Pr X K (bL L) p j t0)
        (max (g0 X K (aL L) (bL L) p j t0) 0)) + (∑ t0 ∈ VVs \ VV', max (g0 X K (aL L) (bL L) p j t0) 0) +
        ∑ t0 ∈ reps X p \ VVs, max (g0 X K (aL L) (bL L) p j t0) 0)) + low ≤
      (∑ j ∈ Finset.Icc 1 D.R.m, (∑ v ∈ BB, max (Gn v j - PRn v j) (G0n v j) + ∑ v ∈ Finset.univ \ BB, G0n v j)) -
        ∑ j ∈ Finset.range D.R.m, (dG j : ℝ) := by
    have h1 := Finset.sum_le_sum hj
    have h2 : low ≤ (∑ j ∈ Finset.Icc 1 D.R.m, ∑ v ∈ Finset.univ \ (reps X p).image vOf, Fn v j) -
        ∑ j ∈ Finset.range D.R.m, (dG j : ℝ) := hdiv
    unfold SizeData₂.lifts at h1
    unfold SizeData₂.lifts
    rw [Finset.sum_add_distrib] at h1
    linarith
  have hvp0 : algebraMap (D.gat u w hg).O (D.gat u w hg).Kf vp ≠ 0 :=
    (map_ne_zero_iff _ hinjK).mpr unif.ne_zero
  refine ⟨vp, unif, scale_pow_mono vp hvp0 _ (Int.ceil_mono ?_) hv2⟩
  rw [← eO_eq_vUnit (D.gat u w hg) vp unif eO eO_spec]
  exact mul_le_mul_of_nonneg_right hTB (Nat.cast_nonneg _)

theorem unit_bound_of_local_system (D : D7) (L : SizeData₂ D) (X : Inst D L) (Y : LatInst D) (K : Consts) (Dx : DivX D)
    (W : Formalism.MainNotions.WeilJacquetShalikaLaw.TwLoc D Y) (lev : LevelData D) (Xe : ErrX D) (ce : ErrC) (sp : ℝ)
    (hP : Formalism.BasicNotions.ErrDefs D L Xe lev K ce → ∀ μ, Formalism.BasicNotions.DV.Used D μ → ∀ (hT : GatTies D), LatTied hT X (W.Yt μ) →
      ∀ (u : D.what₂.Word) (w : D.what₂.places.Pl) (hg : GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)),
      D.what₂.places.resChar w ∉ Dx.Qp μ →
      SysUAt D L X (W.Yt μ) u w hg (Formalism.MainNotions.WeilJacquetShalikaLaw.lowS L Xe K ce sp u w))
    (hNum : Formalism.MainNotions.FormalGroupSystem.SmallResidueCharComparison D L X Y K)
    (hLarge : ∀ (w : D.what₂.places.Pl), Real.logb (D.what₂.places.resChar w) (2 * L.sc.a) < 1 →
      ∀ t0 ∈ reps X (D.what₂.places.resChar w), ∀ j ∈ SizeData₂.lifts D,
        gU X K (aL L) (bL L) (D.what₂.places.resChar w) j t0 - Pr X K (bL L) (D.what₂.places.resChar w) j t0 ≤ 0 ∧
        g0 X K (aL L) (bL L) (D.what₂.places.resChar w) j t0 ≤ 0) :
    Formalism.MainNotions.WeilJacquetShalikaLaw.unitBoundAtTwistedPlaces D L X Y K Dx W lev Xe ce sp := by
  intro hE μ hUs hT hLT u w hg hq
  exact UAt_of D L X (W.Yt μ) K _ hT hLT u w hg (hP hE μ hUs hT hLT u w hg hq) hNum hLarge


open Classical in
theorem unit_bound_of_sum_over_primes (D : D7) (L : SizeData₂ D) (X : Inst D L) (Y : LatInst D) (K : Consts) (Dx : DivX D)
    (W : Formalism.MainNotions.WeilJacquetShalikaLaw.TwLoc D Y) (lev : LevelData D) (Xe : ErrX D) (ce : ErrC) (sp : ℝ) (hS : Formalism.MainNotions.FormalGroupSystem.Stmt D)
    (h5 : Formalism.BasicNotions.ErrDefs D L Xe lev K ce → ∀ μ, Formalism.BasicNotions.DV.Used D μ → ∀ (hT : GatTies D), LatTied hT X (W.Yt μ) →
      ∀ (u : D.what₂.Word) (w : D.what₂.places.Pl) (hg : GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)),
      D.what₂.places.resChar w ∉ Dx.Qp μ →
      ∃ (_ : Fact (D.what₂.places.resChar w).Prime) (std : _) (vp : _) (unif : _) (eO : _) (eO_spec : _) (dG : _)
        (dG_spec : _) (om : _) (Y5 : Formalism.MainNotions.FormalGroupSystem.Pend (Formalism.MainNotions.FormalGroupSystem.Sys.mk (D.gat u w hg) ((W.Yt μ).Fl u w hg)
          ((W.Yt μ).Lv u w hg) ((W.Yt μ).Ch u w hg) std vp unif eO eO_spec dG dG_spec om)),
        Formalism.MainNotions.FormalGroupSystem.admitted D _ Y5 ∧
        ∃ Fn : Fin (D.gat u w hg).P.nV → ℕ → ℝ,
          (∀ v, v ∉ (reps X (D.what₂.places.resChar w)).image ((W.Yt μ).vOf u w hg) → ∀ j < D.R.m,
            Y5.LowAt j v (Fn v (j + 1))) ∧
          Formalism.MainNotions.WeilJacquetShalikaLaw.lowS L Xe K ce sp u w ≤ (∑ j ∈ Finset.Icc 1 D.R.m,
            ∑ v ∈ Finset.univ \ (reps X (D.what₂.places.resChar w)).image ((W.Yt μ).vOf u w hg), Fn v j) -
              ∑ j ∈ Finset.range D.R.m, (dG j : ℝ))
    (hNum : Formalism.MainNotions.FormalGroupSystem.SmallResidueCharComparison D L X Y K)
    (hLarge : ∀ (w : D.what₂.places.Pl), Real.logb (D.what₂.places.resChar w) (2 * L.sc.a) < 1 →
      ∀ t0 ∈ reps X (D.what₂.places.resChar w), ∀ j ∈ SizeData₂.lifts D,
        gU X K (aL L) (bL L) (D.what₂.places.resChar w) j t0 - Pr X K (bL L) (D.what₂.places.resChar w) j t0 ≤ 0 ∧
        g0 X K (aL L) (bL L) (D.what₂.places.resChar w) j t0 ≤ 0) :
    Formalism.MainNotions.WeilJacquetShalikaLaw.unitBoundAtTwistedPlaces D L X Y K Dx W lev Xe ce sp := by
  refine unit_bound_of_local_system D L X Y K Dx W lev Xe ce sp (fun hE μ hUs hT hLT u w hg hq => ?_) hNum hLarge
  obtain ⟨hF, std, vp, unif, eO, eO_spec, dG, dG_spec, om, Y5, hA, Fn, h1, h2⟩ := h5 hE μ hUs hT hLT u w hg hq
  have hP := hS.1 _ _ Y5 hA
  have hfr : IsFractionRing (D.gat u w hg).O (D.gat u w hg).Kf :=
    ((D.gat u w hg).P.setting (Y.vOf u w hg 0)).frac_O
  exact ⟨hF, std, vp, unif, eO, eO_spec, dG, dG_spec, om, Y5, hP.2.2.2.2.2.1, hA.2.2.2.2.2.2.2.2.2.2.2.2,
    hP.2.2.2.2.2.2.2.2.2.2, IsFractionRing.injective _ _, Fn, h1, h2⟩

end Formalism.MainNotions.G.Joints
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.GrowthBounds.JointsTw =====

-- ===== clump member: Formalism.SharpRestriction.GrowthBounds.MultisetValuation.StmtNumFEx =====
-- clump-header: {"m": "Formalism.SharpRestriction.GrowthBounds.MultisetValuation.StmtNumFEx", "h": "module\n\npublic import Formalism.SharpRestriction.GrowthBounds.FormalGroupSystem\npublic import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.NdBNonneg\npublic import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.PriceLinearCombinationLe\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace Formalism.MainNotions.FormalGroupSystem.Pf

theorem stmtNumE : Formalism.MainNotions.FormalGroupSystem.NumericalComparisonUniform := numericalComparisonUniform_of_size nd_size

end Formalism.MainNotions.FormalGroupSystem.Pf
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.GrowthBounds.MultisetValuation.StmtNumFEx =====

-- ===== clump member: Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses =====
-- clump-header: {"m": "Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses", "h": "module\n\npublic import Formalism.LocalRingCardinality.CoeNeZeroOfNotMem\npublic import Formalism.SharpRestriction.Divisibility.OrbitPlaces\npublic import Formalism.SharpRestriction.ParamsHeightRankConstant\npublic import Formalism.SharpRestriction.AdmissibleParameterJoins.DIVfromGLm\npublic import Formalism.SharpRestriction.AdmissibleParameterJoins.GandSab\npublic import Formalism.SharpRestriction.CuspSpanNormBounds.NonemptyParameterModels.SixteenLeMulOfStdOfHypOfHyp0\npublic import Formalism.SharpRestriction.CuspSpanNormBounds.StandingHypothesesHoldFamily\npublic import Formalism.SharpRestriction.Divisibility.ChainOperators.GenericFramesLetters\npublic import Formalism.SharpRestriction.Divisibility.ChainOperators.OrbitEntryBounds\npublic import Formalism.SharpRestriction.Divisibility.JetPolynomialLogs.LocalBoundElevenComparison\npublic import Formalism.SharpRestriction.Divisibility.LocalNonemptiness.OrbitAdmissibleOfSplitBound\npublic import Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.StatementsOfRemainingBound\npublic import Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.RemainingPrimesOfAdmitted\npublic import Formalism.SharpRestriction.GrowthBounds.AdmissibleIntegers.FirstTermSizeBound\npublic import Formalism.SharpRestriction.GrowthBounds.JointsTw\npublic import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.PrvAndKernelCommutationUpToUnitsOfRests\npublic import Formalism.SharpRestriction.GrowthBounds.MultisetValuation.StmtNumFEx\npublic import Formalism.SharpRestriction.GrowthBounds.PlaneCountTheoremWithConstants\nimport Formalism.SharpRestriction.GrowthBounds.TopChoiceBounds\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace Formalism.MainNotions.Pk

open Formalism.BasicNotions

section Re

open Formalism.MainNotions.G

def reY {D : D7} (Y : LatInst D)
    (LC : D.what₂.Tup → ∀ u (w : D.what₂.places.Pl) (hg : GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)),
      Σ Lv : Levels (Y.Fl u w hg), Chain Lv) : LatInst D where
  vOf := Y.vOf
  Fl := Y.Fl
  Lv := fun u w hg => (LC (D.what₂.muAt w) u w hg).1
  Ch := fun u w hg => (LC (D.what₂.muAt w) u w hg).2
  Vram := Y.Vram

def reW {D : D7} (Y : LatInst D) (LC : _) : WeilJacquetShalikaLaw.TwLoc D (reY Y LC) := ⟨LC, fun _ _ _ => rfl⟩

theorem conclusion1_re {D : D7} {L : SizeData₂ D} {X : Inst D L} {Y : LatInst D}
    {K : Consts} {c : LatCmp D} {Dx : DivX D} {T : TwForms D} {lev : LevelData D} {Xe : ErrX D} {ce : ErrC}
    (LC : _) (h : WeilJacquetShalikaLaw.Conclusion1 D L X (reY Y LC) K c Dx T lev Xe ce 1) :
    WeilJacquetShalikaLaw.Conclusion1 D L X Y K c Dx T lev Xe ce 1 := by
  unfold WeilJacquetShalikaLaw.Conclusion1 at h ⊢
  intro hT
  have hT' : WeilJacquetShalikaLaw.Ties9 D L X (reY Y LC) c := { hT with }
  exact h hT'

theorem num_re {D : D7} {L : SizeData₂ D} {X : Inst D L} {Y : LatInst D} {K : Consts} (LC : _)
    (h : FormalGroupSystem.SmallResidueCharComparison D L X Y K) : FormalGroupSystem.SmallResidueCharComparison D L X (reY Y LC) K := h

end Re


open Classical in
def SysTw (D : D7) (L : SizeData₂ D) (X : G.Inst D L) (K : G.Consts) (Dx : DivX D) {Y : G.LatInst D} (W : WeilJacquetShalikaLaw.TwLoc D Y)
    (lev : LevelData D) (Xe : ErrX D) (ce : ErrC) (sp : ℝ) : Prop :=
  ErrDefs D L Xe lev K ce → ∀ μ, DV.Used D μ → ∀ (hT : GatTies D), G.LatTied hT X (W.Yt μ) →
    ∀ (u : D.what₂.Word) (w : D.what₂.places.Pl) (hg : GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)),
    D.what₂.places.resChar w ∉ Dx.Qp μ →
    ∃ (_ : Fact (D.what₂.places.resChar w).Prime) (std : _) (vp : _) (unif : _) (eO : _) (eO_spec : _) (dG : _)
      (dG_spec : _) (om : _) (Y5 : FormalGroupSystem.Pend (FormalGroupSystem.Sys.mk (D.gat u w hg) ((W.Yt μ).Fl u w hg)
        ((W.Yt μ).Lv u w hg) ((W.Yt μ).Ch u w hg) std vp unif eO eO_spec dG dG_spec om)),
      FormalGroupSystem.admitted D _ Y5 ∧
      ∃ Fn : Fin (D.gat u w hg).P.nV → ℕ → ℝ,
        (∀ v, v ∉ (G.reps X (D.what₂.places.resChar w)).image ((W.Yt μ).vOf u w hg) → ∀ j < D.R.m,
          Y5.LowAt j v (Fn v (j + 1))) ∧
        WeilJacquetShalikaLaw.lowS L Xe K ce sp u w ≤ (∑ j ∈ Finset.Icc 1 D.R.m,
          ∑ v ∈ Finset.univ \ (G.reps X (D.what₂.places.resChar w)).image ((W.Yt μ).vOf u w hg), Fn v j) -
            ∑ j ∈ Finset.range D.R.m, (dG j : ℝ)

structure SumOverPrimesHypotheses (𝒞 : FamClass) : Prop where

  twU : Closed 𝒞 fun Fm _ => ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (hx : Fm.x1 < x) (i : Fm.Ix x),
    ∃ LC, WeilJacquetShalikaLaw.CmpV (Fm.ex x hx i).cmp (Fm.X x i) (Fm.ex x hx i).tw (reW (Fm.Gy x i) LC) ∧ SysTw (Fm.D x i) (Fm.L x i)
      (Fm.Gx x i) Fm.GK (Fm.X x i) (reW (Fm.Gy x i) LC) (Fm.ex x hx i).lev (Fm.ex x hx i).errX Fm.cX.err 1

  pdv : Closed 𝒞 fun Fm _ => ∃ x0 : ℝ, ∀ x ≥ x0, ∀ (hx : Fm.x1 < x) (i : Fm.Ix x),
    ∃ E : KerEnt (Fm.D x i) (Fm.X x i) (Fm.ex x hx i).tw,
      (E.UnUnit ∧ OrbitPlaces.KmapRat E ∧ OrbitPlaces.KFi (Fm.D x i) (Fm.ex x hx i).tw ∧ OrbitPlaces.Stab0 (Fm.D x i)) ∧
      ∃ (ep : _) (be : _) (sg : _),
        OrbitPlaces.EvenConditionsInert (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) (Fm.X x i) ∧
        OrbitPlaces.EvenConditionsAtC (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) (Fm.X x i) ∧
        OrbitPlaces.OrbitBoundWithoutOperator (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) (Fm.Gx x i) Fm.GK ∧
        OrbitPlaces.JetIntegralityBis (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) (Fm.X x i) ∧
        OrbitPlaces.ThetaKernelShapeAtD (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) (Fm.X x i) ∧
        OrbitPlaces.Shape (Fm.D x i) (Fm.L x i) (Fm.Gx x i) (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg)

theorem typeG_ne_d {D : D7} {L : SizeData₂ D} (P : ParameterChoice' D L) (k : Fin 2) : D.host.g k ≠ D.host.d := by
  have hs := P.level_split _ (D.host.g_level k)
  intro h
  rw [h] at hs
  simp only [Host.cls, primeClass] at hs
  split_ifs at hs

theorem three_le_split {eps : ℝ} (Fm : FamP eps) (h0 : 0 < eps) {x : ℝ} (hx : (3 : ℝ) ^ (5 / Fm.ez) ≤ x) (h1 : Fm.x1 < x)
    (i : Fm.Ix x) : 3 ≤ (Fm.D x i).host.splitBound := by
  have hez : 0 < Fm.ez := by rw [← Fm.L_ez x i]; exact (Fm.L x i).sc.ez_pos
  have hL := (Fm.L x i).split_tie
  rw [Fm.L_x x i h1, Fm.L_ez x i] at hL
  refine le_trans (Nat.le_floor ?_) hL
  have he : 5 / Fm.ez * (Fm.ez / 5) = 1 := by field_simp
  calc ((3 : ℕ) : ℝ) = ((3 : ℝ) ^ (5 / Fm.ez)) ^ (Fm.ez / 5) := by
        rw [← Real.rpow_mul (by norm_num), he, Real.rpow_one]; norm_num
    _ ≤ x ^ (Fm.ez / 5) := Real.rpow_le_rpow (by positivity) hx (by positivity)

open WeilJacquetShalikaLaw.Proof in
theorem sum_over_primes_service (𝒞 : FamClass) (h : SumOverPrimesHypotheses 𝒞) :
    Closed 𝒞 fun Fm _ => WeilJacquetShalikaLaw.ServF Fm := by
  have h01 : OrbitPlaces.OrbitLetterBoundsAll 11 1 := DIV.Bridge.DworkPowerSeriesWeights.split_bound_eleven_one
  refine (h.twU.and (h.pdv.and (G.num_closed 𝒞 FormalGroupSystem.Pf.stmtNumE))).imp
    fun Fm _ hpos ⟨⟨xb, hb⟩, ⟨xc, hc⟩, ⟨xn, hnum⟩⟩ => ?_
  have hpr1 : 1 ≤ Fm.GK.Pr1 := le_of_eq Fm.fixed.1.symm
  have hCL : OrbitPlaces.CLarge 11 1 Fm.GK Fm.cX.err :=
    OrbitPlaces.cLarge_of_fixed Fm.fixed.2.2.2.2.1 Fm.fixed.2.2.2.2.2.1 Fm.fixed.2.1 (by rw [Fm.fixed.2.2.1]; norm_num)
  refine ⟨max (max xb xc) (max ((3 : ℝ) ^ (5 / Fm.ez)) xn), fun x hx h1 i => ?_⟩
  simp only [max_le_iff] at hx
  obtain ⟨⟨eb, ec⟩, ef, en⟩ := hx
  obtain ⟨LC, hV, hSys⟩ := hb x eb h1 i
  have hU := G.Joints.unit_bound_of_sum_over_primes _ _ _ _ _ _ (reW (Fm.Gy x i) LC) _ _ _ 1 (FormalGroupSystem.Pf.stmt_proved _) hSys
    (num_re LC (hnum x en i))
    (G.TopChoiceBounds.hLarge_proved _ _ Fm.GK_nonneg hpr1 (Fm.params x h1 i))
  obtain ⟨E, ⟨hUn, hR, hKF, hS0⟩, ep, be, sg, b0, b0c, a', ei, sd, sh⟩ := hc x ec h1 i
  have gd : OrbitPlaces.TypePrimeNotDiscriminant (Fm.D x i) := fun k => typeG_ne_d (Fm.params x h1 i) k
  have o := DIV.Inh.orbit_admissible_of_split_bound (Fm.D x i) (three_le_split Fm hpos ef h1 i)
  have hW : OrbitPlaces.SB E := fun _ _ _ _ _ _ B hB => (DIV.Lemmas.theta_isometry_facts_hold (Fm.D x i) _ _ _ _ _ B).1 hB
  have hK : OrbitPlaces.KForm (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) (Fm.X x i) (Fm.ex x h1 i).tw 1 :=
    OrbitPlaces.kform_of_ker E _ (fun _ _ => rfl) rfl hW hUn hR hKF
      (Or.inr ⟨rfl, hS0⟩)
  have hA : OrbitPlaces.admitted (Fm.D x i) (Fm.L x i) (Fm.Gx x i) Fm.GK (Fm.X x i) (Fm.ex x h1 i).tw
      (OrbitPlaces.ofKer (nuRowOK (Fm.D x i)) E ep be sg) Fm.cX.err 1 11 1 :=
    ⟨hK, o, gd, b0, b0c, h01, a', ei, sd, sh, hCL⟩
  obtain ⟨n, c, d, it⟩ := J.four_orbit_conditions_of_proof (lev := (Fm.ex x h1 i).lev) (Xe := (Fm.ex x h1 i).errX)
    (OrbitPlaces.lift_bounds_of_essential hA (DIV.Lemmas.OrbitEntryBounds.orbit_entry_bounds_hold _ _ _ _ _ _ _ 11 1 h01 sd sh hCL))
  have hCol := first_clause_cases n c d (remaining_primes_of_admitted it)
  have hTuple := first_in_local_models (reW (Fm.Gy x i) LC) hU
  exact conclusion1_re LC (baseChange_preserves_unitary_of (reW (Fm.Gy x i) LC) hV hTuple n hCol)

end Formalism.MainNotions.Pk

end
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses =====
