module

import Mathlib
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.FeIsField
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.PieceGood
public import Mathlib.LinearAlgebra.Matrix.Rank
public import GroundTheory.Brauer.DoubleCentralizer
public import Mathlib.Algebra.BigOperators.Group.Finset.Defs
public import Mathlib.Data.Finset.Card
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiBelow
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransferAlt
public import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FrobeniusReciprocity.SupportedInIffOfFrob
public import Mathlib.Topology.Instances.Matrix
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbA
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbitBaseIdempotentRank
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Pieces
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.ExistsConj
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IsClosedRank
public import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FiberLocalization.EqZeroOfFiberEquivariant
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.DistrC
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.T2SpaceCentralizerGroup
public import Development.AbelianVarietyTheory.Definitions.Divisors.T2SpaceGeneralLinearGroup
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.FrobProof
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TwFin
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Normed.Algebra.GelfandRadius
import Mathlib.Analysis.SpecialFunctions.Bernstein
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Combinatorics.Enumerative.DyckWord
import Mathlib.Combinatorics.SimpleGraph.Triangle.Removal
import Mathlib.Data.NNRat.Floor
import Mathlib.Data.Nat.Choose.Multinomial
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
import Mathlib.Tactic.Lemma
import Mathlib.Tactic.Linter.Style
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
import Mathlib.RingTheory.Coalgebra.IsFrobenius
import Mathlib.RingTheory.Etale.Weakly
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.SimpleRing.Principal
import Mathlib.RingTheory.TotallySplit
import Mathlib.RingTheory.PiTensorProduct
import Mathlib.RingTheory.WittVector.IsPoly
import Mathlib.Tactic.ReduceModChar
import Mathlib.Algebra.Order.Star.Int
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat
import Mathlib.Tactic.TypeStar
import Mathlib.LinearAlgebra.Matrix.FiniteDimensional
import GroundTheory.AutomorphicForms.GLnLocal
import Mathlib.Tactic.Linter.HaveILetI
import Mathlib.Tactic.Polynomial.Basic
import Std.Tactic.BVDecide.Normalize.Prop
import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.NilpotentPowers.IsNilpotentPowSub

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PsiMulVec, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiRatio, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RankPosOfNe, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SqSumLe, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TefFinrank, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RatioOf, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RootsFinite, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransfer, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbB, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbClosed, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OneFormsMapOfFunctorMorphismSmul, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TransferOf, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.Transfer, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceGood

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PsiMulVec =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PsiMulVec", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.FeIsField\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Lemma\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

variable {k : Type} [Field k] {N : ℕ} {A : Subalgebra k (Matrix (Fin N) (Fin N) k)} {e : Matrix (Fin N) (Fin N) k}
  (hA : ∀ a ∈ A, ∀ b ∈ A, a * b = b * a) (he : e ∈ A)

instance Fe_tower : IsScalarTower k (Fe hA he) (Wd e) := ⟨fun _ _ _ => rfl⟩

def Psi : Module.End (Fe hA he) (Wd e) →ₗ[k] Matrix (Fin N) (Fin N) k where
  toFun φ := Th e (φ.restrictScalars k)
  map_add' f g := by rw [← map_add (f := _)]; rfl
  map_smul' c f := by rw [RingHom.id_apply, ← map_smul]; rfl

lemma Psi_mulVec (φ : Module.End (Fe hA he) (Wd e)) (v : Fin N → k) :
    Psi hA he φ *ᵥ v = (φ (Pe e v) : Fin N → k) := Th_mulVec (φ.restrictScalars k) v

lemma Psi_inj : Function.Injective (Psi hA he) := by
  intro f g h
  have := Th_inj h
  ext w : 1
  exact congrArg (fun F : Module.End k (Wd e) => F w) this

lemma Pe_smul (a : A) (v : Fin N → k) :
    Pe e (a.1 *ᵥ v) = (⟨rho hA he a, a, rfl⟩ : Fe hA he) • Pe e v := by
  apply Subtype.ext
  show e *ᵥ (a.1 *ᵥ v) = a.1 *ᵥ (e *ᵥ v)
  rw [Matrix.mulVec_mulVec, Matrix.mulVec_mulVec, hA _ a.2 _ he]

def phiOf (c : Matrix (Fin N) (Fin N) k) (hc : ∀ a ∈ A, a * c = c * a) : Module.End (Fe hA he) (Wd e) where
  toFun w := ⟨c *ᵥ (w : Fin N → k), W_stable (hc e he).symm w.2⟩
  map_add' w w' := by apply Subtype.ext; exact Matrix.mulVec_add c w.1 w'.1
  map_smul' := by
    rintro ⟨_, a, rfl⟩ w
    apply Subtype.ext
    show c *ᵥ (a.1 *ᵥ (w : Fin N → k)) = a.1 *ᵥ (c *ᵥ (w : Fin N → k))
    rw [Matrix.mulVec_mulVec, Matrix.mulVec_mulVec, hc _ a.2]

lemma range_Psi (hid : IsIdempotentElem e) :
    LinearMap.range (Psi hA he) =
      (Subalgebra.centralizer k (A : Set (Matrix (Fin N) (Fin N) k))).toSubmodule.map (LinearMap.mulLeft k e) := by
  ext m; constructor
  · rintro ⟨φ, rfl⟩
    refine ⟨Psi hA he φ, ?_, ?_⟩
    · rw [SetLike.mem_coe, Subalgebra.mem_toSubmodule, Subalgebra.mem_centralizer_iff]
      intro a ha
      apply mat_ext; intro v
      rw [← Matrix.mulVec_mulVec, ← Matrix.mulVec_mulVec, Psi_mulVec, Psi_mulVec,
        Pe_smul hA he ⟨a, ha⟩, map_smul]
      rfl
    · apply mat_ext; intro v
      simp only [LinearMap.mulLeft_apply]
      rw [← Matrix.mulVec_mulVec, Psi_mulVec]
      exact W_fix hid (φ (Pe e v)).2
  · rintro ⟨c, hc, rfl⟩
    rw [SetLike.mem_coe, Subalgebra.mem_toSubmodule, Subalgebra.mem_centralizer_iff] at hc
    refine ⟨phiOf hA he c hc, ?_⟩
    apply mat_ext; intro v
    rw [Psi_mulVec]
    show c *ᵥ (e *ᵥ v) = (e * c) *ᵥ v
    rw [Matrix.mulVec_mulVec, hc e he]

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PsiMulVec =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiRatio =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiRatio", "h": "module\n\nimport Mathlib\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.PieceGood\npublic import Mathlib.LinearAlgebra.Matrix.Rank\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PsiMulVec\npublic import GroundTheory.Brauer.DoubleCentralizer\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Etale.Weakly\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.TotallySplit\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.FeIsField\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}

theorem pi_ratio {A : Subalgebra k (Matrix (Fin N) (Fin N) k)} (hA : ∀ a ∈ A, ∀ b ∈ A, a * b = b * a)
    {e : Matrix (Fin N) (Fin N) k} (he : e ∈ A) (hid : IsIdempotentElem e) (hne : e ≠ 0)
    (hf : ∀ a ∈ A, e * a = 0 ∨ ∃ b ∈ A, e * a * b = e) :
    0 < Module.finrank k (A.toSubmodule.map (LinearMap.mulLeft k e)) ∧
      Module.finrank k (A.toSubmodule.map (LinearMap.mulLeft k e)) ∣ e.rank ∧
      Module.finrank k ((cenSub A).map (LinearMap.mulLeft k e)) =
        (e.rank / Module.finrank k (A.toSubmodule.map (LinearMap.mulLeft k e))) ^ 2 *
          Module.finrank k (A.toSubmodule.map (LinearMap.mulLeft k e)) := by
  classical
  let _ : Field (Fe hA he) := (Fe_isField hA he hne hf).toField
  have hFd : Module.finrank k (Fe hA he) = Module.finrank k (A.toSubmodule.map (LinearMap.mulLeft k e)) := by
    rw [← map_Th_Fe hA he, ← (Submodule.equivMapOfInjective (Th e) Th_inj _).finrank_eq,
      Subalgebra.finrank_toSubmodule]
  have hD : Module.finrank k ((cenSub A).map (LinearMap.mulLeft k e)) =
      Module.finrank k (Module.End (Fe hA he) (Wd e)) := by
    unfold cenSub
    rw [← range_Psi hA he hid, LinearMap.finrank_range_of_inj (Psi_inj hA he)]
  set_option synthInstance.maxHeartbeats 200000 in
  have h1 := GroundTheory.Brauer.finrank_mul_finrank_end k (Fe hA he) (Wd e)
  have h2 := Module.finrank_mul_finrank k (Fe hA he) (Wd e)
  have hr : e.rank = Module.finrank k (Wd e) := (Matrix.finrank_range_mulVecLin e).symm
  have hd0 : 0 < Module.finrank k (Fe hA he) := Module.finrank_pos
  rw [← hFd, hD, hr]
  set d := Module.finrank k (Fe hA he)
  set m := Module.finrank (Fe hA he) (Wd e)
  rw [← h2] at h1 ⊢
  refine ⟨hd0, dvd_mul_right _ _, ?_⟩
  rw [Nat.mul_div_cancel_left m hd0]
  apply Nat.eq_of_mul_eq_mul_left hd0
  rw [h1]; ring

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiRatio =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RankPosOfNe =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RankPosOfNe", "h": "module\n\npublic import Mathlib.LinearAlgebra.Matrix.Rank\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Etale.Weakly\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.PiTensorProduct\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.TotallySplit\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open Matrix

variable {k : Type} [Field k] {N : ℕ}

theorem rank_add_orth {a b : Matrix (Fin N) (Fin N) k} (ha : IsIdempotentElem a) (hb : IsIdempotentElem b)
    (hab : a * b = 0) (hba : b * a = 0) : (a + b).rank = a.rank + b.rank := by
  have hsup : LinearMap.range (a + b).mulVecLin = LinearMap.range a.mulVecLin ⊔ LinearMap.range b.mulVecLin := by
    apply le_antisymm
    · rintro _ ⟨v, rfl⟩
      simp only [Matrix.mulVecLin_apply, Matrix.add_mulVec]
      exact Submodule.add_mem_sup ⟨v, rfl⟩ ⟨v, rfl⟩
    · refine sup_le ?_ ?_
      · rintro _ ⟨v, rfl⟩
        refine ⟨a *ᵥ v, ?_⟩
        simp only [Matrix.mulVecLin_apply, Matrix.mulVec_mulVec, add_mul, ha.eq, hba, add_zero]
      · rintro _ ⟨v, rfl⟩
        refine ⟨b *ᵥ v, ?_⟩
        simp only [Matrix.mulVecLin_apply, Matrix.mulVec_mulVec, add_mul, hb.eq, hab, zero_add]
  have hinf : LinearMap.range a.mulVecLin ⊓ LinearMap.range b.mulVecLin = ⊥ := by
    rw [eq_bot_iff]
    rintro w ⟨⟨u, rfl⟩, ⟨v, hv⟩⟩
    simp only [Matrix.mulVecLin_apply] at hv ⊢
    have h1 : a *ᵥ (a *ᵥ u) = a *ᵥ u := by rw [Matrix.mulVec_mulVec, ha.eq]
    have h2 : a *ᵥ (b *ᵥ v) = 0 := by rw [Matrix.mulVec_mulVec, hab, Matrix.zero_mulVec]
    rw [← hv, h2] at h1
    rw [Submodule.mem_bot, ← hv, ← h1]
  have h := Submodule.finrank_sup_add_finrank_inf_eq (LinearMap.range a.mulVecLin) (LinearMap.range b.mulVecLin)
  rw [hinf, finrank_bot, add_zero, ← hsup] at h
  simpa only [Matrix.finrank_range_mulVecLin] using h

theorem idem_sum_orth {ι : Type} (s : Finset ι) (e : ι → Matrix (Fin N) (Fin N) k)
    (hid : ∀ i ∈ s, IsIdempotentElem (e i)) (ho : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → e i * e j = 0) :
    IsIdempotentElem (∑ i ∈ s, e i) := by
  unfold IsIdempotentElem
  rw [Finset.sum_mul_sum]
  refine Finset.sum_congr rfl fun i hi => ?_
  rw [Finset.sum_eq_single i (fun j hj hji => ho i hi j hj (Ne.symm hji)) (fun h => absurd hi h)]
  exact hid i hi

