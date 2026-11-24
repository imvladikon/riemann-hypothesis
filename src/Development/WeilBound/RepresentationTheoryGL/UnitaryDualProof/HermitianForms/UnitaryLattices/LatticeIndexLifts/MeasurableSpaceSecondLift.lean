module

public import Mathlib.Analysis.Complex.Circle
public import Mathlib.NumberTheory.LocalField.Basic
public import Development.AbelianVarietyTheory.Proofs.TwistedOperators.AddCharConductorAndHaarIntegersExist
public import Development.AbelianVarietyTheory.Proofs.TwistedOperators.FourierTransformInversionLocalFieldPi
public import Development.AbelianVarietyTheory.Proofs.FoundationProofs.PadicIsNonarchimedeanLocalField
public import Mathlib.MeasureTheory.Measure.Haar.DistribChar
public import Mathlib.Data.Fintype.Order
public import Mathlib.Topology.Instances.Matrix
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsCharacterSeparatingLattice
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexOpenCompactNeZero
public import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality
public import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsGLLastBasisVecMulEq
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.SmoothColumnLifts.SmoothCol
public import Development.AbelianVarietyTheory.Proofs.DivisorProofs.NormalizedAbsDetMulIntegralCompMulVecFinitePlace
public import Mathlib.GroupTheory.Index
public import Mathlib.MeasureTheory.Group.Defs
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HaarMeasureSubgroupRelIndexMul
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.LatticeIndexLifts.AvNonneg
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
import Development.AbelianVarietyTheory.Definitions.Foundations.SimpleSum
import Mathlib.RingTheory.WittVector.IsPoly
import Mathlib.Tactic.ReduceModChar
import Mathlib.Order.CompletePartialOrder
import Mathlib.Tactic.Linter.Style
import Mathlib.RingTheory.PiTensorProduct
import Mathlib.Tactic.Linter.HaveILetI
import Mathlib.Tactic.Polynomial.Basic
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AnnihilatorOpenCompact, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DistribHaarCharEqOneOfValuationEqOne, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOne, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOneStatement, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsOpenCompactLatticeContaining, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LatticeAnnihilatorWithinNhds, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LocalContinuousSectionVecMulOrbit, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexAnnihilatorsDuality, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.LatticeIndexLifts.MeasurableSpaceSecondLift

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AnnihilatorOpenCompact =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AnnihilatorOpenCompact", "h": "module\n\npublic import Mathlib.Analysis.Complex.Circle\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.AbelianVarietyTheory.Proofs.TwistedOperators.AddCharConductorAndHaarIntegersExist\npublic import Development.AbelianVarietyTheory.Proofs.TwistedOperators.FourierTransformInversionLocalFieldPi\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Development.AbelianVarietyTheory.Definitions.Foundations.SimpleSum\npublic import Development.AbelianVarietyTheory.Proofs.FoundationProofs.PadicIsNonarchimedeanLocalField\n\n"}
section -- clump:auto
@[expose] public section

open Matrix GlobalTheory.SplitWeil GlobalTheory.SplitWeil.FourierPi GlobalTheory.RootEx
open scoped Topology

noncomputable section
namespace GlobalTheory.CompanionTheory.CharPerp

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

def perp {n : ℕ} (ψ : AddChar k Circle) (A : AddSubgroup (Fin n → k)) :
    AddSubgroup (Fin n → k) where
  carrier := {ξ | ∀ a ∈ A, ψ (ξ ⬝ᵥ a) = 1}
  zero_mem' := fun a _ => by simp
  add_mem' := fun {x y} hx hy a ha => by
    rw [add_dotProduct, AddChar.map_add_eq_mul, hx a ha, hy a ha, one_mul]
  neg_mem' := fun {x} hx a ha => by
    rw [neg_dotProduct, AddChar.map_neg_eq_inv, hx a ha, inv_one]

theorem isOpen_perp {n : ℕ} (ψ : AddChar k Circle) (hψ : Continuous ψ)
    (A : AddSubgroup (Fin n → k)) (hAc : IsCompact (A : Set (Fin n → k))) :
    IsOpen (perp ψ A : Set (Fin n → k)) := by
  obtain ⟨s, hs⟩ := exists_cball_addChar_eq_one ψ hψ
  have hN : IsOpen ((fun q : (Fin n → k) × (Fin n → k) => q.1 ⬝ᵥ q.2) ⁻¹' cball s) :=
    (isOpen_cball s).preimage continuous_dot
  have hsub : ({0} : Set (Fin n → k)) ×ˢ (A : Set (Fin n → k)) ⊆
      (fun q : (Fin n → k) × (Fin n → k) => q.1 ⬝ᵥ q.2) ⁻¹' cball s := by
    rintro ⟨x, a⟩ ⟨hx, -⟩
    obtain rfl : x = 0 := hx
    simp [cball]
  obtain ⟨u, v, hu, -, h0u, hAv, huv⟩ :=
    generalized_tube_lemma isCompact_singleton hAc hN hsub
  refine AddSubgroup.isOpen_of_mem_nhds (perp ψ A) (g := 0) ?_
  refine Filter.mem_of_superset (hu.mem_nhds (h0u rfl)) fun ξ hξ a ha => ?_
  exact hs _ (huv (Set.mk_mem_prod hξ (hAv ha)))

theorem isClosed_perp {n : ℕ} (ψ : AddChar k Circle) (hψ : Continuous ψ)
    (A : AddSubgroup (Fin n → k)) : IsClosed (perp ψ A : Set (Fin n → k)) := by
  have : (perp ψ A : Set (Fin n → k)) =
      ⋂ a ∈ A, (fun ξ : Fin n → k => ψ (ξ ⬝ᵥ a)) ⁻¹' {1} := by
    ext ξ
    simp [perp]
  rw [this]
  refine isClosed_biInter fun a _ => isClosed_singleton.preimage ?_
  exact hψ.comp (continuous_id.dotProduct continuous_const)

theorem isCompact_perp {n : ℕ} (ψ : AddChar k Circle) (hψ : Continuous ψ) (h1 : ψ ≠ 1)
    (A : AddSubgroup (Fin n → k)) (hAo : IsOpen (A : Set (Fin n → k))) :
    IsCompact (perp ψ A : Set (Fin n → k)) := by
  classical
  obtain ⟨c, hc⟩ := exists_hasConductor_of_continuous ψ hψ h1
  obtain ⟨s, hs⟩ := exists_box_subset (n := Fin n) (hAo.mem_nhds A.zero_mem)
  refine (isCompact_box (n := Fin n) (c * s⁻¹)).of_isClosed_subset (isClosed_perp ψ hψ A) ?_
  intro ξ hξ i _
  by_contra hi
  obtain ⟨t, ht, hne⟩ := hc.exists_ne_one s hi
  have hmem : Pi.single i t ∈ box (Fin n) s := by
    intro j _
    by_cases hj : j = i
    · subst hj; simpa using ht
    · simp [Pi.single_eq_of_ne hj, cball]
  apply hne
  have := hξ _ (hs hmem)
  rwa [dotProduct_single, mul_comm] at this

theorem perp_isOpen_isCompact : ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k]
    [IsNonarchimedeanLocalField k] (ψ : AddChar k Circle), Continuous ψ → ψ ≠ 1 →
    ∀ (n : ℕ) (A : AddSubgroup (Fin n → k)), IsCompact (A : Set (Fin n → k)) →
    IsOpen (A : Set (Fin n → k)) →
    IsOpen {ξ : Fin n → k | ∀ a ∈ A, ψ (ξ ⬝ᵥ a) = 1} ∧
      IsCompact {ξ : Fin n → k | ∀ a ∈ A, ψ (ξ ⬝ᵥ a) = 1} := by
  intro k _ _ _ _ ψ hψ h1 n A hAc hAo
  exact ⟨isOpen_perp ψ hψ A hAc, isCompact_perp ψ hψ h1 A hAo⟩

end GlobalTheory.CompanionTheory.CharPerp
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AnnihilatorOpenCompact =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DistribHaarCharEqOneOfValuationEqOne =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DistribHaarCharEqOneOfValuationEqOne", "h": "module\n\npublic import Mathlib.MeasureTheory.Measure.Haar.DistribChar\npublic import Mathlib.NumberTheory.LocalField.Basic\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open ValuativeRel MeasureTheory Matrix
open scoped Pointwise

namespace GlobalTheory.CompanionTheory.LocalModule

theorem distribHaarChar_eq_one_of_valuation_eq_one :
    ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]
      (u : kˣ), valuation k (u : k) = 1 → distribHaarChar k u = 1 := by
  intro k _ _ _ _ u hu
  borelize k
  have hsc : IsCompact {x : k | valuation k x ≤ 1} :=
    IsNonarchimedeanLocalField.isCompact_closedBall k 1
  have hso : IsOpen {x : k | valuation k x ≤ 1} :=
    Valuation.isOpen_integer (v := valuation k)
  have hus : u • {x : k | valuation k x ≤ 1} = {x : k | valuation k x ≤ 1} := by
    ext x
    rw [Set.mem_smul_set_iff_inv_smul_mem]
    simp only [Set.mem_ofPred_eq, Units.smul_def, smul_eq_mul, map_mul, Units.val_inv_eq_inv_val,
      map_inv₀, hu, inv_one, one_mul]
  have h0 : (Measure.addHaar : Measure k) {x : k | valuation k x ≤ 1} ≠ 0 :=
    (hso.measure_pos Measure.addHaar ⟨0, by simp⟩).ne'
  have hfin : (Measure.addHaar : Measure k) {x : k | valuation k x ≤ 1} ≠ ⊤ := hsc.measure_lt_top.ne
  exact distribHaarChar_eq_of_measure_smul_eq_mul h0 hfin (by rw [hus, ENNReal.coe_one, one_mul])

end GlobalTheory.CompanionTheory.LocalModule
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DistribHaarCharEqOneOfValuationEqOne =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOne =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOne", "h": "module\n\npublic import Mathlib.MeasureTheory.Measure.Haar.DistribChar\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DistribHaarCharEqOneOfValuationEqOne\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open Matrix ValuativeRel MeasureTheory
open scoped Topology

