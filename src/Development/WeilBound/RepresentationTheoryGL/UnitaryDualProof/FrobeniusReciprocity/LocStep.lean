module

public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocStep
public import Mathlib.NumberTheory.LocalField.Basic
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.IsoOfTrace
public import Mathlib.LinearAlgebra.JordanChevalley
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVan
public import Mathlib.LinearAlgebra.Trace
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ContinuousCj
public import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FiberLocalization.EqZeroOfFiberEquivariant
public import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FrobeniusReciprocity.SupportedInIffOfFrob
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.IsClosedGzS
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.NilpotentPowers.IsNilpotentPowSub
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.DistrC
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsQuotientHomeo
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.IsUnimodOfEquiv
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Pieces
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.T2SpaceCentralizerGroup
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.OpenSlices.LatticeIndices.RelIndexLatConj
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.UnimodOfIndexSym
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.FrobProof
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.BernsteinExponentBounds.IsInvForm
import Mathlib.Algebra.AffineMonoid.UniqueSums
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
import Mathlib.LinearAlgebra.Matrix.FiniteDimensional
import Mathlib.NumberTheory.Chebyshev
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.NumberTheory.LucasLehmer
import Mathlib.NumberTheory.SelbergSieve
import Mathlib.RingTheory.Coalgebra.IsFrobenius
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Radical.NatInt
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.SimpleRing.Principal
import Mathlib.Tactic.Echelon.Zsqrtd
import Mathlib.Tactic.Inclusion.Extension.Core.Core
import Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses
import Mathlib.Tactic.Linter.HaveILetI
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
import Mathlib.RingTheory.TotallySplit
import Mathlib.RingTheory.Coalgebra.CoassocSimps
import Mathlib.Tactic.Linter.Style
import Mathlib.Algebra.Module.StablyFree.Basic
import Mathlib.RingTheory.Etale.Weakly
import Mathlib.RingTheory.WittVector.IsPoly
import Mathlib.Tactic.Polynomial.Basic
import Mathlib.Tactic.ReduceModChar
import Std.Tactic.BVDecide.Normalize.Prop
import GroundTheory.AutomorphicForms.GLnLocal
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.Topology.Baire.LocallyCompactRegular
import Mathlib.Topology.Separation.CompletelyRegular
import Mathlib.Topology.Separation.Connected
import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocalContinuity.LocalDescentHolds
import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.NilpotentOrbits.NilpB

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.AdjointSemisimple.AdjunctionCharZero, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.CoefficientTraces.TraceAllHolds, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.LinearConjugation.ToLinAlgEquivEq, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.NilpotentTraces.TrNil, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.RestrictionHomomorphisms.ResHomApply, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.MemBzOfAdjoin, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.CharpolyNilpotence.IsNilpotentAevalCharpoly, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsConjEqSemisimple, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SemisimpleAdjoint.IsSemisimpleOfMem, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SliceVanOfFrob, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.Imports, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.DescFinal, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.LocStep

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.AdjointSemisimple.AdjunctionCharZero =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.AdjointSemisimple.AdjunctionCharZero", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocStep\npublic import Mathlib.NumberTheory.LocalField.Basic\nimport Mathlib.Algebra.AffineMonoid.UniqueSums\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.T.AdjPf

open Module PositivityTheory.RgUd.T