theorem rank_sum_orth {ι : Type} (s : Finset ι) (e : ι → Matrix (Fin N) (Fin N) k)
    (hid : ∀ i ∈ s, IsIdempotentElem (e i)) (ho : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → e i * e j = 0) :
    (∑ i ∈ s, e i).rank = ∑ i ∈ s, (e i).rank := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert i s hi ih =>
    have hid' : ∀ j ∈ s, IsIdempotentElem (e j) := fun j hj => hid j (Finset.mem_insert_of_mem hj)
    have ho' : ∀ j ∈ s, ∀ l ∈ s, j ≠ l → e j * e l = 0 := fun j hj l hl h =>
      ho j (Finset.mem_insert_of_mem hj) l (Finset.mem_insert_of_mem hl) h
    rw [Finset.sum_insert hi, Finset.sum_insert hi, ← ih hid' ho']
    refine rank_add_orth (hid i (Finset.mem_insert_self i s)) (idem_sum_orth s e hid' ho') ?_ ?_
    · rw [Finset.mul_sum]
      exact Finset.sum_eq_zero fun j hj => ho i (Finset.mem_insert_self i s) j (Finset.mem_insert_of_mem hj)
        (fun h => hi (h ▸ hj))
    · rw [Finset.sum_mul]
      exact Finset.sum_eq_zero fun j hj => ho j (Finset.mem_insert_of_mem hj) i (Finset.mem_insert_self i s)
        (fun h => hi (h ▸ hj))

theorem rank_pos_of_ne {e : Matrix (Fin N) (Fin N) k} (h : e ≠ 0) : 0 < e.rank := by
  rw [Nat.pos_iff_ne_zero]
  intro h0
  apply h
  rw [← Matrix.finrank_range_mulVecLin, Submodule.finrank_eq_zero, LinearMap.range_eq_bot] at h0
  have : Matrix.toLin' e = 0 := h0
  simpa using congrArg LinearMap.toMatrix' this

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RankPosOfNe =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SqSumLe =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SqSumLe", "h": "module\n\npublic import Mathlib.Algebra.BigOperators.Group.Finset.Defs\npublic import Mathlib.Data.Finset.Card\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Algebra.Order.Star.Int\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.TypeStar\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.Algebra.BigOperators.Group.Finset.Basic\npublic import Mathlib.Algebra.BigOperators.Ring.Finset\npublic import Mathlib.Algebra.Order.BigOperators.Group.Finset\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

theorem sq_sum_le {ι : Type*} [DecidableEq ι] (s : Finset ι) (m : ι → ℕ) : ∑ i ∈ s, m i ^ 2 ≤ (∑ i ∈ s, m i) ^ 2 := by
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih =>
    rw [Finset.sum_insert ha, Finset.sum_insert ha]
    nlinarith [ih, Nat.zero_le (m a * ∑ i ∈ s, m i)]

theorem sq_sum_lt {ι : Type*} [DecidableEq ι] (s : Finset ι) (m : ι → ℕ) (hm : ∀ i ∈ s, 1 ≤ m i) (h : 1 < s.card) :
    ∑ i ∈ s, m i ^ 2 < (∑ i ∈ s, m i) ^ 2 := by
  obtain ⟨a, ha⟩ := Finset.card_pos.mp (show 0 < s.card by omega)
  have hne : (s.erase a).Nonempty := by
    rw [← Finset.card_pos, Finset.card_erase_of_mem ha]; omega
  obtain ⟨b, hb⟩ := hne
  have hM : 1 ≤ ∑ i ∈ s.erase a, m i :=
    (hm b (Finset.mem_of_mem_erase hb)).trans (Finset.single_le_sum (fun _ _ => Nat.zero_le _) hb)
  have ih := sq_sum_le (s.erase a) m
  rw [← Finset.add_sum_erase s _ ha, ← Finset.add_sum_erase s _ ha]
  have := hm a ha
  nlinarith

theorem num_fib {ι : Type*} [DecidableEq ι] (s : Finset ι) (m dE : ι → ℕ) (n dF : ℕ) (hdF : 0 < dF)
    (hm : ∀ i ∈ s, 1 ≤ m i) (hd : ∀ i ∈ s, dF ≤ dE i) (hsum : n * dF = ∑ i ∈ s, m i * dE i) :
    ∑ i ∈ s, m i ^ 2 ≤ n ^ 2 ∧ (∑ i ∈ s, m i ^ 2 = n ^ 2 → s.Nonempty → ∀ i ∈ s, s = {i} ∧ dE i ≤ dF) := by
  have hMn : ∑ i ∈ s, m i ≤ n := by
    have : (∑ i ∈ s, m i) * dF ≤ n * dF := by
      rw [hsum, Finset.sum_mul]
      exact Finset.sum_le_sum fun i hi => Nat.mul_le_mul_left _ (hd i hi)
    exact Nat.le_of_mul_le_mul_right this hdF
  have h1 := sq_sum_le s m
  have h2 : (∑ i ∈ s, m i) ^ 2 ≤ n ^ 2 := Nat.pow_le_pow_left hMn 2
  refine ⟨h1.trans h2, fun heq hne i hi => ?_⟩
  have hcard : s.card = 1 := by
    by_contra hc
    have := sq_sum_lt s m hm (by have := hne.card_pos; omega)
    omega
  obtain ⟨a, rfl⟩ := Finset.card_eq_one.mp hcard
  rw [Finset.mem_singleton] at hi; subst hi
  refine ⟨rfl, ?_⟩
  simp only [Finset.sum_singleton] at heq hsum
  have hn : m i = n := by
    have := (Nat.pow_left_injective (by norm_num : (2 : ℕ) ≠ 0)) heq
    exact this
  rw [← hn] at hsum
  have := hm i (Finset.mem_singleton_self i)
  have : dF = dE i := Nat.eq_of_mul_eq_mul_left (by omega) hsum
  omega

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SqSumLe =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TefFinrank =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TefFinrank", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}

open PositivityTheory.RgUd.TP.Desc.Piece Module