namespace GlobalTheory.CompanionTheory.LocalModule

theorem distribHaarChar_det_eventually_eq_one :
    ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]
      (n : ℕ), ∀ᶠ g in nhds (1 : GL (Fin n) k),
        MeasureTheory.distribHaarChar k (Matrix.GeneralLinearGroup.det g) = 1 := by
  intro k _ _ _ _ n
  have hc : Continuous fun g : GL (Fin n) k => ((Matrix.GeneralLinearGroup.det g : kˣ) : k) := by
    have : (fun g : GL (Fin n) k => ((Matrix.GeneralLinearGroup.det g : kˣ) : k)) =
        fun g : GL (Fin n) k => (g : Matrix (Fin n) (Fin n) k).det := rfl
    rw [this]
    exact Continuous.matrix_det Units.continuous_val
  have hO : IsOpen {x : k | valuation k (x - 1) < 1} := by
    have h : IsOpen {z : k | valuation k z < 1} := by simpa using (valuation k).isOpen_ball 1
    exact h.preimage (continuous_id.sub continuous_const)
  have hm : ∀ᶠ g in nhds (1 : GL (Fin n) k),
      ((Matrix.GeneralLinearGroup.det g : kˣ) : k) ∈ {x : k | valuation k (x - 1) < 1} := by
    refine hc.continuousAt.eventually (hO.mem_nhds ?_)
    simp
  filter_upwards [hm] with g hg
  refine distribHaarChar_eq_one_of_valuation_eq_one k _ ?_
  have hv : valuation k (((Matrix.GeneralLinearGroup.det g : kˣ) : k) - 1) < 1 := hg
  have h1 := Valuation.map_one_add_of_lt (valuation k) hv
  rwa [add_sub_cancel] at h1

end GlobalTheory.CompanionTheory.LocalModule
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOne =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOneStatement =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOneStatement", "h": "module\n\npublic import Mathlib.MeasureTheory.Measure.Haar.DistribChar\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOne\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open Matrix
open scoped Topology

theorem _root_.GlobalTheory.T.eventually_haar_det_eq_one_near_one : ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] (n : ℕ), ∀ᶠ g in nhds (1 : GL (Fin n) k), MeasureTheory.distribHaarChar k (Matrix.GeneralLinearGroup.det g) = 1 := by
  first | exact @GlobalTheory.CompanionTheory.LocalModule.distribHaarChar_det_eventually_eq_one
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOneStatement =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsOpenCompactLatticeContaining =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsOpenCompactLatticeContaining", "h": "module\n\npublic import Mathlib.NumberTheory.LocalField.Basic\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.Order.CompletePartialOrder\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.Data.Fintype.Order\n\n"}
section -- clump:auto
@[expose] public section

open Matrix
open scoped Topology

noncomputable section

namespace GlobalTheory.CompanionTheory.LocalLattice

open ValuativeRel

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

def ballSubgroup (k : Type) [Field k] [ValuativeRel k] (n : ℕ) (γ : ValueGroupWithZero k) :
    AddSubgroup (Fin n → k) where
  carrier := {x | ∀ i, valuation k (x i) ≤ γ}
  zero_mem' := fun i => by simp
  add_mem' := fun {a b} ha hb i =>
    (Valuation.map_add _ _ _).trans (max_le (ha i) (hb i))
  neg_mem' := fun {a} ha i => by simpa using ha i

theorem coe_ballSubgroup (n : ℕ) (γ : ValueGroupWithZero k) :
    (ballSubgroup k n γ : Set (Fin n → k)) =
      Set.univ.pi fun _ => {x : k | valuation k x ≤ γ} := by
  ext x
  simp only [Set.mem_univ_pi, Set.mem_setOf_eq]
  rfl

theorem isCompact_ballSubgroup (n : ℕ) (γ : ValueGroupWithZero k) :
    IsCompact (ballSubgroup k n γ : Set (Fin n → k)) := by
  rw [coe_ballSubgroup]
  exact isCompact_univ_pi fun _ => IsNonarchimedeanLocalField.isCompact_closedBall k γ

theorem isOpen_ballSubgroup (n : ℕ) {γ : ValueGroupWithZero k} (hγ : γ ≠ 0) :
    IsOpen (ballSubgroup k n γ : Set (Fin n → k)) := by
  refine AddSubgroup.isOpen_of_mem_nhds (g := 0) _ ?_
  rw [GlobalTheory.CompanionTheory.LocalLattice.coe_ballSubgroup]
  refine set_pi_mem_nhds Set.finite_univ fun i _ => ?_
  exact (IsValuativeTopology.mem_nhds_zero_iff _).2
    ⟨Units.mk0 γ hγ, fun x (hx : valuation k x < γ) => hx.le⟩

theorem exists_compact_open_addSubgroup (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k]
    [IsNonarchimedeanLocalField k] (n : ℕ) (K : Set (Fin n → k)) (hK : IsCompact K) :
    ∃ A : AddSubgroup (Fin n → k), IsCompact (A : Set (Fin n → k)) ∧
      IsOpen (A : Set (Fin n → k)) ∧ K ⊆ A := by
  have hne : ∀ γ : ValueGroupWithZero k, max γ 1 ≠ 0 :=
    fun γ => ne_of_gt (lt_of_lt_of_le zero_lt_one (le_max_right γ 1))
  have hmono : Monotone fun γ : ValueGroupWithZero k =>
      (GlobalTheory.CompanionTheory.LocalLattice.ballSubgroup k n (max γ 1) : Set (Fin n → k)) :=
    fun γ δ hγδ x hx i => (hx i).trans (max_le_max hγδ le_rfl)
  have hcover : K ⊆ ⋃ γ : ValueGroupWithZero k, (GlobalTheory.CompanionTheory.LocalLattice.ballSubgroup k n (max γ 1) : Set (Fin n → k)) := by
    intro x _
    obtain ⟨γ, hγ⟩ := Finite.exists_le fun i => valuation k (x i)
    exact Set.mem_iUnion.2 ⟨γ, fun i => (hγ i).trans (le_max_left γ 1)⟩
  obtain ⟨γ, hγ⟩ := hK.elim_directed_cover _
    (fun γ => GlobalTheory.CompanionTheory.LocalLattice.isOpen_ballSubgroup n (hne γ)) hcover hmono.directed_le
  exact ⟨_, GlobalTheory.CompanionTheory.LocalLattice.isCompact_ballSubgroup n _, GlobalTheory.CompanionTheory.LocalLattice.isOpen_ballSubgroup n (hne γ), hγ⟩

end GlobalTheory.CompanionTheory.LocalLattice
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsOpenCompactLatticeContaining =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LatticeAnnihilatorWithinNhds =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LatticeAnnihilatorWithinNhds", "h": "module\n\npublic import Mathlib.Analysis.Complex.Circle\npublic import Mathlib.NumberTheory.LocalField.Basic\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.Data.Fintype.Order\n\n"}
section -- clump:auto
@[expose] public section

open Matrix ValuativeRel
open scoped Topology

noncomputable section
namespace GlobalTheory.CompanionTheory.AnnihShrink

theorem exists_ne_zero_valuation_lt (k : Type) [Field k] [ValuativeRel k] [ValuativeRel.IsNontrivial k]
    (γ : ValueGroupWithZero k) (hγ : γ ≠ 0) : ∃ t : k, t ≠ 0 ∧ valuation k t < γ := by
  obtain ⟨γ₀, h0, h1⟩ := ValuativeRel.IsNontrivial.condition (R := k)
  obtain ⟨ε, hε0, hε1⟩ : ∃ ε : ValueGroupWithZero k, ε ≠ 0 ∧ ε < 1 := by
    rcases lt_or_gt_of_ne h1 with h | h
    · exact ⟨γ₀, h0, h⟩
    · exact ⟨γ₀⁻¹, inv_ne_zero h0, inv_lt_one_of_one_lt₀ h⟩
  obtain ⟨t, ht⟩ := valuation_surjective (K := k) (ε * γ)
  have hpos : 0 < γ := zero_lt_iff.mpr hγ
  refine ⟨t, ?_, ?_⟩
  · rw [← (valuation k).ne_zero_iff, ht]
    exact mul_ne_zero hε0 hγ
  · rw [ht]
    exact mul_lt_of_lt_one_left hpos hε1

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

def box (n : ℕ) (b : k) : AddSubgroup (Fin n → k) where
  carrier := {a | ∀ j, valuation k (a j) ≤ valuation k b}
  zero_mem' := fun j => by simp
  add_mem' := fun {x y} hx hy j =>
    ((valuation k).map_add _ _).trans (max_le (hx j) (hy j))
  neg_mem' := fun {x} hx j => by simpa using hx j

theorem isCompact_box (n : ℕ) (b : k) : IsCompact (box n b : Set (Fin n → k)) := by
  have : (box n b : Set (Fin n → k)) =
      Set.univ.pi (fun _ => {y : k | valuation k y ≤ valuation k b}) := by
    ext a
    exact ⟨fun h j _ => h j, fun h j => h j (Set.mem_univ j)⟩
  rw [this]
  exact isCompact_univ_pi fun _ => IsNonarchimedeanLocalField.isCompact_closedBall k _