theorem dc {k : Type} [Field k] {n : ℕ} (Z : Subalgebra k (Matrix (Fin n) (Fin n) k))
    (hc : ∀ a ∈ Z, ∀ b ∈ Z, a * b = b * a) (hr : IsReduced Z) (x : Matrix (Fin n) (Fin n) k)
    (hx : ∀ y ∈ Subalgebra.centralizer k (Z : Set (Matrix (Fin n) (Fin n) k)), x * y = y * x) : x ∈ Z := by
  classical
  haveI : IsReduced Z := hr
  letI : CommRing Z := { (inferInstance : Ring Z) with
    mul_comm := fun a b => Subtype.ext (hc a.1 a.2 b.1 b.2) }
  haveI : IsArtinianRing Z := IsArtinianRing.of_finite k Z
  haveI : IsSemisimpleRing Z := IsArtinianRing.isSemisimpleRing_of_isReduced Z
  haveI : IsSemisimpleModule Z (Fin n → k) := inferInstance
  have key : ∀ g : Module.End Z (Fin n → k), ∀ v : Fin n → k,
      Matrix.mulVec x (g v) = g (Matrix.mulVec x v) := by
    intro g v
    set y := LinearMap.toMatrix' (g.restrictScalars k) with hydef
    have hyv : ∀ w, Matrix.mulVec y w = g w := fun w => by
      rw [← Matrix.toLin'_apply, hydef, Matrix.toLin'_toMatrix']
      rfl
    have hy : y ∈ Subalgebra.centralizer k (Z : Set (Matrix (Fin n) (Fin n) k)) := by
      rw [Subalgebra.mem_centralizer_iff]
      intro a ha
      apply Matrix.toLin'.injective
      apply LinearMap.ext
      intro w
      rw [Matrix.toLin'_apply, Matrix.toLin'_apply, ← Matrix.mulVec_mulVec, ← Matrix.mulVec_mulVec,
        hyv, hyv]
      exact (g.map_smul ⟨a, ha⟩ w).symm
    rw [← hyv, ← hyv, Matrix.mulVec_mulVec, Matrix.mulVec_mulVec, hx y hy]
  let f : Module.End (Module.End Z (Fin n → k)) (Fin n → k) :=
    { toFun := fun v => Matrix.mulVec x v
      map_add' := Matrix.mulVec_add x
      map_smul' := fun g v => key g v }
  obtain ⟨r, hr'⟩ := jacobson_density (R := Z) f
    (Finset.univ.image (fun i : Fin n => (Pi.single i (1 : k) : Fin n → k)))
  have hxr : x = (r : Matrix (Fin n) (Fin n) k) := by
    apply Matrix.toLin'.injective
    refine LinearMap.pi_ext' fun i => LinearMap.ext_ring ?_
    simp only [LinearMap.comp_apply, LinearMap.coe_single, Matrix.toLin'_apply]
    exact hr' _ (Finset.mem_image_of_mem _ (Finset.mem_univ i))
  rw [hxr]
  exact r.2

theorem isSemisimple_of_mem {k : Type} [Field k] {n : ℕ} (Z : Subalgebra k (Matrix (Fin n) (Fin n) k))
    (hr : IsReduced Z) (z : Matrix (Fin n) (Fin n) k) (hz : z ∈ Z) :
    Module.End.IsSemisimple (Matrix.toLin' z) := by
  set w : Z := ⟨z, hz⟩ with hw
  have hint : IsIntegral k w := IsIntegral.of_finite k w
  have hm0 : minpoly k w ≠ 0 := minpoly.ne_zero hint
  refine Module.End.isSemisimple_of_squarefree_aeval_eq_zero (p := minpoly k w) ?_ ?_
  · intro x hx
    obtain ⟨r, hr⟩ := hx
    have h1 : Polynomial.aeval w (x * r) = 0 := by
      apply IsReduced.eq_zero
      refine ⟨2, ?_⟩
      rw [pow_two, ← map_mul]
      have hsq : x * r * (x * r) = minpoly k w * r := by rw [hr]; ring
      rw [hsq, map_mul, minpoly.aeval, zero_mul]
    have h2 : minpoly k w ∣ x * r := minpoly.dvd k w h1
    have hxr : x * r ≠ 0 := by
      intro h
      apply hm0
      rw [hr, mul_assoc, h, mul_zero]
    rw [hr, mul_assoc] at h2
    have h3 : x * (x * r) ∣ 1 * (x * r) := by rwa [one_mul]
    exact isUnit_of_dvd_one ((mul_dvd_mul_iff_right hxr).mp h3)
  · have h0 : Polynomial.aeval z (minpoly k w) = 0 := by
      have h := congrArg Z.val (minpoly.aeval k w)
      rwa [map_zero, ← Polynomial.aeval_algHom_apply] at h
    have h4 := Polynomial.aeval_algHom_apply
      (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).toAlgHom z (minpoly k w)
    rw [h0, map_zero] at h4
    exact h4

end PositivityTheory.RgUd.T.AdjPf

namespace PositivityTheory.RgUd.T

open Module

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem adjunction_char_zero [CharZero k] : Adj (k := k) := by
  intro n Z hZ s hs hsZ hss
  obtain ⟨hc, hr⟩ := hZ
  set S : Set (Matrix (Fin n) (Fin n) k) := insert s (Z : Set (Matrix (Fin n) (Fin n) k)) with hSdef
  have hS : ∀ a ∈ S, ∀ b ∈ S, a * b = b * a := by
    rintro a (rfl | ha) b (rfl | hb)
    · rfl
    · exact (hs b hb).symm
    · exact hs a ha
    · exact hc a ha b hb
  have hSc : S ⊆ Subalgebra.centralizer k S := fun a ha =>
    (Subalgebra.mem_centralizer_iff k).mpr fun g hg => hS g hg a ha
  have hcomm : ∀ a ∈ adj Z s, ∀ b ∈ adj Z s, a * b = b * a := by
    intro a ha b hb
    have ha' : a ∈ Subalgebra.centralizer k S := Algebra.adjoin_le hSc ha
    have hb' : b ∈ Subalgebra.centralizer k (Subalgebra.centralizer k S : Set (Matrix (Fin n) (Fin n) k)) :=
      Algebra.adjoin_le_centralizer_centralizer k S hb
    exact (Subalgebra.mem_centralizer_iff k).mp hb' a ha'
  have hsemi : ∀ x ∈ adj Z s, Module.End.IsSemisimple (Matrix.toLin' x) := by
    intro x hx
    induction hx using Algebra.adjoin_induction with
    | mem x hx =>
      rcases hx with rfl | hx
      · exact hss
      · exact AdjPf.isSemisimple_of_mem Z hr x hx
    | algebraMap r =>
      rw [Algebra.algebraMap_eq_smul_one, map_smul, Matrix.toLin'_one]
      exact Module.End.IsSemisimple_smul r Module.End.isSemisimple_id
    | add x y hx hy ihx ihy =>
      have hcm : Commute (Matrix.toLin' x) (Matrix.toLin' y) := by
        change Matrix.toLin' x * Matrix.toLin' y = Matrix.toLin' y * Matrix.toLin' x
        rw [Module.End.mul_eq_comp, Module.End.mul_eq_comp, ← Matrix.toLin'_mul,
          ← Matrix.toLin'_mul, hcomm x hx y hy]
      rw [map_add (f := _)]
      exact Module.End.IsSemisimple.add_of_commute hcm ihx ihy
    | mul x y hx hy ihx ihy =>
      have hcm : Commute (Matrix.toLin' x) (Matrix.toLin' y) := by
        change Matrix.toLin' x * Matrix.toLin' y = Matrix.toLin' y * Matrix.toLin' x
        rw [Module.End.mul_eq_comp, Module.End.mul_eq_comp, ← Matrix.toLin'_mul,
          ← Matrix.toLin'_mul, hcomm x hx y hy]
      rw [Matrix.toLin'_mul, ← Module.End.mul_eq_comp]
      exact Module.End.IsSemisimple.mul_of_commute hcm ihx ihy
  refine ⟨⟨hcomm, ?_⟩, ?_⟩
  · refine ⟨fun x hx => ?_⟩
    have hxs := hsemi x.1 x.2
    have hn : IsNilpotent (Matrix.toLin' (x : Matrix (Fin n) (Fin n) k)) := by
      obtain ⟨m, hm⟩ := hx
      refine ⟨m, ?_⟩
      have hm' : (x : Matrix (Fin n) (Fin n) k) ^ m = 0 := by
        rw [← Subalgebra.coe_pow, hm, Subalgebra.coe_zero]
      have h5 := congrArg (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)) hm'
      rw [map_pow, map_zero] at h5
      exact h5
    have h6 := Module.End.eq_zero_of_isNilpotent_isSemisimple hn hxs
    exact Subtype.ext ((Matrix.toLin'.map_eq_zero_iff).mp h6)
  · have hsub : (Z : Set (Matrix (Fin n) (Fin n) k)) ⊆ (adj Z s : Set (Matrix (Fin n) (Fin n) k)) :=
      fun z hz => Algebra.subset_adjoin (Set.mem_insert_of_mem _ hz)
    have hle := Subalgebra.centralizer_le k _ _ hsub
    have hne : Subalgebra.centralizer k (adj Z s : Set (Matrix (Fin n) (Fin n) k)) ≠
        Subalgebra.centralizer k (Z : Set (Matrix (Fin n) (Fin n) k)) := by
      intro h
      apply hsZ
      apply AdjPf.dc Z hc hr s
      intro y hy
      rw [← h] at hy
      exact (Subalgebra.mem_centralizer_iff k).mp hy s (Algebra.subset_adjoin (Set.mem_insert _ _))
    have hlt : Subalgebra.toSubmodule (Subalgebra.centralizer k (adj Z s : Set (Matrix (Fin n) (Fin n) k))) <
        Subalgebra.toSubmodule (Subalgebra.centralizer k (Z : Set (Matrix (Fin n) (Fin n) k))) :=
      lt_of_le_of_ne (Subalgebra.toSubmodule.monotone hle)
        (fun h => hne (Subalgebra.toSubmodule_injective h))
    exact Submodule.finrank_lt_finrank_of_lt hlt

end PositivityTheory.RgUd.T
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.AdjointSemisimple.AdjunctionCharZero =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.CoefficientTraces.TraceAllHolds =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.CoefficientTraces.TraceAllHolds", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.IsoOfTrace\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.TotallySplit\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.T.Alg.Trall

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Alg

variable (k : Type) [Field k] [CharZero k]

theorem sum_coeff_trace {n : ℕ} (x z : Matrix (Fin n) (Fin n) k) (p : k[X]) (hp : aeval x p = 0) (m : ℕ) :
    ∑ i ∈ Finset.range (p.natDegree + 1), p.coeff i * trace (z * x ^ (m + i)) = 0 := by
  have h : trace (z * x ^ m * aeval x p) = 0 := by rw [hp, mul_zero, trace_zero]
  rw [aeval_eq_sum_range, Finset.mul_sum, trace_sum] at h
  rw [← h]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [mul_smul_comm, trace_smul, smul_eq_mul, mul_assoc, ← pow_add]

theorem trace_all_holds : TrAll k := by
  intro n Z x x' h z hz j
  have key : ∀ w : Z, ∀ j, j < 2 * n + 1 → trace ((w : Matrix (Fin n) (Fin n) k) * x ^ j) = trace ((w : Matrix (Fin n) (Fin n) k) * x' ^ j) := by
    intro w j hj
    have hw : (w : Matrix (Fin n) (Fin n) k) = ∑ i, (Module.finBasis k Z).repr w i • ((Module.finBasis k Z) i : Matrix (Fin n) (Fin n) k) := by
      nth_rewrite 1 [← (Module.finBasis k Z).sum_repr w]
      simp only [AddSubmonoidClass.coe_finsetSum, SetLike.val_smul]
    rw [hw, Finset.sum_mul, Finset.sum_mul, trace_sum, trace_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [smul_mul_assoc, smul_mul_assoc, trace_smul, trace_smul]
    congr 1
    exact congrFun h (⟨j, hj⟩, i)
  set q := x.charpoly * x'.charpoly with hqdef
  have hqm : q.Monic := x.charpoly_monic.mul x'.charpoly_monic
  have hdeg : q.natDegree = 2 * n := by
    rw [hqdef, x.charpoly_monic.natDegree_mul x'.charpoly_monic, charpoly_natDegree_eq_dim, charpoly_natDegree_eq_dim, Fintype.card_fin]
    ring
  have hx0 : aeval x q = 0 := by rw [hqdef, map_mul, aeval_self_charpoly, zero_mul]
  have hx'0 : aeval x' q = 0 := by rw [hqdef, map_mul, aeval_self_charpoly, mul_zero]
  have hrec : ∀ m, ∑ i ∈ Finset.range (2 * n + 1), q.coeff i * (trace (z * x ^ (m + i)) - trace (z * x' ^ (m + i))) = 0 := by
    intro m
    have h1 := sum_coeff_trace k x z q hx0 m
    have h2 := sum_coeff_trace k x' z q hx'0 m
    rw [hdeg] at h1 h2
    simp only [mul_sub, Finset.sum_sub_distrib, h1, h2, sub_zero]
  have hlead : q.coeff (2 * n) = 1 := by
    rw [← hdeg]
    exact hqm
  suffices hall : ∀ j, trace (z * x ^ j) - trace (z * x' ^ j) = 0 from sub_eq_zero.mp (hall j)
  intro j
  induction j using Nat.strong_induction_on with
  | _ j ih =>
    by_cases hj : j < 2 * n + 1
    · exact sub_eq_zero.mpr (key ⟨z, hz⟩ j hj)
    · obtain ⟨m, rfl⟩ : ∃ m, j = m + 2 * n := ⟨j - 2 * n, by omega⟩
      have hm := hrec m
      rw [Finset.sum_range_succ, hlead, one_mul] at hm
      have hs : ∑ i ∈ Finset.range (2 * n), q.coeff i * (trace (z * x ^ (m + i)) - trace (z * x' ^ (m + i))) = 0 :=
        Finset.sum_eq_zero fun i hi => by
          rw [Finset.mem_range] at hi
          rw [ih (m + i) (by omega), mul_zero]
      rw [hs, zero_add] at hm
      exact hm

end PositivityTheory.RgUd.T.Alg.Trall
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.CoefficientTraces.TraceAllHolds =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.LinearConjugation.ToLinAlgEquivEq =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.LinearConjugation.ToLinAlgEquivEq", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.IsoOfTrace\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\npublic import Mathlib.LinearAlgebra.JordanChevalley\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.CoassocSimps\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.T.Alg.Conj2

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Alg

variable {k : Type} [Field k] [CharZero k] {n : ℕ}

def SS (a : Matrix (Fin n) (Fin n) k) : Prop := Module.End.IsSemisimple (Matrix.toLin' a)

theorem toLinAlgEquiv'_eq (a : Matrix (Fin n) (Fin n) k) : Matrix.toLinAlgEquiv' a = Matrix.toLin' a := rfl

theorem ss_add {a b : Matrix (Fin n) (Fin n) k} (h : Commute a b) (ha : SS a) (hb : SS b) : SS (a + b) := by
  unfold SS
  rw [← toLinAlgEquiv'_eq, map_add (f := _)]
  exact Module.End.IsSemisimple.add_of_commute (h.map Matrix.toLinAlgEquiv') ha hb

theorem ss_mul {a b : Matrix (Fin n) (Fin n) k} (h : Commute a b) (ha : SS a) (hb : SS b) : SS (a * b) := by
  unfold SS
  rw [← toLinAlgEquiv'_eq, map_mul]
  exact Module.End.IsSemisimple.mul_of_commute (h.map Matrix.toLinAlgEquiv') ha hb

theorem ss_algebraMap (c : k) : SS (algebraMap k (Matrix (Fin n) (Fin n) k) c) := by
  unfold SS
  rw [← toLinAlgEquiv'_eq, AlgEquiv.commutes]
  refine Module.End.isSemisimple_of_squarefree_aeval_eq_zero (p := X - C c)
    (Polynomial.irreducible_X_sub_C c).squarefree ?_
  simp

theorem ss_of_mem {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)} (hZ : CR Z) {z : Matrix (Fin n) (Fin n) k}
    (hz : z ∈ Z) : SS z := by
  obtain ⟨nn, hnn, ss, -, hnil, hsss, hsum⟩ := Module.End.exists_isNilpotent_isSemisimple (K := k) (f := Matrix.toLin' z)
  have hmap : Algebra.adjoin k {Matrix.toLin' z} =
      (Algebra.adjoin k {z}).map (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).toAlgHom := by
    rw [← Algebra.adjoin_image, Set.image_singleton]
    rfl
  rw [hmap] at hnn
  obtain ⟨m, hm, hmn⟩ := Subalgebra.mem_map.1 hnn
  have hmZ : m ∈ Z := Algebra.adjoin_le (Set.singleton_subset_iff.2 hz) hm
  have hmnil : IsNilpotent m := by
    have : IsNilpotent ((Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).symm nn) := hnil.map _
    rw [← hmn] at this
    simpa using this
  have hm0 : m = 0 := by
    have h1 : IsNilpotent (⟨m, hmZ⟩ : Z) := by
      obtain ⟨e, he⟩ := hmnil
      exact ⟨e, Subtype.ext (by simpa using he)⟩
    have := hZ.2.eq_zero _ h1
    simpa using congrArg Subtype.val this
  have hnn0 : nn = 0 := by rw [← hmn, hm0]; simp
  unfold SS
  rw [hsum, hnn0, zero_add]
  exact hsss

theorem conj_of (hiso : IsoOfTrace k) : Conj k := by
  intro n Z hZ s s' hs hs' hss hss' htr
  classical
  set S : Set (Matrix (Fin n) (Fin n) k × Matrix (Fin n) (Fin n) k) :=
    (fun z => (z, z)) '' (Z : Set (Matrix (Fin n) (Fin n) k)) ∪ {(s, s')} with hSdef
  have hcomm : ∀ a ∈ S, ∀ b ∈ S, a * b = b * a := by
    rintro a (⟨z, hz, rfl⟩ | ha) b (⟨w, hw, rfl⟩ | hb)
    · simp [hZ.1 z hz w hw]
    · rw [Set.mem_singleton_iff] at hb; subst hb
      simp [hs z hz, hs' z hz]
    · rw [Set.mem_singleton_iff] at ha; subst ha
      simp [hs w hw, hs' w hw]
    · rw [Set.mem_singleton_iff] at ha hb; subst ha; subst hb; rfl
  set R := Algebra.adjoin k S with hRdef

  have hRc : ∀ x ∈ R, ∀ y ∈ R, Commute x y := fun x hx y hy =>
    Algebra.commute_of_mem_adjoin_of_forall_mem_commute hy fun b hb =>
      (Algebra.commute_of_mem_adjoin_of_forall_mem_commute hx fun a ha => hcomm b hb a ha).symm

  letI : CommRing R := { (inferInstance : Ring R) with
    mul_comm := fun x y => Subtype.ext (hRc x x.2 y y.2).eq }

  have hRss : ∀ x ∈ R, SS x.1 ∧ SS x.2 := by
    intro x hx
    induction hx using Algebra.adjoin_induction with
    | mem x hx =>
      rcases hx with ⟨z, hz, rfl⟩ | hx
      · exact ⟨ss_of_mem hZ hz, ss_of_mem hZ hz⟩
      · rw [Set.mem_singleton_iff] at hx; subst hx; exact ⟨hss, hss'⟩
    | algebraMap c => exact ⟨ss_algebraMap c, ss_algebraMap c⟩
    | add x y hx hy ihx ihy =>
      have h := hRc x hx y hy
      exact ⟨ss_add (h.map (RingHom.fst _ _)) ihx.1 ihy.1, ss_add (h.map (RingHom.snd _ _)) ihx.2 ihy.2⟩
    | mul x y hx hy ihx ihy =>
      have h := hRc x hx y hy
      exact ⟨ss_mul (h.map (RingHom.fst _ _)) ihx.1 ihy.1, ss_mul (h.map (RingHom.snd _ _)) ihx.2 ihy.2⟩

  let f : Z →+* Matrix (Fin n) (Fin n) k := Z.val.toRingHom
  have hform : ∀ x ∈ R, ∃ P : Z[X], x = (P.eval₂ f s, P.eval₂ f s') := by
    intro x hx
    induction hx using Algebra.adjoin_induction with
    | mem x hx =>
      rcases hx with ⟨z, hz, rfl⟩ | hx
      · exact ⟨C ⟨z, hz⟩, by simp [f]⟩
      · rw [Set.mem_singleton_iff] at hx; subst hx; exact ⟨X, by simp⟩
    | algebraMap c =>
      refine ⟨C (algebraMap k Z c), ?_⟩
      simp [f, Prod.algebraMap_apply]
    | add x y hx hy ihx ihy =>
      obtain ⟨P, rfl⟩ := ihx
      obtain ⟨Q, rfl⟩ := ihy
      exact ⟨P + Q, by simp [eval₂_add]⟩
    | mul x y hx hy ihx ihy =>
      obtain ⟨P, rfl⟩ := ihx
      obtain ⟨Q, rfl⟩ := ihy
      refine ⟨P * Q, ?_⟩
      rw [eval₂_mul_noncomm _ _ fun j => ?_, eval₂_mul_noncomm _ _ fun j => ?_]
      · rfl
      · exact hs' (f (Q.coeff j)) (Q.coeff j).2
      · exact hs (f (Q.coeff j)) (Q.coeff j).2
  have htrP : ∀ P : Z[X], trace (P.eval₂ f s) = trace (P.eval₂ f s') := by
    intro P
    rw [eval₂_eq_sum, eval₂_eq_sum, Polynomial.sum_def, Polynomial.sum_def, trace_sum, trace_sum]
    exact Finset.sum_congr rfl fun e _ => htr _ (P.coeff e).2 e

  haveI : IsReduced R := ⟨fun x hx => by
    have h1 : IsNilpotent (x : Matrix (Fin n) (Fin n) k × Matrix (Fin n) (Fin n) k) := hx.map R.val
    have hs1 := hRss x x.2
    have e1 : (x : Matrix (Fin n) (Fin n) k × Matrix (Fin n) (Fin n) k).1 = 0 := by
      have hn1 := (h1.map (RingHom.fst (Matrix (Fin n) (Fin n) k) (Matrix (Fin n) (Fin n) k))).map
        (Matrix.toLinAlgEquiv' (R := k) (n := Fin n))
      have := Module.End.eq_zero_of_isNilpotent_isSemisimple hn1 (by exact hs1.1)
      exact (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).injective (this.trans (map_zero _).symm)
    have e2 : (x : Matrix (Fin n) (Fin n) k × Matrix (Fin n) (Fin n) k).2 = 0 := by
      have hn2 := (h1.map (RingHom.snd (Matrix (Fin n) (Fin n) k) (Matrix (Fin n) (Fin n) k))).map
        (Matrix.toLinAlgEquiv' (R := k) (n := Fin n))
      have := Module.End.eq_zero_of_isNilpotent_isSemisimple hn2 (by exact hs1.2)
      exact (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).injective (this.trans (map_zero _).symm)
    exact Subtype.ext (Prod.ext e1 e2)⟩
  let ρ : R →ₐ[k] Module.End k (Fin n → k) :=
    (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).toAlgHom.comp ((AlgHom.fst k _ _).comp R.val)
  let ρ' : R →ₐ[k] Module.End k (Fin n → k) :=
    (Matrix.toLinAlgEquiv' (R := k) (n := Fin n)).toAlgHom.comp ((AlgHom.snd k _ _).comp R.val)
  have hρ : ∀ r : R, ρ r = Matrix.toLin' (r : Matrix (Fin n) (Fin n) k × Matrix (Fin n) (Fin n) k).1 :=
    fun r => rfl
  have hρ' : ∀ r : R, ρ' r = Matrix.toLin' (r : Matrix (Fin n) (Fin n) k × Matrix (Fin n) (Fin n) k).2 :=
    fun r => rfl
  have htrace : ∀ r, LinearMap.trace k _ (ρ r) = LinearMap.trace k _ (ρ' r) := by
    intro r
    rw [hρ, hρ', Matrix.trace_toLin'_eq, Matrix.trace_toLin'_eq]
    obtain ⟨P, hP⟩ := hform r r.2
    rw [hP]
    exact htrP P
  obtain ⟨φ, hφ⟩ := hiso n R ρ ρ' htrace

  let A : Matrix (Fin n) (Fin n) k := LinearMap.toMatrix' (φ : (Fin n → k) →ₗ[k] (Fin n → k))
  let B : Matrix (Fin n) (Fin n) k := LinearMap.toMatrix' (φ.symm : (Fin n → k) →ₗ[k] (Fin n → k))
  have hAB : A * B = 1 := by
    rw [← LinearMap.toMatrix'_comp, ← LinearMap.toMatrix'_id]
    congr 1
    ext v : 1
    simp
  have hBA : B * A = 1 := by
    rw [← LinearMap.toMatrix'_comp, ← LinearMap.toMatrix'_id]
    congr 1
    ext v : 1
    simp
  let g : GL (Fin n) k := ⟨A, B, hAB, hBA⟩

  have hint : ∀ x ∈ R, A * x.1 = x.2 * A := by
    intro x hx
    have hc : (φ : (Fin n → k) →ₗ[k] (Fin n → k)).comp (Matrix.toLin' x.1) =
        (Matrix.toLin' x.2).comp (φ : (Fin n → k) →ₗ[k] (Fin n → k)) := by
      refine LinearMap.ext fun v => ?_
      have := hφ ⟨x, hx⟩ v
      rw [hρ, hρ'] at this
      simpa using this
    have := congrArg LinearMap.toMatrix' hc
    rw [LinearMap.toMatrix'_comp, LinearMap.toMatrix'_comp, LinearMap.toMatrix'_toLin',
      LinearMap.toMatrix'_toLin'] at this
    exact this
  refine ⟨g, fun a ha => ?_, ?_⟩
  · have := hint (a, a) (Algebra.subset_adjoin (Or.inl ⟨a, ha, rfl⟩))
    exact this.symm
  · have h1 := hint (s, s') (Algebra.subset_adjoin (Or.inr rfl))
    show A * s * B = s'
    rw [h1, Matrix.mul_assoc, hAB, Matrix.mul_one]

end PositivityTheory.RgUd.T.Alg.Conj2
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.LinearConjugation.ToLinAlgEquivEq =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.NilpotentTraces.TrNil =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.NilpotentTraces.TrNil", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.IsoOfTrace\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\npublic import Mathlib.LinearAlgebra.JordanChevalley\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix

namespace PositivityTheory.RgUd.T.Alg.Jcnil

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Alg

variable (k : Type) [Field k] [CharZero k]

theorem jc : JC k := by
  intro n x
  obtain ⟨N, -, S, hS, hN, hSs, hx⟩ := Module.End.exists_isNilpotent_isSemisimple (K := k) (f := Matrix.toLin' x)
  have hsx : Matrix.toLinAlgEquiv' (Matrix.toLinAlgEquiv'.symm S) = S := AlgEquiv.apply_symm_apply _ _
  refine ⟨Matrix.toLinAlgEquiv'.symm S, ?_, ?_, ?_⟩
  · have hmap := AlgHom.map_adjoin (Matrix.toLinAlgEquiv'.symm : _ ≃ₐ[k] Matrix (Fin n) (Fin n) k).toAlgHom {Matrix.toLin' x}
    rw [Set.image_singleton] at hmap
    have hx' : (Matrix.toLinAlgEquiv'.symm : _ ≃ₐ[k] Matrix (Fin n) (Fin n) k).toAlgHom (Matrix.toLin' x) = x :=
      Matrix.toLinAlgEquiv'.symm_apply_apply x
    rw [hx'] at hmap
    rw [← hmap]
    exact Subalgebra.mem_map.mpr ⟨S, hS, rfl⟩
  · have : Matrix.toLin' (Matrix.toLinAlgEquiv'.symm S) = S := hsx
    rw [this]
    exact hSs
  · have hdiff : x - Matrix.toLinAlgEquiv'.symm S = Matrix.toLinAlgEquiv'.symm N := by
      apply Matrix.toLinAlgEquiv'.injective
      rw [map_sub, hsx, AlgEquiv.apply_symm_apply]
      have : Matrix.toLinAlgEquiv' x = Matrix.toLin' x := rfl
      rw [this, hx]
      abel
    rw [hdiff]
    exact hN.map _

theorem trNil : TrNil k := by
  intro n x s z hs hn hz j
  have hxs : Commute x s := Algebra.commute_of_mem_adjoin_self hs
  have hzs : Commute z s := Algebra.commute_of_mem_adjoin_singleton_of_commute hs hz
  have hdx : Commute (x - s) x := (Commute.refl x).sub_left hxs.symm
  have hds : Commute (x - s) s := hxs.sub_left (Commute.refl s)
  have hg := hxs.mul_geom_sum₂ j
  have hc : Commute (x - s) (∑ i ∈ Finset.range j, x ^ i * s ^ (j - 1 - i)) :=
    Commute.sum_right _ _ _ fun i _ => (hdx.pow_right i).mul_right (hds.pow_right _)
  have hzd : Commute z (x - s) := hz.sub_right hzs
  have hnil : IsNilpotent (z * x ^ j - z * s ^ j) := by
    rw [← mul_sub, ← hg, ← mul_assoc, hzd.eq, mul_assoc]
    exact Commute.isNilpotent_mul_right (hzd.symm.mul_right hc) hn
  have ht := Matrix.isNilpotent_trace_of_isNilpotent hnil
  rw [Matrix.trace_sub] at ht
  exact sub_eq_zero.mp ht.eq_zero

end PositivityTheory.RgUd.T.Alg.Jcnil
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.NilpotentTraces.TrNil =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.RestrictionHomomorphisms.ResHomApply =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.RestrictionHomomorphisms.ResHomApply", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.IsoOfTrace\nimport Mathlib.Algebra.Module.StablyFree.Basic\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Etale.Weakly\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.TotallySplit\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Module

namespace PositivityTheory.RgUd.T.Alg.Iso2

variable {k : Type} [Field k] [CharZero k]

theorem iso_of_field {K W W' : Type} [Field K] [Algebra k K] [FiniteDimensional k K]
    [AddCommGroup W] [Module k W] [FiniteDimensional k W] [AddCommGroup W'] [Module k W'] [FiniteDimensional k W']
    (σ : K →ₐ[k] Module.End k W) (σ' : K →ₐ[k] Module.End k W') (h : finrank k W = finrank k W') :
    ∃ φ : W ≃ₗ[k] W', ∀ c w, φ (σ c w) = σ' c (φ w) := by
  classical
  letI : Module K W := Module.compHom W σ.toRingHom
  letI : Module K W' := Module.compHom W' σ'.toRingHom
  haveI : IsScalarTower k K W := ⟨fun a c w => by
    show σ (a • c) w = a • σ c w
    rw [map_smul]
    rfl⟩
  haveI : IsScalarTower k K W' := ⟨fun a c w => by
    show σ' (a • c) w = a • σ' c w
    rw [map_smul]
    rfl⟩
  haveI : FiniteDimensional K W := Module.Finite.of_restrictScalars_finite k K W
  haveI : FiniteDimensional K W' := Module.Finite.of_restrictScalars_finite k K W'
  have hK : 0 < finrank k K := Module.finrank_pos
  have h2 : finrank K W = finrank K W' := by
    apply Nat.eq_of_mul_eq_mul_left hK
    rw [Module.finrank_mul_finrank, Module.finrank_mul_finrank, h]
  let ψ : W ≃ₗ[K] W' := LinearEquiv.ofFinrankEq W W' h2
  refine ⟨ψ.restrictScalars k, fun c w => ?_⟩
  exact ψ.map_smul c w

variable {n : ℕ} {R : Type} [CommRing R] [Algebra k R]

def resHom (ρ : R →ₐ[k] Module.End k (Fin n → k)) (e : R) :
    R →ₐ[k] Module.End k (LinearMap.range (ρ e)) where
  toFun r := (ρ r).restrict (p := LinearMap.range (ρ e)) (q := LinearMap.range (ρ e)) (fun x hx => by
    obtain ⟨y, rfl⟩ := hx
    refine ⟨ρ r y, ?_⟩
    rw [← Module.End.mul_apply, ← Module.End.mul_apply, ← map_mul, ← map_mul, mul_comm])
  map_one' := by ext x; simp
  map_mul' a b := by ext x; simp
  map_zero' := by ext x; simp
  map_add' a b := by ext x; simp
  commutes' c := by ext x; simp [Algebra.algebraMap_eq_smul_one]

theorem resHom_apply (ρ : R →ₐ[k] Module.End k (Fin n → k)) (e r : R) (x : LinearMap.range (ρ e)) :
    ((resHom ρ e r x : LinearMap.range (ρ e)) : Fin n → k) = ρ r x := rfl

end PositivityTheory.RgUd.T.Alg.Iso2

namespace PositivityTheory.RgUd.T.Alg.Iso2

open Module

variable {k : Type} [Field k] [CharZero k]

theorem proj_of_mem {n : ℕ} {R : Type} [CommRing R] [Algebra k R] (ρ : R →ₐ[k] Module.End k (Fin n → k))
    {ι : Type} [DecidableEq ι] (e : ι → R) (he : ∀ I J, e I * e J = if I = J then e I else 0) (I J : ι)
    (x : Fin n → k) (hx : x ∈ LinearMap.range (ρ (e I))) : ρ (e J) x = if I = J then x else 0 := by
  obtain ⟨y, rfl⟩ := hx
  rw [← Module.End.mul_apply, ← map_mul, he J I]
  by_cases h : I = J
  · subst h
    simp
  · simp [h, Ne.symm h]

private theorem comp_lemma {n : ℕ} {R : Type} [CommRing R] [Algebra k R] [FiniteDimensional k R]
    (ρ ρ' : R →ₐ[k] Module.End k (Fin n → k)) (e : R) (he : e * e = e)
    (m : Ideal R) [m.IsMaximal] (hm : ∀ a ∈ m, a * e = 0)
    (htr : LinearMap.trace k (Fin n → k) (ρ e) = LinearMap.trace k (Fin n → k) (ρ' e)) :
    ∃ φ : LinearMap.range (ρ e) ≃ₗ[k] LinearMap.range (ρ' e),
      ∀ r x, φ (resHom ρ e r x) = resHom ρ' e r (φ x) := by
  letI : Field (R ⧸ m) := Ideal.Quotient.field m
  haveI : FiniteDimensional k (R ⧸ m) :=
    Module.Finite.of_surjective (Ideal.Quotient.mkₐ k m).toLinearMap (Ideal.Quotient.mkₐ_surjective k m)
  have h0 : ∀ (σ : R →ₐ[k] Module.End k (Fin n → k)), ∀ a ∈ m, resHom σ e a = 0 := by
    intro σ a ha
    refine LinearMap.ext fun x => Subtype.ext ?_
    obtain ⟨y, hy⟩ := x.2
    rw [resHom_apply, ← hy, ← Module.End.mul_apply, ← map_mul, hm a ha]
    simp
  have hI : ∀ σ : R →ₐ[k] Module.End k (Fin n → k), IsIdempotentElem (σ e) := fun σ => by
    show σ e * σ e = σ e
    rw [← map_mul, he]
  have hdim : finrank k (LinearMap.range (ρ e)) = finrank k (LinearMap.range (ρ' e)) := by
    have h1 := htr
    rw [(LinearMap.IsIdempotentElem.isProj_range _ (hI ρ)).trace,
      (LinearMap.IsIdempotentElem.isProj_range _ (hI ρ')).trace] at h1
    exact_mod_cast h1
  obtain ⟨φ, hφ⟩ := iso_of_field (Ideal.Quotient.liftₐ m (resHom ρ e) (h0 ρ))
    (Ideal.Quotient.liftₐ m (resHom ρ' e) (h0 ρ')) hdim
  refine ⟨φ, fun r x => ?_⟩
  exact hφ (Ideal.Quotient.mk m r) x

private theorem mul_eq_mul_of_ratio_eq_one {n : ℕ} {R : Type} [CommRing R] [Algebra k R]
    (ρ ρ' : R →ₐ[k] Module.End k (Fin n → k)) {ι : Type} [Fintype ι] [DecidableEq ι] (e : ι → R)
    (he : ∀ I J, e I * e J = if I = J then e I else 0) (hs : ∑ i, e i = 1)
    (φ : ∀ i, LinearMap.range (ρ (e i)) ≃ₗ[k] LinearMap.range (ρ' (e i))) (v : Fin n → k) :
    (∑ i, (LinearMap.range (ρ (e i))).subtype ∘ₗ (φ i).symm.toLinearMap ∘ₗ (ρ' (e i)).rangeRestrict)
      ((∑ i, (LinearMap.range (ρ' (e i))).subtype ∘ₗ (φ i).toLinearMap ∘ₗ (ρ (e i)).rangeRestrict) v) = v := by
  have inner : ∀ i j, (((φ j).symm ((ρ' (e j)).rangeRestrict
      ((φ i ((ρ (e i)).rangeRestrict v) : LinearMap.range (ρ' (e i))) : Fin n → k)) :
        LinearMap.range (ρ (e j))) : Fin n → k) = if i = j then ρ (e i) v else 0 := by
    intro i j
    by_cases h : i = j
    · subst h
      have h1 : (ρ' (e i)).rangeRestrict ((φ i ((ρ (e i)).rangeRestrict v) : LinearMap.range (ρ' (e i))) : Fin n → k)
          = φ i ((ρ (e i)).rangeRestrict v) := by
        apply Subtype.ext
        have := proj_of_mem ρ' e he i i _ (φ i ((ρ (e i)).rangeRestrict v)).2
        simpa using this
      rw [h1, LinearEquiv.symm_apply_apply, if_pos rfl]
      rfl
    · have h1 : (ρ' (e j)).rangeRestrict ((φ i ((ρ (e i)).rangeRestrict v) : LinearMap.range (ρ' (e i))) : Fin n → k)
          = 0 := by
        apply Subtype.ext
        have := proj_of_mem ρ' e he i j _ (φ i ((ρ (e i)).rangeRestrict v)).2
        simpa [h] using this
      rw [h1, (φ j).symm.map_zero, if_neg h]
      rfl

  simp only [LinearMap.sum_apply, LinearMap.comp_apply, map_sum, Submodule.coe_subtype,
  LinearEquiv.coe_coe]
  simp only [inner]
  simp

  rw [← LinearMap.sum_apply, ← map_sum, hs, map_one]
  rfl

theorem isoOfTrace : IsoOfTrace k := by
  unfold IsoOfTrace
  intro n R _ _ _ _ ρ ρ' htr
  classical
  haveI : IsArtinianRing R := IsArtinianRing.of_finite k R
  haveI : Fintype (MaximalSpectrum R) := Fintype.ofFinite _
  let E := IsArtinianRing.equivPi R
  let e : MaximalSpectrum R → R := fun m => E.symm (Pi.single m 1)
  have hE : ∀ m, E (e m) = Pi.single m 1 := fun m => E.apply_symm_apply _
  have he : ∀ I J, e I * e J = if I = J then e I else 0 := by
    intro I J
    apply E.injective
    rw [map_mul, hE, hE]
    by_cases h : I = J
    · subst h
      rw [if_pos rfl, hE, ← Pi.single_mul, mul_one]
    · rw [if_neg h, map_zero]
      funext x
      rw [Pi.mul_apply, Pi.zero_apply]
      by_cases hx : x = I
      · subst hx
        rw [Pi.single_eq_of_ne h, mul_zero]
      · rw [Pi.single_eq_of_ne hx, zero_mul]
  have hs : ∑ m, e m = 1 := by
    apply E.injective

    rw [map_sum, map_one]
    funext x
    simp [hE, Finset.sum_apply]
  have hm : ∀ m : MaximalSpectrum R, ∀ a ∈ m.asIdeal, a * e m = 0 := by
    intro m a ha
    apply E.injective
    rw [map_mul, hE, map_zero]
    funext x
    rw [Pi.mul_apply, Pi.zero_apply]
    by_cases h : x = m
    · subst h
      have h0 : E a x = 0 := Ideal.Quotient.eq_zero_iff_mem.2 ha
      rw [h0, zero_mul]
    · rw [Pi.single_eq_of_ne h, mul_zero]
  have hc : ∀ m : MaximalSpectrum R, ∃ φ : LinearMap.range (ρ (e m)) ≃ₗ[k] LinearMap.range (ρ' (e m)),
      ∀ r x, φ (resHom ρ (e m) r x) = resHom ρ' (e m) r (φ x) := fun m => by
    haveI := m.isMaximal
    exact comp_lemma ρ ρ' (e m) (by simpa using he m m) m.asIdeal (hm m) (htr _)
  choose φ hφ using hc
  let Φ : (Fin n → k) →ₗ[k] (Fin n → k) :=
    ∑ i, (LinearMap.range (ρ' (e i))).subtype ∘ₗ (φ i).toLinearMap ∘ₗ (ρ (e i)).rangeRestrict
  let Ψ : (Fin n → k) →ₗ[k] (Fin n → k) :=
    ∑ i, (LinearMap.range (ρ (e i))).subtype ∘ₗ (φ i).symm.toLinearMap ∘ₗ (ρ' (e i)).rangeRestrict
  have h1 : Ψ ∘ₗ Φ = LinearMap.id := LinearMap.ext fun v => mul_eq_mul_of_ratio_eq_one ρ ρ' e he hs φ v
  have h2 : Φ ∘ₗ Ψ = LinearMap.id :=
    LinearMap.ext fun v => mul_eq_mul_of_ratio_eq_one ρ' ρ e he hs (fun i => (φ i).symm) v
  refine ⟨LinearEquiv.ofLinear Φ Ψ h2 h1, fun r v => ?_⟩
  show Φ (ρ r v) = ρ' r (Φ v)

  simp only [Φ, LinearMap.sum_apply, LinearMap.comp_apply, map_sum, Submodule.coe_subtype,
  LinearEquiv.coe_coe]
  refine Finset.sum_congr rfl fun i _ => ?_
  have h3 : (ρ (e i)).rangeRestrict (ρ r v) = resHom ρ (e i) r ((ρ (e i)).rangeRestrict v) := by
    apply Subtype.ext
    rw [resHom_apply]
    show ρ (e i) (ρ r v) = ρ r (ρ (e i) v)
    rw [← Module.End.mul_apply, ← Module.End.mul_apply, ← map_mul, ← map_mul, mul_comm]
  rw [h3, hφ, resHom_apply]

end PositivityTheory.RgUd.T.Alg.Iso2
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.RestrictionHomomorphisms.ResHomApply =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.MemBzOfAdjoin =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.MemBzOfAdjoin", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocStep\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.CoefficientTraces.TraceAllHolds\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.LinearConjugation.ToLinAlgEquivEq\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.NilpotentTraces.TrNil\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.RestrictionHomomorphisms.ResHomApply\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix

namespace PositivityTheory.RgUd.T.Alg

open PositivityTheory.RgUd.T

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] [CharZero k]

theorem mem_Bz_of_adjoin' {n : ℕ} {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)} {x s : Matrix (Fin n) (Fin n) k}
    (hx : x ∈ Bz Z) (hs : s ∈ Algebra.adjoin k {x}) : s ∈ Bz Z := by
  intro a ha
  exact (Algebra.commute_of_mem_adjoin_singleton_of_commute hs (hx a ha)).eq

theorem dich : Dich (k := k) := by
  classical
  intro n Z hZ y
  by_cases hne : ∃ x₀ ∈ Bz Z, pZ Z x₀ = y
  · obtain ⟨x₀, hx₀, hy₀⟩ := hne
    obtain ⟨s₀, hs₀, hss₀, hn₀⟩ := Jcnil.jc k n x₀
    have hs₀B : s₀ ∈ Bz Z := mem_Bz_of_adjoin' k hx₀ hs₀

    have key : ∀ x ∈ Bz Z, pZ Z x = y → ∃ g ∈ Gz Z, ∃ s, s ∈ Algebra.adjoin k {x} ∧ IsNilpotent (x - s) ∧
        g.val * s * g⁻¹.val = s₀ := by
      intro x hx hy
      obtain ⟨s, hs, hss, hn⟩ := Jcnil.jc k n x
      have hsB : s ∈ Bz Z := mem_Bz_of_adjoin' k hx hs
      have htr : ∀ z ∈ Z, ∀ j : ℕ, trace (z * s ^ j) = trace (z * s₀ ^ j) := by
        intro z hz j
        rw [← Jcnil.trNil k n x s z hs hn (hx z hz) j, ← Jcnil.trNil k n x₀ s₀ z hs₀ hn₀ (hx₀ z hz) j]
        exact Trall.trace_all_holds k n Z x x₀ (hy.trans hy₀.symm) z hz j
      obtain ⟨g, hg, hgs⟩ := Conj2.conj_of Iso2.isoOfTrace n Z hZ s s₀ hsB hs₀B hss hss₀ htr
      exact ⟨g, hg, s, hs, hn, hgs⟩
    by_cases hZs : s₀ ∈ Z
    · refine Or.inl ⟨s₀, hZs, fun x hx hy => ?_⟩
      obtain ⟨g, hg, s, hs, hn, hgs⟩ := key x hx hy
      have hgc : g.val * s₀ = s₀ * g.val := (hg s₀ hZs).symm
      have : s = s₀ := by
        have h1 : g.val * s = s₀ * g.val := by
          rw [← hgs, Matrix.mul_assoc, Matrix.mul_assoc, ← Units.val_mul, inv_mul_cancel, Units.val_one,
            Matrix.mul_one]
        have h2 : g.val * s = g.val * s₀ := h1.trans hgc.symm
        have := congrArg (fun m => g⁻¹.val * m) h2
        simpa [← Matrix.mul_assoc, ← Units.val_mul] using this
      rw [← this]
      exact hn
    · refine Or.inr ⟨s₀, hs₀B, hZs, hss₀, fun x hx hy => ?_⟩
      obtain ⟨g, hg, s, hs, hn, hgs⟩ := key x hx hy
      refine ⟨g, hg, ?_, ?_⟩
      · have e : g.val * x * g⁻¹.val - s₀ = g.val * (x - s) * g⁻¹.val := by
          rw [← hgs, Matrix.mul_sub, Matrix.sub_mul]
        rw [e]
        obtain ⟨m, hm⟩ := hn
        refine ⟨m, ?_⟩
        have hconj : ∀ j : ℕ, (g.val * (x - s) * g⁻¹.val) ^ j = g.val * (x - s) ^ j * g⁻¹.val := by
          intro j
          induction j with
          | zero => simp [← Units.val_mul]
          | succ j ih =>
            rw [pow_succ, ih, pow_succ]
            simp only [Matrix.mul_assoc]
            congr 2
            rw [← Matrix.mul_assoc g⁻¹.val, ← Units.val_mul, inv_mul_cancel, Units.val_one, Matrix.one_mul]
        rw [hconj, hm]
        simp
      · have hcs : Commute x s := (Algebra.commute_of_mem_adjoin_singleton_of_commute hs (Commute.refl x)).symm.symm
        rw [← hgs]
        have e1 : g.val * x * g⁻¹.val * (g.val * s * g⁻¹.val) = g.val * (x * s) * g⁻¹.val := by
          simp only [Matrix.mul_assoc]
          congr 2
          rw [← Matrix.mul_assoc g⁻¹.val, ← Units.val_mul, inv_mul_cancel, Units.val_one, Matrix.one_mul]
        have e2 : g.val * s * g⁻¹.val * (g.val * x * g⁻¹.val) = g.val * (s * x) * g⁻¹.val := by
          simp only [Matrix.mul_assoc]
          congr 2
          rw [← Matrix.mul_assoc g⁻¹.val, ← Units.val_mul, inv_mul_cancel, Units.val_one, Matrix.one_mul]
        show _ * _ = _ * _
        rw [e1, e2, hcs.eq]
  · refine Or.inl ⟨0, Z.zero_mem, fun x hx hy => absurd ⟨x, hx, hy⟩ hne⟩

end PositivityTheory.RgUd.T.Alg
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.MemBzOfAdjoin =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.CharpolyNilpotence.IsNilpotentAevalCharpoly =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.CharpolyNilpotence.IsNilpotentAevalCharpoly", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVan\npublic import Mathlib.NumberTheory.LocalField.Basic\nimport Mathlib.Algebra.AffineMonoid.UniqueSums\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Etale.Weakly\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.TotallySplit\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\npublic import Mathlib.LinearAlgebra.Trace\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.T.Desc.JC

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Desc

variable {k : Type} [Field k] {n : ℕ}

theorem trace_aeval_eq_sum (A : Matrix (Fin n) (Fin n) k) (p : k[X]) :
    trace (aeval A p) = ∑ i ∈ Finset.range (p.natDegree + 1), p.coeff i * trace (A ^ i) := by
  rw [aeval_eq_sum_range, Matrix.trace_sum]
  simp only [Matrix.trace_smul, smul_eq_mul]

theorem isNilpotent_of_trace_pow [CharZero k] (A : Matrix (Fin n) (Fin n) k)
    (h : ∀ m, 1 ≤ m → trace (A ^ m) = 0) : IsNilpotent A := by
  obtain ⟨q, hq, hXq⟩ := Polynomial.exists_eq_pow_rootMultiplicity_mul_and_not_dvd A.charpoly
    (charpoly_monic A).ne_zero 0
  simp only [map_zero, sub_zero] at hq hXq
  set r := rootMultiplicity 0 A.charpoly
  have hcop : IsCoprime (X ^ (r + 1) : k[X]) q :=
    IsCoprime.pow_left ((Polynomial.irreducible_X.coprime_iff_not_dvd).2 hXq)
  obtain ⟨a, b, hab⟩ := hcop
  have hzero : aeval A (X ^ (r + 1) * q) = 0 := by
    have e : (X ^ (r + 1) * q : k[X]) = X * A.charpoly := by
      rw [hq]
      ring
    rw [e, map_mul, aeval_self_charpoly, mul_zero]
  have hsum : aeval A (a * X ^ (r + 1)) + aeval A (b * q) = 1 := by
    rw [← map_add (f := _), hab, map_one]
  have hprod : aeval A (a * X ^ (r + 1)) * aeval A (b * q) = 0 := by
    rw [← map_mul]
    have e : a * X ^ (r + 1) * (b * q) = (a * b) * (X ^ (r + 1) * q) := by ring
    rw [e, map_mul, hzero, mul_zero]
  have he : aeval A (a * X ^ (r + 1)) = 1 - aeval A (b * q) := eq_sub_of_add_eq hsum
  have hidem : IsIdempotentElem (aeval A (a * X ^ (r + 1))) := by
    unfold IsIdempotentElem
    calc aeval A (a * X ^ (r + 1)) * aeval A (a * X ^ (r + 1))
        = aeval A (a * X ^ (r + 1)) * (1 - aeval A (b * q)) := by rw [← he]
      _ = aeval A (a * X ^ (r + 1)) := by rw [mul_sub, mul_one, hprod, sub_zero]
  have htr : trace (aeval A (a * X ^ (r + 1))) = 0 := by
    rw [trace_aeval_eq_sum]
    refine Finset.sum_eq_zero fun i _ => ?_
    rcases i with _ | i
    · simp
    · rw [h (i + 1) (by omega), mul_zero]
  have hlin : IsIdempotentElem (Matrix.toLinAlgEquiv' (aeval A (a * X ^ (r + 1)))) :=
    hidem.map _
  have hlintr : LinearMap.trace k _ (Matrix.toLinAlgEquiv' (aeval A (a * X ^ (r + 1)))) = 0 := by
    rw [LinearMap.trace_eq_matrix_trace k (Pi.basisFun k (Fin n)), LinearMap.toMatrix_eq_toMatrix']
    change trace (LinearMap.toMatrix' (Matrix.toLin' _)) = 0
    rw [LinearMap.toMatrix'_toLin', htr]
  have hz : aeval A (a * X ^ (r + 1)) = 0 := by
    have := LinearMap.IsIdempotentElem.eq_zero_of_trace_eq_zero hlin hlintr
    exact (map_eq_zero_iff _ (AlgEquiv.injective _)).1 this
  refine ⟨r + 1, ?_⟩
  have e : (X ^ (r + 1) : k[X]) = X ^ (r + 1) * (a * X ^ (r + 1)) + b * (X ^ (r + 1) * q) := by
    linear_combination (-(X ^ (r + 1) : k[X])) * hab
  have := congrArg (aeval A) e
  rw [map_add (f := _), map_mul (aeval A) (X ^ (r + 1)), hz, map_mul (aeval A) b, hzero, mul_zero, mul_zero,
    add_zero, map_pow, aeval_X] at this
  exact this

variable [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]


omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem trace_pow_eq {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)} {x x₀ : Matrix (Fin n) (Fin n) k}
    (h : pZ Z x = pZ Z x₀) (i : ℕ) (hi : i < 2 * n + 1) : trace (x ^ i) = trace (x₀ ^ i) := by
  have h1 : ((1 : Z) : Matrix (Fin n) (Fin n) k) =
      ∑ j, (Module.finBasis k Z).repr 1 j • ((Module.finBasis k Z j : Z) : Matrix (Fin n) (Fin n) k) := by
    have h0 := congrArg Subtype.val ((Module.finBasis k Z).sum_repr 1)
    rw [← h0, AddSubmonoidClass.coe_finsetSum]
    rfl
  have key : ∀ y : Matrix (Fin n) (Fin n) k, trace (y ^ i) =
      ∑ j, (Module.finBasis k Z).repr 1 j * pZ Z y (⟨i, hi⟩, j) := by
    intro y
    calc trace (y ^ i) = trace (((1 : Z) : Matrix (Fin n) (Fin n) k) * y ^ i) := by simp
      _ = _ := by
        rw [h1, Finset.sum_mul, Matrix.trace_sum]
        simp [pZ, Matrix.trace_smul]
  rw [key x, key x₀, h]

theorem trace_aeval_eq {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)} {x x₀ : Matrix (Fin n) (Fin n) k}
    (h : pZ Z x = pZ Z x₀) (p : k[X]) (hp : p.natDegree ≤ 2 * n) :
    trace (aeval x p) = trace (aeval x₀ p) := by
  rw [trace_aeval_eq_sum, trace_aeval_eq_sum]
  refine Finset.sum_congr rfl fun i hi => ?_
  rw [trace_pow_eq h i (by simp at hi; omega)]

private theorem trace_aeval_eq_of_pZ_eq {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)}
    {x x₀ : Matrix (Fin n) (Fin n) k} (h : pZ Z x = pZ Z x₀) (p : k[X]) :
    trace (aeval x p) = trace (aeval x₀ p) := by
  have hM : (x.charpoly * x₀.charpoly).Monic := (charpoly_monic x).mul (charpoly_monic x₀)
  have hdeg : (x.charpoly * x₀.charpoly).natDegree = 2 * n := by
    rw [(charpoly_monic x).natDegree_mul (charpoly_monic x₀), charpoly_natDegree_eq_dim,
      charpoly_natDegree_eq_dim, Fintype.card_fin]
    ring
  have hx : aeval x (x.charpoly * x₀.charpoly) = 0 := by
    rw [map_mul, aeval_self_charpoly, zero_mul]
  have hx0 : aeval x₀ (x.charpoly * x₀.charpoly) = 0 := by
    rw [map_mul, aeval_self_charpoly, mul_zero]
  rw [← aeval_modByMonic_eq_self_of_root hx, ← aeval_modByMonic_eq_self_of_root hx0]
  exact trace_aeval_eq h _ ((natDegree_modByMonic_le p hM).trans hdeg.le)

theorem isNilpotent_aeval_charpoly [CharZero k] {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)}
    {x x₀ : Matrix (Fin n) (Fin n) k} (h : pZ Z x = pZ Z x₀) : IsNilpotent (aeval x x₀.charpoly) := by
  apply isNilpotent_of_trace_pow
  intro m hm
  rw [← map_pow, trace_aeval_eq_of_pZ_eq h, map_pow, aeval_self_charpoly, zero_pow (by omega),
    Matrix.trace_zero]


omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem pow_eq_zero_of_isNilpotent {N : Matrix (Fin n) (Fin n) k} (hN : IsNilpotent N) : N ^ n = 0 := by
  have h := isNilpotent_charpoly_sub_pow_of_isNilpotent hN
  have h0 : N.charpoly - X ^ Fintype.card (Fin n) = 0 := h.eq_zero
  rw [sub_eq_zero, Fintype.card_fin] at h0
  have := aeval_self_charpoly N
  rwa [h0, map_pow, aeval_X] at this

theorem jcPoly [CharZero k] : JCPoly (k := k) := by
  classical
  unfold JCPoly
  intro m Z _ y
  by_cases hex : ∃ x₀ ∈ Bz Z, pZ Z x₀ = y
  · obtain ⟨x₀, -, rfl⟩ := hex
    have hsq : Squarefree (UniqueFactorizationMonoid.radical x₀.charpoly) :=
      UniqueFactorizationMonoid.squarefree_radical
    have hsep : (UniqueFactorizationMonoid.radical x₀.charpoly).Separable :=
      PerfectField.separable_iff_squarefree.mpr hsq
    obtain ⟨N, c, hc⟩ := (UniqueFactorizationMonoid.exists_dvd_pow_iff_radical_dvd
      (charpoly_monic x₀).ne_zero).mpr dvd_rfl
    set Q := UniqueFactorizationMonoid.radical x₀.charpoly
    obtain ⟨a, b, hab⟩ := hsep
    set T : k[X] := X - b * Q
    have hT : ∀ z : k[X], T.comp z = z + -(b.comp z * Q.comp z) := by
      intro z
      simp [T, mul_comp, sub_eq_add_neg]
    have e1 : ∀ p w : k[X], (p.map C).eval w = p.comp w := fun p w => by
      rw [eval_map]
      rfl
    have step : ∀ z : k[X], ∃ w, Q.comp (T.comp z) = (Q.comp z) ^ 2 * w := by
      intro z
      obtain ⟨s, hs⟩ := Polynomial.binomExpansion (Q.map C) z (-(b.comp z * Q.comp z))
      refine ⟨a.comp z + s * (b.comp z) ^ 2, ?_⟩
      have hab' : a.comp z * Q.comp z + b.comp z * (derivative Q).comp z = 1 := by
        have := congrArg (fun p => p.comp z) hab
        simpa [add_comp, mul_comp] using this
      rw [derivative_map] at hs
      simp only [e1] at hs
      rw [hT, hs]
      linear_combination (-(Q.comp z)) * hab'
    have iter : ∀ j, ∃ w v, Q.comp ((fun p => T.comp p)^[j] X) = Q ^ (2 ^ j) * w ∧
        X - (fun p => T.comp p)^[j] X = Q * v := by
      intro j
      induction j with
      | zero => exact ⟨1, 0, by simp, by simp⟩
      | succ j ih =>
        obtain ⟨w, v, hw, hv⟩ := ih
        obtain ⟨w', hw'⟩ := step ((fun p => T.comp p)^[j] X)
        rw [Function.iterate_succ_apply']
        refine ⟨w ^ 2 * w', v + b.comp ((fun p => T.comp p)^[j] X) * Q ^ (2 ^ j - 1) * w, ?_, ?_⟩
        · rw [hw', hw, pow_succ (2 : ℕ) j, pow_mul]
          ring
        · have hQ : Q ^ (2 ^ j) = Q * Q ^ (2 ^ j - 1) := by
            rw [← pow_succ']
            congr 1
            have := Nat.one_le_two_pow (n := j)
            omega
          rw [hT, hw, hQ]
          linear_combination hv
    obtain ⟨w, v, hw, hv⟩ := iter m
    refine ⟨(fun p => T.comp p)^[m] X, fun x _ hx => ?_⟩
    have hQx : IsNilpotent (aeval x Q) := by
      have h5 := isNilpotent_aeval_charpoly hx
      have hpow : aeval x Q ^ N = aeval x x₀.charpoly * aeval x c := by
        rw [← map_pow, hc, map_mul]
      have hcomm : Commute (aeval x x₀.charpoly) (aeval x c) := by
        rw [Commute, SemiconjBy, ← map_mul, ← map_mul, mul_comm]
      have : IsNilpotent (aeval x Q ^ N) := by
        rw [hpow]
        exact hcomm.isNilpotent_mul_right h5
      exact IsNilpotent.of_pow this
    have hQn : aeval x Q ^ m = 0 := pow_eq_zero_of_isNilpotent hQx
    constructor
    · apply Module.End.isSemisimple_of_squarefree_aeval_eq_zero hsq
      have h0 : aeval (aeval x ((fun p => T.comp p)^[m] X)) Q = 0 := by
        rw [← aeval_comp, hw, map_mul, map_pow]
        rw [pow_eq_zero_of_le (Nat.lt_two_pow_self).le hQn, zero_mul]
      change aeval (Matrix.toLinAlgEquiv' _) Q = 0
      rw [aeval_algEquiv, AlgHom.comp_apply, h0, map_zero]
    · have h1 : x - aeval x ((fun p => T.comp p)^[m] X) = aeval x Q * aeval x v := by
        rw [← map_mul, ← hv, map_sub, aeval_X]
      rw [h1]
      have hcomm : Commute (aeval x Q) (aeval x v) := by
        rw [Commute, SemiconjBy, ← map_mul, ← map_mul, mul_comm]
      exact hcomm.isNilpotent_mul_right hQx
  · exact ⟨0, fun x hx hxy => absurd ⟨x, hx, hxy⟩ hex⟩

end PositivityTheory.RgUd.T.Desc.JC
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.CharpolyNilpotence.IsNilpotentAevalCharpoly =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsConjEqSemisimple =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsConjEqSemisimple", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ContinuousCj\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial GroundTheory.Automorphic GroundTheory.Automorphic.Whittaker

namespace PositivityTheory.RgUd.T.Desc.SLF

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {n : ℕ}

section Hyp

variable {Z : Subalgebra k (Matrix (Fin n) (Fin n) k)} {F : Set (Matrix (Fin n) (Fin n) k)} {P : k[X]}
  {s : Matrix (Fin n) (Fin n) k}
  (hFinv : ∀ g ∈ Gz Z, ∀ x ∈ F, g.val * x * g⁻¹.val ∈ F)
  (hP : ∀ x ∈ F, aeval x P ∈ F ∧ Module.End.IsSemisimple (Matrix.toLin' (aeval x P)) ∧ IsNilpotent (x - aeval x P) ∧
    ∃ g ∈ Gz Z, g.val * aeval x P * g⁻¹.val = s)

include hP in
theorem P_idem [CharZero k] {x} (hx : x ∈ F) : aeval (aeval x P) P = aeval x P := by
  set y := aeval x P with hydef
  obtain ⟨hyF, hyS, -, -⟩ := hP x hx
  obtain ⟨-, hzS, hzN, -⟩ := hP y hyF
  have e : ∀ M : Matrix (Fin n) (Fin n) k, Matrix.toLinAlgEquiv' M = Matrix.toLin' M := fun M => rfl
  have hc : Commute y (aeval y P) := by
    have := (Commute.all (X : k[X]) P).map (aeval y)
    rwa [aeval_X] at this
  have hc' : Commute (Matrix.toLin' y) (Matrix.toLin' (aeval y P)) := by
    have := hc.map (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _)
    rwa [e, e] at this
  have hS : Module.End.IsSemisimple (Matrix.toLin' (y - aeval y P)) := by
    rw [map_sub]
    exact Module.End.IsSemisimple.sub_of_commute hc' hyS hzS
  have hN : IsNilpotent (Matrix.toLin' (y - aeval y P)) := by
    rw [← e]
    exact hzN.map _
  have h0 := Module.End.eq_zero_of_isNilpotent_isSemisimple hN hS
  rw [← e, map_eq_zero_iff _ (AlgEquiv.injective _), sub_eq_zero] at h0
  exact h0.symm

include hP in
theorem P_mem_Tset [CharZero k] {x} (hx : x ∈ F) : aeval x P ∈ Tset F P := ⟨(hP x hx).1, P_idem hP hx⟩

include hP in
theorem exists_conj_eq_semisimple {x} (hx : x ∈ Tset F P) : ∃ g ∈ Gz Z, cj g x = s := by
  obtain ⟨hxF, hxP⟩ := hx
  obtain ⟨-, -, -, g, hg, hgs⟩ := hP x hxF
  rw [hxP] at hgs
  exact ⟨g, hg, hgs⟩

theorem continuousSMul_actT : @ContinuousSMul (GzS Z) (Tset F P) (actT hFinv).toSMul _ _ := by
  refine @ContinuousSMul.mk _ _ (actT hFinv).toSMul _ _ ?_
  exact (((Units.continuous_val.comp (continuous_subtype_val.comp continuous_fst)).matrix_mul
    (continuous_subtype_val.comp continuous_snd)).matrix_mul
    (Units.continuous_coe_inv.comp (continuous_subtype_val.comp continuous_fst))).subtype_mk _

include hP in
theorem isPretransitive_actT (hsT : s ∈ Tset F P) : @MulAction.IsPretransitive (GzS Z) (Tset F P) (actT hFinv).toSMul := by
  refine @MulAction.IsPretransitive.mk _ _ (actT hFinv).toSMul ?_
  intro x y
  obtain ⟨a, ha, hax⟩ := exists_conj_eq_semisimple hP x.2
  obtain ⟨b, hb, hby⟩ := exists_conj_eq_semisimple hP y.2
  refine ⟨⟨b⁻¹ * a, (GzS Z).mul_mem ((GzS Z).inv_mem hb) ha⟩, Subtype.ext ?_⟩
  show cj (b⁻¹ * a) x.1 = y.1
  simp only [cj] at hax hby ⊢
  simp only [_root_.mul_inv_rev, inv_inv, Units.val_mul]
  calc (b⁻¹ : GL (Fin n) k).val * a.val * x.1 * (a⁻¹.val * b.val)
      = (b⁻¹ : GL (Fin n) k).val * (a.val * x.1 * a⁻¹.val) * b.val := by
        simp only [Matrix.mul_assoc]
    _ = (b⁻¹ : GL (Fin n) k).val * (b.val * y.1 * b⁻¹.val) * b.val := by rw [hax, hby]
    _ = y.1 := by simp [Matrix.mul_assoc]

end Hyp

end PositivityTheory.RgUd.T.Desc.SLF
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsConjEqSemisimple =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SemisimpleAdjoint.IsSemisimpleOfMem =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SemisimpleAdjoint.IsSemisimpleOfMem", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocStep\npublic import Mathlib.NumberTheory.LocalField.Basic\nimport Mathlib.Algebra.AffineMonoid.UniqueSums\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.LinearAlgebra.Matrix.FiniteDimensional\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.T.Desc.SLF.CRAdj

open PositivityTheory.RgUd.T

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {n : ℕ}

theorem isSemisimple_of_mem (Z : Subalgebra k (Matrix (Fin n) (Fin n) k)) (hZ : CR Z) {a : Matrix (Fin n) (Fin n) k}
    (ha : a ∈ Z) : Module.End.IsSemisimple (Matrix.toLin' a) := by
  haveI : IsReduced Z := hZ.2
  let a' : Z := ⟨a, ha⟩
  have hint : IsIntegral k a' := .of_finite k a'
  refine Module.End.isSemisimple_of_squarefree_aeval_eq_zero
    ((minpoly.isRadical k a').squarefree (minpoly.ne_zero hint)) ?_
  have h1 : aeval a (minpoly k a') = 0 := by
    have := congrArg (Subalgebra.val Z) (minpoly.aeval k a')
    rwa [← Polynomial.aeval_algHom_apply, map_zero] at this
  have e : Matrix.toLin' a = (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _) a := rfl
  rw [e, Polynomial.aeval_algHom_apply, h1, map_zero]

theorem comm_gen (Z : Subalgebra k (Matrix (Fin n) (Fin n) k)) (hZ : CR Z) {s : Matrix (Fin n) (Fin n) k}
    (hs : s ∈ Bz Z) : ∀ a ∈ insert s (Z : Set (Matrix (Fin n) (Fin n) k)),
      ∀ b ∈ insert s (Z : Set (Matrix (Fin n) (Fin n) k)), a * b = b * a := by
  have hs' : ∀ a ∈ Z, a * s = s * a := hs
  intro a ha b hb
  rcases Set.mem_insert_iff.mp ha with h1 | h1 <;> rcases Set.mem_insert_iff.mp hb with h2 | h2
  · rw [h1, h2]
  · rw [h1]
    exact (hs' b h2).symm
  · rw [h2]
    exact hs' a h1
  · exact hZ.1 a h1 b h2

theorem adj_comm (Z : Subalgebra k (Matrix (Fin n) (Fin n) k)) (hZ : CR Z) {s : Matrix (Fin n) (Fin n) k}
    (hs : s ∈ Bz Z) : ∀ a ∈ adj Z s, ∀ b ∈ adj Z s, a * b = b * a := by
  intro a ha b hb
  have h1 : ∀ c ∈ insert s (Z : Set (Matrix (Fin n) (Fin n) k)), Commute c b := fun c hc =>
    Algebra.commute_of_mem_adjoin_of_forall_mem_commute hb (fun d hd => comm_gen Z hZ hs c hc d hd)
  exact (Algebra.commute_of_mem_adjoin_of_forall_mem_commute ha (fun c hc => (h1 c hc).symm)).symm.eq

private theorem lin_comm_lemma {a b : Matrix (Fin n) (Fin n) k} (h : a * b = b * a) :
    Commute (Matrix.toLin' a) (Matrix.toLin' b) :=
  (show Commute a b from h).map (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _)

theorem cr_adj [CharZero k] (Z : Subalgebra k (Matrix (Fin n) (Fin n) k)) (hZ : CR Z) (s : Matrix (Fin n) (Fin n) k)
    (hs : s ∈ Bz Z) (hss : Module.End.IsSemisimple (Matrix.toLin' s)) : CR (adj Z s) := by
  have hsem : ∀ x (hx : x ∈ adj Z s), Module.End.IsSemisimple (Matrix.toLin' x) := by
    intro x hx
    change x ∈ Algebra.adjoin k (insert s (Z : Set (Matrix (Fin n) (Fin n) k))) at hx
    induction hx using Algebra.adjoin_induction with
    | mem y hy =>
      rcases Set.mem_insert_iff.mp hy with rfl | hy
      · exact hss
      · exact isSemisimple_of_mem Z hZ hy
    | algebraMap r =>
      rw [show Matrix.toLin' (algebraMap k (Matrix (Fin n) (Fin n) k) r) =
          algebraMap k (Module.End k (Fin n → k)) r from
        (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _).commutes r]
      exact Module.End.IsSemisimple.of_mem_adjoin_pair (Commute.refl _) hss hss
        (Subalgebra.algebraMap_mem _ r)
    | add y z hy hz ihy ihz =>
      rw [map_add (f := _)]
      exact Module.End.IsSemisimple.add_of_commute (lin_comm_lemma (adj_comm Z hZ hs y hy z hz)) ihy ihz
    | mul y z hy hz ihy ihz =>
      rw [show Matrix.toLin' (y * z) = Matrix.toLin' y * Matrix.toLin' z from
        map_mul (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _) y z]
      exact Module.End.IsSemisimple.mul_of_commute (lin_comm_lemma (adj_comm Z hZ hs y hy z hz)) ihy ihz
  refine ⟨adj_comm Z hZ hs, ⟨fun x hx => ?_⟩⟩
  have hN : IsNilpotent (Matrix.toLin' (x : Matrix (Fin n) (Fin n) k)) :=
    (hx.map (adj Z s).val).map (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _)
  have h0 := Module.End.eq_zero_of_isNilpotent_isSemisimple hN (hsem x x.2)
  apply Subtype.ext
  have h2 : (Matrix.toLinAlgEquiv' : Matrix (Fin n) (Fin n) k ≃ₐ[k] _) (x : Matrix (Fin n) (Fin n) k) = 0 := h0
  simpa using h2

end PositivityTheory.RgUd.T.Desc.SLF.CRAdj
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SemisimpleAdjoint.IsSemisimpleOfMem =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SliceVanOfFrob =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SliceVanOfFrob", "h": "module\n\npublic import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FiberLocalization.EqZeroOfFiberEquivariant\npublic import Development.WeilBound.CoreStatements.AutomorphicKernels.BernsteinUnitaryProducts.BernsteinTheoremA.FrobeniusReciprocity.SupportedInIffOfFrob\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVan\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.IsClosedGzS\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.NilpotentPowers.IsNilpotentPowSub\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.DistrC\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsConjEqSemisimple\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ExistsQuotientHomeo\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.IsUnimodOfEquiv\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Pieces\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SemisimpleAdjoint.IsSemisimpleOfMem\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.T2SpaceCentralizerGroup\nimport GroundTheory.AutomorphicForms.GLnLocal\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Algebra.Group.Units\nimport Mathlib.Topology.Baire.LocallyCompactRegular\nimport Mathlib.Topology.Separation.CompletelyRegular\nimport Mathlib.Topology.Separation.Connected\nimport Mathlib.Topology.Sheaves.Init\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.ContinuousCj\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial GroundTheory.Automorphic GroundTheory.Automorphic.Whittaker MeasureTheory

namespace PositivityTheory.RgUd.T.Desc.SLF

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Desc
open PositivityTheory.PfBern.Loc (SC restr restr_surjective pullL mulInd)
open PositivityTheory.PfBern.Frob (FrobeniusReciprocity IsUnimod eqv eqvF transl translF Fib fibSmul)

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]


theorem sliceVan_of_frob' [CharZero k] (hFr : FrobeniusReciprocity) (hU : Unimod (k := k)) : SliceVan (k := k) := by
  intro n Z hZ s hs hss hV F P hFc hFB hFinv hP ξ hsupp hinv f hf
  have hCR : CR (adj Z s) := CRAdj.cr_adj Z hZ s hs hss
  haveI : T2Space k := t2k
  haveI : TotallyDisconnectedSpace k := tdk
  haveI : SecondCountableTopology k := sck
  haveI : TotallyDisconnectedSpace (Matrix (Fin n) (Fin n) k) := inferInstanceAs (TotallyDisconnectedSpace (Fin n → Fin n → k))
  rcases F.eq_empty_or_nonempty with hF0 | ⟨x0, hx0⟩
  · exact hsupp f ⟨hf.1, Set.subset_univ _⟩ (fun p hp => by simp [hF0] at hp)
  have hsT : s ∈ Tset F P := by
    obtain ⟨g, hg, e⟩ := exists_conj_eq_semisimple hP (P_mem_Tset hP hx0)
    rw [← e]
    exact cj_mem_Tset hFinv hg (P_mem_Tset hP hx0)

  letI A := actT (P := P) hFinv
  haveI := continuousSMul_actT (P := P) hFinv
  haveI := isPretransitive_actT hFinv hP hsT
  haveI : LocallyCompactSpace (Tset F P) := (isClosed_Tset hFc P).isClosedEmbedding_subtypeVal.locallyCompactSpace
  let t : Tset F P := ⟨s, hsT⟩
  obtain ⟨e, he⟩ := exists_quotient_homeo (G := GzS Z) t
  let H := MulAction.stabilizer (GzS Z) t
  have hHc : IsClosed (H : Set (GzS Z)) := by
    have : (H : Set (GzS Z)) = (fun g : GzS Z => g • t) ⁻¹' {t} := by ext g; rfl
    rw [this]
    exact isClosed_singleton.preimage (continuous_id.smul continuous_const)
  haveI : LocallyCompactSpace H := hHc.isClosedEmbedding_subtypeVal.locallyCompactSpace
  have memH : ∀ g : GzS Z, g ∈ H ↔ s * g.1.val = g.1.val * s := by
    intro g
    have h1 : g.1⁻¹.val * g.1.val = 1 := by rw [← Units.val_mul, inv_mul_cancel, Units.val_one]
    have h2 : g.1.val * g.1⁻¹.val = 1 := by rw [← Units.val_mul, mul_inv_cancel, Units.val_one]
    show g • t = t ↔ _
    constructor
    · intro h
      have e1 : g.1.val * s * g.1⁻¹.val = s := congrArg Subtype.val h
      calc s * g.1.val = g.1.val * s * g.1⁻¹.val * g.1.val := by rw [e1]
        _ = g.1.val * s := by rw [mul_assoc, h1, mul_one]
    · intro h
      apply Subtype.ext
      change g.1.val * s * g.1⁻¹.val = s
      rw [← h, mul_assoc, h2, mul_one]
  have uG : IsUnimod (GzS Z) := hU n Z hZ
  let φ : H ≃ₜ* GzS (adj Z s) :=
    { toFun := fun h => ⟨h.1.1, mem_Gz_adj_iff.2 ⟨h.1.2, (memH h.1).1 h.2⟩⟩
      invFun := fun g => ⟨⟨g.1, (mem_Gz_adj_iff.1 g.2).1⟩, (memH _).2 (mem_Gz_adj_iff.1 g.2).2⟩
      left_inv := fun h => rfl
      right_inv := fun g => rfl
      map_mul' := fun a b => rfl
      continuous_toFun := Continuous.subtype_mk (continuous_subtype_val.comp continuous_subtype_val) _
      continuous_invFun := Continuous.subtype_mk (Continuous.subtype_mk continuous_subtype_val _) _ }
  have uH : IsUnimod H := isUnimod_of_equiv φ (hU n (adj Z s) hCR)

  letI B := actX (F := F) hFinv
  haveI := continuousSMul_actX (F := F) hFinv
  have hXc : IsClosed (Xs F) := hFc.prod isClosed_univ
  haveI : LocallyCompactSpace (Xs F) := hXc.isClosedEmbedding_subtypeVal.locallyCompactSpace
  let σX : Xs F → Tset F P := fun q => ⟨aeval q.1.1 P, P_mem_Tset hP q.2.1⟩
  have hσc : Continuous σX :=
    Continuous.subtype_mk ((continuous_aevalM P).comp (continuous_fst.comp continuous_subtype_val)) _
  have hσeq : ∀ (g : GzS Z) (q : Xs F), σX (g • q) = g • σX q := fun g q =>
    Subtype.ext (Asm.aeval_conj g.1 q.1.1 P)
  have he_eq : ∀ (g : GzS Z) (c : GzS Z ⧸ H), e (g • c) = g • e c := by
    intro g c
    induction c using QuotientGroup.induction_on with
    | H g' => rw [MulAction.Quotient.smul_mk, he, he, smul_assoc]
  let p : Xs F → GzS Z ⧸ H := fun q => e.symm (σX q)
  have hpc : Continuous p := e.symm.continuous.comp hσc
  have hp : ∀ (g : GzS Z) (q : Xs F), p (g • q) = g • p q := by
    intro g q
    apply e.injective
    simp only [p, Homeomorph.apply_symm_apply, he_eq, hσeq]
  have hfib : ∀ q : Xs F, p q = ((1 : GzS Z) : GzS Z ⧸ H) ↔ aeval q.1.1 P = s := by
    intro q
    constructor
    · intro h
      have h' : σX q = e ((1 : GzS Z) : GzS Z ⧸ H) := by rw [← h]; simp [p]
      rw [he, one_smul] at h'
      exact congrArg Subtype.val h'
    · intro h
      apply e.injective
      simp only [p, Homeomorph.apply_symm_apply, he, one_smul]
      exact Subtype.ext h

  letI : MeasurableSpace (GzS Z) := borel _
  haveI : BorelSpace (GzS Z) := ⟨rfl⟩
  obtain ⟨Fr, hFr1, -⟩ := hFr (GzS Z) H hHc uG uH (Xs F) p hpc hp (1 : GzS Z →* ℂˣ)
    (by simpa using continuous_const) Measure.haar Measure.haar

  obtain ⟨D, hD⟩ := exists_distr_on ξ hXc hsupp
  let actH : GL (Fin n) k → Sp k n ≃ₜ Sp k n := fun g =>
    { toFun := act g, invFun := act g⁻¹
      left_inv := fun q => by rw [← act_mul, inv_mul_cancel, act_one]
      right_inv := fun q => by rw [← act_mul, mul_inv_cancel, act_one]
      continuous_toFun := continuous_act.comp (continuous_const.prodMk continuous_id)
      continuous_invFun := continuous_act.comp (continuous_const.prodMk continuous_id) }
  have hDeqv : D ∈ eqv (X := Xs F) (1 : GzS Z →* ℂˣ) := by
    intro g φ0
    obtain ⟨f0, rfl⟩ := restr_surjective hXc φ0
    let f1 : SC (Sp k n) := pullL (actH g⁻¹.1) f0
    have e1 : transl g (restr hXc f0) = restr hXc f1 := Subtype.ext (funext fun x => rfl)
    rw [e1]
    simp only [MonoidHom.one_apply, Units.val_one, one_mul]
    exact ((hD f1).symm.trans (hinv g⁻¹.1 (g⁻¹).2 f0 ⟨f0.2, Set.subset_univ _⟩)).trans (hD f0)
  let C : Set (Xs F) := {q | q.1.2 = 0}
  have hCc : IsClosed C := isClosed_eq (continuous_snd.comp continuous_subtype_val) continuous_const
  have hCinv : ∀ (g : GzS Z), ∀ x ∈ C, g • x ∈ C := by
    intro g x hx
    change g.1.val *ᵥ x.1.2 = 0
    rw [show x.1.2 = 0 from hx, Matrix.mulVec_zero]
  have hSD : PositivityTheory.PfBern.Frob.SupportedIn (D : PositivityTheory.PfBern.Frob.Distr (Xs F)) C := by
    refine (hFr1 ⟨D, hDeqv⟩ C hCc hCinv).2 ?_
    intro φ0 hφ0
    have hEeqv := (Fr ⟨D, hDeqv⟩).2
    set E : PositivityTheory.PfBern.Frob.Distr (Fib p) := ((Fr ⟨D, hDeqv⟩ : eqvF hp _) : PositivityTheory.PfBern.Frob.Distr (Fib p)) with hEdef
    let Ys : Set (Sp k n) := {q | q.1 ∈ F ∧ aeval q.1 P = s}
    have hYc : IsClosed Ys := (hFc.preimage continuous_fst).inter
      (isClosed_eq ((continuous_aevalM P).comp continuous_fst) continuous_const)
    let hY : Fib p ≃ₜ Ys :=
      { toFun := fun z => ⟨z.1.1, z.1.2.1, (hfib z.1).1 z.2⟩
        invFun := fun y => ⟨⟨y.1, y.2.1, trivial⟩, (hfib _).2 y.2.2⟩
        left_inv := fun z => rfl
        right_inv := fun y => rfl
        continuous_toFun := Continuous.subtype_mk (continuous_subtype_val.comp continuous_subtype_val) _
        continuous_invFun := Continuous.subtype_mk (Continuous.subtype_mk continuous_subtype_val _) _ }
    let E' : PositivityTheory.PfBern.Loc.Distr Ys := E.comp (pullL hY)
    obtain ⟨η, hη⟩ := exists_functional hYc E'
    have hcommY : ∀ y ∈ Ys, s * y.1 = y.1 * s := by
      intro y hy
      have := Asm.comm_aeval (a := y.1) (x := y.1) rfl P
      rw [hy.2] at this
      exact this.symm
    have hSη : Supp η (Bz (adj Z s) ×ˢ Set.univ) := by
      intro f hf1 hvan
      have hr : restr hYc ⟨f, hf1.1⟩ = 0 := Subtype.ext (funext fun y =>
        hvan y.1 ⟨mem_Bz_adj (hFB y.2.1) (hcommY y.1 y.2), trivial⟩)
      have := hη ⟨f, hf1.1⟩
      rw [hr, map_zero] at this
      exact this
    have hIη : Inv (adj Z s) η := by
      intro h hh f hf1
      obtain ⟨hhZ, hhs⟩ := mem_Gz_adj_iff.1 hh
      let hG : GzS Z := ⟨h, hhZ⟩
      let hH : H := ⟨hG, (memH hG).2 hhs⟩
      let f1 : SC (Sp k n) := pullL (actH h) ⟨f, hf1.1⟩
      have key : pullL hY (restr hYc f1) = translF hp hH⁻¹ (pullL hY (restr hYc ⟨f, hf1.1⟩)) :=
        Subtype.ext (funext fun z => rfl)
      have h1 : η (fun q => f (act h q)) = η f1 := rfl
      rw [h1, hη f1, hη ⟨f, hf1.1⟩]
      change E (pullL hY (restr hYc f1)) = E (pullL hY (restr hYc ⟨f, hf1.1⟩))
      rw [key]
      exact (hEeqv hH⁻¹ _).trans (by simp)
    have hkill := hV η hSη hIη
    let φ' : SC Ys := pullL hY.symm φ0
    obtain ⟨f0, hf0⟩ := restr_surjective hYc φ'
    have hsupp' : Function.support (φ' : Ys → ℂ) ⊆ {y | y.1.2 ≠ 0} := fun y hy => hφ0 hy
    have hK : IsCompact (Subtype.val '' Function.support (φ' : Ys → ℂ)) :=
      (isCompact_support φ'.2).image continuous_subtype_val
    have hKsub : Subtype.val '' Function.support (φ' : Ys → ℂ) ⊆ {q : Sp k n | q.2 ≠ 0} := by
      rintro _ ⟨y, hy, rfl⟩
      exact hsupp' hy
    have hUo : IsOpen {q : Sp k n | q.2 ≠ 0} := isOpen_ne_fun continuous_snd continuous_const
    obtain ⟨Bc, hBc, hBo, hKB, hBU⟩ := exists_isCompact_isOpen_between hK hUo hKsub
    let f : SC (Sp k n) := mulInd Bc ⟨hBc.isClosed, hBo⟩ f0
    have hrf : restr hYc f = φ' := by
      apply Subtype.ext
      funext y
      change Bc.indicator 1 y.1 * (f0 : Sp k n → ℂ) y.1 = (φ' : Ys → ℂ) y
      have e0 : (f0 : Sp k n → ℂ) y.1 = (φ' : Ys → ℂ) y := congrFun (congrArg Subtype.val hf0) y
      by_cases hyB : y.1 ∈ Bc
      · simp [hyB, e0]
      · have : (φ' : Ys → ℂ) y = 0 := by
          by_contra hne
          exact hyB (hKB ⟨y, hne, rfl⟩)
        simp [hyB, this]
    have hfU : (f : Sp k n → ℂ) ∈ supportedIn {q : Sp k n | q.2 ≠ 0} := by
      refine ⟨f.2, fun q hq => hBU ?_⟩
      by_contra hqB
      exact hq (by simp [f, mulInd, hqB])
    have hz := hkill f hfU
    rw [hη f, hrf] at hz
    have e2 : pullL hY φ' = φ0 := PositivityTheory.PfBern.Loc.pullL_pullL_symm hY φ0
    change E (pullL hY φ') = 0 at hz
    rw [e2] at hz
    exact hz

  rw [show ξ f = D (restr hXc ⟨f, hf.1⟩) from hD ⟨f, hf.1⟩]
  refine hSD _ fun x hx hxC => hx ?_
  have h0 : x.1.2 = 0 := hxC
  show f x.1 = 0
  by_contra hfx
  exact hf.2 hfx h0

end PositivityTheory.RgUd.T.Desc.SLF
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SliceVanOfFrob =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.Imports =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.Imports", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.IsClosedGzS\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.OpenSlices.LatticeIndices.RelIndexLatConj\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.UnimodOfIndexSym\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.T.Desc.SLF.Un2

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem unimod [CharZero k] : PositivityTheory.RgUd.T.Desc.SLF.Unimod (k := k) :=
  unimod_of_indexSym PositivityTheory.RgUd.T.Desc.SLT.indexSym

end PositivityTheory.RgUd.T.Desc.SLF.Un2
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.Imports =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.DescFinal =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.DescFinal", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVan\npublic import Mathlib.NumberTheory.LocalField.Basic\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.CharpolyNilpotence.IsNilpotentAevalCharpoly\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.NilpotentPowers.IsNilpotentPowSub\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.SliceVanOfFrob\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.Descent.SliceVanishing.Unimodularity.Imports\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.FrobProof\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.T.Desc.Final

open PositivityTheory.RgUd.T PositivityTheory.RgUd.T.Desc

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem sliceVan [CharZero k] : SliceVan (k := k) :=
  SLF.sliceVan_of_frob' PositivityTheory.PfBern.Frob.frobeniusReciprocity SLF.Un2.unimod

theorem descA [CharZero k] : DescA (k := k) := Asm.descA_of JC.jcPoly (sliceVan k)

end PositivityTheory.RgUd.T.Desc.Final
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.DescFinal =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.LocStep =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.LocStep", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocStep\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.BernsteinExponentBounds.IsInvForm\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.AdjointSemisimple.AdjunctionCharZero\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.LocalContinuity.LocalDescentHolds\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.NilpotentOrbits.NilpB\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CompactOrbits.TraceAlgebra.MemBzOfAdjoin\nimport Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.DescFinal\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.T.Final

open PositivityTheory.RgUd.T

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem locStep : LocStep (k := k) := LocStepPf.local_descent_holds
theorem van_all [CharZero k] : ∀ (m n : ℕ) (Z : Subalgebra k (Matrix (Fin n) (Fin n) k)),
    Module.finrank k (Subalgebra.centralizer k (Z : Set (Matrix (Fin n) (Fin n) k))) = m → CR Z → Van Z := by
  intro m
  induction m using Nat.strong_induction_on with
  | _ m ih =>
    intro n Z hm hZ
    refine _root_.PositivityTheory.RgUd.T.Nil.Final.nilpB k n Z hZ fun ξ hs hi => locStep k n Z hZ ξ hs hi fun y => ?_
    rcases _root_.PositivityTheory.RgUd.T.Alg.dich k n Z hZ y with h | ⟨s, hs, hsZ, hss, hy⟩
    · exact Or.inl h
    · obtain ⟨hC, hlt⟩ := _root_.PositivityTheory.RgUd.T.adjunction_char_zero k n Z hZ s hs hsZ hss
      exact Or.inr fun ξ' h1 h2 => _root_.PositivityTheory.RgUd.T.Desc.Final.descA k n Z hZ s hs hsZ hss (ih _ (hm ▸ hlt) n _ rfl hC) y hy ξ' h1 h2

theorem thmT [CharZero k] : PositivityTheory.RgUd.ThmT k := by
  intro n Z hcomm hred ξ hsupp hinv f hf
  exact van_all k _ n Z rfl ⟨hcomm, hred⟩ ξ (fun g hg h0 => hsupp g hg fun p hp => h0 p ⟨hp, Set.mem_univ _⟩)
    (fun g hg f hf => hinv g hg f hf) f hf

end PositivityTheory.RgUd.T.Final
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.FrobeniusReciprocity.LocStep =====