section
variable {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {χ : k[X]} {q : ℕ} (D : SData Z χ q)
  {x : Matrix (Fin N) (Fin N) k} (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0)
  {e f : Matrix (Fin N) (Fin N) k} (he : e ∈ primIdem (Sx D x)) (hf : f ∈ primIdem Z) (hef : e * f = e)
include hZ hx hχ he hf hef

theorem tef_nil {w : Matrix (Fin N) (Fin N) k} (hw : w ∈ Tef (Z := Z) e f) (hn : IsNilpotent w) : w = 0 := by
  obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.1 hw
  obtain ⟨z, hz, rfl⟩ := Submodule.mem_map.1 hy
  simp only [LinearMap.mulLeft_apply] at hn ⊢
  rw [tef_zero hZ hx he.2.1 he.2.2.1 hf hef (sx_le D he.1) hz hn, mul_zero]

theorem tef_finrank : finrank k (Tef (Z := Z) e f) = finrank k (Z.toSubmodule.map (LinearMap.mulLeft k f)) := by
  have hinj : Function.Injective ((LinearMap.mulLeft k e).comp
      (Submodule.subtype (Z.toSubmodule.map (LinearMap.mulLeft k f)))) := by
    rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
    rintro ⟨y, hy⟩ h0
    obtain ⟨z, hz, rfl⟩ := Submodule.mem_map.1 hy
    simp only [LinearMap.comp_apply, Submodule.subtype_apply, LinearMap.mulLeft_apply] at h0
    have hfz := tef_zero hZ hx he.2.1 he.2.2.1 hf hef (sx_le D he.1) hz (by rw [h0]; exact IsNilpotent.zero)
    apply Subtype.ext
    simpa using hfz
  have h := LinearMap.finrank_range_of_inj hinj
  rw [LinearMap.range_comp, Submodule.range_subtype] at h
  exact h

theorem tef_inf : Tef (Z := Z) e f ⊓ Nx D x = ⊥ := by
  rw [eq_bot_iff]
  intro w hw
  rw [Submodule.mem_bot]
  exact tef_nil D hZ hx hχ he hf hef hw.1 (nx_nil D hZ hx hχ w hw.2)

theorem tef_le : Tef (Z := Z) e f ≤ (Sx D x).toSubmodule.map (LinearMap.mulLeft k e) ⊔ Nx D x := by
  intro w hw
  obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.1 hw
  obtain ⟨z, hz, rfl⟩ := Submodule.mem_map.1 hy
  obtain ⟨s, hs, n, hn, rfl⟩ := Submodule.mem_sup.1 (z_le D hZ hx hχ hz)
  simp only [LinearMap.mulLeft_apply]
  have hfS : f ∈ Sx D x := pz_mem_S D hZ hx hχ hf
  have hfC : f ∈ _root_.PositivityTheory.RgUd.T.adj Z x := z_le_cx hf.1
  have heC : e ∈ _root_.PositivityTheory.RgUd.T.adj Z x := sx_le D he.1
  have hs' : s ∈ Sx D x := (Subalgebra.mem_toSubmodule _).1 hs
  rw [mul_add, mul_add]
  refine Submodule.add_mem_sup (Submodule.mem_map.2 ⟨f * s, (Subalgebra.mem_toSubmodule _).2 ((Sx D x).mul_mem hfS hs'), rfl⟩) ?_
  rw [← mul_assoc]
  exact nx_mul D hZ hx (e * f) ((_root_.PositivityTheory.RgUd.T.adj Z x).mul_mem heC hfC) n hn

theorem dim_le : finrank k (Z.toSubmodule.map (LinearMap.mulLeft k f)) ≤
    finrank k ((Sx D x).toSubmodule.map (LinearMap.mulLeft k e)) := by
  rw [← tef_finrank D hZ hx hχ he hf hef]
  have h1 := Submodule.finrank_sup_add_finrank_inf_eq (Tef (Z := Z) e f) (Nx D x)
  rw [tef_inf D hZ hx hχ he hf hef, finrank_bot, add_zero] at h1
  have h2 : Tef (Z := Z) e f ⊔ Nx D x ≤ (Sx D x).toSubmodule.map (LinearMap.mulLeft k e) ⊔ Nx D x :=
    sup_le (tef_le D hZ hx hχ he hf hef) le_sup_right
  have h3 := Submodule.finrank_mono h2
  have h4 := Submodule.finrank_add_le_finrank_add_finrank
    ((Sx D x).toSubmodule.map (LinearMap.mulLeft k e)) (Nx D x)
  omega

theorem dim_eq_le (hd : finrank k ((Sx D x).toSubmodule.map (LinearMap.mulLeft k e)) ≤
    finrank k (Z.toSubmodule.map (LinearMap.mulLeft k f))) :
    (Sx D x).toSubmodule.map (LinearMap.mulLeft k e) ≤ Tef (Z := Z) e f ⊔ Nx D x := by
  have h1 := Submodule.finrank_sup_add_finrank_inf_eq (Tef (Z := Z) e f) (Nx D x)
  rw [tef_inf D hZ hx hχ he hf hef, finrank_bot, add_zero, tef_finrank D hZ hx hχ he hf hef] at h1
  have h2 : Tef (Z := Z) e f ⊔ Nx D x ≤ (Sx D x).toSubmodule.map (LinearMap.mulLeft k e) ⊔ Nx D x :=
    sup_le (tef_le D hZ hx hχ he hf hef) le_sup_right
  have h4 := Submodule.finrank_add_le_finrank_add_finrank
    ((Sx D x).toSubmodule.map (LinearMap.mulLeft k e)) (Nx D x)
  have h5 := Submodule.eq_of_le_of_finrank_le h2 (by omega)
  rw [h5]
  exact le_sup_left

end

section
variable {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {χ : k[X]} {q : ℕ} (D : SData Z χ q)
  {x : Matrix (Fin N) (Fin N) k} (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0)
include hZ hx hχ

theorem zn_of_eq (h : ∀ f ∈ primIdem Z, f ∈ primIdem (Sx D x) ∧
      finrank k ((Sx D x).toSubmodule.map (LinearMap.mulLeft k f)) ≤ finrank k (Z.toSubmodule.map (LinearMap.mulLeft k f))) :
    ∃ c ∈ Z, IsNilpotent (x - c) := by
  have hfin := pi_fin hZ
  have hS : (Sx D x).toSubmodule ≤ Z.toSubmodule ⊔ Nx D x := by
    intro s hs
    have hsum : s = ∑ f ∈ hfin.toFinset, f * s := by
      rw [← Finset.sum_mul, pi_sum hZ, one_mul]
    rw [hsum]
    refine Submodule.sum_mem _ (fun f hf => ?_)
    rw [Set.Finite.mem_toFinset] at hf
    obtain ⟨hfS, hd⟩ := h f hf
    have hle := dim_eq_le D hZ hx hχ hfS hf hfS.2.1.eq hd
    have hmem : f * s ∈ (Sx D x).toSubmodule.map (LinearMap.mulLeft k f) :=
      Submodule.mem_map.2 ⟨s, hs, rfl⟩
    have hT : Tef (Z := Z) f f ≤ Z.toSubmodule ⊔ Nx D x := by
      intro w hw
      obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.1 hw
      obtain ⟨z, hz, rfl⟩ := Submodule.mem_map.1 hy
      apply Submodule.mem_sup_left
      simp only [LinearMap.mulLeft_apply]
      exact (Subalgebra.mem_toSubmodule _).2 (Z.mul_mem hf.1 (Z.mul_mem hf.1 hz))
    exact (sup_le hT le_sup_right) (hle hmem)
  have hxm : x ∈ Z.toSubmodule ⊔ Nx D x :=
    (sup_le hS le_sup_right : (Sx D x).toSubmodule ⊔ Nx D x ≤ _) (x_mem D hZ hx hχ)
  obtain ⟨c, hc, n, hn, hcn⟩ := Submodule.mem_sup.1 hxm
  refine ⟨c, hc, ?_⟩
  rw [← hcn, add_sub_cancel_left]
  exact nx_nil D hZ hx hχ n hn

end

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TefFinrank =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RatioOf =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RatioOf", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiBelow\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiRatio\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RankPosOfNe\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SqSumLe\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TefFinrank\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}

open PositivityTheory.RgUd.TP.Desc.Piece Module

abbrev dA (A : Subalgebra k (Matrix (Fin N) (Fin N) k)) (e : Matrix (Fin N) (Fin N) k) : ℕ :=
  finrank k (A.toSubmodule.map (LinearMap.mulLeft k e))

theorem ratio_of (A : Subalgebra k (Matrix (Fin N) (Fin N) k)) (hA : CR A) {e : Matrix (Fin N) (Fin N) k}
    (he : e ∈ primIdem A) :
    0 < dA A e ∧ dA A e ∣ e.rank ∧
      finrank k ((cenSub A).map (LinearMap.mulLeft k e)) / dA A e = (e.rank / dA A e) ^ 2 := by
  obtain ⟨h0, hd, h⟩ := pi_ratio hA.1 he.1 he.2.1 he.2.2.1 (fun a ha => pi_field hA he ha)
  exact ⟨h0, hd, by rw [h, Nat.mul_div_cancel _ h0]⟩

theorem mu_sum (A : Subalgebra k (Matrix (Fin N) (Fin N) k)) (hA : CR A) :
    mu A = ∑ e ∈ (pi_fin hA).toFinset, (e.rank / dA A e) ^ 2 := by
  unfold mu
  rw [finsum_mem_eq_finite_toFinset_sum _ (pi_fin hA)]
  exact Finset.sum_congr rfl fun e he => (ratio_of A hA ((Set.Finite.mem_toFinset _).mp he)).2.2

theorem m_pos (A : Subalgebra k (Matrix (Fin N) (Fin N) k)) (hA : CR A) {e : Matrix (Fin N) (Fin N) k}
    (he : e ∈ primIdem A) : 1 ≤ e.rank / dA A e := by
  obtain ⟨h0, hd, -⟩ := ratio_of A hA he
  have hr := rank_pos_of_ne he.2.2.1
  obtain ⟨c, hc⟩ := hd
  rw [hc, Nat.mul_div_cancel_left _ h0]
  rcases Nat.eq_zero_or_pos c with rfl | h
  · simp at hc; omega
  · exact h

open Classical in
theorem dich_pt {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {χ : k[X]} {q : ℕ} (D : SData Z χ q)
    {x : Matrix (Fin N) (Fin N) k} (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) :
    mu (Sx D x) < mu Z ∨ ∃ c ∈ Z, IsNilpotent (x - c) := by
  have hS := sx_cr D hZ hx hχ
  set P := (pi_fin hS).toFinset with hP
  set Q := (pi_fin hZ).toFinset with hQ
  have mP : ∀ {e}, e ∈ P ↔ e ∈ primIdem (Sx D x) := fun {e} => Set.Finite.mem_toFinset _
  have mQ : ∀ {f}, f ∈ Q ↔ f ∈ primIdem Z := fun {f} => Set.Finite.mem_toFinset _

  have hsplit : mu (Sx D x) = ∑ f ∈ Q, ∑ e ∈ P with e * f = e, (e.rank / dA (Sx D x) e) ^ 2 := by
    rw [mu_sum _ hS]
    calc ∑ e ∈ P, (e.rank / dA (Sx D x) e) ^ 2
        = ∑ e ∈ P, ∑ f ∈ Q, if e * f = e then (e.rank / dA (Sx D x) e) ^ 2 else 0 := by
          refine Finset.sum_congr rfl fun e he => ?_
          obtain ⟨f₀, hf₀, hef₀⟩ := ef_exists D hZ hx hχ (mP.mp he)
          rw [Finset.sum_eq_single_of_mem f₀ (mQ.mpr hf₀) fun f hf hne => if_neg fun h =>
            hne (ef_unique D hZ hx hχ (mP.mp he) (mQ.mp hf) hf₀ h hef₀), if_pos hef₀]
      _ = ∑ f ∈ Q, ∑ e ∈ P with e * f = e, (e.rank / dA (Sx D x) e) ^ 2 := by
          rw [Finset.sum_comm]; exact Finset.sum_congr rfl fun f _ => (Finset.sum_filter _ _).symm

  have hfib : ∀ f ∈ Q, ∑ e ∈ P with e * f = e, (e.rank / dA (Sx D x) e) ^ 2 ≤ (f.rank / dA Z f) ^ 2 ∧
      (∑ e ∈ P with e * f = e, (e.rank / dA (Sx D x) e) ^ 2 = (f.rank / dA Z f) ^ 2 →
        f ∈ primIdem (Sx D x) ∧ dA (Sx D x) f ≤ dA Z f) := by
    intro f hf
    have hf' := mQ.mp hf
    have hmem : ∀ e ∈ P.filter (fun e => e * f = e), e ∈ primIdem (Sx D x) ∧ e * f = e := fun e he =>
      ⟨mP.mp (Finset.mem_filter.mp he).1, (Finset.mem_filter.mp he).2⟩
    have hfs := fib_sum D hZ hx hχ hf'
    obtain ⟨hdF, hdvF, -⟩ := ratio_of Z hZ hf'
    have hsum : f.rank / dA Z f * dA Z f =
        ∑ e ∈ P with e * f = e, e.rank / dA (Sx D x) e * dA (Sx D x) e := by
      rw [Nat.div_mul_cancel hdvF]
      conv_lhs => rw [← hfs]
      rw [rank_sum_orth _ _ (fun e he => (hmem e he).1.2.1)
        (fun e he e' he' hne => pi_orth hS (hmem e he).1 (hmem e' he').1 hne)]
      exact Finset.sum_congr rfl fun e he => (Nat.div_mul_cancel (ratio_of _ hS (hmem e he).1).2.1).symm
    obtain ⟨hle, heq⟩ := num_fib (P.filter (fun e => e * f = e)) (fun e => e.rank / dA (Sx D x) e)
      (fun e => dA (Sx D x) e) (f.rank / dA Z f) (dA Z f) hdF (fun e he => m_pos _ hS (hmem e he).1)
      (fun e he => dim_le D hZ hx hχ (hmem e he).1 hf' (hmem e he).2) hsum
    refine ⟨hle, fun h => ?_⟩
    have hne : (P.filter (fun e => e * f = e)).Nonempty := by
      rw [Finset.nonempty_iff_ne_empty]
      intro h0
      rw [h0, Finset.sum_empty] at hfs
      exact hf'.2.2.1 hfs.symm
    obtain ⟨e, he⟩ := hne
    obtain ⟨hsing, hde⟩ := heq h ⟨e, he⟩ e he
    have hef : e = f := by rw [← hfs, hsing, Finset.sum_singleton]
    subst hef
    exact ⟨(hmem e he).1, hde⟩

  have hle : mu (Sx D x) ≤ mu Z := by
    rw [hsplit, mu_sum _ hZ]
    exact Finset.sum_le_sum fun f hf => (hfib f hf).1
  by_cases hlt : mu (Sx D x) < mu Z
  · exact Or.inl hlt
  right
  have heq : mu (Sx D x) = mu Z := le_antisymm hle (not_lt.mp hlt)
  rw [hsplit, mu_sum _ hZ] at heq
  have hall := (Finset.sum_eq_sum_iff_of_le fun f hf => (hfib f hf).1).mp heq
  exact zn_of_eq D hZ hx hχ fun f hf => (hfib f (mQ.mpr hf)).2 (hall f (mQ.mpr hf))

variable (k) in
theorem dich : PositivityTheory.RgUd.TP.Desc.Piece.Dich k := by
  intro N q Z hZ χ D τ x₀ hx₀
  exact dich_pt D hZ hx₀.1 hx₀.2.1

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RatioOf =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RootsFinite =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RootsFinite", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop\nimport GroundTheory.AutomorphicForms.GLnLocal\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.NilpotentPowers.IsNilpotentPowSub\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace PositivityTheory.RgUd.TP.Desc.Piece.PAsm2

open Polynomial PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc PositivityTheory.RgUd.TP.Desc.Piece

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem roots_finite {N : ℕ} {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} (hZ : CR Z) {χ : k[X]} (hχ : χ ≠ 0) :
    {c : Matrix (Fin N) (Fin N) k | c ∈ Z ∧ aeval c χ = 0}.Finite := by
  letI : CommRing Z := { (inferInstance : Ring ↥Z) with mul_comm := fun a b => Subtype.ext (hZ.1 a a.2 b b.2) }
  haveI : IsReduced Z := hZ.2
  haveI : IsArtinianRing Z := IsArtinianRing.of_finite k Z
  have hT : {c : Z | aeval c χ = 0}.Finite := by
    refine Set.Finite.of_finite_image ?_ (IsArtinianRing.equivPi Z).injective.injOn
    refine (Set.Finite.pi (t := fun I : MaximalSpectrum Z => χ.rootSet (Z ⧸ I.asIdeal))
      fun I => χ.rootSet_finite _).subset ?_
    rintro _ ⟨c, hc, rfl⟩
    refine Set.mem_univ_pi.2 fun I => ?_
    rw [mem_rootSet_of_ne hχ, IsArtinianRing.equivPi_apply]
    have h := Polynomial.aeval_algHom_apply (Ideal.Quotient.mkₐ k I.asIdeal) c χ
    rw [show aeval c χ = 0 from hc, map_zero] at h
    exact h
  refine (hT.image Subtype.val).subset ?_
  rintro c ⟨hc, h0⟩
  refine ⟨⟨c, hc⟩, ?_, rfl⟩
  show aeval (⟨c, hc⟩ : Z) χ = 0
  exact Subtype.ext (by rw [Polynomial.aeval_subalgebra_coe]; exact h0)

theorem root_of_nil {N : ℕ} {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} (hZ : CR Z) {χ : k[X]}
    {x c : Matrix (Fin N) (Fin N) k} (hx : x ∈ Bz Z) (hc : c ∈ Z) (hχx : aeval x χ = 0)
    (hn : IsNilpotent (x - c)) : aeval c χ = 0 := by
  have hxc : x * c = c * x := (hx c hc).symm
  have hcomm : ∀ a ∈ ({x, c} : Set (Matrix (Fin N) (Fin N) k)), ∀ b ∈ ({x, c} : Set (Matrix (Fin N) (Fin N) k)),
      a * b = b * a := by
    intro a ha b hb
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · rfl
    · exact hxc
    · exact hxc.symm
    · rfl
  let A := Algebra.adjoin k ({x, c} : Set (Matrix (Fin N) (Fin N) k))
  haveI : IsMulCommutative A := Algebra.isMulCommutative_adjoin k (fun a ha b hb _ => hcomm a ha b hb)
  letI : CommRing A := { (inferInstance : Ring A) with mul_comm := fun a b => mul_comm' a b }
  let xa : A := ⟨x, Algebra.subset_adjoin (by simp)⟩
  let ca : A := ⟨c, Algebra.subset_adjoin (by simp)⟩
  have hna : IsNilpotent (xa - ca) := (IsNilpotent.map_iff (f := A.val) Subtype.val_injective).1 hn
  have h1 := isNilpotent_aeval_sub_of_isNilpotent_sub χ hna
  have h2 : aeval xa χ = 0 := Subtype.ext (by rw [Polynomial.aeval_subalgebra_coe]; exact hχx)
  have h3 : IsNilpotent (aeval ca χ) := by simpa [h2] using h1.neg
  have h4 : IsNilpotent (aeval c χ) := by
    have := h3.map A.val
    rwa [← Polynomial.aeval_algHom_apply] at this
  let c' : Z := ⟨c, hc⟩
  have h5 : IsNilpotent (aeval c' χ) := by
    refine (IsNilpotent.map_iff (f := Z.val) Subtype.val_injective).1 ?_
    rw [← Polynomial.aeval_algHom_apply]
    exact h4
  have h6 : aeval c' χ = 0 := by
    haveI : IsReduced Z := hZ.2
    exact h5.eq_zero
  have h7 := congrArg Subtype.val h6
  rwa [Polynomial.aeval_subalgebra_coe] at h7


variable (k) in
theorem pieceGood_of (hF : PositivityTheory.PfBern.Frob.FrobeniusReciprocity) (hS : Sect k) (hP : PieceTop k) (hD : Dich k)
    (hT : Transfer k) : PieceGood k := by
  classical
  intro p _ _ hU N q Z hZ hq hR hB χ
  by_cases hχ : χ.Monic ∧ χ.natDegree = N
  swap
  · refine ⟨0, Fin.elim0, ⟨fun i => i.elim0, fun i => i.elim0, fun x _ hc => ?_⟩, fun i => i.elim0⟩
    exact (hχ ⟨hc ▸ x.charpoly_monic, by rw [← hc, Matrix.charpoly_natDegree_eq_dim, Fintype.card_fin]⟩).elim
  obtain ⟨D⟩ := hS p N q Z hZ hq hR hB χ hχ.1 hχ.2
  have hfin := roots_finite hZ hχ.1.ne_zero
  have hrt : ∀ j : Fin hfin.toFinset.card, (hfin.toFinset.equivFin.symm j).1 ∈ Z ∧
      aeval (hfin.toFinset.equivFin.symm j).1 χ = 0 := fun j => hfin.mem_toFinset.1 (hfin.toFinset.equivFin.symm j).2
  let rt : Fin hfin.toFinset.card → Matrix (Fin N) (Fin N) k := fun j => (hfin.toFinset.equivFin.symm j).1
  have rt_inj : Function.Injective rt := fun j j' h => hfin.toFinset.equivFin.symm.injective (Subtype.ext h)
  have hred : ∀ c ∈ Z, IsNilpotent c → c = 0 := fun c hc hn => by
    have h : IsNilpotent (⟨c, hc⟩ : Z) := (IsNilpotent.map_iff (f := Z.val) Subtype.val_injective).1 hn
    haveI : IsReduced Z := hZ.2
    exact congrArg Subtype.val h.eq_zero
  have hcz : ∀ c ∈ Z, ∀ x ∈ Bz Z, x - c ∈ Bz Z := fun c hc x hx a ha => by
    rw [mul_sub, sub_mul, hx a ha, hZ.1 a ha c hc]
  let e := (finFunctionFinEquiv (m := N + 1) (n := D.m)).symm
  let τ : Fin ((N + 1) ^ D.m) → Fin D.m → ℕ := fun i t => (e i t : ℕ)
  have τ_inj : Function.Injective τ := fun i j h => e.injective (funext fun t => Fin.ext (congrFun h t))
  let bad : Fin ((N + 1) ^ D.m) → Prop := fun i => ∃ x₀ ∈ piece D (τ i), mu (Sx D x₀) < mu Z
  let G : Fin ((N + 1) ^ D.m) × Option (Fin hfin.toFinset.card) → Set (Matrix (Fin N) (Fin N) k) := fun is =>
    if bad is.1 then (if is.2 = none then piece D (τ is.1) else ∅)
    else is.2.elim ∅ (fun j => {x | x ∈ piece D (τ is.1) ∧ (x - rt j) ^ q = 0})
  have hsub : ∀ is x, x ∈ G is → x ∈ piece D (τ is.1) := by
    rintro ⟨i, s⟩ x hx
    simp only [G] at hx
    split_ifs at hx
    · exact hx
    · simp at hx
    · cases s with
      | none => simp at hx
      | some j => exact hx.1
  have huniq : ∀ is js x, x ∈ G is → x ∈ G js → is = js := by
    rintro ⟨i, s⟩ ⟨j, t⟩ x hx hy
    have hij : i = j := τ_inj ((hsub _ x hx).2.2.symm.trans (hsub _ x hy).2.2)
    subst hij
    have hxB : x ∈ Bz Z := (hsub _ x hx).1
    simp only [G] at hx hy
    by_cases hb : bad i
    · rw [if_pos hb] at hx hy
      split_ifs at hx hy with h1 h2
      · rw [h1, h2]
      · simp at hy
      · simp at hx
      · simp at hx
    · rw [if_neg hb] at hx hy
      cases s with
      | none => simp at hx
      | some a =>
        cases t with
        | none => simp at hy
        | some b =>
          have ha : IsNilpotent (x - rt a) := ⟨q, hx.2⟩
          have hb' : IsNilpotent (x - rt b) := ⟨q, hy.2⟩
          have hca : Commute (rt a) x := hxB _ (hrt a).1
          have hcb : Commute (rt b) x := hxB _ (hrt b).1
          have hab : Commute (rt b) (rt a) := hZ.1 _ (hrt b).1 _ (hrt a).1
          have hcomm : Commute (x - rt b) (x - rt a) :=
            ((Commute.refl x).sub_right hca.symm).sub_left (hcb.sub_right hab)
          have hn : IsNilpotent (rt a - rt b) := by
            have := hcomm.isNilpotent_sub hb' ha
            rwa [sub_sub_sub_cancel_left] at this
          have h0 := hred _ (Z.sub_mem (hrt a).1 (hrt b).1) hn
          rw [rt_inj (sub_eq_zero.1 h0)]
  have hclosed : ∀ is, IsClosed (G is) := by
    rintro ⟨i, s⟩
    simp only [G]
    split_ifs
    · exact (hP N q Z hZ χ D (τ i)).1
    · exact isClosed_empty
    · cases s with
      | none => exact isClosed_empty
      | some j =>
        exact (hP N q Z hZ χ D (τ i)).1.inter
          (isClosed_eq ((continuous_id.sub continuous_const).pow q) continuous_const)
  have hinvar : ∀ is, ∀ g ∈ Gz Z, ∀ x ∈ G is, g.val * x * g⁻¹.val ∈ G is := by
    rintro ⟨i, s⟩ g hg x hx
    have hP2 := (hP N q Z hZ χ D (τ i)).2.1 g hg
    simp only [G] at hx ⊢
    split_ifs at hx ⊢
    · exact hP2 x hx
    · simp at hx
    · cases s with
      | none => simp at hx
      | some j =>
        refine ⟨hP2 x hx.1, ?_⟩
        have e1 : g.val * x * g⁻¹.val - rt j = g.val * (x - rt j) * g⁻¹.val := by
          rw [mul_sub, sub_mul, ← hg (rt j) (hrt j).1, mul_assoc (rt j), Units.mul_inv, mul_one]
        rw [e1, _root_.UpperTheory.Reformulated.B.Yhc6.main, hx.2, mul_zero, zero_mul]
  have hcover : ∀ x ∈ Bz Z, x.charpoly = χ → ∃ is, x ∈ G is := by
    intro x hx hc
    have hle : ∀ t, typ D x t < N + 1 := fun t =>
      Nat.lt_succ_of_le ((Matrix.rank_le_width _).trans (by simp))
    let i := e.symm fun t => ⟨typ D x t, hle t⟩
    have hxp : x ∈ piece D (τ i) :=
      ⟨hx, by rw [← hc]; exact Matrix.aeval_self_charpoly x, by funext t; simp [τ, i]⟩
    by_cases hb : bad i
    · refine ⟨(i, none), ?_⟩
      simp only [G, if_pos hb, if_true]
      exact hxp
    · rcases hD N q Z hZ χ D (τ i) x hxp with h | ⟨c, hc, hn⟩
      · exact (hb ⟨x, hxp, h⟩).elim
      · have hroot : aeval c χ = 0 := root_of_nil hZ hx hc hxp.2.1 hn
        have hmem : c ∈ hfin.toFinset := hfin.mem_toFinset.2 ⟨hc, hroot⟩
        refine ⟨(i, some (hfin.toFinset.equivFin ⟨c, hmem⟩)), ?_⟩
        have hrtc : rt (hfin.toFinset.equivFin ⟨c, hmem⟩) = c := by simp [rt]
        simp only [G, if_neg hb, Option.elim_some]
        refine ⟨hxp, ?_⟩
        rw [hrtc]
        exact hB _ (hcz c hc x hx) hn
  have hgood : ∀ is, Good Z (G is) := by
    rintro ⟨i, s⟩
    simp only [G]
    split_ifs with h1
    · obtain ⟨x₀, hx₀, hlt⟩ := h1
      exact Or.inr ⟨N, Sx D x₀, (hP N q Z hZ χ D (τ i)).2.2 x₀ hx₀, hlt, hT hF p hU N q Z hZ χ D (τ i) x₀ hx₀⟩
    · exact Or.inl ⟨0, Z.zero_mem, fun x hx => by simp at hx⟩
    · cases s with
      | none => exact Or.inl ⟨0, Z.zero_mem, fun x hx => by simp at hx⟩
      | some j => exact Or.inl ⟨rt j, (hrt j).1, fun x hx => ⟨q, hx.2⟩⟩
  let eqv := Fintype.equivFin (Fin ((N + 1) ^ D.m) × Option (Fin hfin.toFinset.card))
  refine ⟨Fintype.card (Fin ((N + 1) ^ D.m) × Option (Fin hfin.toFinset.card)), fun i => G (eqv.symm i),
    ⟨fun i => ⟨hclosed _, fun x hx => (hsub _ x hx).1, hinvar _⟩,
      fun i j hij => Set.disjoint_left.2 fun x h1 h2 => hij (eqv.symm.injective (huniq _ _ x h1 h2)),
      fun x hx hc => ?_⟩, fun i => hgood _⟩
  obtain ⟨is, his⟩ := hcover x hx hc
  exact ⟨eqv is, by simpa using his⟩

end PositivityTheory.RgUd.TP.Desc.Piece.PAsm2

end
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RootsFinite =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransfer =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransfer", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransferAlt\npublic import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FrobeniusReciprocity.SupportedInIffOfFrob\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open PositivityTheory.PfBern.Frob PositivityTheory.RgUd.TP.Desc.Piece.Tr

namespace PositivityTheory.RgUd.TP.Desc.Piece.TrDbl

theorem doubleTransfer : FrobeniusReciprocity → DoubleTransfer := by
  intro hF G _ _ _ _ _ _ _ _ _ H₁ H₂ _ _ hH₁ hH₂ hG hU₁ hU₂ X _ _ _ _ _ _ p₁ p₂ hc₁ hc₂ hp₁ hp₂ C hC hCinv hE₂ E hE
  obtain ⟨Fr₁, hs₁, -⟩ := hF G H₁ hH₁ hG hU₁ X p₁ hc₁ hp₁ 1 continuous_const
    (MeasureTheory.Measure.haar) (MeasureTheory.Measure.haar)
  obtain ⟨Fr₂, hs₂, -⟩ := hF G H₂ hH₂ hG hU₂ X p₂ hc₂ hp₂ 1 continuous_const
    (MeasureTheory.Measure.haar) (MeasureTheory.Measure.haar)
  set ξ := Fr₁.symm ⟨E, hE⟩
  have h2 : SupportedIn (↑ξ) C := (hs₂ ξ C hC hCinv).2 (hE₂ _ (Fr₂ ξ).2)
  have h1 := (hs₁ ξ C hC hCinv).1 h2
  simpa [ξ] using h1

end PositivityTheory.RgUd.TP.Desc.Piece.TrDbl
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransfer =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbB =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbB", "h": "module\n\npublic import Mathlib.LinearAlgebra.Matrix.Rank\npublic import Mathlib.Topology.Instances.Matrix\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbA\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.PiTensorProduct\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Tactic.TypeStar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Module

namespace PositivityTheory.RgUd.TP.Desc.Piece.TrOrb

variable {k : Type*} [Field k] [TopologicalSpace k] [IsTopologicalRing k] [T2Space k] {N : ℕ}

theorem rank_eq_of_idem {R : Type*} [Field R] {P Q : Matrix (Fin N) (Fin N) R} (hP : P * P = P) (hQ : Q * Q = Q)
    (hu : IsUnit (Q * P + (1 - Q) * (1 - P)).det) : P.rank = Q.rank := by
  set u := Q * P + (1 - Q) * (1 - P)
  have h1 : u * P = Q * P := by
    simp only [u, add_mul, mul_assoc, sub_mul, one_mul, hP, sub_self, mul_zero, add_zero]
  have h2 : Q * u = Q * P := by
    simp only [u, mul_add, ← mul_assoc, mul_sub, mul_one, hQ, sub_self, zero_mul, add_zero]
  have : (u * P).rank = (Q * u).rank := by rw [h1, h2]
  rwa [rank_mul_eq_right_of_isUnit_det u P hu, rank_mul_eq_left_of_isUnit_det u Q hu] at this

theorem isClosed_idem_rank (n : ℕ) : IsClosed {P : Matrix (Fin N) (Fin N) k | P * P = P ∧ P.rank = n} := by
  rw [← isOpen_compl_iff, isOpen_iff_forall_mem_open]
  intro Q hQ
  by_cases hi : Q * Q = Q
  · have hr : Q.rank ≠ n := fun h => hQ ⟨hi, h⟩
    refine ⟨{P | (Q * P + (1 - Q) * (1 - P)).det ≠ 0}, fun P hP hP' => hr ?_, ?_, ?_⟩
    · rw [← hP'.2]
      exact (rank_eq_of_idem hP'.1 hi (isUnit_iff_ne_zero.2 hP)).symm
    · exact isOpen_ne_fun (((continuous_const.mul continuous_id).add
        (continuous_const.mul (continuous_const.sub continuous_id))).matrix_det) continuous_const
    · show (Q * Q + (1 - Q) * (1 - Q)).det ≠ 0
      have : Q * Q + (1 - Q) * (1 - Q) = 1 := by
        simp only [sub_mul, mul_sub, one_mul, mul_one, hi]; abel
      rw [this, det_one]; exact one_ne_zero
  · exact ⟨{P | P * P ≠ P}, fun P hP hP' => hP hP'.1, isOpen_ne_fun (continuous_id.mul continuous_id) continuous_id,
      hi⟩

theorem orbClosed_gen (N r : ℕ) (A : Type) [CommRing A] [Algebra k A] [FiniteDimensional k A] (hA : IsReduced A)
    (b : Fin r → A) (hb : Submodule.span k (Set.range b) = ⊤) (ρ₀ : A →ₐ[k] Matrix (Fin N) (Fin N) k) :
    IsClosed {w : Fin r → Matrix (Fin N) (Fin N) k | ∃ g : GL (Fin N) k, ∀ i, w i = g.val * ρ₀ (b i) * g⁻¹.val} := by
  classical
  let L : (Fin r → k) → A := fun c => ∑ i, c i • b i
  let Φ : (Fin r → Matrix (Fin N) (Fin N) k) → (Fin r → k) → Matrix (Fin N) (Fin N) k :=
    fun w c => ∑ i, c i • w i
  have hL : ∀ a, ∃ c, L c = a := fun a =>
    (Submodule.mem_span_range_iff_exists_fun k).1 (hb ▸ Submodule.mem_top)
  choose s hs using hL
  have Lsub : ∀ c c', L (c - c') = L c - L c' := fun c c' => by
    simp only [L, Pi.sub_apply, sub_smul, Finset.sum_sub_distrib]
  have Φsub : ∀ w c c', Φ w (c - c') = Φ w c - Φ w c' := fun w c c' => by
    simp only [Φ, Pi.sub_apply, sub_smul, Finset.sum_sub_distrib]
  have Φadd : ∀ w c c', Φ w (c + c') = Φ w c + Φ w c' := fun w c c' => by
    simp only [Φ, Pi.add_apply, add_smul, Finset.sum_add_distrib]
  have Φsmul : ∀ w (t : k) c, Φ w (t • c) = t • Φ w c := fun w t c => by
    simp only [Φ, Pi.smul_apply, smul_eq_mul, mul_smul, Finset.smul_sum]
  have Lsingle : ∀ i, L (Pi.single i 1) = b i := fun i => by
    simp [L]
  have Φsingle : ∀ w i, Φ w (Pi.single i 1) = w i := fun w i => by
    simp [Φ]
  have hΦc : ∀ c : Fin r → k, Continuous fun w : Fin r → Matrix (Fin N) (Fin N) k => Φ w c := fun c =>
    continuous_finsetSum _ fun i _ => (continuous_apply i).const_smul (c i)
  let S : Set (Fin r → Matrix (Fin N) (Fin N) k) :=
    (⋂ c, ⋂ (_ : L c = 0), {w | Φ w c = 0}) ∩ ((⋂ a, ⋂ a', {w | Φ w (s (a * a')) = Φ w (s a) * Φ w (s a')}) ∩
      ({w | Φ w (s 1) = 1} ∩ ⋂ e, ⋂ (_ : IsIdempotentElem e),
        (fun w => Φ w (s e)) ⁻¹' {P | P * P = P ∧ P.rank = (ρ₀ e).rank}))
  have hS : IsClosed S := by
    refine IsClosed.inter ?_ (IsClosed.inter ?_ (IsClosed.inter ?_ ?_))
    · exact isClosed_iInter fun c => isClosed_iInter fun _ => isClosed_eq (hΦc c) continuous_const
    · exact isClosed_iInter fun a => isClosed_iInter fun a' =>
        isClosed_eq (hΦc _) ((hΦc _).mul (hΦc _))
    · exact isClosed_eq (hΦc _) continuous_const
    · exact isClosed_iInter fun e => isClosed_iInter fun _ =>
        (isClosed_idem_rank (ρ₀ e).rank).preimage (hΦc (s e))
  convert hS using 1
  ext w
  simp only [S, Set.mem_inter_iff, Set.mem_iInter, Set.mem_setOf_eq, Set.mem_preimage]
  constructor
  · rintro ⟨g, hg⟩
    have hΦ : ∀ c, Φ w c = g.val * ρ₀ (L c) * g⁻¹.val := fun c => by

      simp only [Φ, L, hg, map_sum, map_smul, Finset.mul_sum, Finset.sum_mul, mul_smul_comm, smul_mul_assoc]
    have hgi : g⁻¹.val * g.val = 1 := Units.inv_mul g
    refine ⟨fun c hc => by rw [hΦ, hc, map_zero, mul_zero, zero_mul], fun a a' => ?_, ?_, fun e he => ?_⟩
    · rw [hΦ, hΦ, hΦ, hs, hs, hs, map_mul]
      simp only [mul_assoc]
      rw [← mul_assoc g⁻¹.val g.val, hgi, one_mul]
    · rw [hΦ, hs, map_one, mul_one, Units.mul_inv]
    · rw [hΦ, hs]
      refine ⟨?_, ?_⟩
      · have := congrArg ρ₀ he.eq
        rw [map_mul] at this
        simp only [mul_assoc]
        rw [← mul_assoc g⁻¹.val g.val, hgi, one_mul, ← mul_assoc (ρ₀ e), this]
      · rw [rank_mul_eq_left_of_isUnit_det _ _ (isUnits_det_units g⁻¹),
          rank_mul_eq_right_of_isUnit_det _ _ (isUnits_det_units g)]
  · rintro ⟨h0, hmul, h1, hrk⟩
    have hwd : ∀ c c', L c = L c' → Φ w c = Φ w c' := fun c c' h => by
      have := h0 (c - c') (by rw [Lsub, h, sub_self])
      rwa [Φsub, sub_eq_zero] at this
    let ρl : A →ₗ[k] Matrix (Fin N) (Fin N) k :=
      { toFun := fun a => Φ w (s a)
        map_add' := fun a a' => by
          rw [← Φadd]; apply hwd; rw [hs]
          simp only [L, Pi.add_apply, add_smul, Finset.sum_add_distrib]
          rw [show (∑ i, s a i • b i) = L (s a) from rfl, show (∑ i, s a' i • b i) = L (s a') from rfl, hs, hs]
        map_smul' := fun t a => by
          rw [RingHom.id_apply, ← Φsmul]; apply hwd; rw [hs]
          simp only [L, Pi.smul_apply, smul_eq_mul, mul_smul, ← Finset.smul_sum]
          rw [show (∑ i, s a i • b i) = L (s a) from rfl, hs] }
    let ρ : A →ₐ[k] Matrix (Fin N) (Fin N) k := AlgHom.ofLinearMap ρl h1 hmul
    have hρ : ∀ a, ρ a = Φ w (s a) := fun _ => rfl
    obtain ⟨g, hg⟩ := orbHom_gen k N A hA ρ₀ ρ fun e he => by rw [hρ, (hrk e he).2]
    refine ⟨g, fun i => ?_⟩
    rw [← hg, hρ, ← Φsingle w i]
    apply hwd
    rw [hs, Lsingle]

end PositivityTheory.RgUd.TP.Desc.Piece.TrOrb
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbB =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbClosed =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbClosed", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransferAlt\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbA\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TrOrbB\nimport GroundTheory.AutomorphicForms.GLnLocal\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.TP.Desc.Piece.TrOrb

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem orbHom : Tr.OrbHom k := fun N A _ _ _ hA ρ ρ' h => orbHom_gen k N A hA ρ ρ' h

theorem orbClosed : Tr.OrbClosed k := fun N r A _ _ _ hA b hb ρ₀ => orbClosed_gen N r A hA b hb ρ₀

end PositivityTheory.RgUd.TP.Desc.Piece.TrOrb
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbClosed =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OneFormsMapOfFunctorMorphismSmul =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OneFormsMapOfFunctorMorphismSmul", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbitBaseIdempotentRank\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.NilpotentPowers.IsNilpotentPowSub\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Pieces\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.ExistsConj\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IsClosedRank\nimport GroundTheory.AutomorphicForms.GLnLocal\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.PiTensorProduct\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Tactic.TypeStar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial PositivityTheory.PfBern.Frob

namespace PositivityTheory.RgUd.TP.Desc.Piece.TrI

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Desc.SLF PositivityTheory.RgUd.TP.Desc.Piece.Tr PositivityTheory.RgUd.TP.Desc.Piece.PTop

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}
  {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {χ : k[X]} {q : ℕ} (D : SData Z χ q) (τ : Fin D.m → ℕ)

theorem Continuous.cjc {X : Type*} [TopologicalSpace X] {f : X → GL (Fin N) k} {g : X → Matrix (Fin N) (Fin N) k}
    (hf : Continuous f) (hg : Continuous g) : Continuous fun x => cj (f x) (g x) :=
  continuous_cj.comp (hf.prodMk hg)

theorem Continuous.actc {X : Type*} [TopologicalSpace X] {f : X → GL (Fin N) k} {g : X → Sp k N}
    (hf : Continuous f) (hg : Continuous g) : Continuous fun x => act (f x) (g x) :=
  continuous_act.comp (hf.prodMk hg)

theorem Continuous.swc {X : Type*} [TopologicalSpace X] {f : X → Fin D.a0 → Matrix (Fin N) (Fin N) k}
    {g : X → Matrix (Fin N) (Fin N) k} (hf : Continuous f) (hg : Continuous g) : Continuous fun x => sw D (f x) (g x) := by
  refine continuous_pi fun j => ?_
  have h := (continuous_sw D j).comp (hf.prodMk hg)
  exact h

theorem Continuous.ewc {X : Type*} [TopologicalSpace X] {f : X → Fin D.a0 → Matrix (Fin N) (Fin N) k}
    {g : X → Matrix (Fin N) (Fin N) k} (hf : Continuous f) (hg : Continuous g) : Continuous fun x => ew D (f x) (g x) := by
  have h := (continuous_ew D).comp (hf.prodMk hg)
  exact h

def smulY (g : GL (Fin N) k) (p : Ys D τ) : Ys D τ := ⟨((fun i => cj g (p.1.1 i)), act g p.1.2), mem_Ys_cj D p.2 g⟩

theorem smulY_one (p : Ys D τ) : smulY D τ 1 p = p := by
  apply Subtype.ext
  simp [smulY, cj, act]

theorem smulY_mul (g h : GL (Fin N) k) (p : Ys D τ) : smulY D τ (g * h) p = smulY D τ g (smulY D τ h p) := by
  apply Subtype.ext
  simp [smulY, cj, act, _root_.mul_inv_rev, Matrix.mulVec_mulVec, mul_assoc]

instance actY : MulAction (GL (Fin N) k) (Ys D τ) where
  smul := smulY D τ
  one_smul := smulY_one D τ
  mul_smul := smulY_mul D τ

theorem smul_val (g : GL (Fin N) k) (p : Ys D τ) : (g • p).1 = ((fun i => cj g (p.1.1 i)), act g p.1.2) := rfl

instance continuousSMul_actY : ContinuousSMul (GL (Fin N) k) (Ys D τ) := by
  refine ⟨?_⟩
  have hv : Continuous fun p : GL (Fin N) k × Ys D τ => p.2.1 := continuous_subtype_val.comp continuous_snd
  have h : Continuous fun p : GL (Fin N) k × Ys D τ =>
      (((fun i => cj p.1 (p.2.1.1 i)), act p.1 p.2.1.2) : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N) :=
    (continuous_pi fun i => Continuous.cjc continuous_fst ((continuous_apply i).comp (continuous_fst.comp hv))).prodMk
      (Continuous.actc continuous_fst (continuous_snd.comp hv))
  exact h.subtype_mk fun p => mem_Ys_cj D p.2.2 p.1

variable {D τ}

theorem orb_of_Ys {p : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N} (hp : p ∈ Ys D τ) : p.1 ∈ Orb D.z := by
  obtain ⟨g, hg, -⟩ := hp
  exact ⟨g, hg⟩

theorem sw_of {p : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N} {g : GL (Fin N) k} (hg : ∀ i, p.1 i = cj g (D.z i)) :
    sw D p.1 p.2.1 = fun j => cj g (pe (D.a j) (cj g⁻¹ p.2.1)) := by
  have hw : p.1 = fun i => cj g (D.z i) := funext hg
  funext j
  rw [hw]
  simp only [sw, lin_cj, lin_al]
  rw [← pe_cj, cj_cj_inv]

theorem ew_of {p : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N} {g : GL (Fin N) k} (hg : ∀ i, p.1 i = cj g (D.z i)) :
    ew D p.1 p.2.1 = cj g (pe D.b (cj g⁻¹ p.2.1)) := by
  have hw : p.1 = fun i => cj g (D.z i) := funext hg
  rw [hw, ← eigenvalue_map_at_base, ← ew_cj, cj_cj_inv]

private theorem piece_inv_lemma {g : GL (Fin N) k} (hg : g ∈ Gz Z) {x : Matrix (Fin N) (Fin N) k}
    (hx : x ∈ piece D τ) : cj g x ∈ piece D τ := by
  unfold cj
  obtain ⟨hB, hχ, ht⟩ := hx
  refine ⟨PositivityTheory.RgUd.T.Desc.Asm.conj_mem_Bz hg hB, ?_, ?_⟩
  · rw [_root_.PositivityTheory.RgUd.T.Desc.Asm.aeval_conj, hχ, mul_zero, zero_mul]
  · rw [← ht]
    funext t
    simp only [typ]
    have hc := fun j => PositivityTheory.RgUd.TP.Desc.Piece.PTop.pe_conj (D.a j) (D.ha j) hg x
    simp only [hc]
    rw [← PositivityTheory.RgUd.TP.Desc.Piece.PTop.rank_conj g (∑ j, D.κ t j • pe (D.a j) x)]
    congr 1
    simp only [Finset.mul_sum, Finset.sum_mul, mul_smul_comm, smul_mul_assoc]

private theorem re_cj_lemma_2 {d r : ℕ} (γ : Fin d → Fin r → k) (s : Fin r → Matrix (Fin N) (Fin N) k)
    (ε : Matrix (Fin N) (Fin N) k) (g : GL (Fin N) k) : re γ (fun j => cj g (s j)) (cj g ε) = cj g (re γ s ε) := by
  simp only [re, cj_sum, cj_smul, cj_mulM, cj_pow]

private theorem sw_cj_lemma_3 (w : Fin D.a0 → Matrix (Fin N) (Fin N) k) (x : Matrix (Fin N) (Fin N) k)
    (g : GL (Fin N) k) : sw D (fun i => cj g (w i)) (cj g x) = fun j => cj g (sw D w x j) := by
  funext j
  simp only [sw, lin_cj, pe_cj]

theorem sw_mem_orb (hOH : OrbHom k) (hZ : CR Z) {x₀ : Matrix (Fin N) (Fin N) k} (hx₀ : x₀ ∈ piece D τ)
    {p : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N} (hp : p ∈ Ys D τ) :
    sw D p.1 p.2.1 ∈ Orb (fun j => pe (D.a j) x₀) := by
  obtain ⟨g, hg, hx⟩ := hp
  obtain ⟨h, hh⟩ := exists_isAttachedHodgeS_conj_mapRep D hOH hZ hx₀ hx
  refine ⟨g * h, fun j => ?_⟩
  rw [sw_of hg]
  show cj g (pe (D.a j) (cj g⁻¹ p.2.1)) = cj (g * h) (pe (D.a j) x₀)
  rw [hh j]
  simp only [cj, Units.val_mul, _root_.mul_inv_rev, mul_assoc]

theorem Ys_spec {p : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N} (hp : p ∈ Ys D τ) :
    (∀ j, sw D p.1 p.2.1 j * ew D p.1 p.2.1 = ew D p.1 p.2.1 * sw D p.1 p.2.1 j) ∧
      (∀ i, re (D.γ i) (sw D p.1 p.2.1) (ew D p.1 p.2.1) = p.1 i) ∧ re D.β (sw D p.1 p.2.1) (ew D p.1 p.2.1) = p.2.1 := by
  obtain ⟨g, hg, hx⟩ := hp
  obtain ⟨hB, hχ, -⟩ := hx
  have hs := D.spec _ hB hχ
  have h4 : ∀ j, pe (D.a j) (cj g⁻¹ p.2.1) * pe D.b (cj g⁻¹ p.2.1) =
      pe D.b (cj g⁻¹ p.2.1) * pe (D.a j) (cj g⁻¹ p.2.1) := hs.2.2.2.1
  have h7 : ∀ i, D.z i = re (D.γ i) (fun j => pe (D.a j) (cj g⁻¹ p.2.1)) (pe D.b (cj g⁻¹ p.2.1)) :=
    hs.2.2.2.2.2.2.1
  have h8 : cj g⁻¹ p.2.1 = re D.β (fun j => pe (D.a j) (cj g⁻¹ p.2.1)) (pe D.b (cj g⁻¹ p.2.1)) :=
    hs.2.2.2.2.2.2.2.1
  rw [sw_of hg, ew_of hg]
  refine ⟨fun j => ?_, fun i => ?_, ?_⟩
  · beta_reduce
    rw [← cj_mulM, ← cj_mulM, h4 j]
  · rw [re_cj_lemma_2, ← h7 i, hg i]
  · rw [re_cj_lemma_2, ← h8, cj_cj_inv]

theorem e_smul {r : ℕ} {S : Subalgebra k (Matrix (Fin N) (Fin N) k)} {b : Fin r → Matrix (Fin N) (Fin N) k}
    {e : GL (Fin N) k ⧸ GzS S ≃ₜ Orb b} (he : ∀ g : GL (Fin N) k, ((e g : Orb b) : Fin r → _) = fun i => cj g (b i))
    (g : GL (Fin N) k) (c : GL (Fin N) k ⧸ GzS S) : ((e (g • c) : Orb b) : Fin r → _) = fun i => cj g ((e c).1 i) := by
  obtain ⟨h, rfl⟩ := QuotientGroup.mk_surjective c
  rw [MulAction.Quotient.smul_mk, he, he]
  funext i
  simp [cj, _root_.mul_inv_rev, mul_assoc]

theorem e_eq_one_iff {r : ℕ} {S : Subalgebra k (Matrix (Fin N) (Fin N) k)} {b : Fin r → Matrix (Fin N) (Fin N) k}
    {e : GL (Fin N) k ⧸ GzS S ≃ₜ Orb b} (he : ∀ g : GL (Fin N) k, ((e g : Orb b) : Fin r → _) = fun i => cj g (b i))
    (w : Orb b) : e.symm w = ((1 : GL (Fin N) k) : GL (Fin N) k ⧸ GzS S) ↔ w.1 = b := by
  rw [Homeomorph.symm_apply_eq, Subtype.ext_iff, he]
  have h1 : (fun i => cj (1 : GL (Fin N) k) (b i)) = b := by
    funext i
    simp [cj]
  rw [h1]

variable (D τ)

def p1 (e₁ : GL (Fin N) k ⧸ GzS Z ≃ₜ Orb D.z) (p : Ys D τ) : GL (Fin N) k ⧸ GzS Z := e₁.symm ⟨p.1.1, orb_of_Ys p.2⟩

def p2 (hOH : OrbHom k) (hZ : CR Z) {x₀ : Matrix (Fin N) (Fin N) k} (hx₀ : x₀ ∈ piece D τ)
    (e₂ : GL (Fin N) k ⧸ GzS (Sx D x₀) ≃ₜ Orb (fun j => pe (D.a j) x₀)) (p : Ys D τ) :
    GL (Fin N) k ⧸ GzS (Sx D x₀) :=
  e₂.symm ⟨sw D p.1.1 p.1.2.1, sw_mem_orb hOH hZ hx₀ p.2⟩

variable {D τ}

section E1

variable {e₁ : GL (Fin N) k ⧸ GzS Z ≃ₜ Orb D.z} (he₁ : ∀ g : GL (Fin N) k, ((e₁ g : Orb D.z) : Fin D.a0 → _) =
  fun i => cj g (D.z i))
include he₁

theorem oneFormsMapOfFunctorMorphism_smul (g : GL (Fin N) k) (p : Ys D τ) : p1 D τ e₁ (g • p) = g • p1 D τ e₁ p := by
  apply e₁.injective
  apply Subtype.ext
  rw [e_smul he₁]
  simp only [p1, Homeomorph.apply_symm_apply, smul_val]

theorem first_orbit_map_eq_one_iff (p : Ys D τ) : p1 D τ e₁ p = ((1 : GL (Fin N) k) : GL (Fin N) k ⧸ GzS Z) ↔ p.1.1 = D.z :=
  e_eq_one_iff he₁ _

theorem continuous_first_orbit_map : Continuous (p1 D τ e₁) :=
  e₁.symm.continuous.comp (Continuous.subtype_mk (continuous_fst.comp continuous_subtype_val) _)

theorem mem_piece_of_first_fibre (hZ : CR Z) (y : Fib (p1 D τ e₁)) : y.1.1.2 ∈ piece D τ ×ˢ (Set.univ : Set (Fin N → k)) := by
  obtain ⟨⟨p, hp⟩, hy⟩ := y
  have hz1 : p.1 = D.z := (first_orbit_map_eq_one_iff he₁ ⟨p, hp⟩).1 hy
  obtain ⟨g, hg, hx⟩ := hp
  have hgZ : g ∈ Gz Z := (mem_GzS_iff D.hz g).2 fun i => by rw [← hg i, hz1]
  refine ⟨?_, Set.mem_univ _⟩
  have h1 := piece_inv_lemma hgZ hx
  rw [cj_cj_inv] at h1
  exact h1

end E1

theorem mem_Ys_of_piece (y : piece D τ ×ˢ (Set.univ : Set (Fin N → k))) : (D.z, y.1) ∈ Ys D τ := by
  refine ⟨1, fun i => ?_, ?_⟩
  · simp [cj]
  · simpa [cj] using y.2.1

def hY1 (e₁ : GL (Fin N) k ⧸ GzS Z ≃ₜ Orb D.z) (he₁ : ∀ g : GL (Fin N) k, ((e₁ g : Orb D.z) : Fin D.a0 → _) =
    fun i => cj g (D.z i)) (hZ : CR Z) : Fib (p1 D τ e₁) ≃ₜ (piece D τ ×ˢ (Set.univ : Set (Fin N → k))) where
  toFun y := ⟨y.1.1.2, mem_piece_of_first_fibre he₁ hZ y⟩
  invFun y := ⟨⟨(D.z, y.1), mem_Ys_of_piece y⟩, (first_orbit_map_eq_one_iff he₁ _).2 rfl⟩
  left_inv y := Subtype.ext (Subtype.ext (Prod.ext ((first_orbit_map_eq_one_iff he₁ y.1).1 y.2).symm rfl))
  right_inv y := rfl
  continuous_toFun := Continuous.subtype_mk (continuous_snd.comp (continuous_subtype_val.comp continuous_subtype_val)) _
  continuous_invFun := Continuous.subtype_mk (Continuous.subtype_mk (continuous_const.prodMk continuous_subtype_val) _) _

theorem first_fibre_homeomorph_smul {e₁ : GL (Fin N) k ⧸ GzS Z ≃ₜ Orb D.z} (he₁ : ∀ g : GL (Fin N) k, ((e₁ g : Orb D.z) : Fin D.a0 → _) =
    fun i => cj g (D.z i)) (hZ : CR Z) (h : GzS Z) (y : Fib (p1 D τ e₁)) :
    (hY1 e₁ he₁ hZ (fibSmul (oneFormsMapOfFunctorMorphism_smul he₁) h y)).1 = act h.1 (hY1 e₁ he₁ hZ y).1 := rfl

section E2

variable {hOH : OrbHom k} {hZ : CR Z} {x₀ : Matrix (Fin N) (Fin N) k} {hx₀ : x₀ ∈ piece D τ}
  {e₂ : GL (Fin N) k ⧸ GzS (Sx D x₀) ≃ₜ Orb (fun j => pe (D.a j) x₀)}
  (he₂ : ∀ g : GL (Fin N) k, ((e₂ g : Orb (fun j => pe (D.a j) x₀)) : Fin D.r → _) = fun j => cj g (pe (D.a j) x₀))
include he₂

theorem second_orbit_map_equivariant (g : GL (Fin N) k) (p : Ys D τ) : p2 D τ hOH hZ hx₀ e₂ (g • p) = g • p2 D τ hOH hZ hx₀ e₂ p := by
  apply e₂.injective
  apply Subtype.ext
  rw [e_smul he₂]
  simp only [p2, Homeomorph.apply_symm_apply, smul_val]
  exact sw_cj_lemma_3 p.1.1 p.1.2.1 g

theorem second_orbit_map_eq_one_iff (p : Ys D τ) : p2 D τ hOH hZ hx₀ e₂ p = ((1 : GL (Fin N) k) : GL (Fin N) k ⧸ GzS (Sx D x₀)) ↔
    sw D p.1.1 p.1.2.1 = fun j => pe (D.a j) x₀ := by
  unfold p2
  exact e_eq_one_iff he₂ _

omit he₂ in
theorem continuous_p2 : Continuous (p2 D τ hOH hZ hx₀ e₂) := by
  unfold p2
  exact e₂.symm.continuous.comp ((Continuous.swc D (continuous_fst.comp continuous_subtype_val)
    (continuous_fst.comp (continuous_snd.comp continuous_subtype_val))).subtype_mk _)

end E2

def psi (D : SData Z χ q) (x₀ : Matrix (Fin N) (Fin N) k) (y : Sp k N) : (Fin D.a0 → Matrix (Fin N) (Fin N) k) × Sp k N :=
  ((fun i => re (D.γ i) (fun j => pe (D.a j) x₀) y.1), (re D.β (fun j => pe (D.a j) x₀) y.1, y.2))

theorem continuous_psi (x₀ : Matrix (Fin N) (Fin N) k) : Continuous (psi D x₀) :=
  (continuous_pi fun i => (continuous_re _ _).comp continuous_fst).prodMk
    (((continuous_re _ _).comp continuous_fst).prodMk continuous_snd)


variable (D τ) in
def Ys2 (x₀ : Matrix (Fin N) (Fin N) k) : Set (Sp k N) :=
  {y | psi D x₀ y ∈ Ys D τ ∧ sw D (psi D x₀ y).1 (psi D x₀ y).2.1 = (fun j => pe (D.a j) x₀) ∧
    ew D (psi D x₀ y).1 (psi D x₀ y).2.1 = y.1}

theorem isClosed_second_fibre_set (hOC : OrbClosed k) (hZ : CR Z) (x₀ : Matrix (Fin N) (Fin N) k) : IsClosed (Ys2 D τ x₀) := by
  have hYs := isClosed_Ys D hOC hZ τ fun g hg x hx => piece_inv_lemma hg hx
  refine (hYs.preimage (continuous_psi x₀)).inter ((isClosed_eq ?_ continuous_const).inter (isClosed_eq ?_ continuous_fst))
  · exact Continuous.swc D (continuous_fst.comp (continuous_psi x₀))
      (continuous_fst.comp (continuous_snd.comp (continuous_psi x₀)))
  · exact Continuous.ewc D (continuous_fst.comp (continuous_psi x₀))
      (continuous_fst.comp (continuous_snd.comp (continuous_psi x₀)))

theorem Ys2_sub {x₀ : Matrix (Fin N) (Fin N) k} (hB0 : x₀ ∈ Bz Z) (hχ0 : aeval x₀ χ = 0) {y : Sp k N}
    (hy : y ∈ Ys2 D τ x₀) : y ∈ Bz (Sx D x₀) ×ˢ (Set.univ : Set (Fin N → k)) := by
  obtain ⟨hY, hs, he⟩ := hy
  have hsp := (Ys_spec hY).1
  rw [hs, he] at hsp
  refine ⟨fun a ha => ?_, Set.mem_univ _⟩
  have hle : Sx D x₀ ≤ Subalgebra.centralizer k {y.1} := by
    refine Algebra.adjoin_le ?_
    rintro _ ⟨j, rfl⟩
    refine (Subalgebra.mem_centralizer_iff k).2 ?_
    rintro _ rfl
    exact (hsp j).symm
  have h1 := (Subalgebra.mem_centralizer_iff k).1 (hle ha) y.1 rfl
  exact h1.symm

section E2b

variable {hOH : OrbHom k} {hZ : CR Z} {x₀ : Matrix (Fin N) (Fin N) k} {hx₀ : x₀ ∈ piece D τ}
  {e₂ : GL (Fin N) k ⧸ GzS (Sx D x₀) ≃ₜ Orb (fun j => pe (D.a j) x₀)}
  (he₂ : ∀ g : GL (Fin N) k, ((e₂ g : Orb (fun j => pe (D.a j) x₀)) : Fin D.r → _) = fun j => cj g (pe (D.a j) x₀))
include he₂

theorem psi_ew (y : Fib (p2 D τ hOH hZ hx₀ e₂)) :
    psi D x₀ (ew D y.1.1.1 y.1.1.2.1, y.1.1.2.2) = y.1.1 := by
  have hs := (second_orbit_map_eq_one_iff he₂ y.1).1 y.2
  obtain ⟨-, hz, hx⟩ := Ys_spec y.1.2
  rw [hs] at hz hx
  exact Prod.ext (funext hz) (Prod.ext hx rfl)

theorem mem_second_fibre_set_of_fib (y : Fib (p2 D τ hOH hZ hx₀ e₂)) : (ew D y.1.1.1 y.1.1.2.1, y.1.1.2.2) ∈ Ys2 D τ x₀ := by
  have hs : sw D y.1.1.1 y.1.1.2.1 = fun j => pe (D.a j) x₀ := (second_orbit_map_eq_one_iff he₂ y.1).1 y.2
  have h := psi_ew he₂ y
  refine ⟨?_, ?_, ?_⟩
  · rw [h]
    exact y.1.2
  · rw [h]
    exact hs
  · rw [h]

theorem second_fibre_of_set (y : Ys2 D τ x₀) : p2 D τ hOH hZ hx₀ e₂ ⟨psi D x₀ y.1, y.2.1⟩ = ((1 : GL (Fin N) k) : _ ⧸ _) :=
  (second_orbit_map_eq_one_iff he₂ _).2 y.2.2.1

end E2b

def hY2 {hOH : OrbHom k} {hZ : CR Z} {x₀ : Matrix (Fin N) (Fin N) k} {hx₀ : x₀ ∈ piece D τ}
    {e₂ : GL (Fin N) k ⧸ GzS (Sx D x₀) ≃ₜ Orb (fun j => pe (D.a j) x₀)}
    (he₂ : ∀ g : GL (Fin N) k, ((e₂ g : Orb (fun j => pe (D.a j) x₀)) : Fin D.r → _) = fun j => cj g (pe (D.a j) x₀)) :
    Fib (p2 D τ hOH hZ hx₀ e₂) ≃ₜ Ys2 D τ x₀ where
  toFun y := ⟨(ew D y.1.1.1 y.1.1.2.1, y.1.1.2.2), mem_second_fibre_set_of_fib he₂ y⟩
  invFun y := ⟨⟨psi D x₀ y.1, y.2.1⟩, second_fibre_of_set he₂ y⟩
  left_inv y := Subtype.ext (Subtype.ext (psi_ew he₂ y))
  right_inv y := Subtype.ext (Prod.ext y.2.2.2 rfl)
  continuous_toFun := by
    have hv : Continuous fun y : Fib (p2 D τ hOH hZ hx₀ e₂) => y.1.1 :=
      continuous_subtype_val.comp continuous_subtype_val
    exact ((Continuous.ewc D (continuous_fst.comp hv) (continuous_fst.comp (continuous_snd.comp hv))).prodMk
      (continuous_snd.comp (continuous_snd.comp hv))).subtype_mk _
  continuous_invFun := Continuous.subtype_mk (Continuous.subtype_mk ((continuous_psi x₀).comp continuous_subtype_val) _) _

section CasimirPairingBound

variable {hOH : OrbHom k} {hZ : CR Z} {x₀ : Matrix (Fin N) (Fin N) k} {hx₀ : x₀ ∈ piece D τ}
  {e₂ : GL (Fin N) k ⧸ GzS (Sx D x₀) ≃ₜ Orb (fun j => pe (D.a j) x₀)}
  (he₂ : ∀ g : GL (Fin N) k, ((e₂ g : Orb (fun j => pe (D.a j) x₀)) : Fin D.r → _) = fun j => cj g (pe (D.a j) x₀))
include he₂

theorem second_fibre_homeomorph_val (y : Fib (p2 D τ hOH hZ hx₀ e₂)) : (hY2 he₂ y).1 = (ew D y.1.1.1 y.1.1.2.1, y.1.1.2.2) := rfl

theorem second_fibre_homeomorph_smul (h : GzS (Sx D x₀)) (y : Fib (p2 D τ hOH hZ hx₀ e₂)) :
    (hY2 he₂ (fibSmul (second_orbit_map_equivariant he₂) h y)).1 = act h.1 (hY2 he₂ y).1 := by
  rw [second_fibre_homeomorph_val, second_fibre_homeomorph_val]
  show (ew D (h.1 • y.1).1.1 (h.1 • y.1).1.2.1, (h.1 • y.1).1.2.2) = _
  rw [smul_val]
  exact Prod.ext (ew_cj D _ _ _) rfl

end CasimirPairingBound

end PositivityTheory.RgUd.TP.Desc.Piece.TrI
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OneFormsMapOfFunctorMorphismSmul =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TransferOf =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TransferOf", "h": "module\n\npublic import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FiberLocalization.EqZeroOfFiberEquivariant\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransferAlt\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.DistrC\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Pieces\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.T2SpaceCentralizerGroup\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.ExistsConj\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IsClosedRank\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OneFormsMapOfFunctorMorphismSmul\nimport GroundTheory.AutomorphicForms.GLnLocal\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\npublic import Development.AbelianVarietyTheory.Definitions.Divisors.T2SpaceGeneralLinearGroup\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial GroundTheory.Automorphic GroundTheory.Automorphic.Whittaker MeasureTheory

namespace PositivityTheory.RgUd.TP.Desc.Piece.TrI

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Desc.SLF PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc.Piece.Tr PositivityTheory.RgUd.TP.Desc.Piece.PTop
open PositivityTheory.PfBern.Loc (SC restr restr_surjective pullL mulInd)
open PositivityTheory.PfBern.Frob (FrobeniusReciprocity IsUnimod eqvF translF Fib fibSmul)

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

def actH {N : ℕ} (g : GL (Fin N) k) : Sp k N ≃ₜ Sp k N where
  toFun := act g
  invFun := act g⁻¹
  left_inv q := by rw [← act_mul, inv_mul_cancel, act_one]
  right_inv q := by rw [← act_mul, mul_inv_cancel, act_one]
  continuous_toFun := Continuous.actc continuous_const continuous_id
  continuous_invFun := Continuous.actc continuous_const continuous_id


theorem transfer_of : (PositivityTheory.PfBern.Frob.FrobeniusReciprocity → DoubleTransfer) → OrbHom k → OrbClosed k → Transfer k := by
  intro hDT hOH hOC hFr p _ _ hU N q Z hZ χ D τ x₀ hx₀ hV ξ hsupp hinv f hf
  haveI : T2Space k := t2k
  haveI : TotallyDisconnectedSpace k := tdk
  haveI : SecondCountableTopology k := sck
  haveI : TotallyDisconnectedSpace (Matrix (Fin N) (Fin N) k) := tdM
  haveI : LocallyCompactSpace (Matrix (Fin N) (Fin N) k) := inferInstanceAs (LocallyCompactSpace (Fin N → Fin N → k))
  haveI : SecondCountableTopology (GL (Fin N) k) := GlobalTheory.SplitFlip.secondCountable_GL
  letI : MeasurableSpace (GL (Fin N) k) := borel _
  haveI : BorelSpace (GL (Fin N) k) := ⟨rfl⟩
  have hP := pieceTop k N q Z hZ χ D τ
  have hCR : CR (Sx D x₀) := hP.2.2 x₀ hx₀
  have hB0 : x₀ ∈ Bz Z := hx₀.1
  have hχ0 : aeval x₀ χ = 0 := hx₀.2.1
  obtain ⟨e₁, he₁⟩ := exists_orb_homeo hOC hZ D.hz
  obtain ⟨e₂, he₂⟩ := exists_orb_homeo hOC hCR (sx_span D hB0 hχ0)
  have hYc : IsClosed (Ys D τ) := isClosed_Ys D hOC hZ τ hP.2.1
  haveI : LocallyCompactSpace (Ys D τ) := hYc.isClosedEmbedding_subtypeVal.locallyCompactSpace
  have hp₁ := oneFormsMapOfFunctorMorphism_smul (τ := τ) he₁
  have hp₂ := second_orbit_map_equivariant (τ := τ) (hOH := hOH) (hZ := hZ) (hx₀ := hx₀) he₂
  let C : Set (Ys D τ) := {y | y.1.2.2 = 0}
  have hCc : IsClosed C := isClosed_eq (continuous_snd.comp (continuous_snd.comp continuous_subtype_val)) continuous_const
  have hCinv : ∀ (g : GL (Fin N) k), ∀ y ∈ C, g • y ∈ C := by
    intro g y hy
    change g.val *ᵥ y.1.2.2 = 0
    rw [show y.1.2.2 = 0 from hy, Matrix.mulVec_zero]

  have hyp : ∀ E ∈ eqvF hp₂ ((1 : GL (Fin N) k →* ℂˣ).comp (GzS (Sx D x₀)).subtype),
      PositivityTheory.PfBern.Frob.SupportedIn E (Subtype.val ⁻¹' C) := by
    intro E hEeqv φ0 hφ0
    let hY := hY2 (hOH := hOH) (hZ := hZ) (hx₀ := hx₀) he₂
    have hY2c : IsClosed (Ys2 D τ x₀) := isClosed_second_fibre_set hOC hZ x₀
    let E' : PositivityTheory.PfBern.Loc.Distr (Ys2 D τ x₀) := E.comp (pullL hY)
    obtain ⟨η, hη⟩ := exists_functional hY2c E'
    have hSη : Supp η (Bz (Sx D x₀) ×ˢ Set.univ) := by
      intro f hf1 hvan
      have hr : restr hY2c ⟨f, hf1.1⟩ = 0 := Subtype.ext (funext fun y => hvan y.1 (Ys2_sub hB0 hχ0 y.2))
      have := hη ⟨f, hf1.1⟩
      rw [hr, map_zero] at this
      exact this
    have hIη : Inv (Sx D x₀) η := by
      intro h hh f hf1
      let hH : GzS (Sx D x₀) := ⟨h, hh⟩
      let f1 : SC (Sp k N) := pullL (actH k h) ⟨f, hf1.1⟩
      have key : pullL hY (restr hY2c f1) = translF hp₂ hH⁻¹ (pullL hY (restr hY2c ⟨f, hf1.1⟩)) := by
        apply Subtype.ext
        funext z
        change f (act h (hY z).1) = f (hY (fibSmul hp₂ hH⁻¹⁻¹ z)).1
        rw [second_fibre_homeomorph_smul he₂, inv_inv]
      have h1 : η (fun q => f (act h q)) = η f1 := rfl
      rw [h1, hη f1, hη ⟨f, hf1.1⟩]
      change E (pullL hY (restr hY2c f1)) = E (pullL hY (restr hY2c ⟨f, hf1.1⟩))
      rw [key]
      exact (hEeqv hH⁻¹ _).trans (by simp)
    have hkill := hV η hSη hIη
    let φ' : SC (Ys2 D τ x₀) := pullL hY.symm φ0
    obtain ⟨f0, hf0⟩ := restr_surjective hY2c φ'
    have hsupp' : Function.support (φ' : Ys2 D τ x₀ → ℂ) ⊆ {y | y.1.2 ≠ 0} := fun y hy => hφ0 hy
    have hK : IsCompact (Subtype.val '' Function.support (φ' : Ys2 D τ x₀ → ℂ)) :=
      (isCompact_support φ'.2).image continuous_subtype_val
    have hKsub : Subtype.val '' Function.support (φ' : Ys2 D τ x₀ → ℂ) ⊆ {q : Sp k N | q.2 ≠ 0} := by
      rintro _ ⟨y, hy, rfl⟩
      exact hsupp' hy
    have hUo : IsOpen {q : Sp k N | q.2 ≠ 0} := isOpen_ne_fun continuous_snd continuous_const
    obtain ⟨Bc, hBc, hBo, hKB, hBU⟩ := exists_isCompact_isOpen_between hK hUo hKsub
    let f : SC (Sp k N) := mulInd Bc ⟨hBc.isClosed, hBo⟩ f0
    have hrf : restr hY2c f = φ' := by
      apply Subtype.ext
      funext y
      change Bc.indicator 1 y.1 * (f0 : Sp k N → ℂ) y.1 = (φ' : Ys2 D τ x₀ → ℂ) y
      have e0 : (f0 : Sp k N → ℂ) y.1 = (φ' : Ys2 D τ x₀ → ℂ) y := congrFun (congrArg Subtype.val hf0) y
      by_cases hyB : y.1 ∈ Bc
      · simp [hyB, e0]
      · have : (φ' : Ys2 D τ x₀ → ℂ) y = 0 := by
          by_contra hne
          exact hyB (hKB ⟨y, hne, rfl⟩)
        simp [hyB, this]
    have hfU : (f : Sp k N → ℂ) ∈ supportedIn {q : Sp k N | q.2 ≠ 0} := by
      refine ⟨f.2, fun q hq => hBU ?_⟩
      by_contra hqB
      exact hq (by simp [f, mulInd, hqB])
    have hz := hkill f hfU
    rw [hη f, hrf] at hz
    have e2 : pullL hY φ' = φ0 := PositivityTheory.PfBern.Loc.pullL_pullL_symm hY φ0
    change E (pullL hY φ') = 0 at hz
    rw [e2] at hz
    exact hz

  have hPc : IsClosed (piece D τ ×ˢ (Set.univ : Set (Fin N → k))) := hP.1.prod isClosed_univ
  obtain ⟨Dd, hDd⟩ := exists_distr_on ξ hPc hsupp
  let hY1' := hY1 (τ := τ) e₁ he₁ hZ
  let E₁ : PositivityTheory.PfBern.Frob.Distr (Fib (p1 D τ e₁)) := Dd.comp (pullL hY1'.symm)
  have hE₁ : E₁ ∈ eqvF hp₁ ((1 : GL (Fin N) k →* ℂˣ).comp (GzS Z).subtype) := by
    intro h φ
    obtain ⟨f0, hf0⟩ := restr_surjective hPc (pullL hY1'.symm φ)
    have hφ : ∀ w, (φ : Fib (p1 D τ e₁) → ℂ) w = (f0 : Sp k N → ℂ) (hY1' w).1 := fun w => by
      have := congrFun (congrArg Subtype.val hf0) (hY1' w)
      change (f0 : Sp k N → ℂ) (hY1' w).1 = (φ : Fib (p1 D τ e₁) → ℂ) (hY1'.symm (hY1' w)) at this
      rw [Homeomorph.symm_apply_apply] at this
      exact this.symm
    let f1 : SC (Sp k N) := pullL (actH k (h⁻¹).1) f0
    have e1 : pullL hY1'.symm (translF hp₁ h φ) = restr hPc f1 := by
      apply Subtype.ext
      funext y
      change (φ : Fib (p1 D τ e₁) → ℂ) (fibSmul hp₁ h⁻¹ (hY1'.symm y)) = (f0 : Sp k N → ℂ) (act (h⁻¹).1 y.1)
      rw [hφ, first_fibre_homeomorph_smul he₁ hZ, Homeomorph.apply_symm_apply]
    simp only [MonoidHom.comp_apply, MonoidHom.one_apply, Units.val_one, one_mul]
    change Dd (pullL hY1'.symm (translF hp₁ h φ)) = Dd (pullL hY1'.symm φ)
    rw [e1, ← hf0, ← hDd f1, ← hDd f0]
    exact hinv (h⁻¹).1 (h⁻¹).2 f0 ⟨f0.2, Set.subset_univ _⟩
  have hSupp := hDT hFr (GL (Fin N) k) (GzS Z) (GzS (Sx D x₀)) (isClosed_GzS Z) (isClosed_GzS _) (isUnimod_GL hU)
    (hU N Z hZ) (hU N _ hCR) (Ys D τ) (p1 D τ e₁) (p2 D τ hOH hZ hx₀ e₂) (continuous_first_orbit_map he₁) continuous_p2 hp₁ hp₂
    C hCc hCinv hyp E₁ hE₁
  have hz := hSupp (pullL hY1' (restr hPc ⟨f, hf.1⟩)) fun w hw hwC => hw (by
    change f w.1.1.2 = 0
    by_contra hne
    exact hf.2 hne hwC)
  rw [show ξ f = Dd (restr hPc ⟨f, hf.1⟩) from hDd ⟨f, hf.1⟩,
    ← PositivityTheory.PfBern.Loc.pullL_pullL_symm hY1'.symm (restr hPc ⟨f, hf.1⟩)]
  exact hz

end PositivityTheory.RgUd.TP.Desc.Piece.TrI
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TransferOf =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.Transfer =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.Transfer", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.DoubleTransfer\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.OrbClosed\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TransferOf\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.TP.Desc.Piece.PTr

open PositivityTheory.RgUd.TP.Desc.Piece

theorem transfer (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] : Transfer k :=
  TrI.transfer_of k TrDbl.doubleTransfer (TrOrb.orbHom k) (TrOrb.orbClosed k)

end PositivityTheory.RgUd.TP.Desc.Piece.PTr
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.Transfer =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceGood =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceGood", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.PieceGood\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.FrobProof\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IsClosedRank\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RatioOf\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.RootsFinite\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.Transfer\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.TwFin\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.TP.Desc.Piece.Final

open PositivityTheory.RgUd.TP.Desc

theorem pieceGood (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] :
    PieceGood k :=
  PositivityTheory.RgUd.TP.Desc.Piece.PAsm2.pieceGood_of k PositivityTheory.PfBern.Frob.frobeniusReciprocity (PositivityTheory.RgUd.TP.Desc.Piece.PSect.sect k)
    (PositivityTheory.RgUd.TP.Desc.Piece.PTop.pieceTop k) (PositivityTheory.RgUd.TP.Desc.Piece.PDich.dich k)
    (PositivityTheory.RgUd.TP.Desc.Piece.PTr.transfer k)

end PositivityTheory.RgUd.TP.Desc.Piece.Final
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceGood =====