theorem isOpen_box (n : ℕ) (b : k) (hb : b ≠ 0) : IsOpen (box n b : Set (Fin n → k)) := by
  have hvb : valuation k b ≠ 0 := (Valuation.ne_zero_iff _).2 hb
  have hU : Set.univ.pi (fun _ : Fin n => {y : k | valuation k y < valuation k b}) ∈
      nhds (0 : Fin n → k) :=
    set_pi_mem_nhds Set.finite_univ fun j _ =>
      (IsValuativeTopology.hasBasis_nhds_zero' k).mem_of_mem hvb
  refine (box n b).isOpen_of_mem_nhds (g := 0) (Filter.mem_of_superset hU ?_)
  intro x hx j
  exact (hx j (Set.mem_univ j)).le

theorem exists_compact_open_annihilator_subset :
    ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]
      (ψ : AddChar k Circle), Continuous ψ → ψ ≠ 1 → ∀ (n : ℕ) (U : Set (Fin n → k)),
      U ∈ nhds (0 : Fin n → k) → ∃ A : AddSubgroup (Fin n → k),
        IsCompact (A : Set (Fin n → k)) ∧ IsOpen (A : Set (Fin n → k)) ∧
        {ξ : Fin n → k | ∀ a ∈ A, ψ (ξ ⬝ᵥ a) = 1} ⊆ U := by
  intro k _ _ _ _ ψ _ hne n U hU
  obtain ⟨y₀, hy⟩ : ∃ y : k, ψ y ≠ 1 := by
    by_contra hall
    push Not at hall
    exact hne (AddChar.ext _ _ fun t => by simpa using hall t)
  have hy0 : y₀ ≠ 0 := by
    rintro rfl
    exact hy (by simp)

  obtain ⟨I, V, hV, hIV⟩ : ∃ (I : Set (Fin n)) (V : Fin n → Set k),
      (∀ i, V i ∈ nhds (0 : k)) ∧ I.pi V ⊆ U := by
    rw [nhds_pi, Filter.mem_pi] at hU
    obtain ⟨I, _, V, hV, hIV⟩ := hU
    exact ⟨I, V, hV, hIV⟩
  have hball : ∀ i, ∃ γ : (ValueGroupWithZero k)ˣ, {y : k | valuation k y < γ} ⊆ V i := fun i =>
    (IsValuativeTopology.mem_nhds_zero_iff (V i)).1 (hV i)
  choose g hg using hball
  obtain ⟨γ, hγ0, hγ⟩ : ∃ γ : ValueGroupWithZero k, γ ≠ 0 ∧ ∀ i, γ ≤ (g i : ValueGroupWithZero k) := by
    obtain ⟨m, hm⟩ := Finite.exists_ge g
    exact ⟨m, m.ne_zero, fun i => Units.val_le_val.2 (hm i)⟩
  obtain ⟨t, ht0, ht⟩ := exists_ne_zero_valuation_lt k γ hγ0
  refine ⟨box n (y₀ / t), isCompact_box n _, isOpen_box n _ (div_ne_zero hy0 ht0), ?_⟩
  intro ξ hξ
  apply hIV
  intro i _
  apply hg i
  show valuation k (ξ i) < g i
  refine lt_of_lt_of_le ?_ (hγ i)
  by_contra hlt
  have hle : γ ≤ valuation k (ξ i) := not_lt.mp hlt
  have hvξ : valuation k (ξ i) ≠ 0 := (lt_of_lt_of_le (zero_lt_iff.mpr hγ0) hle).ne'
  have hξi : ξ i ≠ 0 := (Valuation.ne_zero_iff _).1 hvξ
  have hmem : (Pi.single i (y₀ / ξ i) : Fin n → k) ∈ box n (y₀ / t) := by
    intro j
    by_cases h : j = i
    · subst h
      have he : y₀ / ξ j = (y₀ / t) * (t / ξ j) := by field_simp
      rw [Pi.single_eq_same, he, map_mul]
      refine mul_le_of_le_one_right' ?_
      rw [map_div₀]
      exact (div_le_one₀ (zero_lt_iff.mpr hvξ)).2 (ht.le.trans hle)
    · simp [Pi.single_eq_of_ne h]
  have h1 := hξ _ hmem
  rw [dotProduct_single, mul_div_cancel₀ _ hξi] at h1
  exact hy h1

end GlobalTheory.CompanionTheory.AnnihShrink
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LatticeAnnihilatorWithinNhds =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LocalContinuousSectionVecMulOrbit =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LocalContinuousSectionVecMulOrbit", "h": "module\n\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Mathlib.Topology.Instances.Matrix\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.PiTensorProduct\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open Matrix
open scoped Topology

namespace GlobalTheory.CompanionTheory.OrbitSection

section Shear

variable {k : Type} [Field k] {n : ℕ}

noncomputable def shear (j : Fin n) (c : k) (ζ ξ : Fin n → k) : Matrix (Fin n) (Fin n) k :=
  1 + c • vecMulVec (Pi.single j 1) (ξ - ζ)

theorem shear_mul_shear (j : Fin n) (ζ ξ : Fin n → k) (h0 : ζ j ≠ 0) (h1 : ξ j ≠ 0) :
    shear j (ζ j)⁻¹ ζ ξ * shear j (-(ξ j)⁻¹) ζ ξ = 1 := by
  have hE : vecMulVec (Pi.single j (1 : k)) (ξ - ζ) * vecMulVec (Pi.single j 1) (ξ - ζ)
      = (ξ j - ζ j) • vecMulVec (Pi.single j (1 : k)) (ξ - ζ) := by
    rw [vecMulVec_mul_vecMulVec, vecMulVec_smul]
    simp
  have hc : (ζ j)⁻¹ + -(ξ j)⁻¹ + (ζ j)⁻¹ * -(ξ j)⁻¹ * (ξ j - ζ j) = 0 := by
    field_simp
    ring
  have key : ∀ E : Matrix (Fin n) (Fin n) k, E * E = (ξ j - ζ j) • E →
      (1 + (ζ j)⁻¹ • E) * (1 + (-(ξ j)⁻¹) • E) = 1 := by
    intro E hEE
    have : (1 + (ζ j)⁻¹ • E) * (1 + (-(ξ j)⁻¹) • E)
        = 1 + ((ζ j)⁻¹ + -(ξ j)⁻¹ + (ζ j)⁻¹ * -(ξ j)⁻¹ * (ξ j - ζ j)) • E := by
      simp only [add_mul, mul_add, one_mul, mul_one, smul_mul_assoc, mul_smul_comm, hEE]
      module
    rw [this, hc, zero_smul, add_zero]
  exact key _ hE

theorem vecMul_shear (j : Fin n) (ζ ξ : Fin n → k) (h0 : ζ j ≠ 0) :
    ζ ᵥ* shear j (ζ j)⁻¹ ζ ξ = ξ := by
  have : ζ ᵥ* vecMulVec (Pi.single j (1 : k)) (ξ - ζ) = (ζ j) • (ξ - ζ) := by
    rw [vecMul_vecMulVec]
    simp
  rw [shear, vecMul_add, vecMul_one, vecMul_smul, this, smul_smul, inv_mul_cancel₀ h0, one_smul]
  abel

theorem shear_self (j : Fin n) (c : k) (ζ : Fin n → k) : shear j c ζ ζ = 1 := by
  simp [shear]


open scoped Classical in
open Classical in
noncomputable def orbitSection (j : Fin n) (ζ ξ : Fin n → k) : GL (Fin n) k :=
  if h : ζ j ≠ 0 ∧ ξ j ≠ 0 then
    ⟨shear j (ζ j)⁻¹ ζ ξ, shear j (-(ξ j)⁻¹) ζ ξ, shear_mul_shear j ζ ξ h.1 h.2,
      mul_eq_one_comm.mp (shear_mul_shear j ζ ξ h.1 h.2)⟩
  else 1

theorem coe_orbitSection (j : Fin n) (ζ ξ : Fin n → k) (h0 : ζ j ≠ 0) (h1 : ξ j ≠ 0) :
    (orbitSection j ζ ξ : Matrix (Fin n) (Fin n) k) = shear j (ζ j)⁻¹ ζ ξ := by
  rw [orbitSection, dite_eq_left ⟨h0, h1⟩]

theorem coe_orbitSection_inv (j : Fin n) (ζ ξ : Fin n → k) (h0 : ζ j ≠ 0) (h1 : ξ j ≠ 0) :
    ((orbitSection j ζ ξ)⁻¹ : (Matrix (Fin n) (Fin n) k)ˣ).val = shear j (-(ξ j)⁻¹) ζ ξ := by
  rw [orbitSection, dite_eq_left ⟨h0, h1⟩]
  rfl

end Shear

section Top

variable {k : Type} [Field k] [TopologicalSpace k] [IsTopologicalDivisionRing k] {n : ℕ}

theorem continuousOn_shear (j : Fin n) (ζ : Fin n → k) {N : Set (Fin n → k)} {c : (Fin n → k) → k}
    (hc : ContinuousOn c N) : ContinuousOn (fun ξ => shear j (c ξ) ζ ξ) N := by
  refine continuousOn_pi.2 fun a => continuousOn_pi.2 fun b => ?_
  simp only [shear, Matrix.add_apply, Matrix.smul_apply, vecMulVec_apply, Pi.sub_apply, smul_eq_mul]
  refine continuousOn_const.add (hc.mul (continuousOn_const.mul ?_))
  exact ((continuous_apply b).sub continuous_const).continuousOn

theorem continuousOn_orbitSection (j : Fin n) (ζ : Fin n → k) (h0 : ζ j ≠ 0) :
    ContinuousOn (orbitSection j ζ) {ξ | ξ j ≠ 0} := by
  have hinv : ContinuousOn (fun ξ : Fin n → k => -(ξ j)⁻¹) {ξ | ξ j ≠ 0} :=
    (((continuous_apply j).continuousOn).inv₀ fun ξ h => h).neg
  rw [continuousOn_iff_continuous_restrict, Units.continuous_iff]
  refine ⟨(continuousOn_iff_continuous_restrict.1
      (continuousOn_shear j ζ (c := fun _ => (ζ j)⁻¹) continuousOn_const)).congr fun ξ => ?_,
    (continuousOn_iff_continuous_restrict.1 (continuousOn_shear j ζ hinv)).congr fun ξ => ?_⟩
  · exact (coe_orbitSection j ζ ξ.1 h0 ξ.2).symm
  · exact (coe_orbitSection_inv j ζ ξ.1 h0 ξ.2).symm

end Top

theorem exists_local_section : ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] (n : ℕ) (ζ : Fin n → k), ζ ≠ 0 → ∃ N : Set (Fin n → k), IsOpen N ∧ ζ ∈ N ∧ ∃ f : (Fin n → k) → GL (Fin n) k, ContinuousOn f N ∧ f ζ = 1 ∧ ∀ ξ ∈ N, ζ ᵥ* (f ξ : Matrix (Fin n) (Fin n) k) = ξ := by
  intro k _ _ _ _ n ζ hζ
  haveI : T2Space k := by
    letI := IsTopologicalAddGroup.rightUniformSpace k
    haveI := isUniformAddGroup_of_addCommGroup (G := k)
    infer_instance
  obtain ⟨j, hj⟩ := Function.ne_iff.mp hζ
  have hj' : ζ j ≠ 0 := hj
  refine ⟨{ξ | ξ j ≠ 0}, isOpen_ne.preimage (continuous_apply j), hj', orbitSection j ζ,
    continuousOn_orbitSection j ζ hj', ?_, fun ξ hξ => ?_⟩
  · apply Units.ext
    rw [coe_orbitSection j ζ ζ hj' hj', shear_self]
    rfl
  · rw [coe_orbitSection j ζ ξ hj' hξ, vecMul_shear j ζ ξ hj']

end GlobalTheory.CompanionTheory.OrbitSection
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LocalContinuousSectionVecMulOrbit =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexAnnihilatorsDuality =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexAnnihilatorsDuality", "h": "module\n\npublic import Mathlib.Analysis.Complex.Circle\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsCharacterSeparatingLattice\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexOpenCompactNeZero\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\npublic import Mathlib.Analysis.Fourier.FiniteAbelian.PontryaginDuality\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open Matrix
open scoped Topology

noncomputable section
namespace GlobalTheory.CompanionTheory.IndexDuality

theorem relIndex_le_of_pairing {X Y : Type} [AddCommGroup X] [AddCommGroup Y]
    (b : X → Y → Circle)
    (hl : ∀ x x' y, b (x + x') y = b x y * b x' y)
    (hr : ∀ x y y', b x (y + y') = b x y * b x y')
    (H₀ H : AddSubgroup Y) (R₀ R : AddSubgroup X)
    (hfin : H₀.relIndex H ≠ 0)
    (hann : ∀ x ∈ R₀, ∀ y ∈ H₀, b x y = 1)
    (hsep : ∀ x ∈ R₀, (∀ y ∈ H, b x y = 1) → x ∈ R) :
    R.relIndex R₀ ≠ 0 ∧ R.relIndex R₀ ≤ H₀.relIndex H := by
  classical
  have hQfin : Finite (H ⧸ H₀.addSubgroupOf H) := Nat.finite_of_card_ne_zero hfin
  have hb0 : ∀ x, b x 0 = 1 := by
    intro x
    have h := hr x 0 0
    rw [add_zero] at h
    exact (mul_left_cancel (a := b x 0) (by rw [mul_one]; exact h)).symm
  have hb0' : ∀ y, b 0 y = 1 := by
    intro y
    have h := hl 0 0 y
    rw [add_zero] at h
    exact (mul_left_cancel (a := b 0 y) (by rw [mul_one]; exact h)).symm
  let f : R₀ → H →+ Additive Circle := fun x =>
    { toFun := fun y => Additive.ofMul (b x y)
      map_zero' := by simp [hb0]
      map_add' := fun y y' => by simp [hr] }
  have hker : ∀ x : R₀, ∀ y ∈ H₀.addSubgroupOf H, f x y = 0 := by
    intro x y hy
    rw [AddSubgroup.mem_addSubgroupOf] at hy
    simp [f, hann x x.2 y hy]
  let g : R₀ → (H ⧸ H₀.addSubgroupOf H) →+ Additive Circle := fun x =>
    QuotientAddGroup.lift (H₀.addSubgroupOf H) (f x) (hker x)
  let χ : R₀ → AddChar (H ⧸ H₀.addSubgroupOf H) Circle := fun x =>
    { toFun := fun q => Additive.toMul (g x q)
      map_zero_eq_one' := by simp
      map_add_eq_mul' := fun q q' => by simp [map_add (f := _)] }
  have hχ : ∀ (x : R₀) (y : H), χ x (QuotientAddGroup.mk y) = b x y := fun x y => rfl
  let Ψ : R₀ →+ AddChar (H ⧸ H₀.addSubgroupOf H) Circle :=
    { toFun := χ
      map_zero' := by
        ext1 q
        induction q using QuotientAddGroup.induction_on with
        | H y =>
          rw [hχ]
          exact hb0' y
      map_add' := fun x x' => by
        ext1 q
        induction q using QuotientAddGroup.induction_on with
        | H y =>
          rw [hχ]
          change b (x + x') y = (χ x * χ x') (QuotientAddGroup.mk y)
          rw [AddChar.mul_apply, hχ, hχ]
          exact hl x x' y }
  have hkerle : Ψ.ker ≤ R.addSubgroupOf R₀ := by
    intro x hx
    rw [AddMonoidHom.mem_ker] at hx
    rw [AddSubgroup.mem_addSubgroupOf]
    refine hsep x x.2 (fun y hy => ?_)
    have := congrArg (fun φ : AddChar (H ⧸ H₀.addSubgroupOf H) Circle => φ (QuotientAddGroup.mk ⟨y, hy⟩)) hx
    simpa [Ψ, hχ] using this
  have : Fintype (H ⧸ H₀.addSubgroupOf H) := Fintype.ofFinite _
  have hinjC : Function.Injective fun φ : AddChar (H ⧸ H₀.addSubgroupOf H) Circle => Circle.coeHom.compAddChar φ :=
    MonoidHom.compAddChar_injective_right _ Circle.coe_injective
  have : Finite (AddChar (H ⧸ H₀.addSubgroupOf H) Circle) := Finite.of_injective _ hinjC
  have hcardC : Nat.card (AddChar (H ⧸ H₀.addSubgroupOf H) Circle) ≤ H₀.relIndex H := by
    have h1 := Nat.card_le_card_of_injective _ hinjC
    rw [Nat.card_eq_fintype_card (α := AddChar (H ⧸ H₀.addSubgroupOf H) ℂ), AddChar.card_eq,
      ← Nat.card_eq_fintype_card] at h1
    exact h1
  have : Finite (R₀ ⧸ Ψ.ker) := Finite.of_injective _ (QuotientAddGroup.kerLift_injective Ψ)
  have hkerfin : Ψ.ker.index ≤ Nat.card (AddChar (H ⧸ H₀.addSubgroupOf H) Circle) :=
    Nat.card_le_card_of_injective _ (QuotientAddGroup.kerLift_injective Ψ)
  have hker0 : Ψ.ker.index ≠ 0 := AddSubgroup.index_ne_zero_of_finite
  have hdvd := AddSubgroup.index_dvd_of_le hkerle
  have hR0 : (R.addSubgroupOf R₀).index ≠ 0 := fun h0 => hker0 (Nat.eq_zero_of_zero_dvd (h0 ▸ hdvd))
  refine ⟨hR0, ?_⟩
  exact (Nat.le_of_dvd (Nat.pos_of_ne_zero hker0) hdvd).trans (hkerfin.trans hcardC)

theorem relIndex_annihilator_eq : ∀ (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k]
    [IsNonarchimedeanLocalField k] (ψ : AddChar k Circle), Continuous ψ → ψ ≠ 1 →
    ∀ (n : ℕ) (A₀ A P₀ P : AddSubgroup (Fin n → k)), IsCompact (A₀ : Set (Fin n → k)) →
    IsOpen (A₀ : Set (Fin n → k)) → IsCompact (A : Set (Fin n → k)) →
    IsOpen (A : Set (Fin n → k)) → A₀ ≤ A → (∀ ξ, ξ ∈ P₀ ↔ ∀ a ∈ A₀, ψ (ξ ⬝ᵥ a) = 1) →
    (∀ ξ, ξ ∈ P ↔ ∀ a ∈ A, ψ (ξ ⬝ᵥ a) = 1) → P.relIndex P₀ = A₀.relIndex A := by
  intro k _ _ _ _ ψ hψc hψ1 n A₀ A P₀ P hA₀c hA₀o hAc hAo hle hP₀ hP
  have hfin : A₀.relIndex A ≠ 0 :=
    GlobalTheory.CompanionTheory.RelIndex.relIndex_ne_zero_of_isCompact_of_isOpen A A₀ hAc hA₀o hle
  have h1 := relIndex_le_of_pairing (fun ξ a : Fin n → k => ψ (ξ ⬝ᵥ a))
    (fun ξ ξ' a => by simp [add_dotProduct, AddChar.map_add_eq_mul])
    (fun ξ a a' => by simp [dotProduct_add, AddChar.map_add_eq_mul])
    A₀ A P₀ P hfin (fun ξ hξ a ha => (hP₀ ξ).mp hξ a ha) (fun ξ _ h => (hP ξ).mpr h)
  have h2 := relIndex_le_of_pairing (fun a ξ : Fin n → k => ψ (ξ ⬝ᵥ a))
    (fun a a' ξ => by simp [dotProduct_add, AddChar.map_add_eq_mul])
    (fun a ξ ξ' => by simp [add_dotProduct, AddChar.map_add_eq_mul])
    P P₀ A A₀ h1.1 (fun a _ ξ hξ => (hP ξ).mp hξ a ‹_›) (fun a _ h => by
      by_contra hna
      obtain ⟨η, hη, hne⟩ := GlobalTheory.CompanionTheory.CharacterBiduality.exists_annihilator_ne k ψ hψc hψ1 n A₀ hA₀c hA₀o a hna
      exact hne (h η ((hP₀ η).mpr hη)))
  exact le_antisymm h1.2 h2.2

end GlobalTheory.CompanionTheory.IndexDuality
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexAnnihilatorsDuality =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.LatticeIndexLifts.MeasurableSpaceSecondLift =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.LatticeIndexLifts.MeasurableSpaceSecondLift", "h": "module\n\npublic import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsGLLastBasisVecMulEq\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.SmoothColumnLifts.SmoothCol\npublic import Development.AbelianVarietyTheory.Proofs.DivisorProofs.NormalizedAbsDetMulIntegralCompMulVecFinitePlace\npublic import Mathlib.Analysis.Complex.Circle\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AnnihilatorOpenCompact\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.EventuallyHaarDetEqOneNearOneStatement\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsOpenCompactLatticeContaining\npublic import Mathlib.GroupTheory.Index\npublic import Mathlib.MeasureTheory.Group.Defs\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HaarMeasureSubgroupRelIndexMul\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LatticeAnnihilatorWithinNhds\npublic import Mathlib.Topology.Instances.Matrix\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LocalContinuousSectionVecMulOrbit\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RelIndexAnnihilatorsDuality\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.LatticeIndexLifts.AvNonneg\nimport Development.AbelianVarietyTheory.Proofs.FoundationProofs.PadicIsNonarchimedeanLocalField\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix MeasureTheory GlobalTheory.SplitWeil GlobalTheory.BZMir Filter
open scoped Topology ENNReal NNReal

namespace PositivityTheory.RgUd.Form.U.Lift2

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

section Lattices

variable (ψ : AddChar k Circle) {n : ℕ}

theorem perp_open (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {A : AddSubgroup (Fin n → k)} (hA : Lat A) :
    IsOpen (perp ψ A : Set (Fin n → k)) := (_root_.GlobalTheory.CompanionTheory.CharPerp.perp_isOpen_isCompact k ψ hψ hψ1 n A hA.1 hA.2).1

theorem perp_compact (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {A : AddSubgroup (Fin n → k)} (hA : Lat A) :
    IsCompact (perp ψ A : Set (Fin n → k)) := (_root_.GlobalTheory.CompanionTheory.CharPerp.perp_isOpen_isCompact k ψ hψ hψ1 n A hA.1 hA.2).2

theorem perp_anti {A A' : AddSubgroup (Fin n → k)} (h : A ≤ A') : perp ψ A' ≤ perp ψ A :=
  fun _ hξ a ha => hξ a (h ha)

theorem perp_relIndex (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {A₀ A : AddSubgroup (Fin n → k)} (h₀ : Lat A₀) (h : Lat A)
    (hle : A₀ ≤ A) : (perp ψ A).relIndex (perp ψ A₀) = A₀.relIndex A :=
  _root_.GlobalTheory.CompanionTheory.IndexDuality.relIndex_annihilator_eq k ψ hψ hψ1 n A₀ A (perp ψ A₀) (perp ψ A) h₀.1 h₀.2 h.1 h.2 hle (fun _ => Iff.rfl) (fun _ => Iff.rfl)

theorem relIndex_ne_zero_of_lat {A₀ A : AddSubgroup (Fin n → k)} (h₀ : Lat A₀) (h : Lat A) : A₀.relIndex A ≠ 0 := by
  haveI : CompactSpace A := isCompact_iff_compactSpace.mp h.1
  have ho : IsOpen ((A₀.addSubgroupOf A : AddSubgroup A) : Set A) := h₀.2.preimage continuous_subtype_val
  haveI := AddSubgroup.quotient_finite_of_isOpen (A₀.addSubgroupOf A) ho
  exact AddSubgroup.index_ne_zero_of_finite

theorem lat_over {K : Set (Fin n → k)} (hK : IsCompact K) : ∃ A : AddSubgroup (Fin n → k), Lat A ∧ K ⊆ A := by
  obtain ⟨A, h1, h2, h3⟩ := _root_.GlobalTheory.CompanionTheory.LocalLattice.exists_compact_open_addSubgroup k n K hK
  exact ⟨A, ⟨h1, h2⟩, h3⟩

theorem lat_shrink (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {U : Set (Fin n → k)} (hU : U ∈ 𝓝 (0 : Fin n → k)) :
    ∃ A : AddSubgroup (Fin n → k), Lat A ∧ (perp ψ A : Set _) ⊆ U := by
  obtain ⟨A, h1, h2, h3⟩ := _root_.GlobalTheory.CompanionTheory.AnnihShrink.exists_compact_open_annihilator_subset k ψ hψ hψ1 n U hU
  exact ⟨A, ⟨h1, h2⟩, h3⟩

theorem lat_sup {A A' : AddSubgroup (Fin n → k)} (h : Lat A) (h' : Lat A') : ∃ A'', Lat A'' ∧ A ≤ A'' ∧ A' ≤ A'' := by
  obtain ⟨B, hB, hB'⟩ := lat_over (h.1.union h'.1)
  exact ⟨B, hB, fun x hx => hB' (Or.inl hx), fun x hx => hB' (Or.inr hx)⟩

end Lattices

section Forms

variable {m : ℕ} {V : Type} [AddCommGroup V] [Module ℂ V]

abbrev md (g : GL (Fin (m + 1)) k) : ℝ := nabs k (Matrix.GeneralLinearGroup.det g)

theorem md_pos (g : GL (Fin (m + 1)) k) : 0 < md g := NNReal.coe_pos.mpr distribHaarChar_pos

theorem md_mul (g h : GL (Fin (m + 1)) k) : md (g * h) = md g * md h := by
  simp [md, nabs, map_mul]

theorem md_inv (g : GL (Fin (m + 1)) k) : md g⁻¹ = (md g)⁻¹ := by
  simp [md, nabs, map_inv]

theorem md_one : md (1 : GL (Fin (m + 1)) k) = 1 := by
  simp [md, nabs]

theorem xz_eq (m : ℕ) : (xz m : Fin (m + 1) → k) = eLast k m := rfl

variable (gl : GL (Fin (m + 1)) k →* (V →ₗ[ℂ] V)) (s : ℝ) (C : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ)

def Ct (g : GL (Fin (m + 1)) k) : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ :=
  (((md g ^ (s + 1) : ℝ) : ℂ)) • (C.compl₂ (gl g⁻¹)).comp (gl g⁻¹)

theorem Ct_apply (g : GL (Fin (m + 1)) k) (v w : V) :
    Ct gl s C g v w = ((md g ^ (s + 1) : ℝ) : ℂ) * C (gl g⁻¹ v) (gl g⁻¹ w) := by
  simp [Ct]


open Classical in
def sect (ξ : Fin (m + 1) → k) : GL (Fin (m + 1)) k :=
  if h : ξ = 0 then 1 else (Classical.choose (_root_.GlobalTheory.CompanionTheory.RowSect.exists_GL_last_row k m ξ h))⁻¹

theorem sect_spec {ξ : Fin (m + 1) → k} (h : ξ ≠ 0) :
    xz m ᵥ* (((sect ξ)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = ξ := by
  rw [sect, dite_eq_right h, inv_inv]
  exact Classical.choose_spec (_root_.GlobalTheory.CompanionTheory.RowSect.exists_GL_last_row k m ξ h)


open Classical in
def Df (ξ : Fin (m + 1) → k) : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ := if ξ = 0 then 0 else Ct gl s C (sect ξ)

theorem Df_zero : Df gl s C (0 : Fin (m + 1) → k) = 0 := by
  simp [Df]

variable {gl s C}

theorem Ct_congr (hC : ∀ p ∈ Mir k m, ∀ v w, C (gl p v) (gl p w) = ((md p ^ (s + 1) : ℝ) : ℂ) * C v w)
    {g h : GL (Fin (m + 1)) k}
    (hgh : xz m ᵥ* ((g⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) =
      xz m ᵥ* ((h⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) :
    Ct gl s C g = Ct gl s C h := by
  set p := h⁻¹ * g with hp_def
  have hp : p⁻¹ ∈ Mir k m := by
    show vecMul (eLast k m) ((p⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = eLast k m
    rw [hp_def, _root_.mul_inv_rev, inv_inv, Units.val_mul, ← vecMul_vecMul, ← xz_eq, hgh, vecMul_vecMul, ← Units.val_mul,
      inv_mul_cancel, Units.val_one, vecMul_one]
  have hg : g = h * p := by rw [hp_def, mul_inv_cancel_left]
  have hgi : g⁻¹ = p⁻¹ * h⁻¹ := by rw [hg, _root_.mul_inv_rev]
  refine LinearMap.ext fun v => LinearMap.ext fun w => ?_
  rw [Ct_apply, Ct_apply, hgi, map_mul, Module.End.mul_apply, Module.End.mul_apply, hC _ hp, ← mul_assoc]
  congr 1
  rw [hg, md_mul, md_inv, ← Complex.ofReal_mul, Real.mul_rpow (md_pos h).le (md_pos p).le,
    Real.inv_rpow (md_pos p).le, mul_assoc, mul_inv_cancel₀ (Real.rpow_pos_of_pos (md_pos p) _).ne', mul_one]

theorem Df_eq (hC : ∀ p ∈ Mir k m, ∀ v w, C (gl p v) (gl p w) = ((md p ^ (s + 1) : ℝ) : ℂ) * C v w)
    {ξ : Fin (m + 1) → k} (hξ : ξ ≠ 0) {g : GL (Fin (m + 1)) k}
    (hg : xz m ᵥ* ((g⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = ξ) :
    Df gl s C ξ = Ct gl s C g := by
  rw [Df, if_neg hξ]
  exact Ct_congr hC ((sect_spec hξ).trans hg.symm)

theorem Df_xz (hC : ∀ p ∈ Mir k m, ∀ v w, C (gl p v) (gl p w) = ((md p ^ (s + 1) : ℝ) : ℂ) * C v w) (v w : V) :
    Df gl s C (xz m) v w = C v w := by
  have h0 : (xz m : Fin (m + 1) → k) ≠ 0 := by
    intro h
    have := congrFun h (Fin.last m)
    simp [xz] at this
  rw [Df_eq hC h0 (g := 1) (by simp), Ct_apply]
  simp [md_one]

end Forms

section Forms2

variable {m : ℕ} {V : Type} [AddCommGroup V] [Module ℂ V] {ψ : AddChar k Circle}
  {col : (Fin (m + 1) → k) → V →ₗ[ℂ] V} {gl : GL (Fin (m + 1)) k →* (V →ₗ[ℂ] V)} {s : ℝ} {C : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ}

theorem circ_mul_conj (z : Circle) : (z : ℂ) * starRingEnd ℂ (z : ℂ) = 1 := by
  rw [Complex.mul_conj, Complex.normSq_eq_norm_sq, Circle.norm_coe]
  norm_num

theorem Ct_herm (hCp : Psd C) (g : GL (Fin (m + 1)) k) (v w : V) :
    Ct gl s C g w v = starRingEnd ℂ (Ct gl s C g v w) := by
  rw [Ct_apply, Ct_apply, hCp.1, map_mul, Complex.conj_ofReal]

theorem Ct_re_nonneg (hCp : Psd C) (g : GL (Fin (m + 1)) k) (v : V) : 0 ≤ (Ct gl s C g v v).re := by
  rw [Ct_apply, Complex.re_ofReal_mul]
  exact mul_nonneg (Real.rpow_nonneg (md_pos g).le _) (hCp.2 _)

theorem Df_herm (hCp : Psd C) (ξ : Fin (m + 1) → k) (v w : V) :
    Df gl s C ξ w v = starRingEnd ℂ (Df gl s C ξ v w) := by
  by_cases h : ξ = 0
  · subst h
    simp [Df_zero]
  · simp only [Df, if_neg h]
    exact Ct_herm hCp _ _ _

theorem Df_re_nonneg (hCp : Psd C) (ξ : Fin (m + 1) → k) (v : V) : 0 ≤ (Df gl s C ξ v v).re := by
  by_cases h : ξ = 0
  · subst h
    simp [Df_zero]
  · simp only [Df, if_neg h]
    exact Ct_re_nonneg hCp _ _

theorem Ct_col (hS : Setup col gl) (hCc : ∀ x v w, C (col x v) w = ((ψ (xz m ⬝ᵥ x) : Circle) : ℂ) * C v w)
    (g : GL (Fin (m + 1)) k) (x : Fin (m + 1) → k) (v w : V) :
    Ct gl s C g (col x v) w =
      ((ψ ((xz m ᵥ* ((g⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) ⬝ᵥ x) : Circle) : ℂ) *
        Ct gl s C g v w := by
  rw [Ct_apply, Ct_apply, hS.conj, hCc, dotProduct_mulVec]
  ring

variable (hS : Setup col gl) (hCp : Psd C)
  (hCc : ∀ x v w, C (col x v) w = ((ψ (xz m ⬝ᵥ x) : Circle) : ℂ) * C v w)
  (hC : ∀ p ∈ Mir k m, ∀ v w, C (gl p v) (gl p w) = ((md p ^ (s + 1) : ℝ) : ℂ) * C v w)
include hS hCc hC

theorem Df_col (ξ x : Fin (m + 1) → k) (v w : V) :
    Df gl s C ξ (col x v) w = ((ψ (ξ ⬝ᵥ x) : Circle) : ℂ) * Df gl s C ξ v w := by
  by_cases h : ξ = 0
  · subst h
    simp [Df_zero]
  · rw [Df_eq hC h (sect_spec h), Ct_col hS hCc, sect_spec h]

include hCp

theorem Df_col_right (ξ x : Fin (m + 1) → k) (v w : V) :
    Df gl s C ξ v (col x w) = starRingEnd ℂ ((ψ (ξ ⬝ᵥ x) : Circle) : ℂ) * Df gl s C ξ v w := by
  rw [Df_herm hCp, Df_col hS hCc hC, map_mul, ← Df_herm hCp]

theorem form_column_invariant (ξ x : Fin (m + 1) → k) (v w : V) : Df gl s C ξ (col x v) (col x w) = Df gl s C ξ v w := by
  rw [Df_col_right hS hCp hCc hC, Df_col hS hCc hC, ← mul_assoc, mul_comm (starRingEnd ℂ _), circ_mul_conj, one_mul]

omit hCp hCc in
theorem Df_gl {ξ : Fin (m + 1) → k} (hξ : ξ ≠ 0) (g : GL (Fin (m + 1)) k) (v w : V) :
    Df gl s C ξ (gl g v) (gl g w) =
      ((md g ^ (s + 1) : ℝ) : ℂ) * Df gl s C (ξ ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) v w := by
  have hξg : ξ ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k) ≠ 0 := by
    intro h0
    apply hξ
    have := congrArg (fun x => x ᵥ* ((g⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) h0
    simpa [vecMul_vecMul, ← Units.val_mul] using this
  have hτ : xz m ᵥ* (((g⁻¹ * sect ξ)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) =
      ξ ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k) := by
    rw [_root_.mul_inv_rev, inv_inv, Units.val_mul, ← vecMul_vecMul, sect_spec hξ]
  rw [Df_eq hC hξ (sect_spec hξ), Df_eq hC hξg hτ, Ct_apply, Ct_apply, ← Module.End.mul_apply, ← Module.End.mul_apply,
    ← map_mul, _root_.mul_inv_rev (g⁻¹) (sect ξ), inv_inv, ← mul_assoc, ← Complex.ofReal_mul]
  congr 2
  rw [md_mul, md_inv, Real.mul_rpow (inv_nonneg.mpr (md_pos g).le) (md_pos (sect ξ)).le, Real.inv_rpow (md_pos g).le,
    ← mul_assoc, mul_inv_cancel₀ (Real.rpow_pos_of_pos (md_pos g) _).ne', one_mul]

omit hS hCc in
theorem Df_ker (Y : Submodule ℂ V) (hY : ∀ g, ∀ y ∈ Y, gl g y ∈ Y) (hCY : ∀ y ∈ Y, ∀ w, C y w = 0)
    (ξ : Fin (m + 1) → k) {y : V} (hy : y ∈ Y) (w : V) : Df gl s C ξ y w = 0 := by
  by_cases h : ξ = 0
  · subst h
    simp [Df_zero]
  · simp only [Df, if_neg h]
    rw [Ct_apply, hCY _ (hY _ _ hy), mul_zero]


omit hCp hCc in
theorem Df_loc {ζ : Fin (m + 1) → k} (hζ : ζ ≠ 0) (v w : V) : ∀ᶠ ξ in 𝓝 ζ, Df gl s C ξ v w = Df gl s C ζ v w := by
  obtain ⟨N, hNo, hζN, f, hf, hf1, hfN⟩ := _root_.GlobalTheory.CompanionTheory.OrbitSection.exists_local_section k (m + 1) ζ hζ
  have hH : {h : GL (Fin (m + 1)) k | gl h v = v} ∩ {h | gl h w = w} ∩ {h | md h = 1} ∈ 𝓝 (1 : GL (Fin (m + 1)) k) := by
    refine Filter.inter_mem (Filter.inter_mem ?_ ?_) ?_
    · exact (hS.smooth_gl v).mem_nhds (by simp)
    · exact (hS.smooth_gl w).mem_nhds (by simp)
    · filter_upwards [GlobalTheory.T.eventually_haar_det_eq_one_near_one k (m + 1)] with h hh
      simp [md, nabs, hh]
  have hfc : ContinuousAt f ζ := hf.continuousAt (hNo.mem_nhds hζN)
  have hpre : f ⁻¹' ({h : GL (Fin (m + 1)) k | gl h v = v} ∩ {h | gl h w = w} ∩ {h | md h = 1}) ∈ 𝓝 ζ :=
    hfc (by rw [hf1]; exact hH)
  filter_upwards [hNo.mem_nhds hζN, hpre] with ξ hξN hξH
  obtain ⟨⟨hv, hw⟩, hd⟩ := hξH
  have hξ : ζ ᵥ* (f ξ : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = ξ := hfN ξ hξN
  have hξ0 : ξ ≠ 0 := by
    intro h0
    apply hζ
    have := congrArg (fun x => x ᵥ* (((f ξ)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) (hξ.trans h0)
    simpa [vecMul_vecMul, ← Units.val_mul] using this
  have hτ : xz m ᵥ* ((((f ξ)⁻¹ * sect ζ)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = ξ := by
    rw [_root_.mul_inv_rev, inv_inv, Units.val_mul, ← vecMul_vecMul, sect_spec hζ, hξ]
  rw [Df_eq hC hξ0 hτ, Df_eq hC hζ (sect_spec hζ), Ct_apply, Ct_apply, _root_.mul_inv_rev, inv_inv, map_mul,
    Module.End.mul_apply, Module.End.mul_apply, hv, hw, md_mul, md_inv, hd, inv_one, one_mul]

end Forms2

section Meas

local instance instMeasK : MeasurableSpace k := borel k
local instance instBorelK : BorelSpace k := ⟨rfl⟩
local instance instSCK : SecondCountableTopology k := GlobalTheory.SplitWeil.secondCountable k

variable {m : ℕ} (ψ : AddChar k Circle) (ν : Measure (Fin (m + 1) → k)) [ν.IsAddHaarMeasure]

theorem meas_perp_index (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {A₀ A : AddSubgroup (Fin (m + 1) → k)} (h₀ : Lat A₀) (h : Lat A)
    (hle : A₀ ≤ A) : ν (perp ψ A₀) = (A₀.relIndex A : ℝ≥0∞) * ν (perp ψ A) := by
  have := _root_.GlobalTheory.CompanionTheory.HaarIndex.measure_eq_relIndex_mul (Fin (m + 1) → k) ν (perp ψ A) (perp ψ A₀) (perp_anti ψ hle)
    (perp_open ψ hψ hψ1 h).measurableSet (by rw [perp_relIndex ψ hψ hψ1 h₀ h hle]; exact relIndex_ne_zero_of_lat h₀ h)
  rw [this, perp_relIndex ψ hψ hψ1 h₀ h hle]

theorem meas_perp_lt_top (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {A : AddSubgroup (Fin (m + 1) → k)} (h : Lat A) :
    ν (perp ψ A) < ∞ := (perp_compact ψ hψ hψ1 h).measure_lt_top

theorem meas_perp_ne_zero (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {A : AddSubgroup (Fin (m + 1) → k)} (h : Lat A) :
    ν (perp ψ A) ≠ 0 := (perp_open ψ hψ hψ1 h).measure_ne_zero ν ⟨0, (perp ψ A).zero_mem⟩

def gT (g : GL (Fin (m + 1)) k) : GL (Fin (m + 1)) k :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero ((g : Matrix (Fin (m + 1)) (Fin (m + 1)) k)ᵀ)
    (by rw [det_transpose]; exact (Matrix.isUnits_det_units g).ne_zero)

theorem md_gT (g : GL (Fin (m + 1)) k) : md (gT g) = md g := by
  have : Matrix.GeneralLinearGroup.det (gT g) = Matrix.GeneralLinearGroup.det g := by
    ext
    simp [gT, Matrix.GeneralLinearGroup.mkOfDetNeZero, det_transpose]
  simp only [md, this]

theorem integral_vecMul (f : (Fin (m + 1) → k) → ℂ) (g : GL (Fin (m + 1)) k) :
    ∫ ξ, f (ξ ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) ∂ν = ((md g)⁻¹ : ℝ) * ∫ ξ, f ξ ∂ν := by
  have h := GlobalTheory.InertLagChar.haarChar_det_mul_integral_comp_mulVec_localField k (m + 1) _ BorelSpace.measurable_eq ν inferInstance (gT g) f
  have h2 : ∀ y : Fin (m + 1) → k, ((gT g : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) *ᵥ y =
      y ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k) := by
    intro y
    simp [gT, Matrix.GeneralLinearGroup.mkOfDetNeZero, mulVec_transpose]
  simp_rw [h2] at h
  have hmd : ((distribHaarChar k (Matrix.GeneralLinearGroup.det (gT g)) : ℝ≥0) : ℝ) = md g := by
    rw [← md_gT]; rfl
  rw [← h, ← mul_assoc, ← Complex.ofReal_mul, hmd, inv_mul_cancel₀ (md_pos g).ne', Complex.ofReal_one, one_mul]

theorem perp_gmap (g : GL (Fin (m + 1)) k) (A : AddSubgroup (Fin (m + 1) → k)) (ξ : Fin (m + 1) → k) :
    ξ ∈ perp ψ (gmap g A) ↔ ξ ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k) ∈ perp ψ A := by
  simp only [mem_perp, gmap, AddSubgroup.mem_map, forall_exists_index, and_imp]
  constructor
  · intro h a ha
    rw [← dotProduct_mulVec]
    exact h _ a ha (by simp)
  · rintro h _ a ha rfl
    simp only [LinearMap.toAddMonoidHom_coe, mulVecLin_apply]
    rw [dotProduct_mulVec]
    exact h a ha

theorem meas_perp_gmap (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) (g : GL (Fin (m + 1)) k) {A : AddSubgroup (Fin (m + 1) → k)}
    (hA : Lat A) : (ν (perp ψ (gmap g A))).toReal = (md g)⁻¹ * (ν (perp ψ A)).toReal := by
  have hmeas : MeasurableSet (perp ψ A : Set (Fin (m + 1) → k)) := (perp_open ψ hψ hψ1 hA).measurableSet
  have hmeas' : MeasurableSet (perp ψ (gmap g A) : Set (Fin (m + 1) → k)) :=
    (perp_open ψ hψ hψ1 (_root_.PositivityTheory.RgUd.Form.U.Lift2.AvA.lat_gmap' g A hA)).measurableSet
  have h := integral_vecMul ν ((perp ψ A : Set (Fin (m + 1) → k)).indicator fun _ => (1 : ℂ)) g
  have hset : (fun ξ => (perp ψ A : Set (Fin (m + 1) → k)).indicator (fun _ => (1 : ℂ))
      (ξ ᵥ* (g : Matrix (Fin (m + 1)) (Fin (m + 1)) k))) =
      (perp ψ (gmap g A) : Set (Fin (m + 1) → k)).indicator fun _ => (1 : ℂ) := by
    funext ξ
    by_cases hξ : ξ ∈ perp ψ (gmap g A)
    · rw [Set.indicator_of_mem hξ, Set.indicator_of_mem ((perp_gmap ψ g A ξ).1 hξ)]
    · rw [Set.indicator_of_notMem hξ, Set.indicator_of_notMem (fun h => hξ ((perp_gmap ψ g A ξ).2 h))]
  rw [hset, integral_indicator_const _ hmeas', integral_indicator_const _ hmeas] at h
  simp only [Complex.real_smul, mul_one] at h
  exact_mod_cast h

end Meas

section Psd

variable {V : Type} [AddCommGroup V] [Module ℂ V]

theorem psd_norm_le (E : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ) (hE : Psd E) (v w : V) : ‖E v w‖ ≤ ((E v v).re + (E w w).re) / 2 := by
  set c := E v w with hc
  by_cases h0 : c = 0
  · rw [h0, norm_zero]
    exact div_nonneg (add_nonneg (hE.2 v) (hE.2 w)) zero_le_two
  have hn : (‖c‖ : ℝ) ≠ 0 := norm_ne_zero_iff.mpr h0
  obtain ⟨z, hz⟩ : ∃ z : ℂ, z = c / (‖c‖ : ℂ) := ⟨_, rfl⟩
  have h := hE.2 (v - z • w)
  have hwv : E w v = starRingEnd ℂ c := hE.1 v w
  have e1 : starRingEnd ℂ z * c = (‖c‖ : ℂ) := by
    rw [hz, map_div₀, Complex.conj_ofReal, div_mul_eq_mul_div, mul_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]
    push_cast
    field_simp
  have e2 : z * starRingEnd ℂ c = (‖c‖ : ℂ) := by
    have := congrArg (starRingEnd ℂ) e1
    rwa [map_mul, Complex.conj_conj, Complex.conj_ofReal] at this
  have e3 : z * starRingEnd ℂ z = 1 := by
    rw [hz, map_div₀, Complex.conj_ofReal, div_mul_div_comm, Complex.mul_conj, Complex.normSq_eq_norm_sq]
    push_cast
    rw [← pow_two]
    exact div_self (pow_ne_zero 2 (by exact_mod_cast hn))
  have hexp : E (v - z • w) (v - z • w) = E v v - (‖c‖ : ℂ) - (‖c‖ : ℂ) + E w w := by
    simp only [map_sub, map_smul, LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.map_smulₛₗ, smul_eq_mul]
    rw [← hc, hwv]
    linear_combination -e1 - e2 + (E w w) * e3
  rw [hexp] at h
  simp only [Complex.add_re, Complex.sub_re, Complex.ofReal_re] at h
  linarith

end Psd

section Main

local instance measurableSpaceSecondLift : MeasurableSpace k := borel k

theorem gmap_gmap_inv {n : ℕ} (g : GL (Fin n) k) (M : AddSubgroup (Fin n → k)) : gmap g (gmap g⁻¹ M) = M := by
  ext x
  simp only [gmap, AddSubgroup.mem_map, LinearMap.toAddMonoidHom_coe, mulVecLin_apply]
  constructor
  · rintro ⟨y, ⟨z, hz, rfl⟩, rfl⟩
    rwa [mulVec_mulVec, ← Units.val_mul, mul_inv_cancel, Units.val_one, one_mulVec]
  · intro hx
    refine ⟨((g⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) *ᵥ x, ⟨x, hx, rfl⟩, ?_⟩
    rw [mulVec_mulVec, ← Units.val_mul, mul_inv_cancel, Units.val_one, one_mulVec]

variable {ψ : AddChar k Circle} (hψ : Continuous ψ) (hψ1 : ψ ≠ 1) {m : ℕ} {V : Type} [AddCommGroup V] [Module ℂ V]
  {col : (Fin (m + 1) → k) → V →ₗ[ℂ] V} {gl : GL (Fin (m + 1)) k →* (V →ₗ[ℂ] V)} (hS : Setup col gl) {s : ℝ}
  {B B' C : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ} {A₀ : AddSubgroup (Fin (m + 1) → k)} (hA₀ : Lat A₀)
  (hBp : Psd B) (hBc : ∀ x v w, B (col x v) (col x w) = B v w)
  (hBg : ∀ g v w, B (gl g v) (gl g w) = ((md g ^ s : ℝ) : ℂ) * B v w)
  (hD : IsD ψ col A₀ B B') (hCp : Psd C) (hCc : ∀ x v w, C (col x v) w = ((ψ (xz m ⬝ᵥ x) : Circle) : ℂ) * C v w)
  (hC : ∀ p ∈ Mir k m, ∀ v w, C (gl p v) (gl p w) = ((md p ^ (s + 1) : ℝ) : ℂ) * C v w)
  (hCB : ∀ v, (C v v).re ≤ (B' v v).re)
  {ν : Measure (Fin (m + 1) → k)} [ν.IsAddHaarMeasure] (hν : ν (perp ψ A₀) = 1)


include hψ hψ1 hS hA₀ hBg hD hCp hC hCB hν in
theorem locB {ζ : Fin (m + 1) → k} (hζ : ζ ≠ 0) (v : V) :
    ∃ M₀ : AddSubgroup (Fin (m + 1) → k), Lat M₀ ∧ ∀ ξ, ξ - ζ ∈ perp ψ M₀ →
      Df gl s C ξ v v = Df gl s C ζ v v ∧ ∀ M, Lat M → M₀ ≤ M →
        (Df gl s C ζ v v).re * (ν (perp ψ M)).toReal ≤ (B (av ψ col ξ M v) v).re := by
  obtain ⟨A₁, hA₁, hA₀₁, hA₁s⟩ := hD (gl (sect ζ)⁻¹ v) (gl (sect ζ)⁻¹ v)
  obtain ⟨N, hNo, hζN, f, hf, hf1, hfN⟩ := _root_.GlobalTheory.CompanionTheory.OrbitSection.exists_local_section k (m + 1) ζ hζ
  have hH : {h : GL (Fin (m + 1)) k | gl h v = v} ∩ {h | md h = 1} ∈ 𝓝 (1 : GL (Fin (m + 1)) k) := by
    refine Filter.inter_mem ((hS.smooth_gl v).mem_nhds (by simp)) ?_
    filter_upwards [GlobalTheory.T.eventually_haar_det_eq_one_near_one k (m + 1)] with h hh
    simp [md, nabs, hh]
  have hfc : ContinuousAt f ζ := hf.continuousAt (hNo.mem_nhds hζN)
  have hW : N ∩ f ⁻¹' ({h : GL (Fin (m + 1)) k | gl h v = v} ∩ {h | md h = 1}) ∈ 𝓝 ζ :=
    Filter.inter_mem (hNo.mem_nhds hζN) (hfc (by rw [hf1]; exact hH))
  have hU : (fun η => ζ + η) ⁻¹' (N ∩ f ⁻¹' ({h : GL (Fin (m + 1)) k | gl h v = v} ∩ {h | md h = 1})) ∈
      𝓝 (0 : Fin (m + 1) → k) := by
    have : Filter.Tendsto (fun η : Fin (m + 1) → k => ζ + η) (𝓝 0) (𝓝 ζ) := by
      have hc : Continuous (fun η : Fin (m + 1) → k => ζ + η) :=
        continuous_const.add continuous_id
      simpa using hc.tendsto (0 : Fin (m + 1) → k)
    exact this hW
  obtain ⟨M₁, hM₁, hM₁U⟩ := lat_shrink ψ hψ hψ1 hU
  have hSc : IsCompact ((fun η => ζ + η) '' (perp ψ M₁ : Set (Fin (m + 1) → k))) :=
    (perp_compact ψ hψ hψ1 hM₁).image (continuous_const.add continuous_id)
  have hSN : (fun η => ζ + η) '' (perp ψ M₁ : Set (Fin (m + 1) → k)) ⊆ N := by
    rintro _ ⟨η, hη, rfl⟩
    exact (hM₁U hη).1
  have hSH : ∀ ξ ∈ (fun η => ζ + η) '' (perp ψ M₁ : Set (Fin (m + 1) → k)), gl (f ξ) v = v ∧ md (f ξ) = 1 := by
    rintro _ ⟨η, hη, rfl⟩
    exact (hM₁U hη).2
  have hKc : IsCompact ((fun p : (Fin (m + 1) → k) × (Fin (m + 1) → k) =>
      ((((f p.1)⁻¹ * sect ζ : GL (Fin (m + 1)) k)) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) *ᵥ p.2) ''
        (((fun η => ζ + η) '' (perp ψ M₁ : Set (Fin (m + 1) → k))) ×ˢ (A₁ : Set (Fin (m + 1) → k)))) := by
    refine (hSc.prod hA₁.1).image_of_continuousOn ?_
    have h1 : ContinuousOn (fun p : (Fin (m + 1) → k) × (Fin (m + 1) → k) => f p.1)
        (((fun η => ζ + η) '' (perp ψ M₁ : Set (Fin (m + 1) → k))) ×ˢ (A₁ : Set (Fin (m + 1) → k))) :=
      (hf.mono hSN).comp continuous_fst.continuousOn (fun p hp => hp.1)
    have h2 := Units.continuous_val.comp_continuousOn (h1.inv.mul continuousOn_const
      (g := fun _ => (sect ζ : GL (Fin (m + 1)) k)))
    exact (continuous_fst.matrix_mulVec continuous_snd).comp_continuousOn (h2.prodMk continuous_snd.continuousOn)
  obtain ⟨M₂, hM₂, hKM₂⟩ := lat_over hKc
  obtain ⟨M₀, hM₀, hM₁M₀, hM₂M₀⟩ := lat_sup hM₁ hM₂
  refine ⟨M₀, hM₀, fun ξ hξ => ?_⟩
  have hξS : ξ ∈ (fun η => ζ + η) '' (perp ψ M₁ : Set (Fin (m + 1) → k)) :=
    ⟨ξ - ζ, perp_anti ψ hM₁M₀ hξ, by abel⟩
  obtain ⟨hhv, hhd⟩ := hSH ξ hξS
  have hζh : ζ ᵥ* (f ξ : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = ξ := hfN ξ (hSN hξS)
  have hg'ξ : xz m ᵥ* ((((f ξ)⁻¹ * sect ζ)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = ξ := by
    rw [_root_.mul_inv_rev, inv_inv, Units.val_mul, ← vecMul_vecMul, sect_spec hζ, hζh]
  have hξ0 : ξ ≠ 0 := by
    intro h0
    apply hζ
    have := congrArg (fun x => x ᵥ* (((f ξ)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k)) (hζh.trans h0)
    simpa [vecMul_vecMul, ← Units.val_mul] using this
  have hu : gl ((f ξ)⁻¹ * sect ζ)⁻¹ v = gl (sect ζ)⁻¹ v := by
    rw [_root_.mul_inv_rev, inv_inv, map_mul, Module.End.mul_apply, hhv]
  have hDg : Df gl s C ξ v v = Ct gl s C ((f ξ)⁻¹ * sect ζ) v v := by rw [Df_eq hC hξ0 hg'ξ]
  have hconst : Df gl s C ξ v v = Df gl s C ζ v v := by
    rw [hDg, Df_eq hC hζ (sect_spec hζ), Ct_apply, Ct_apply, hu, md_mul, md_inv, hhd, inv_one, one_mul]
  refine ⟨hconst, fun M hM hM₀M => ?_⟩
  set g' : GL (Fin (m + 1)) k := (f ξ)⁻¹ * sect ζ with hg'
  have hA : Lat (gmap g'⁻¹ M) := _root_.PositivityTheory.RgUd.Form.U.Lift2.AvA.lat_gmap' _ M hM
  have hA₁A : A₁ ≤ gmap g'⁻¹ M := by
    intro a ha
    have hK : ((g' : Matrix (Fin (m + 1)) (Fin (m + 1)) k) *ᵥ a) ∈ M :=
      hM₀M (hM₂M₀ (hKM₂ ⟨(ξ, a), ⟨hξS, ha⟩, rfl⟩))
    refine AddSubgroup.mem_map.mpr ⟨_, hK, ?_⟩
    simp only [LinearMap.toAddMonoidHom_coe, mulVecLin_apply]
    rw [mulVec_mulVec, ← Units.val_mul, inv_mul_cancel, Units.val_one, one_mulVec]
  have hdens := hA₁s _ hA hA₁A
  have hav := _root_.PositivityTheory.RgUd.Form.U.Lift2.AvA.av_conj' ψ hψ col hS.col_zero hS.col_add hS.smooth_col gl hS.conj g'⁻¹ M hM ξ v
  have hξg' : ξ ᵥ* (((g'⁻¹)⁻¹ : GL (Fin (m + 1)) k) : Matrix (Fin (m + 1)) (Fin (m + 1)) k) = xz m := by
    rw [inv_inv, ← hg'ξ, vecMul_vecMul, ← Units.val_mul, inv_mul_cancel, Units.val_one, vecMul_one]
  rw [hξg', hu] at hav
  rw [← hav, ← hu, hBg] at hdens

  have hmM : (ν (perp ψ M)).toReal = (md g')⁻¹ * (ν (perp ψ (gmap g'⁻¹ M))).toReal := by
    rw [← meas_perp_gmap ψ ν hψ hψ1 g' hA, gmap_gmap_inv]
  have hidx := meas_perp_index ψ ν hψ hψ1 hA₀ hA (hA₀₁.trans hA₁A)
  rw [hν] at hidx
  have hr : ((A₀.relIndex (gmap g'⁻¹ M) : ℕ) : ℝ) * (ν (perp ψ (gmap g'⁻¹ M))).toReal = 1 := by
    have := congrArg ENNReal.toReal hidx
    rw [ENNReal.toReal_mul, ENNReal.toReal_natCast, ENNReal.toReal_one] at this
    exact this.symm
  have hrpos : (0 : ℝ) < (A₀.relIndex (gmap g'⁻¹ M) : ℕ) := by
    exact_mod_cast Nat.pos_of_ne_zero (relIndex_ne_zero_of_lat hA₀ hA)

  have hre1 : (Df gl s C ζ v v).re = md g' ^ (s + 1) * (C (gl g'⁻¹ v) (gl g'⁻¹ v)).re := by
    rw [← hconst, hDg, Ct_apply, Complex.re_ofReal_mul]
  have hre2 : (B' (gl g'⁻¹ v) (gl g'⁻¹ v)).re =
      ((A₀.relIndex (gmap g'⁻¹ M) : ℕ) : ℝ) * (md g'⁻¹ ^ s * (B (av ψ col ξ M v) v).re) := by
    rw [hdens, ← Complex.ofReal_natCast, Complex.re_ofReal_mul, Complex.re_ofReal_mul]
  have hle := hCB (gl g'⁻¹ v)
  set t := md g' with ht
  have htpos : 0 < t := md_pos g'
  set r : ℝ := ((A₀.relIndex (gmap g'⁻¹ M) : ℕ) : ℝ) with hrdef
  set b := (B (av ψ col ξ M v) v).re with hb
  set c := (C (gl g'⁻¹ v) (gl g'⁻¹ v)).re with hc
  set μA := (ν (perp ψ (gmap g'⁻¹ M))).toReal with hμA
  rw [md_inv, ← ht] at hre2
  rw [hre1, hmM]
  have hμA' : μA = r⁻¹ := eq_inv_of_mul_eq_one_left (by rw [mul_comm]; exact hr)
  rw [hμA']
  have hts : t ^ (s + 1) = t ^ s * t := Real.rpow_add_one htpos.ne' s
  have hti : t⁻¹ ^ s = (t ^ s)⁻¹ := Real.inv_rpow htpos.le s
  rw [hti] at hre2
  have htspos : 0 < t ^ s := Real.rpow_pos_of_pos htpos s
  calc t ^ (s + 1) * c * (t⁻¹ * r⁻¹) ≤ t ^ (s + 1) * (r * ((t ^ s)⁻¹ * b)) * (t⁻¹ * r⁻¹) := by
        rw [← hre2]
        gcongr
    _ = b := by
        rw [hts]
        field_simp

end Main

end PositivityTheory.RgUd.Form.U.Lift2
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.LatticeIndexLifts.MeasurableSpaceSecondLift =====
