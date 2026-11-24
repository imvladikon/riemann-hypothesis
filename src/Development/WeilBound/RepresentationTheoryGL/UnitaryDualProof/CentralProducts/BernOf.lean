module

public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD
public import Mathlib.LinearAlgebra.Eigenspace.Triangularizable
public import Mathlib.LinearAlgebra.Eigenspace.Basic
public import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.CentralCharacterEqProdSupercuspidalSupport
public import Development.AbelianVarietyTheory.Proofs.TwistedOperators.ParabolicProductTwoRepsEquivTwoBlockInduction
public import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.ColMatMulGlEmbMat
public import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.UnipotentDerivatives.DerUnipLeUnipB
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.MirabolicTwistedKernelDerivativeZero
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.TwistedJacquetPhiMinusEquiv
public import GroundTheory.AutomorphicForms.InductionParabolicGroups
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RestrictionMirabolicTwistedKernel
public import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.WhittakerCuspidal.UnipBEqUnipotent
public import GroundTheory.AutomorphicForms.AdmissibleFiniteLength
public import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.LeibnizOrders.LeibnizOrd
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.IsSmoothIterPhi
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LeibnizOrderOfExactSequences
public import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.BernsteinZelevinskyGL.TopAdm
public import Development.AbelianVarietyTheory.Definitions.NonGaloisDescent.NonemptyEquivMultiProdOne
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.BernsteinExponentBounds.IsInvForm
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AdjacentQuotientOfTwoSegment
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsCIndValue
public import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsNontrivialDerivative
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.UnitarisableHypotheses.NormEqOneOfUnitarisable
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
import Mathlib.RingTheory.SimpleRing.Principal
import Mathlib.Tactic.Echelon.Zsqrtd
import Mathlib.Tactic.Inclusion.Extension.Core.Core
import Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp
import Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic
import Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses
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
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat
import Std.Tactic.BVDecide.Normalize.Prop
import GroundTheory.AutomorphicForms.AdmissibleInduction
import GroundTheory.AutomorphicForms.CuspidalAdmissible
import GroundTheory.LocalFields.PadicLogSeries
import Mathlib.Algebra.Order.Star.Real
import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.TwistedJacquetIteratedPhiEquiv
import Mathlib.Tactic.Linter.HaveILetI
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.ExistsBijectiveOfIsSubquotient

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralGenerators.CentralSubGen, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralSub, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.EigenInjectivity.SubInjective, Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DerCharEqOneOfMemUnipRad, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.LeviScalars.EmbScalarMemLevi, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.NontrivialOfNeBot, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.PosProdOf, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.SubquotientBounds.LeOfSubsingletonSubQuot, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.BernOf

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralGenerators.CentralSubGen =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralGenerators.CentralSubGen", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\npublic import Mathlib.LinearAlgebra.Eigenspace.Triangularizable\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.LinearAlgebra.Eigenspace.Basic\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.BZMir.Leib

namespace PositivityTheory.RgUd.Prod.CS

variable {k : Type} [Field k]

theorem sc_one (n : ℕ) : sc n (1 : kˣ) = 1 := map_one _

theorem sc_mul (n : ℕ) (y z : kˣ) : sc n (y * z) = sc n y * sc n z := map_mul _ _ _

theorem sc_comm (n : ℕ) (y : kˣ) (g : GL (Fin n) k) : sc n y * g = g * sc n y := by
  apply Units.ext
  have h : ((sc n y : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) = Matrix.scalar (Fin n) (y : k) := rfl
  show ((sc n y : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) * (g : Matrix (Fin n) (Fin n) k) =
    (g : Matrix (Fin n) (Fin n) k) * ((sc n y : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)
  rw [h]
  exact (Matrix.scalar_commute (y : k) (fun r => Commute.all _ _) _).eq

theorem rho_sc_comm {n : ℕ} (A : GRep k n) (y : kˣ) (g : GL (Fin n) k) (v : A.V) :
    A.ρ (sc n y) (A.ρ g v) = A.ρ g (A.ρ (sc n y) v) := by
  rw [← Module.End.mul_apply, ← map_mul, sc_comm, map_mul, Module.End.mul_apply]

theorem centralSub_gen [TopologicalSpace k] : CentralSub k := by
  classical
  intro n A _hs hLF x c a ha hxa
  obtain ⟨U, hUf, haU, hUinv⟩ := hLF a
  have := hUf
  let Good : Submodule ℂ A.V → Prop := fun S => S ≤ U ∧ S ≠ ⊥ ∧
    (∀ y : kˣ, ∀ s ∈ S, A.ρ (sc n y) s ∈ S) ∧ ∀ s ∈ S, A.ρ (sc n x) s = c • s
  have hex : ∃ d : ℕ, ∃ S : Submodule ℂ A.V, Good S ∧ Module.finrank ℂ S = d := by
    refine ⟨_, U ⊓ LinearMap.ker (A.ρ (sc n x) - c • LinearMap.id), ⟨inf_le_left, ?_, ?_, ?_⟩, rfl⟩
    · intro h
      apply ha
      have hm : a ∈ U ⊓ LinearMap.ker (A.ρ (sc n x) - c • LinearMap.id) :=
        ⟨haU, by simp [LinearMap.mem_ker, hxa]⟩
      rw [h] at hm
      exact (Submodule.mem_bot ℂ).1 hm
    · rintro y s ⟨hsU, hsk⟩
      refine ⟨hUinv y s hsU, ?_⟩
      have hsk' : A.ρ (sc n x) s = c • s := by
        simpa [LinearMap.mem_ker, sub_eq_zero] using hsk
      show A.ρ (sc n y) s ∈ LinearMap.ker (A.ρ (sc n x) - c • LinearMap.id)
      rw [LinearMap.mem_ker, LinearMap.sub_apply, rho_sc_comm A x (sc n y) s, hsk', map_smul]
      simp
    · rintro s ⟨_, hsk⟩
      simpa [LinearMap.mem_ker, sub_eq_zero] using hsk
  obtain ⟨S, ⟨hSU, hS0, hSinv, hSx⟩, hSd⟩ := Nat.find_spec hex
  have hmin : ∀ S' : Submodule ℂ A.V, Good S' → Module.finrank ℂ S ≤ Module.finrank ℂ S' := by
    intro S' hS'
    rw [hSd]
    exact Nat.find_min' hex ⟨S', hS', rfl⟩
  have : FiniteDimensional ℂ S := Submodule.finiteDimensional_of_le hSU
  have hscal : ∀ y : kˣ, ∃ μ : ℂ, ∀ s ∈ S, A.ρ (sc n y) s = μ • s := by
    intro y
    let f : Module.End ℂ S := (A.ρ (sc n y)).restrict (hSinv y)
    have : Nontrivial S := Submodule.nontrivial_iff_ne_bot.2 hS0
    obtain ⟨μ, hμ⟩ := Module.End.exists_eigenvalue f
    obtain ⟨w, hw⟩ := hμ.exists_hasEigenvector
    refine ⟨μ, ?_⟩
    have hfw : A.ρ (sc n y) (w : A.V) = μ • (w : A.V) := congrArg Subtype.val hw.apply_eq_smul
    let S' : Submodule ℂ A.V := S ⊓ LinearMap.ker (A.ρ (sc n y) - μ • LinearMap.id)
    have hmem : ∀ s, s ∈ S' ↔ s ∈ S ∧ A.ρ (sc n y) s = μ • s := by
      intro s
      simp [S', Submodule.mem_inf, LinearMap.mem_ker, sub_eq_zero]
    have hgood : Good S' := by
      refine ⟨inf_le_left.trans hSU, ?_, ?_, ?_⟩
      · intro h
        have hw' : (w : A.V) ∈ S' := (hmem _).2 ⟨w.2, hfw⟩
        rw [h] at hw'
        exact hw.2 (Subtype.ext ((Submodule.mem_bot ℂ).1 hw'))
      · intro y' s hs
        obtain ⟨hsS, hsy⟩ := (hmem s).1 hs
        refine (hmem _).2 ⟨hSinv y' s hsS, ?_⟩
        rw [rho_sc_comm A y (sc n y') s, hsy, map_smul]
      · intro s hs
        exact hSx s ((hmem s).1 hs).1
    have hEq : S' = S := Submodule.eq_of_le_of_finrank_le inf_le_left (hmin S' hgood)
    intro s hs
    rw [← hEq] at hs
    exact ((hmem s).1 hs).2
  choose lam hlam using hscal
  obtain ⟨a', ha'S, ha'0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hS0
  have key : ∀ μ ν : ℂ, μ • a' = ν • a' → μ = ν := fun μ ν h => smul_left_injective ℂ ha'0 h
  have hlam1 : lam 1 = 1 := by
    apply key
    rw [← hlam 1 a' ha'S, sc_one, map_one, Module.End.one_apply, one_smul]
  have hlammul : ∀ y z : kˣ, lam (y * z) = lam y * lam z := by
    intro y z
    apply key
    rw [← hlam (y * z) a' ha'S, sc_mul, map_mul, Module.End.mul_apply, hlam z a' ha'S, map_smul,
      hlam y a' ha'S, smul_smul, mul_comm]
  let f : kˣ →* ℂ := { toFun := lam, map_one' := hlam1, map_mul' := hlammul }
  let Wm : Submodule ℂ A.V :=
    { carrier := {v | ∀ y : kˣ, A.ρ (sc n y) v = lam y • v}
      add_mem' := by
        intro u v hu hv y
        have hu' : ∀ y : kˣ, A.ρ (sc n y) u = lam y • u := hu
        have hv' : ∀ y : kˣ, A.ρ (sc n y) v = lam y • v := hv
        show A.ρ (sc n y) (u + v) = lam y • (u + v)
        rw [map_add (f := _), hu' y, hv' y, smul_add]
      zero_mem' := by
        intro y
        show A.ρ (sc n y) 0 = lam y • (0 : A.V)
        rw [map_zero, smul_zero]
      smul_mem' := by
        intro r v hv y
        have hv' : ∀ y : kˣ, A.ρ (sc n y) v = lam y • v := hv
        show A.ρ (sc n y) (r • v) = lam y • (r • v)
        rw [map_smul, hv' y, smul_comm] }
  let W : Subrepresentation A.ρ := ⟨Wm, fun g v hv y => by
    have hv' : ∀ y : kˣ, A.ρ (sc n y) v = lam y • v := hv
    show A.ρ (sc n y) (A.ρ g v) = lam y • A.ρ g v
    rw [rho_sc_comm, hv' y, map_smul]⟩
  have ha'W : a' ∈ W.toSubmodule := fun y => hlam y a' ha'S
  refine ⟨W, f.toHomUnits, ?_, ?_, ?_⟩
  · intro h
    apply ha'0
    have h2 : W.toSubmodule = (⊥ : Subrepresentation A.ρ).toSubmodule := congrArg _ h
    have h3 : a' ∈ (⊥ : Subrepresentation A.ρ).toSubmodule := h2 ▸ ha'W
    exact (Submodule.mem_bot ℂ).1 h3
  · intro z v
    apply Subtype.ext
    show A.ρ (sc n z) v.1 = ((f.toHomUnits z : ℂˣ) : ℂ) • v.1
    rw [MonoidHom.coe_toHomUnits]
    exact v.2 z
  · show ((f.toHomUnits x : ℂˣ) : ℂ) = c
    rw [MonoidHom.coe_toHomUnits]
    exact (key _ _ ((hlam x a' ha'S).symm.trans (hSx a' ha'S))).trans rfl

theorem centralSub (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] :
    CentralSub k :=
  centralSub_gen

end PositivityTheory.RgUd.Prod.CS
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralGenerators.CentralSubGen =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralSub =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralSub", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralGenerators.CentralSubGen\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace PositivityTheory.RgUd.Prod.CSel

end PositivityTheory.RgUd.Prod.CSel
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralSub =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.EigenInjectivity.SubInjective =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.EigenInjectivity.SubInjective", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\npublic import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.CentralCharacterEqProdSupercuspidalSupport\npublic import Development.AbelianVarietyTheory.Proofs.TwistedOperators.ParabolicProductTwoRepsEquivTwoBlockInduction\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\npublic import Mathlib.LinearAlgebra.Eigenspace.Triangularizable\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.BZMir.Leib
open scoped TensorProduct

namespace PositivityTheory.RgUd.Prod.Eig

section Lin

variable {V W : Type} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W]

theorem sub_injective (f : Module.End ℂ V) (α : ℂ) (h : ∀ a : V, f a = α • a → a = 0) :
    Function.Injective (f - α • (LinearMap.id : V →ₗ[ℂ] V)) := by
  refine (injective_iff_map_eq_zero _).2 fun a ha => h a ?_
  simpa [sub_eq_zero] using ha

theorem exists_fin (S : Module.End ℂ V) (T : Module.End ℂ W)
    (hA : ∀ a : V, ∃ U : Submodule ℂ V, FiniteDimensional ℂ U ∧ a ∈ U ∧ ∀ u ∈ U, S u ∈ U)
    (hB : ∀ b : W, ∃ U : Submodule ℂ W, FiniteDimensional ℂ U ∧ b ∈ U ∧ ∀ u ∈ U, T u ∈ U)
    (y : V ⊗[ℂ] W) : ∃ (U₁ : Submodule ℂ V) (U₂ : Submodule ℂ W), FiniteDimensional ℂ U₁ ∧
      FiniteDimensional ℂ U₂ ∧ (∀ u ∈ U₁, S u ∈ U₁) ∧ (∀ u ∈ U₂, T u ∈ U₂) ∧
      y ∈ LinearMap.range (TensorProduct.map U₁.subtype U₂.subtype) := by
  induction y using TensorProduct.induction_on with
  | zero => exact ⟨⊥, ⊥, inferInstance, inferInstance, by simp, by simp, zero_mem _⟩
  | tmul a b =>
    obtain ⟨U₁, h₁, ha, s₁⟩ := hA a
    obtain ⟨U₂, h₂, hb, s₂⟩ := hB b
    exact ⟨U₁, U₂, h₁, h₂, s₁, s₂, ⟨⟨a, ha⟩ ⊗ₜ ⟨b, hb⟩, by simp⟩⟩
  | add y z hy hz =>
    obtain ⟨U₁, U₂, h₁, h₂, s₁, s₂, my⟩ := hy
    obtain ⟨U₁', U₂', h₁', h₂', s₁', s₂', mz⟩ := hz
    have st : ∀ {M : Type} [AddCommGroup M] [Module ℂ M] (F : Module.End ℂ M) (P Q : Submodule ℂ M),
        (∀ u ∈ P, F u ∈ P) → (∀ u ∈ Q, F u ∈ Q) → ∀ u ∈ P ⊔ Q, F u ∈ P ⊔ Q := by
      intro M _ _ F P Q hP hQ u hu
      obtain ⟨p, hp, q, hq, rfl⟩ := Submodule.mem_sup.1 hu
      rw [map_add (f := _)]
      exact Submodule.add_mem_sup (hP p hp) (hQ q hq)
    have mono : ∀ (P P' : Submodule ℂ V) (Q Q' : Submodule ℂ W), P ≤ P' → Q ≤ Q' →
        LinearMap.range (TensorProduct.map P.subtype Q.subtype) ≤
          LinearMap.range (TensorProduct.map P'.subtype Q'.subtype) := by
      intro P P' Q Q' hP hQ
      have : TensorProduct.map P.subtype Q.subtype =
          TensorProduct.map P'.subtype Q'.subtype ∘ₗ
            TensorProduct.map (Submodule.inclusion hP) (Submodule.inclusion hQ) := by
        rw [← TensorProduct.map_comp]; rfl
      rw [this]
      exact LinearMap.range_comp_le_range _ _
    exact ⟨U₁ ⊔ U₁', U₂ ⊔ U₂', inferInstance, inferInstance, st S _ _ s₁ s₁', st T _ _ s₂ s₂',
      add_mem (mono _ _ _ _ le_sup_left le_sup_left my) (mono _ _ _ _ le_sup_right le_sup_right mz)⟩

theorem tensor_eig (S : Module.End ℂ V) (T : Module.End ℂ W) (hS : Function.Injective S)
    (U₁ : Submodule ℂ V) (U₂ : Submodule ℂ W) [FiniteDimensional ℂ U₁] [FiniteDimensional ℂ U₂]
    (h₁ : ∀ u ∈ U₁, S u ∈ U₁)
    (y : V ⊗[ℂ] W) (hy : y ∈ LinearMap.range (TensorProduct.map U₁.subtype U₂.subtype))
    (hy0 : y ≠ 0) (c : ℂ) (hc : TensorProduct.map S T y = c • y) :
    ∃ α β : ℂ, c = α * β ∧ (∃ a : V, a ≠ 0 ∧ S a = α • a) ∧ ∃ b : W, b ≠ 0 ∧ T b = β • b := by
  set R := LinearMap.range (TensorProduct.map U₁.subtype U₂.subtype) with hR
  set S' := LinearMap.rTensor W S with hS'
  set T' := LinearMap.lTensor V T with hT'
  set P := TensorProduct.map S T with hP
  have hPST : ∀ z, P z = S' (T' z) := fun z => by
    rw [hP, hS', hT', ← LinearMap.comp_apply, LinearMap.rTensor_comp_lTensor]
  have hPS : ∀ z, P (S' z) = S' (P z) := fun z => by
    have : P ∘ₗ S' = S' ∘ₗ P := TensorProduct.ext' fun a b => by simp [hP, hS']
    exact LinearMap.congr_fun this z
  have hRS : ∀ z ∈ R, S' z ∈ R := by
    rintro _ ⟨z, rfl⟩
    refine ⟨TensorProduct.map (S.restrict h₁) LinearMap.id z, ?_⟩
    have : TensorProduct.map U₁.subtype U₂.subtype ∘ₗ TensorProduct.map (S.restrict h₁) LinearMap.id =
        S' ∘ₗ TensorProduct.map U₁.subtype U₂.subtype :=
      TensorProduct.ext' fun a b => by simp [hS', LinearMap.restrict_apply]
    exact LinearMap.congr_fun this z
  let E : Submodule ℂ (V ⊗[ℂ] W) := R ⊓ LinearMap.ker (P - c • LinearMap.id)
  have memE : ∀ z, z ∈ E ↔ z ∈ R ∧ P z = c • z := fun z => by
    simp [E, sub_eq_zero]
  have hES : ∀ z ∈ E, S' z ∈ E := fun z hz => by
    rw [memE] at hz ⊢
    exact ⟨hRS z hz.1, by rw [hPS, hz.2, map_smul]⟩
  have : FiniteDimensional ℂ R := LinearMap.finiteDimensional_range _
  have : FiniteDimensional ℂ E := Submodule.finiteDimensional_of_le inf_le_left
  have hyE : y ∈ E := (memE y).2 ⟨hy, hc⟩
  have : Nontrivial E := ⟨⟨⟨y, hyE⟩, 0, fun h => hy0 (congrArg Subtype.val h)⟩⟩
  obtain ⟨α, hα⟩ := Module.End.exists_eigenvalue (S'.restrict hES)
  obtain ⟨v, hv⟩ := hα.exists_hasEigenvector
  have hv1 : S' v.1 = α • v.1 := by
    have := Module.End.mem_eigenspace_iff.1 hv.1
    exact congrArg Subtype.val this
  have hv0 : v.1 ≠ 0 := fun h => hv.2 (Subtype.ext h)
  have hv2 : P v.1 = c • v.1 := ((memE _).1 v.2).2
  have hS'inj : Function.Injective S' := Module.Flat.rTensor_preserves_injective_linearMap S hS
  have hα0 : α ≠ 0 := by
    rintro rfl
    exact hv0 (hS'inj (by rw [hv1, zero_smul, map_zero]))
  have hT1 : T' v.1 = (c / α) • v.1 := by
    apply hS'inj
    rw [← hPST, hv2, map_smul, hv1, smul_smul, div_mul_cancel₀ _ hα0]
  refine ⟨α, c / α, (mul_div_cancel₀ _ hα0).symm, ?_, ?_⟩
  · by_contra hno
    push Not at hno
    have hinj := sub_injective S α fun a ha => by
      by_contra h0; exact hno a h0 ha
    have h3 := Module.Flat.rTensor_preserves_injective_linearMap (M := W) _ hinj
    have h4 : LinearMap.rTensor W (S - α • LinearMap.id) v.1 = 0 := by
      rw [LinearMap.rTensor_sub, LinearMap.rTensor_smul, LinearMap.rTensor_id, LinearMap.sub_apply,
        LinearMap.smul_apply, LinearMap.id_apply, ← hS', hv1, sub_self]
    exact hv0 (h3 (by rw [h4, map_zero]))
  · by_contra hno
    push Not at hno
    have hinj := sub_injective T (c / α) fun b hb => by
      by_contra h0; exact hno b h0 hb
    have h3 := Module.Flat.lTensor_preserves_injective_linearMap (M := V) _ hinj
    have h4 : LinearMap.lTensor V (T - (c / α) • LinearMap.id) v.1 = 0 := by
      rw [LinearMap.lTensor_sub, LinearMap.lTensor_smul, LinearMap.lTensor_id, LinearMap.sub_apply,
        LinearMap.smul_apply, LinearMap.id_apply, ← hT', hT1, sub_self]
    exact hv0 (h3 (by rw [h4, map_zero]))

end Lin

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem eigProd : EigProd k := by
  intro r t A B _ _ hA hB x c f hf hfc
  have hinj : ∀ {n : ℕ} (C : GRep k n), Function.Injective (C.ρ (sc n x)) := fun {n} C => by
    refine Function.LeftInverse.injective (g := C.ρ (sc n x⁻¹)) fun a => ?_
    rw [← Module.End.mul_apply, ← map_mul, ← map_mul, inv_mul_cancel, map_one, map_one, Module.End.one_apply]
  have h1 : leviEmb k (two (stdSum (rfl : r + t = r + t)))
      (fun a => GeneralLinearGroup.scalar (Two (Fin r) (Fin t) a) x) = sc (r + t) x := by
    ext i j
    obtain ⟨⟨b, y⟩, rfl⟩ := (two (stdSum (rfl : r + t = r + t))).surjective i
    obtain ⟨⟨b', y'⟩, rfl⟩ := (two (stdSum (rfl : r + t = r + t))).surjective j
    by_cases hb : b = b'
    · subst hb
      simp only [leviEmb, blockDiagonal'_apply_eq, Equiv.symm_apply_apply, Matrix.reindex_apply, Matrix.submatrix_apply, MonoidHom.coe_toHomUnits, MonoidHom.coe_mk, OneHom.coe_mk]
      simp [GeneralLinearGroup.scalar, diagonal_apply]
    · simp only [leviEmb, blockDiagonal'_apply, Equiv.symm_apply_apply, Matrix.reindex_apply, Matrix.submatrix_apply, MonoidHom.coe_toHomUnits, MonoidHom.coe_mk, OneHom.coe_mk, hb, ↓reduceDIte]
      simp [hb]
  obtain ⟨g, hg⟩ : ∃ g, f.1.1 g ≠ 0 := by
    by_contra h
    push Not at h
    exact hf (Subtype.ext (Subtype.ext (funext h)))
  have hc : f.1.1 (g * sc (r + t) x) = c • f.1.1 g := congrArg (fun F : (A.prod B).V => F.1.1 g) hfc
  have hcomm : g * sc (r + t) x = sc (r + t) x * g := by
    ext i j
    simp [mul_comm]
  let e := two (stdSum (rfl : r + t = r + t))
  let d : Levi k (Two (Fin r) (Fin t)) := fun a => GeneralLinearGroup.scalar _ x
  have hp : leviEmb k e d ∈ parab k e := by
    apply mem_parab_iff.2
    intro a b i j hab
    simp [leviEmb, blockDiagonal'_apply, hab.ne']
  have hproj : leviProj k e ⟨leviEmb k e d, hp⟩ = d := by
    funext a
    ext i j
    simp [leviProj_apply, leviEmb, blockDiagonal'_apply_eq]
  have h5 := parInd_law e (piTensor (twoRep A.ρ B.ρ)) f ⟨leviEmb k e d, hp⟩ g
  rw [hproj, GlobalTheory.CentralSupport.deltaHalf_scalar] at h5
  have h6 : piTensor (twoRep A.ρ B.ρ) (fun a => GeneralLinearGroup.scalar (Two (Fin r) (Fin t) a) x) (f.1.1 g) =
      c • f.1.1 g := by
    have h7 : f.1.1 (leviEmb k (two (stdSum (rfl : r + t = r + t)))
        (fun a => GeneralLinearGroup.scalar (Two (Fin r) (Fin t) a) x) * g) = c • f.1.1 g := by
      rw [h1, ← hcomm]; exact hc
    rw [h5] at h7
    simpa using h7
  have htr : ∀ z, Exponents.boolTensorEquiv (X := TwoT A.V B.V)
      (piTensor (twoRep A.ρ B.ρ) (fun a => GeneralLinearGroup.scalar (Two (Fin r) (Fin t) a) x) z) =
      TensorProduct.map (A.ρ (sc r x)) (B.ρ (sc t x)) (Exponents.boolTensorEquiv (X := TwoT A.V B.V) z) := by
    intro z
    induction z using PiTensorProduct.induction_on with
    | add z w hz hw => rw [map_add (f := _), map_add (f := _), hz, hw, map_add (f := _), map_add (f := _)]
    | smul_tprod s z =>
      rw [map_smul, map_smul, map_smul, map_smul, piTensor_tprod, Exponents.boolTensorEquiv_tprod,
        Exponents.boolTensorEquiv_tprod, TensorProduct.map_tmul]
      rfl
  set y := Exponents.boolTensorEquiv (X := TwoT A.V B.V) (f.1.1 g) with hy
  have hy0 : y ≠ 0 := by
    rw [hy]; exact (LinearEquiv.map_ne_zero_iff _).2 hg
  have hyc : TensorProduct.map (A.ρ (sc r x)) (B.ρ (sc t x)) y = c • y := by
    rw [hy, ← htr, h6, map_smul]
  obtain ⟨U₁, U₂, fd₁, fd₂, s₁, -, hmem⟩ := exists_fin (A.ρ (sc r x)) (B.ρ (sc t x))
    (fun a => by obtain ⟨U, h, ha, hs⟩ := hA a; exact ⟨U, h, ha, fun u hu => hs x u hu⟩)
    (fun b => by obtain ⟨U, h, hb, hs⟩ := hB b; exact ⟨U, h, hb, fun u hu => hs x u hu⟩) y
  exact tensor_eig _ _ (hinj A) U₁ U₂ s₁ y hmem hy0 c hyc


omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem eigFilt : EigFilt k := by
  intro n V _ _ ρ ℓ F hF h0 hℓ x c v hv hvc
  classical
  have hex : ∃ j, v ∉ (F (j + 1)).toSubmodule := ⟨ℓ, by
    rw [hℓ]
    intro h
    exact hv ((Submodule.mem_bot ℂ).1 h)⟩
  set j := Nat.find hex with hjdef
  have hj : v ∉ (F (j + 1)).toSubmodule := Nat.find_spec hex
  have hvj : v ∈ (F j).toSubmodule := by
    rcases hjj : j with _ | j'
    · rw [h0]; exact Submodule.mem_top
    · have := Nat.find_min hex (show j' < Nat.find hex by omega)
      push Not at this
      exact this
  refine ⟨j, Nat.find_min' hex (show v ∉ (F (ℓ + 1)).toSubmodule from ?_), ?_⟩
  · rw [hℓ]; intro h; exact hv ((Submodule.mem_bot ℂ).1 h)
  refine ⟨Submodule.Quotient.mk ⟨v, hvj⟩, fun h => hj (Submodule.mem_comap.1 ((Submodule.Quotient.mk_eq_zero _).1 h)), ?_⟩
  rw [← Submodule.Quotient.mk_smul]
  show Submodule.Quotient.mk (⟨ρ (sc n x) v, _⟩ : (F j).toSubmodule) = _
  congr 1
  exact Subtype.ext hvc

end PositivityTheory.RgUd.Prod.Eig
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.EigenInjectivity.SubInjective =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DerCharEqOneOfMemUnipRad =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DerCharEqOneOfMemUnipRad", "h": "module\n\npublic import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.ColMatMulGlEmbMat\npublic import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.UnipotentDerivatives.DerUnipLeUnipB\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.MirabolicTwistedKernelDerivativeZero\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.TwistedJacquetPhiMinusEquiv\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\n\n"}
section -- clump:auto
@[expose] public section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.LocGL GlobalTheory.BZMir

noncomputable section

namespace GlobalTheory.CompanionTheory.BZMirJac

section Abstract

variable {M V X Y : Type} [Group M] [AddCommGroup V] [Module ℂ V] [AddCommGroup X] [Module ℂ X]
  [AddCommGroup Y] [Module ℂ Y]

theorem ker_comp_mkQ (K₁ K : Submodule ℂ V) (q : (V ⧸ K₁) →ₗ[ℂ] X) (e : LinearMap.ker q = K.map K₁.mkQ)
    (hle : K₁ ≤ K) : LinearMap.ker (q ∘ₗ K₁.mkQ) = K := by
  rw [LinearMap.ker_comp, e, Submodule.comap_map_eq, Submodule.ker_mkQ, sup_eq_left.2 hle]

end Abstract

section Iter

variable (k : Type) [Field k]

noncomputable def embedding₂ (n : ℕ) : (j : ℕ) → GL (Fin n) k →* Mir k (n + j)
  | 0 => levi k n
  | j + 1 => ((levi k (n + j + 1)).comp (Mir k (n + j)).subtype).comp (embedding₂ n j)

end Iter

section IterRep

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem iterPhi_quotient (ψ : AddChar k Circle) (n : ℕ) : ∀ (j : ℕ) (τ : MRep k (n + j)),
    ∃ q : τ.V →ₗ[ℂ] TwJacquet (iterPhi k ψ j τ).ρ (MirUin k n) 1, Function.Surjective q ∧
      LinearMap.ker q = twKer τ.ρ (derUnipM k (n + j) n) (derCharM k ψ (n + j) n) ∧
      ∀ g v, q (τ.ρ (embedding₂ k n j g) v) = psiMinus k (iterPhi k ψ j τ).ρ g (q v) := by
  intro j
  induction j with
  | zero =>
    intro τ
    exact ⟨Submodule.mkQ _, Submodule.mkQ_surjective _,
      (Submodule.ker_mkQ _).trans (GlobalTheory.CompanionTheory.BZMir.twKer_MirUin_eq_derUnipM k ψ n τ.V τ.ρ), fun _ _ => rfl⟩
  | succ j ih =>
    intro τ
    obtain ⟨q', hs, hk, hi⟩ := ih (MRep.phiM k ψ τ)
    have hnm : n ≤ n + j := Nat.le_add_right n j
    let N₁ := MirUin k (n + j + 1)
    let θ₁ := mirChar k ψ (n + j)
    let N₂ := derUnipM k (n + j) n
    let θ₂ := derCharM k ψ (n + j) n
    let N := derUnipM k (n + j + 1) n
    let θ := derCharM k ψ (n + j + 1) n
    let s := (levi k (n + j + 1)).comp (Mir k (n + j)).subtype
    let K₁ := twKer τ.ρ N₁ θ₁
    let K := twKer τ.ρ N θ
    let L : Submodule ℂ (τ.V ⧸ K₁) :=
      twKer (twAct τ.ρ N₁ θ₁ s (levi_stab ψ (n + j))) N₂ θ₂
    have hle : K₁ ≤ K := by
      refine Submodule.span_le.2 ?_
      rintro w ⟨u, v, rfl⟩
      obtain ⟨hu, hθ⟩ := GlobalTheory.CompanionTheory.BZMirStep.MirUin_step ψ hnm u
      exact Submodule.subset_span ⟨⟨u, hu⟩, v, by rw [hθ]⟩
    have e : L = K.map K₁.mkQ := by
      apply le_antisymm
      · refine Submodule.span_le.2 ?_
        rintro w ⟨a, x, rfl⟩
        induction x using Submodule.Quotient.induction_on with
        | H v =>
          obtain ⟨ha, hθ⟩ := GlobalTheory.CompanionTheory.BZMirStep.levi_step ψ hnm a
          refine ⟨τ.ρ (s a) v - (θ ⟨s a, ha⟩ : ℂ) • v,
            Submodule.subset_span ⟨⟨s a, ha⟩, v, rfl⟩, ?_⟩
          change K₁.mkQ (τ.ρ (s a) v - (θ ⟨s a, ha⟩ : ℂ) • v) =
            K₁.mkQ (τ.ρ (s a) v) - (θ₂ a : ℂ) • K₁.mkQ v
          rw [map_sub, map_smul, hθ]
      · rw [Submodule.map_le_iff_le_comap]
        refine Submodule.span_le.2 ?_
        rintro w ⟨u, v, rfl⟩
        obtain ⟨u₁, a, hu⟩ := GlobalTheory.CompanionTheory.BZMirStep.derUnipM_decomp hnm u
        obtain ⟨hu₁, hθ₁⟩ := GlobalTheory.CompanionTheory.BZMirStep.MirUin_step ψ hnm u₁
        obtain ⟨ha, hθ₂⟩ := GlobalTheory.CompanionTheory.BZMirStep.levi_step ψ hnm a
        have hθ : θ u = θ₁ u₁ * θ₂ a := by
          have hu' : u = ⟨u₁, hu₁⟩ * ⟨s a, ha⟩ := Subtype.ext hu
          rw [hu', map_mul, hθ₁, hθ₂]
        have hdec : τ.ρ (u : Mir k (n + j + 1)) v - (θ u : ℂ) • v =
            (τ.ρ u₁ (τ.ρ (s a) v) - (θ₁ u₁ : ℂ) • τ.ρ (s a) v) +
              (θ₁ u₁ : ℂ) • (τ.ρ (s a) v - (θ₂ a : ℂ) • v) := by
          rw [hθ, hu, map_mul, mul_apply_eq_comp, Units.val_mul, smul_sub, mul_smul]
          abel
        have hz : τ.ρ u₁ (τ.ρ (s a) v) - (θ₁ u₁ : ℂ) • τ.ρ (s a) v ∈ K₁ :=
          Submodule.subset_span ⟨u₁, _, rfl⟩
        have hzero : K₁.mkQ (τ.ρ u₁ (τ.ρ (s a) v) - (θ₁ u₁ : ℂ) • τ.ρ (s a) v) = 0 :=
          (Submodule.Quotient.mk_eq_zero K₁).2 hz
        change K₁.mkQ _ ∈ L
        rw [hdec, map_add, hzero, zero_add, map_smul]
        refine Submodule.smul_mem _ _ (Submodule.subset_span ⟨a, K₁.mkQ v, ?_⟩)
        change K₁.mkQ (τ.ρ (s a) v - (θ₂ a : ℂ) • v) =
          K₁.mkQ (τ.ρ (s a) v) - (θ₂ a : ℂ) • K₁.mkQ v
        rw [map_sub, map_smul]
    refine ⟨q' ∘ₗ K₁.mkQ, hs.comp K₁.mkQ_surjective, ?_, fun g v => ?_⟩
    · exact ker_comp_mkQ K₁ K q' (hk.trans e) hle
    · exact hi g (K₁.mkQ v)

end IterRep

section Concrete

variable {k : Type} [Field k]

theorem emb_inl_inl {n t N : ℕ} (h : n + t = N) (g : GL (Fin n) k × GL (Fin t) k) (i j : Fin n) :
    (emb₂ k (stdSum h) g : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inl i)) (stdSum h (Sum.inl j)) =
      (g.1 : Matrix (Fin n) (Fin n) k) i j := by
  rw [val_emb₂]
  simp [reindex_apply, submatrix_apply]

theorem emb_inl_inr {n t N : ℕ} (h : n + t = N) (g : GL (Fin n) k × GL (Fin t) k) (i : Fin n) (j : Fin t) :
    (emb₂ k (stdSum h) g : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inl i)) (stdSum h (Sum.inr j)) = 0 := by
  rw [val_emb₂]
  simp [reindex_apply, submatrix_apply]

theorem emb_inr_inl {n t N : ℕ} (h : n + t = N) (g : GL (Fin n) k × GL (Fin t) k) (i : Fin t) (j : Fin n) :
    (emb₂ k (stdSum h) g : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inr i)) (stdSum h (Sum.inl j)) = 0 := by
  rw [val_emb₂]
  simp [reindex_apply, submatrix_apply]

theorem emb_inr_inr {n t N : ℕ} (h : n + t = N) (g : GL (Fin n) k × GL (Fin t) k) (i j : Fin t) :
    (emb₂ k (stdSum h) g : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inr i)) (stdSum h (Sum.inr j)) =
      (g.2 : Matrix (Fin t) (Fin t) k) i j := by
  rw [val_emb₂]
  simp [reindex_apply, submatrix_apply]

theorem one_inr_inr {n t N : ℕ} (h : n + t = N) (i j : Fin t) :
    (1 : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inr i)) (stdSum h (Sum.inr j)) =
      (1 : Matrix (Fin t) (Fin t) k) i j := by
  rw [Matrix.one_apply, Matrix.one_apply]
  simp only [Equiv.apply_eq_iff_eq, Sum.inr.injEq]

theorem one_inl_inr {n t N : ℕ} (h : n + t = N) (i : Fin n) (j : Fin t) :
    (1 : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inl i)) (stdSum h (Sum.inr j)) = 0 := by
  simp

theorem one_inr_inl {n t N : ℕ} (h : n + t = N) (i : Fin t) (j : Fin n) :
    (1 : Matrix (Fin N) (Fin N) k) (stdSum h (Sum.inr i)) (stdSum h (Sum.inl j)) = 0 := by
  simp

end Concrete

section ConcreteChar

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

end ConcreteChar

section Entries

variable {k : Type} [Field k]

theorem glEmbMat_block_apply {n m : ℕ} (hnm : n ≤ m) (g : Matrix (Fin n) (Fin n) k) (A : Matrix (Fin m) (Fin m) k)
    (hA : ∀ r s : Fin m, A r s = if h : (r : ℕ) < n ∧ (s : ℕ) < n then g ⟨r, h.1⟩ ⟨s, h.2⟩
      else (1 : Matrix (Fin m) (Fin m) k) r s) (r s : Fin (m + 1)) :
    glEmbMat k m A r s = if h : (r : ℕ) < n ∧ (s : ℕ) < n then g ⟨r, h.1⟩ ⟨s, h.2⟩
      else (1 : Matrix (Fin (m + 1)) (Fin (m + 1)) k) r s := by
  induction r using Fin.lastCases with
  | last =>
    rw [dite_eq_right (fun h => by have := h.1; simp at this; omega)]
    induction s using Fin.lastCases with
    | last => rw [GlobalTheory.CompanionTheory.BZMirStep.glEmbMat_last_last, one_apply_eq]
    | cast s => rw [GlobalTheory.CompanionTheory.BZMirStep.glEmbMat_last_castSucc, one_apply_ne (Fin.castSucc_ne_last s).symm]
  | cast r =>
    induction s using Fin.lastCases with
    | last =>
      rw [dite_eq_right (fun h => by have := h.2; simp at this; omega), GlobalTheory.CompanionTheory.BZMirStep.glEmbMat_castSucc_last,
        one_apply_ne (Fin.castSucc_ne_last r)]
    | cast s =>
      rw [GlobalTheory.CompanionTheory.BZMirStep.glEmbMat_castSucc_castSucc, hA r s]
      by_cases h : (r : ℕ) < n ∧ (s : ℕ) < n
      · rw [dite_eq_left h, dite_eq_left (by simpa using h)]
        rfl
      · rw [dite_eq_right h, dite_eq_right (by simpa using h)]
        rw [Matrix.one_apply, Matrix.one_apply]
        simp only [Fin.castSucc_inj]

theorem iotaM_apply (n : ℕ) (g : GL (Fin n) k) : ∀ (j : ℕ) (r s : Fin (n + j + 1)),
    (((embedding₂ k n j g : Mir k (n + j)) : GL (Fin (n + j + 1)) k) : Matrix (Fin (n + j + 1)) (Fin (n + j + 1)) k) r s =
      if h : (r : ℕ) < n ∧ (s : ℕ) < n then (g : Matrix (Fin n) (Fin n) k) ⟨r, h.1⟩ ⟨s, h.2⟩
      else (1 : Matrix (Fin (n + j + 1)) (Fin (n + j + 1)) k) r s
  | 0, r, s => glEmbMat_block_apply le_rfl (g : Matrix (Fin n) (Fin n) k) (g : Matrix (Fin n) (Fin n) k)
      (fun r s => by rw [dite_eq_left ⟨r.2, s.2⟩]) r s
  | j + 1, r, s => glEmbMat_block_apply (by omega) (g : Matrix (Fin n) (Fin n) k) _ (iotaM_apply n g j) r s

theorem iotaM_eq_emb (n j : ℕ) (g : GL (Fin n) k) :
    ((embedding₂ k n j g : Mir k (n + j)) : GL (Fin (n + j + 1)) k) =
      emb₂ k (stdSum (rfl : n + (j + 1) = n + j + 1)) (g, 1) := by
  apply Units.ext
  ext r s
  rw [iotaM_apply]
  obtain ⟨x, rfl⟩ := (stdSum (rfl : n + (j + 1) = n + j + 1)).surjective r
  obtain ⟨y, rfl⟩ := (stdSum (rfl : n + (j + 1) = n + j + 1)).surjective s
  rcases x with x | x <;> rcases y with y | y
  · rw [emb_inl_inl, dite_eq_left (by simp)]
    congr 1
  · rw [emb_inl_inr, dite_eq_right (by simp), one_inl_inr]
  · rw [emb_inr_inl, dite_eq_right (by simp), one_inr_inl]
  · rw [emb_inr_inr, dite_eq_right (by simp), one_inr_inr]
    rfl

end Entries

end GlobalTheory.CompanionTheory.BZMirJac

end
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DerCharEqOneOfMemUnipRad =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.LeviScalars.EmbScalarMemLevi =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.LeviScalars.EmbScalarMemLevi", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\npublic import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.UnipotentDerivatives.DerUnipLeUnipB\npublic import GroundTheory.AutomorphicForms.InductionParabolicGroups\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.DerCharEqOneOfMemUnipRad\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.RestrictionMirabolicTwistedKernel\nimport Development.AutomorphicSpectrum.Proofs.BlockDecomposition.TwistedJacquetPhiMinusEquiv\npublic import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.WhittakerCuspidal.UnipBEqUnipotent\npublic import GroundTheory.AutomorphicForms.AdmissibleFiniteLength\nimport GroundTheory.AutomorphicForms.AdmissibleInduction\nimport GroundTheory.AutomorphicForms.CuspidalAdmissible\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.LocGL GlobalTheory.BZMir GlobalTheory.BZMir.Leib

namespace PositivityTheory.RgUd.Prod.LF

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

def bb (n N : ℕ) : Fin N → Bool := fun i => decide (n ≤ (i : ℕ))

theorem bb_eq_true {n N : ℕ} (i : Fin N) : bb n N i = true ↔ n ≤ (i : ℕ) := by
  simp [bb]

theorem bb_eq_false {n N : ℕ} (i : Fin N) : bb n N i = false ↔ (i : ℕ) < n := by
  simp [bb]


omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem unip_entries {n N : ℕ} {g : GL (Fin N) k}
    (hg : g ∈ GroundTheory.Automorphic.Parabolic.unipotentRadical k N (bb n N)) (i j : Fin N)
    (hij : ¬ ((i : ℕ) < n ∧ n ≤ (j : ℕ))) :
    (g : Matrix (Fin N) (Fin N) k) i j = (1 : Matrix (Fin N) (Fin N) k) i j := by
  obtain ⟨hP, hD⟩ := GroundTheory.Automorphic.Parabolic.mem_unipotentRadical.1 hg
  by_cases he : bb n N i = bb n N j
  · exact hD i j he
  · have hji : (j : ℕ) < n ∧ n ≤ (i : ℕ) := by
      by_cases hi : n ≤ (i : ℕ)
      · refine ⟨?_, hi⟩
        by_contra hj
        exact he (((bb_eq_true i).2 hi).trans ((bb_eq_true j).2 (by omega)).symm)
      · exfalso
        by_cases hj : n ≤ (j : ℕ)
        · exact hij ⟨by omega, hj⟩
        · exact he (((bb_eq_false i).2 (by omega)).trans ((bb_eq_false j).2 (by omega)).symm)
    have hlt : bb n N j < bb n N i := by
      rw [(bb_eq_false j).2 hji.1, (bb_eq_true i).2 hji.2]
      decide
    have h0 : (g : Matrix (Fin N) (Fin N) k) i j = 0 := hP hlt
    rw [h0, one_apply_ne (fun e => by rw [e] at hji; omega)]

omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem unip_le_derUnip {n N : ℕ} :
    GroundTheory.Automorphic.Parabolic.unipotentRadical k N (bb n N) ≤ derUnip k N n := by
  intro g hg
  have hE := unip_entries hg
  refine Subgroup.mem_inf.2 ⟨(mem_unipB k).2 ⟨fun i j hji => ?_, fun i => ?_⟩,
    (GlobalTheory.CompanionTheory.BZMirStep.mem_colFix_iff _).2 fun i j hj => hE i j (by omega)⟩
  · have := Fin.lt_def.1 hji
    rw [hE i j (by omega), one_apply_ne (ne_of_gt hji)]
  · rw [hE i i (by omega), one_apply_eq]

omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem derChar_unip {n N : ℕ} (ψ : AddChar k Circle) (u : derUnip k N n)
    (hu : (u : GL (Fin N) k) ∈ GroundTheory.Automorphic.Parabolic.unipotentRadical k N (bb n N)) :
    derChar k ψ N n u = 1 := by
  have hE := unip_entries hu
  show Circle.toUnits _ = 1
  rw [Finset.sum_eq_zero, AddChar.map_zero_eq_one, map_one]
  intro p hp
  obtain ⟨h1, h2⟩ := (Finset.mem_filter.1 hp).2
  refine (hE p.1 p.2 (by omega)).trans (one_apply_ne fun e => ?_)
  rw [e] at h1
  omega

omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem sub_mem_twKer {n N : ℕ} (ψ : AddChar k Circle) {V : Type} [AddCommGroup V] [Module ℂ V]
    (π : Representation ℂ (GL (Fin N) k) V) (u : GL (Fin N) k)
    (hu : u ∈ GroundTheory.Automorphic.Parabolic.unipotentRadical k N (bb n N)) (w : V) :
    π u w - w ∈ twKer π (derUnip k N n) (derChar k ψ N n) :=
  Submodule.subset_span ⟨⟨u, unip_le_derUnip hu⟩, w, by rw [derChar_unip ψ _ hu]; simp⟩

def dd (n N : ℕ) (x : kˣ) : Fin N → k := fun i => if (i : ℕ) < n then (x : k) else 1

omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem emb_scalar {n t N : ℕ} (h : n + t = N) (x : kˣ) :
    ((emb₂ k (stdSum h) (GeneralLinearGroup.scalar (Fin n) x, 1) : GL (Fin N) k) : Matrix (Fin N) (Fin N) k) =
      diagonal (dd n N x) := by
  ext i j
  obtain ⟨a, rfl⟩ := (stdSum h).surjective i
  obtain ⟨b, rfl⟩ := (stdSum h).surjective j
  rcases a with a | a <;> rcases b with b | b
  · rw [GlobalTheory.CompanionTheory.BZMirJac.emb_inl_inl]
    by_cases hab : a = b
    · subst hab
      simp [dd, GeneralLinearGroup.scalar]
    · rw [diagonal_apply_ne _ (fun e => hab (Sum.inl_injective ((stdSum h).injective e)))]
      simp [GeneralLinearGroup.scalar, hab]
  · rw [GlobalTheory.CompanionTheory.BZMirJac.emb_inl_inr,
      diagonal_apply_ne _ (fun e => Sum.inl_ne_inr ((stdSum h).injective e))]
  · rw [GlobalTheory.CompanionTheory.BZMirJac.emb_inr_inl,
      diagonal_apply_ne _ (fun e => Sum.inr_ne_inl ((stdSum h).injective e))]
  · rw [GlobalTheory.CompanionTheory.BZMirJac.emb_inr_inr]
    by_cases hab : a = b
    · subst hab
      simp [dd]
    · rw [diagonal_apply_ne _ (fun e => hab (Sum.inr_injective ((stdSum h).injective e)))]
      simp [hab]

omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem emb_scalar_mem_levi {n t N : ℕ} (h : n + t = N) (x : kˣ) :
    emb₂ k (stdSum h) (GeneralLinearGroup.scalar (Fin n) x, 1) ∈ GroundTheory.Automorphic.Parabolic.levi k N (bb n N) := by
  rw [GroundTheory.Automorphic.Parabolic.mem_levi]
  intro i j hij
  have hne : i ≠ j := fun e => hij (e ▸ rfl)
  show ((emb₂ k (stdSum h) (GeneralLinearGroup.scalar (Fin n) x, 1) : GL (Fin N) k) :
    Matrix (Fin N) (Fin N) k) i j = 0
  rw [emb_scalar, diagonal_apply_ne _ hne]

omit [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] in
theorem emb_scalar_comm {n t N : ℕ} (h : n + t = N) (x : kˣ) (y : GL (Fin N) k)
    (hy : y ∈ GroundTheory.Automorphic.Parabolic.levi k N (bb n N)) :
    emb₂ k (stdSum h) (GeneralLinearGroup.scalar (Fin n) x, 1) * y =
      y * emb₂ k (stdSum h) (GeneralLinearGroup.scalar (Fin n) x, 1) := by
  apply Units.ext
  rw [Units.val_mul, Units.val_mul, emb_scalar]
  ext i j
  rw [diagonal_mul, mul_diagonal]
  by_cases he : bb n N i = bb n N j
  · have hd : dd n N x i = dd n N x j := by
      by_cases hi : (i : ℕ) < n
      · have hj : (j : ℕ) < n := (bb_eq_false j).1 (he.symm.trans ((bb_eq_false i).2 hi))
        simp [dd, hi, hj]
      · have hj : ¬ (j : ℕ) < n := fun hj =>
          hi ((bb_eq_false i).1 (he.trans ((bb_eq_false j).2 hj)))
        simp [dd, hi, hj]
    rw [hd, mul_comm]
  · have h0 : (y : Matrix (Fin N) (Fin N) k) i j = 0 := GroundTheory.Automorphic.Parabolic.mem_levi.1 hy i j he
    rw [h0, mul_zero, zero_mul]

theorem lfin_of_quot {n t N : ℕ} (h : n + t = N) (ψ : AddChar k Circle) {V X : Type} [AddCommGroup V]
    [Module ℂ V] [AddCommGroup X] [Module ℂ X] (π : Representation ℂ (GL (Fin N) k) V)
    (hπ : GlobalTheory.PRep.IsAdmissible π) (ρ : Representation ℂ (GL (Fin n) k) X) (p : V →ₗ[ℂ] X)
    (hp : Function.Surjective p) (hk : twKer π (derUnip k N n) (derChar k ψ N n) ≤ LinearMap.ker p)
    (hi : ∀ g v, p (π (emb₂ k (stdSum h) (g, 1)) v) = ρ g (p v)) (a : X) :
    ∃ U : Submodule ℂ X, FiniteDimensional ℂ U ∧ a ∈ U ∧
      ∀ (x : kˣ), ∀ u ∈ U, ρ (GeneralLinearGroup.scalar (Fin n) x) u ∈ U := by
  obtain ⟨v, rfl⟩ := hp a
  have hF : GroundTheory.Automorphic.IsAdmissible π := (PositivityTheory.rg.gu.whit.isAdmissible_iff π).1 hπ
  have hA := GroundTheory.Automorphic.Parabolic.isAdmissible_jacquetRep (β := bb n N) hF
  let J := GroundTheory.Automorphic.Parabolic.jacquetAction k N (bb n N) π
  have hpu : ∀ u : GroundTheory.Automorphic.Parabolic.unipotentRadical k N (bb n N),
      p ∘ₗ (π.comp (GroundTheory.Automorphic.Parabolic.unipotentRadical k N (bb n N)).subtype) u = p := by
    intro u
    refine LinearMap.ext fun w => ?_
    show p (π u w) = p w
    rw [← sub_eq_zero, ← map_sub]
    exact hk (sub_mem_twKer ψ π u u.2 w)
  let pb : GroundTheory.Automorphic.Parabolic.JacquetModule k N (bb n N) π →ₗ[ℂ] X :=
    Representation.Coinvariants.lift _ p hpu
  have hpb : ∀ w, pb (Representation.Coinvariants.mk _ w) = p w := fun w =>
    Representation.Coinvariants.lift_mk _ p hpu w
  let w₀ : GroundTheory.Automorphic.Parabolic.JacquetModule k N (bb n N) π := Representation.Coinvariants.mk _ v
  let KM : ℕ → Subgroup (GroundTheory.Automorphic.Parabolic.levi k N (bb n N)) := fun m =>
    (GroundTheory.Automorphic.GLnLocal.congruenceSubgroup k N m).subgroupOf (GroundTheory.Automorphic.Parabolic.levi k N (bb n N))
  obtain ⟨m, hm⟩ := GroundTheory.Automorphic.Parabolic.exists_subgroupOf_congruenceSubgroup_subset (F := k) (n := N)
    (β := bb n N) ((hA.1 w₀).mem_nhds (one_mem (GroundTheory.Automorphic.stabilizerOf _ w₀)))
  have hfix : w₀ ∈ GroundTheory.Automorphic.fixedVectors J (KM m) := by
    have : w₀ ∈ GroundTheory.Automorphic.fixedVectors (GroundTheory.Automorphic.Parabolic.jacquetRep k N (bb n N) π) (KM m) :=
      fun x hx => hm hx
    rwa [GroundTheory.Automorphic.Parabolic.fixedVectors_jacquetRep_congruenceSubgroup] at this
  have hfin : FiniteDimensional ℂ (GroundTheory.Automorphic.fixedVectors J (KM m)) := by
    have := hA.2 (KM m)
      (GroundTheory.Automorphic.Parabolic.isCompact_subgroupOf_levi
        (GroundTheory.Automorphic.GLnLocal.isCompact_congruenceSubgroup k N m))
      (GroundTheory.Automorphic.Parabolic.isOpen_subgroupOf_levi
        (GroundTheory.Automorphic.GLnLocal.isOpen_congruenceSubgroup k N m))
    rwa [GroundTheory.Automorphic.Parabolic.fixedVectors_jacquetRep_congruenceSubgroup] at this
  refine ⟨(GroundTheory.Automorphic.fixedVectors J (KM m)).map pb, inferInstance, ⟨w₀, hfix, hpb v⟩, ?_⟩
  rintro x _ ⟨y, hy, rfl⟩
  obtain ⟨w, rfl⟩ := Representation.Coinvariants.mk_surjective _ y
  let z : GroundTheory.Automorphic.Parabolic.levi k N (bb n N) :=
    ⟨_, emb_scalar_mem_levi h x⟩
  refine ⟨J z (Representation.Coinvariants.mk _ w), ?_, ?_⟩
  · intro g hg
    have hc : g * z = z * g := Subtype.ext (emb_scalar_comm h x g g.2).symm
    show J g (J z _) = J z _
    rw [← Module.End.mul_apply, ← map_mul, hc, map_mul, Module.End.mul_apply]
    exact congrArg _ (hy g hg)
  · show pb (Representation.Coinvariants.mk _ (π _ w)) = _
    rw [hpb, hpb, hi]

theorem lfin_self {n : ℕ} (A : GRep k n) (hA : GlobalTheory.PRep.IsAdmissible A.ρ) : LFin A := by
  intro v
  have hF : GroundTheory.Automorphic.IsAdmissible A.ρ := (PositivityTheory.rg.gu.whit.isAdmissible_iff A.ρ).1 hA
  have hO : {g : GL (Fin n) k | A.ρ g v = v} ∈ nhds (1 : GL (Fin n) k) :=
    (hA.1 v).mem_nhds (by simp)
  obtain ⟨m, -, hm⟩ := (GroundTheory.Automorphic.GLnLocal.hasBasis_nhds_one k n).mem_iff.1 hO
  let K := GroundTheory.Automorphic.GLnLocal.congruenceSubgroup k n m
  have hfin : FiniteDimensional ℂ (GroundTheory.Automorphic.fixedVectors A.ρ K) :=
    hF.2 K (GroundTheory.Automorphic.GLnLocal.isCompact_congruenceSubgroup k n m)
      (GroundTheory.Automorphic.GLnLocal.isOpen_congruenceSubgroup k n m)
  refine ⟨GroundTheory.Automorphic.fixedVectors A.ρ K, hfin, fun g hg => hm hg, ?_⟩
  intro x u hu g hg
  have hc : g * sc n x = sc n x * g := by
    apply Units.ext
    rw [Units.val_mul, Units.val_mul]
    show (g : Matrix (Fin n) (Fin n) k) * scalar (Fin n) (x : k) = scalar (Fin n) (x : k) * g
    exact ((scalar_commute (x : k) (fun r => Commute.all _ r) (g : Matrix (Fin n) (Fin n) k))).symm.eq
  show A.ρ g (A.ρ (sc n x) u) = A.ρ (sc n x) u
  rw [← Module.End.mul_apply, ← map_mul, hc, map_mul, Module.End.mul_apply, hu g hg]

variable (k)

theorem lfDeriv : LFDeriv k := by
  intro ψ _ n j π _ hA
  cases j with
  | zero => exact lfin_self π hA
  | succ j =>
    intro a
    obtain ⟨p, hp, hpk, hpi⟩ := GlobalTheory.CompanionTheory.BZMirJac.iterPhi_quotient ψ n j (resM k π.ρ)
    refine lfin_of_quot (rfl : n + (j + 1) = n + j + 1) ψ π.ρ hA (deriv k ψ j π.ρ) p hp ?_ ?_ a
    · intro w hw
      have hw' : w ∈ LinearMap.ker p := by
        rw [hpk, GlobalTheory.CompanionTheory.BZMirDer.twKer_resM_derUnipM]
        exact hw
      exact hw'
    · intro g v
      rw [← GlobalTheory.CompanionTheory.BZMirJac.iotaM_eq_emb]
      exact hpi g v

end PositivityTheory.RgUd.Prod.LF
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.LeviScalars.EmbScalarMemLevi =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.NontrivialOfNeBot =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.NontrivialOfNeBot", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\npublic import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.LeibnizOrders.LeibnizOrd\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.IsSmoothIterPhi\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LeibnizOrderOfExactSequences\npublic import Development.WeilBound.CoreStatements.TemperedRepresentationTheory.BernsteinZelevinskyGL.TopAdm\nimport GroundTheory.LocalFields.PadicLogSeries\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Algebra.Order.Star.Real\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\npublic import Development.AbelianVarietyTheory.Definitions.NonGaloisDescent.NonemptyEquivMultiProdOne\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.LocGL GlobalTheory.BZMir GlobalTheory.BZMir.Leib

namespace PositivityTheory.RgUd.Prod.Pos

set_option linter.unusedSectionVars false

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem dpow_sc (m : ℕ) (s : ℝ) (x : kˣ) :
    ((dpow m s (sc m x) : ℂˣ) : ℂ) = ((nabs k x ^ ((m : ℝ) * s) : ℝ) : ℂ) := by
  have hd : Matrix.GeneralLinearGroup.det (sc m x) = x ^ m := by
    ext; simp [sc, Matrix.GeneralLinearGroup.scalar]
  have hn : nabs k (x ^ m) = nabs k x ^ m := by simp [nabs]
  rw [dpow, detChar_apply, val_absPow_ofReal, hd, hn, ← Real.rpow_natCast_mul (nabs_pos' k x).le]

theorem tw_eig {m : ℕ} (A : GRep k m) (s : ℝ) (x : kˣ) (v : A.V) :
    (A.tw s).ρ (sc m x) v = ((nabs k x ^ ((m : ℝ) * s) : ℝ) : ℂ) • A.ρ (sc m x) v := by
  show ((dpow m s (sc m x) : ℂˣ) : ℂ) • A.ρ (sc m x) v = _
  rw [dpow_sc]

theorem untw {m : ℕ} (A : GRep k m) (s : ℝ) (x : kˣ) (c : ℂ) (v : A.V) (h : (A.tw s).ρ (sc m x) v = c • v) :
    A.ρ (sc m x) v = (c * ((nabs k x ^ (-((m : ℝ) * s)) : ℝ) : ℂ)) • v := by
  rw [tw_eig] at h
  calc A.ρ (sc m x) v = ((nabs k x ^ (-((m : ℝ) * s)) : ℝ) : ℂ) • ((nabs k x ^ ((m : ℝ) * s) : ℝ) : ℂ) •
        A.ρ (sc m x) v := by
        rw [smul_smul, ← Complex.ofReal_mul, ← Real.rpow_add (nabs_pos' k x), neg_add_cancel, Real.rpow_zero,
          Complex.ofReal_one, one_smul]
    _ = _ := by rw [h, smul_smul, mul_comm]

theorem retw {m : ℕ} (A : GRep k m) (s : ℝ) (x : kˣ) (c : ℂ) (v : A.V) (h : A.ρ (sc m x) v = c • v) :
    (A.tw s).ρ (sc m x) v = (((nabs k x ^ ((m : ℝ) * s) : ℝ) : ℂ) * c) • v := by
  rw [tw_eig, h, smul_smul]

theorem isSmooth_tw {m : ℕ} {A : GRep k m} (h : IsSmooth A.ρ) (s : ℝ) : IsSmooth (A.tw s).ρ :=
  isSmooth_twist h (IsSmoothChar.detChar (isSmoothChar_absPow (k := k) _))

theorem lfin_tw {m : ℕ} {A : GRep k m} (h : LFin A) (s : ℝ) : LFin (A.tw s) := by
  intro a
  obtain ⟨U, hU, ha, hst⟩ := h a
  refine ⟨U, hU, ha, fun x u hu => ?_⟩
  exact U.smul_mem ((dpow m s (sc m x) : ℂˣ) : ℂ) (hst x u hu)

theorem isSmooth_derivB (ψ : AddChar k Circle) : ∀ (j : ℕ) {n : ℕ} (π : GRep k (n + j)), IsSmooth π.ρ →
    IsSmooth (derivB ψ j π).ρ
  | 0, _, _, h => h
  | j + 1, _, _, h => GlobalTheory.CompanionTheory.BZCuspPair.isSmooth_deriv ψ j h

theorem isAdm_cast {a b : ℕ} (h : a = b) {π : GRep k a} (hπ : IsAdmissible π.ρ) : IsAdmissible (π.cast h).ρ := by
  subst h; exact hπ

theorem irr_cast {a b : ℕ} (h : a = b) {π : GRep k a} (hπ : π.ρ.IsIrreducible) : (π.cast h).ρ.IsIrreducible := by
  subst h; exact hπ

theorem unit_cast {a b : ℕ} (h : a = b) {π : GRep k a} (hπ : IsUnitarisable π.ρ) : IsUnitarisable (π.cast h).ρ := by
  subst h; exact hπ

theorem cast_cast {a b c : ℕ} (h : a = b) (h' : b = c) (π : GRep k a) : (π.cast h).cast h' = π.cast (h.trans h') := by
  subst h; subst h'; rfl

theorem eig_cast {a b : ℕ} (h : a = b) (π : GRep k a) (x : kˣ) (c : ℂ) (v : (π.cast h).V) (hv0 : v ≠ 0)
    (hv : (π.cast h).ρ (sc b x) v = c • v) : ∃ w : π.V, w ≠ 0 ∧ π.ρ (sc a x) w = c • w := by
  subst h; exact ⟨v, hv0, hv⟩

theorem adm {n : ℕ} (π : GRep k n) (hs : IsSmooth π.ρ) (hi : π.ρ.IsIrreducible) : IsAdmissible π.ρ :=
  PositivityTheory.Tls2.BZGL.irreducibleAdmissibleGL_top k n π.V π.ρ hs hi

theorem norm_eig_of_unit {G V : Type} [Group G] [AddCommGroup V] [Module ℂ V] {ρ : Representation ℂ G V}
    (hu : IsUnitarisable ρ) {g : G} {c : ℂ} {v : V} (hv : v ≠ 0) (h : ρ g v = c • v) : ‖c‖ = 1 := by
  obtain ⟨B, -, hpos, hinv⟩ := hu
  have h1 := hinv g v v
  simp only [h, map_smul, LinearMap.smul_apply, LinearMap.map_smulₛₗ, smul_eq_mul] at h1
  have hB : B v v ≠ 0 := fun h0 => by have := hpos v hv; rw [h0] at this; simp at this
  have h2 : c * (starRingEnd ℂ) c = 1 := by
    apply mul_right_cancel₀ hB
    linear_combination h1
  rw [Complex.mul_conj, Complex.normSq_eq_norm_sq] at h2
  have h3 : ‖c‖ ^ 2 = 1 := by exact_mod_cast h2
  have h4 := norm_nonneg c
  nlinarith

theorem nontrivial_of_ne_bot {G V : Type} [Group G] [AddCommGroup V] [Module ℂ V] {ρ : Representation ℂ G V}
    (W : Subrepresentation ρ) (hW : W ≠ ⊥) : Nontrivial W.toSubmodule := by
  by_contra hn
  rw [not_nontrivial_iff_subsingleton] at hn
  apply hW
  apply Subrepresentation.ext
  rw [Submodule.eq_bot_of_subsingleton (p := W.toSubmodule)]
  rfl

theorem subquot_sub {G V : Type} [Group G] [AddCommGroup V] [Module ℂ V] {ρ : Representation ℂ G V}
    (W : Subrepresentation ρ) : IsSubquotient W.toRepresentation ρ :=
  ⟨W, Representation.IntertwiningMap.id _, Function.surjective_id⟩

theorem pipe (hL : GlobalTheory.RgGu.Leib.LeibnizOrd k) (hLF : LFDeriv k) (hE : EigProd k) (hF : EigFilt k)
    (ψ : AddChar k Circle) (hc : Continuous ψ) (h1 : ψ ≠ 1) {r t : ℕ} (π₁ : GRep k r) (π₂ : GRep k t)
    (hs₁ : IsSmooth π₁.ρ) (ha₁ : IsAdmissible π₁.ρ) (hs₂ : IsSmooth π₂.ρ) (ha₂ : IsAdmissible π₂.ρ)
    (ℓ n : ℕ) (e : r + t = n + ℓ) (x : kˣ) (c : ℂ) (v : (derivB ψ ℓ ((π₁.prod π₂).cast e)).V) (hv0 : v ≠ 0)
    (hv : (derivB ψ ℓ ((π₁.prod π₂).cast e)).ρ (sc n x) v = c • v) :
    ∃ (i : ℕ) (h : i ≤ r ∧ ℓ - i ≤ t) (cA cB : ℂ), i ≤ ℓ ∧ c = cA * cB ∧
      (∃ a : ((derivB ψ i (π₁.cast (Nat.sub_add_cancel h.1).symm)).tw (((ℓ - i : ℕ) : ℝ) / 2)).V, a ≠ 0 ∧
        ((derivB ψ i (π₁.cast (Nat.sub_add_cancel h.1).symm)).tw (((ℓ - i : ℕ) : ℝ) / 2)).ρ (sc (r - i) x) a =
          cA • a) ∧
      ∃ b : ((derivB ψ (ℓ - i) (π₂.cast (Nat.sub_add_cancel h.2).symm)).tw ((i : ℝ) / 2)).V, b ≠ 0 ∧
        ((derivB ψ (ℓ - i) (π₂.cast (Nat.sub_add_cancel h.2).symm)).tw ((i : ℝ) / 2)).ρ (sc (t - (ℓ - i)) x) b =
          cB • b := by
  obtain ⟨F, hanti, h0, hbot, hpieces⟩ := hL ψ hc h1 r t ℓ n e π₁ π₂ hs₁ hs₂
  obtain ⟨i, hi, w, hw0, hw⟩ := hF n _ (derivB ψ ℓ ((π₁.prod π₂).cast e)).ρ ℓ F hanti h0 hbot x c v hv0 hv
  have hp := hpieces i hi
  split_ifs at hp with h
  · obtain ⟨hsz, ⟨eq⟩⟩ := hp
    have hw' := GlobalTheory.CompanionTheory.LeibOrd.eint eq (sc n x) w
    rw [hw, map_smul] at hw'
    have hw0' : eq w ≠ 0 := fun h0' =>
      hw0 (eq.toLinearEquiv.injective ((show eq.toLinearEquiv w = 0 from h0').trans (map_zero _).symm))
    obtain ⟨f, hf0, hf⟩ := eig_cast hsz _ x c _ hw0' hw'.symm
    have hsA := isSmooth_tw (isSmooth_derivB ψ i _ (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast
      (Nat.sub_add_cancel h.1).symm hs₁)) (((ℓ - i : ℕ) : ℝ) / 2)
    have hsB := isSmooth_tw (isSmooth_derivB ψ (ℓ - i) _ (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast
      (Nat.sub_add_cancel h.2).symm hs₂)) ((i : ℝ) / 2)
    have hlA := lfin_tw (hLF ψ hc (r - i) i _ (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast (Nat.sub_add_cancel h.1).symm hs₁)
      (isAdm_cast (Nat.sub_add_cancel h.1).symm ha₁)) (((ℓ - i : ℕ) : ℝ) / 2)
    have hlB := lfin_tw (hLF ψ hc (t - (ℓ - i)) (ℓ - i) _
      (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast (Nat.sub_add_cancel h.2).symm hs₂)
      (isAdm_cast (Nat.sub_add_cancel h.2).symm ha₂)) ((i : ℝ) / 2)
    obtain ⟨cA, cB, hcc, ⟨a, ha0, hea⟩, b, hb0, heb⟩ := hE _ _ _ _ hsA hsB hlA hlB x c f hf0 hf
    exact ⟨i, h, cA, cB, hi, hcc, ⟨a, ha0, hea⟩, b, hb0, heb⟩
  · exfalso
    obtain ⟨u, rfl⟩ := Submodule.Quotient.mk_surjective _ w
    apply hw0
    rw [Submodule.Quotient.mk_eq_zero, Submodule.mem_comap]
    show u.1 ∈ (F (i + 1)).toSubmodule
    rw [← hp]
    exact u.2

end PositivityTheory.RgUd.Prod.Pos
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.NontrivialOfNeBot =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.PosProdOf =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.PosProdOf", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.LeibnizOrders.LeibnizOrd\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.BernsteinExponentBounds.IsInvForm\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LeibnizOrderOfExactSequences\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.NontrivialOfNeBot\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Algebra.Order.Star.Real\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.LocGL GlobalTheory.BZMir GlobalTheory.BZMir.Leib

namespace PositivityTheory.RgUd.Prod.Pos

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem norm_untw (X : ℝ) (hX0 : 0 < X) (y : ℝ) (c : ℂ) : ‖c * ((X ^ (-y) : ℝ) : ℂ)‖ * X ^ y = ‖c‖ := by
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.rpow_pos_of_pos hX0 _), mul_assoc,
    ← Real.rpow_add hX0, neg_add_cancel, Real.rpow_zero, mul_one]

theorem norm_combo (X : ℝ) (hX0 : 0 < X) (p y u : ℝ) (c : ℂ) (hsum : p + -y + u = 0) :
    ‖((X ^ p : ℝ) : ℂ) * (c * ((X ^ (-y) : ℝ) : ℂ))‖ * X ^ u = ‖c‖ := by
  rw [norm_mul, norm_mul, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs, Real.norm_eq_abs,
    abs_of_pos (Real.rpow_pos_of_pos hX0 _), abs_of_pos (Real.rpow_pos_of_pos hX0 _),
    show X ^ p * (‖c‖ * X ^ (-y)) * X ^ u = ‖c‖ * (X ^ p * X ^ (-y) * X ^ u) by ring,
    ← Real.rpow_add hX0, ← Real.rpow_add hX0, hsum, Real.rpow_zero, mul_one]

theorem fac_bound (hT : DerivTop k) (hP : DerivPos k) (hC : CentralSub k) (hLF : LFDeriv k)
    (ψ : AddChar k Circle) (hc : Continuous ψ) (h1 : ψ ≠ 1) {r : ℕ} (π : GRep k r) (hs : IsSmooth π.ρ)
    (hirr : π.ρ.IsIrreducible) (hu : IsUnitarisable π.ρ) (ha : IsAdmissible π.ρ) (i : ℕ) (hi : i ≤ r) (s : ℝ)
    (x : kˣ) (hx : nabs k x < 1) (cA : ℂ)
    (a : ((derivB ψ i (π.cast (Nat.sub_add_cancel hi).symm)).tw s).V) (ha0 : a ≠ 0)
    (hea : ((derivB ψ i (π.cast (Nat.sub_add_cancel hi).symm)).tw s).ρ (sc (r - i) x) a = cA • a) :
    ‖cA‖ ≤ nabs k x ^ (((r - i : ℕ) : ℝ) * (s + ((i : ℝ) - 1) / 2)) ∧
    (‖cA‖ = nabs k x ^ (((r - i : ℕ) : ℝ) * (s + ((i : ℝ) - 1) / 2)) →
      ∀ (n' h' : ℕ) (e : r = n' + h'), i < h' → Subsingleton (derivB ψ h' (π.cast e)).V) := by
  have hX0 : 0 < nabs k x := nabs_pos' k x
  have hd := untw (derivB ψ i (π.cast (Nat.sub_add_cancel hi).symm)) s x cA a hea
  have hm0 : (0 : ℝ) ≤ ((r - i : ℕ) : ℝ) := Nat.cast_nonneg _
  rcases Nat.eq_zero_or_pos i with rfl | hi1
  · have hu' : IsUnitarisable (derivB ψ 0 (π.cast (Nat.sub_add_cancel hi).symm)).ρ :=
      unit_cast (Nat.sub_add_cancel hi).symm hu
    have h1' := norm_eig_of_unit hu' ha0 hd
    have hcA : ‖cA‖ = nabs k x ^ (((r - 0 : ℕ) : ℝ) * s) := by
      rw [← norm_untw _ hX0 (((r - 0 : ℕ) : ℝ) * s) cA, h1', one_mul]
    have hle : ((r - 0 : ℕ) : ℝ) * (s + (((0 : ℕ) : ℝ) - 1) / 2) ≤ ((r - 0 : ℕ) : ℝ) * s := by
      simp only [Nat.cast_zero]; nlinarith
    refine ⟨hcA ▸ Real.rpow_le_rpow_of_exponent_ge hX0 hx.le hle, fun heq n' h' e hlt => ?_⟩
    exfalso
    have hr : r = 0 := by
      by_contra hr
      have hmpos : (0 : ℝ) < ((r - 0 : ℕ) : ℝ) := Nat.cast_pos.2 (by omega)
      have hlt2 : ((r - 0 : ℕ) : ℝ) * (s + (((0 : ℕ) : ℝ) - 1) / 2) < ((r - 0 : ℕ) : ℝ) * s := by
        simp only [Nat.cast_zero]; nlinarith
      have := Real.rpow_lt_rpow_of_exponent_gt hX0 hx hlt2
      rw [← hcA, ← heq] at this
      exact lt_irrefl _ this
    omega
  · have hd' := retw (derivB ψ i (π.cast (Nat.sub_add_cancel hi).symm)) ((1 - (i : ℝ)) / 2) x _ a hd
    have key := norm_combo (nabs k x) hX0 (((r - i : ℕ) : ℝ) * ((1 - (i : ℝ)) / 2)) (((r - i : ℕ) : ℝ) * s)
      (((r - i : ℕ) : ℝ) * (s + ((i : ℝ) - 1) / 2)) cA (by ring)
    have hT0 : 0 < nabs k x ^ (((r - i : ℕ) : ℝ) * (s + ((i : ℝ) - 1) / 2)) := Real.rpow_pos_of_pos hX0 _
    by_cases htop : ∃ (n' h' : ℕ) (e : (r - i) + i = n' + h'), i < h' ∧
        Nontrivial (derivB ψ h' ((π.cast (Nat.sub_add_cancel hi).symm).cast e)).V
    · have hsD := isSmooth_tw (isSmooth_derivB ψ i _ (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast
        (Nat.sub_add_cancel hi).symm hs)) ((1 - (i : ℝ)) / 2)
      have hlD := lfin_tw (hLF ψ hc (r - i) i _ (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast (Nat.sub_add_cancel hi).symm hs)
        (isAdm_cast (Nat.sub_add_cancel hi).symm ha)) ((1 - (i : ℝ)) / 2)
      obtain ⟨W, ω, hW, hcc, hωx⟩ := hC (r - i) _ hsD hlD x _ a ha0 hd'
      have hlt := hP ψ hc h1 (r - i) i (π.cast (Nat.sub_add_cancel hi).symm) hi1
        (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast _ hs) (irr_cast _ hirr) (unit_cast _ hu) htop
        W.toSubmodule W.toRepresentation ω (nontrivial_of_ne_bot W hW) (subquot_sub W) hcc x hx
      rw [hωx] at hlt
      have hlt2 : ‖cA‖ < nabs k x ^ (((r - i : ℕ) : ℝ) * (s + ((i : ℝ) - 1) / 2)) := by
        rw [← key]
        nlinarith [norm_nonneg (((nabs k x ^ (((r - i : ℕ) : ℝ) * ((1 - (i : ℝ)) / 2)) : ℝ) : ℂ) *
          (cA * ((nabs k x ^ (-(((r - i : ℕ) : ℝ) * s)) : ℝ) : ℂ)))]
      exact ⟨hlt2.le, fun heq => absurd heq hlt2.ne⟩
    · have hnt : Nontrivial (derivB ψ i (π.cast (Nat.sub_add_cancel hi).symm)).V := ⟨⟨a, 0, ha0⟩⟩
      have htop' : ∀ (n' h' : ℕ) (e : (r - i) + i = n' + h'), i < h' →
          Subsingleton (derivB ψ h' ((π.cast (Nat.sub_add_cancel hi).symm).cast e)).V :=
        fun n' h' e hlt => not_nontrivial_iff_subsingleton.1 (fun hn => htop ⟨n', h', e, hlt, hn⟩)
      obtain ⟨-, hun⟩ := hT ψ hc h1 (r - i) i (π.cast (Nat.sub_add_cancel hi).symm) hi1
        (GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast _ hs) (irr_cast _ hirr) (unit_cast _ hu) hnt htop'
      have h1' := norm_eig_of_unit hun ha0 hd'
      have heq : ‖cA‖ = nabs k x ^ (((r - i : ℕ) : ℝ) * (s + ((i : ℝ) - 1) / 2)) := by
        rw [← key, h1', one_mul]
      refine ⟨heq.le, fun _ n' h' e hlt => ?_⟩
      have := htop' n' h' ((Nat.sub_add_cancel hi).trans e) hlt
      rwa [cast_cast] at this

variable (k)

theorem posProd_of : DerivTop k → DerivPos k → GlobalTheory.RgGu.Leib.LeibnizOrd k → LFDeriv k → CentralSub k → EigProd k →
    EigFilt k → PosProdD k := by
  intro hT hP hL hLF hC hE hF ψ hc h1 r t π₁ π₂ hs₁ hi₁ hu₁ hs₂ hi₂ hu₂ n h e htop n' j e' hj x hx v c hv0 hv
  have ha₁ := adm π₁ hs₁ hi₁
  have ha₂ := adm π₂ hs₂ hi₂
  obtain ⟨i, hi, cA, cB, hil, rfl, ⟨a, ha0, hea⟩, b, hb0, heb⟩ :=
    pipe hL hLF hE hF ψ hc h1 π₁ π₂ hs₁ ha₁ hs₂ ha₂ j n' e' x c v hv0 hv
  obtain ⟨b1, t1⟩ := fac_bound hT hP hC hLF ψ hc h1 π₁ hs₁ hi₁ hu₁ ha₁ i hi.1 _ x hx cA a ha0 hea
  obtain ⟨b2, t2⟩ := fac_bound hT hP hC hLF ψ hc h1 π₂ hs₂ hi₂ hu₂ ha₂ (j - i) hi.2 _ x hx cB b hb0 heb
  have hX0 : 0 < nabs k x := nabs_pos' k x
  have hsz : (r - i) + (t - (j - i)) = n' := by omega
  have hexp : ((r - i : ℕ) : ℝ) * ((((j - i : ℕ) : ℝ) / 2) + ((i : ℝ) - 1) / 2) +
      ((t - (j - i) : ℕ) : ℝ) * (((i : ℝ) / 2) + (((j - i : ℕ) : ℝ) - 1) / 2) = (n' : ℝ) * ((j : ℝ) - 1) / 2 := by
    have h3 : ((r - i : ℕ) : ℝ) + ((t - (j - i) : ℕ) : ℝ) = (n' : ℝ) := by exact_mod_cast hsz
    have h4 : ((j - i : ℕ) : ℝ) = (j : ℝ) - (i : ℝ) := Nat.cast_sub hil
    rw [h4, ← h3]; ring
  rw [← hexp, Real.rpow_add hX0, norm_mul]
  have hB1 := Real.rpow_pos_of_pos hX0 (((r - i : ℕ) : ℝ) * ((((j - i : ℕ) : ℝ) / 2) + ((i : ℝ) - 1) / 2))
  have hB2 := Real.rpow_pos_of_pos hX0 (((t - (j - i) : ℕ) : ℝ) * (((i : ℝ) / 2) + (((j - i : ℕ) : ℝ) - 1) / 2))
  by_contra hge
  have eqA : ‖cA‖ = nabs k x ^ (((r - i : ℕ) : ℝ) * ((((j - i : ℕ) : ℝ) / 2) + ((i : ℝ) - 1) / 2)) := by
    by_contra hne
    exact hge (lt_of_le_of_lt (mul_le_mul_of_nonneg_left b2 (norm_nonneg _))
      (mul_lt_mul_of_pos_right (lt_of_le_of_ne b1 hne) hB2))
  have eqB : ‖cB‖ = nabs k x ^ (((t - (j - i) : ℕ) : ℝ) * (((i : ℝ) / 2) + (((j - i : ℕ) : ℝ) - 1) / 2)) := by
    by_contra hne
    exact hge (lt_of_le_of_lt (mul_le_mul_of_nonneg_right b1 (norm_nonneg _))
      (mul_lt_mul_of_pos_left (lt_of_le_of_ne b2 hne) hB1))
  have top1 := t1 eqA
  have top2 := t2 eqB
  obtain ⟨hnt, -⟩ := htop
  obtain ⟨v', hv'⟩ := @exists_ne _ hnt 0
  have hsc : sc n (1 : kˣ) = 1 := map_one _
  have hv1 : (derivB ψ h ((π₁.prod π₂).cast e)).ρ (sc n 1) v' = (1 : ℂ) • v' := by simp [hsc]
  obtain ⟨i', hi', -, -, hil', -, ⟨a', ha', -⟩, b', hb', -⟩ :=
    pipe hL hLF hE hF ψ hc h1 π₁ π₂ hs₁ ha₁ hs₂ ha₂ h n e 1 1 v' hv' hv1
  by_cases hcase : i < i'
  · exact ha' (@Subsingleton.elim _ (top1 (r - i') i' (Nat.sub_add_cancel hi'.1).symm hcase) a' 0)
  · exact hb' (@Subsingleton.elim _ (top2 (t - (h - i')) (h - i') (Nat.sub_add_cancel hi'.2).symm (by omega)) b' 0)

end PositivityTheory.RgUd.Prod.Pos
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.PosProdOf =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.SubquotientBounds.LeOfSubsingletonSubQuot =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.SubquotientBounds.LeOfSubsingletonSubQuot", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.TopProdD\npublic import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.LeibnizOrders.LeibnizOrd\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.BernsteinExponentBounds.IsInvForm\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.AdjacentQuotientOfTwoSegment\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsCIndValue\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.ExistsNontrivialDerivative\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.IsSmoothIterPhi\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.LeibnizOrderOfExactSequences\nimport Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.UnipotentDerivatives.DerUnipLeUnipB\nimport Development.WeilBound.CoreStatements.TemperedRepresentationTheory.MirabolicDerivatives.ColMatMulGlEmbMat\nimport Development.AutomorphicSpectrum.Proofs.BlockDecomposition.TwistedJacquetIteratedPhiEquiv\nimport GroundTheory.LocalFields.PadicLogSeries\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.ExistsBijectiveOfIsSubquotient\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

set_option linter.unusedSectionVars false

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.LocGL GlobalTheory.BZMir GlobalTheory.BZMir.Leib

namespace PositivityTheory.RgUd.Prod.Pos2

section Gen

variable {G V : Type} [Group G] [AddCommGroup V] [Module ℂ V] {ρ : Representation ℂ G V}

theorem isUnitarisable_twist_one (hu : IsUnitarisable ρ) (χ : G →* ℂˣ) (hχ : ∀ g, χ g = 1) :
    IsUnitarisable (twist ρ χ) := by
  obtain ⟨B, h1, h2, h3⟩ := hu
  refine ⟨B, h1, h2, fun g v w => ?_⟩
  rw [twist_apply, twist_apply, hχ g, Units.val_one, one_smul, one_smul]
  exact h3 g v w

theorem le_of_subsingleton_subQuot {S T : Subrepresentation ρ}
    [Subsingleton (S.toSubmodule ⧸ Submodule.comap S.toSubmodule.subtype T.toSubmodule)] : S ≤ T := by
  rw [SetLike.le_def]
  intro x hx
  have hx' : x ∈ S.toSubmodule := hx
  have := (Submodule.Quotient.mk_eq_zero
    (Submodule.comap S.toSubmodule.subtype T.toSubmodule) (x := ⟨x, hx'⟩)).1 (Subsingleton.elim _ _)
  exact this

theorem filt_const {F : ℕ → Subrepresentation ρ} {ℓ : ℕ} (h : ∀ i ≤ ℓ, F i = F (i + 1)) :
    ∀ i ≤ ℓ + 1, F i = F 0
  | 0, _ => rfl
  | i + 1, hi => (h i (by omega)).symm.trans (filt_const h i (by omega))

theorem subsingleton_of_filt {F : ℕ → Subrepresentation ρ} {ℓ : ℕ} (h0 : F 0 = ⊤) (hl : F (ℓ + 1) = ⊥)
    (h : ∀ i ≤ ℓ, F i = F (i + 1)) : Subsingleton V := by
  have h1 := filt_const h (ℓ + 1) le_rfl
  rw [hl, h0] at h1
  have h2 : (⊥ : Submodule ℂ V) = ⊤ := congrArg Subrepresentation.toSubmodule h1
  constructor
  intro a b
  have ha : a ∈ (⊥ : Submodule ℂ V) := h2 ▸ Submodule.mem_top
  have hb : b ∈ (⊥ : Submodule ℂ V) := h2 ▸ Submodule.mem_top
  rw [(Submodule.mem_bot ℂ).1 ha, (Submodule.mem_bot ℂ).1 hb]

theorem filt_single {F : ℕ → Subrepresentation ρ} {ℓ i₀ : ℕ} (hi₀ : i₀ ≤ ℓ) (h0 : F 0 = ⊤) (hl : F (ℓ + 1) = ⊥)
    (h : ∀ i ≤ ℓ, i ≠ i₀ → F i = F (i + 1)) : F i₀ = ⊤ ∧ F (i₀ + 1) = ⊥ := by
  have up : ∀ i ≤ i₀, F i = ⊤ := by
    intro i
    induction i with
    | zero => intro _; exact h0
    | succ i ih => intro hi; rw [← h i (by omega) (by omega)]; exact ih (by omega)
  have down : ∀ d ≤ ℓ - i₀, F (ℓ + 1 - d) = ⊥ := by
    intro d
    induction d with
    | zero => intro _; exact hl
    | succ d ih =>
      intro hd
      rw [show ℓ + 1 - (d + 1) = ℓ - d by omega, h (ℓ - d) (by omega) (by omega),
        show ℓ - d + 1 = ℓ + 1 - d by omega]
      exact ih (by omega)
  refine ⟨up i₀ le_rfl, ?_⟩
  have := down (ℓ - i₀) le_rfl
  rwa [show ℓ + 1 - (ℓ - i₀) = i₀ + 1 by omega] at this

def topBotMap : V →ₗ[ℂ] ((⊤ : Subrepresentation ρ).toSubmodule ⧸
    Submodule.comap (⊤ : Subrepresentation ρ).toSubmodule.subtype (⊥ : Subrepresentation ρ).toSubmodule) :=
  (Submodule.mkQ _).comp (LinearMap.codRestrict (⊤ : Subrepresentation ρ).toSubmodule LinearMap.id
    (fun _ => Submodule.mem_top))

theorem topBotMap_bij : Function.Bijective (topBotMap (ρ := ρ)) := by
  constructor
  · rw [← LinearMap.ker_eq_bot, eq_bot_iff]
    intro v hv
    have h1 : (Submodule.mkQ _) (⟨v, Submodule.mem_top⟩ : (⊤ : Subrepresentation ρ).toSubmodule) = 0 := hv
    rw [Submodule.mkQ_apply, Submodule.Quotient.mk_eq_zero] at h1
    exact h1
  · intro w
    induction w using Submodule.Quotient.induction_on with
    | H x => exact ⟨x.1, rfl⟩

theorem equiv_subQuot {S T : Subrepresentation ρ} (hS : S = ⊤) (hT : T = ⊥) :
    Nonempty (ρ.Equiv (subQuot S T)) := by
  subst hS; subst hT
  exact ⟨Representation.Equiv.mk (LinearEquiv.ofBijective topBotMap topBotMap_bij) (fun g => by ext v; rfl)⟩

end Gen

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

section Cast

theorem cast_cast {a b c : ℕ} (e : a = b) (e' : b = c) (π : GRep k a) :
    (π.cast e).cast e' = π.cast (e.trans e') := by
  subst e; subst e'; rfl

theorem nontrivial_cast_iff {a b : ℕ} (e : a = b) (π : GRep k a) : Nontrivial (π.cast e).V ↔ Nontrivial π.V := by
  subst e; rfl

theorem subsingleton_cast_iff {a b : ℕ} (e : a = b) (π : GRep k a) :
    Subsingleton (π.cast e).V ↔ Subsingleton π.V := by
  subst e; rfl

theorem isIrr_cast {a b : ℕ} (e : a = b) {π : GRep k a} (h : π.ρ.IsIrreducible) : (π.cast e).ρ.IsIrreducible := by
  subst e; exact h

theorem isUnit_cast {a b : ℕ} (e : a = b) {π : GRep k a} (h : IsUnitarisable π.ρ) :
    IsUnitarisable (π.cast e).ρ := by
  subst e; exact h

theorem derivB_nontrivial_congr (ψ : AddChar k Circle) {r n n' h : ℕ} (π : GRep k r) (e : r = n + h)
    (e' : r = n' + h) : Nontrivial (derivB ψ h (π.cast e)).V ↔ Nontrivial (derivB ψ h (π.cast e')).V := by
  obtain rfl : n = n' := by omega
  rfl

end Cast

section Tw

theorem isSmooth_derivB (ψ : AddChar k Circle) : ∀ (i : ℕ) {n : ℕ} {π : GRep k (n + i)}, IsSmooth π.ρ →
    IsSmooth (derivB ψ i π).ρ
  | 0, _, _, h => h
  | j + 1, _, _, h => GlobalTheory.CompanionTheory.BZCuspPair.isSmooth_deriv ψ j h

theorem isSmooth_tw {n : ℕ} {A : GRep k n} (h : IsSmooth A.ρ) (s : ℝ) : IsSmooth (A.tw s).ρ :=
  isSmooth_twist h (GlobalTheory.CompanionTheory.LeibPhi.isOpen_ker_dpow k n s)

end Tw

section Prod

theorem subsingleton_piTwo {V W : Type} [AddCommGroup V] [Module ℂ V] [AddCommGroup W] [Module ℂ W]
    (h : Subsingleton V ∨ Subsingleton W) : Subsingleton (PiTensorProduct ℂ (TwoT V W)) := by
  constructor
  have key : ∀ z : PiTensorProduct ℂ (TwoT V W), z = 0 := by
    intro z
    induction z using PiTensorProduct.induction_on with
    | smul_tprod r f =>
      rcases h with h | h
      · rw [MultilinearMap.map_coord_zero (PiTensorProduct.tprod ℂ) false
          (show f false = 0 from @Subsingleton.elim V h _ _), smul_zero]
      · rw [MultilinearMap.map_coord_zero (PiTensorProduct.tprod ℂ) true
          (show f true = 0 from @Subsingleton.elim W h _ _), smul_zero]
    | add x y hx hy => rw [hx, hy, add_zero]
  intro a b
  rw [key a, key b]

theorem subsingleton_prod {r t : ℕ} (A : GRep k r) (B : GRep k t) (h : Subsingleton A.V ∨ Subsingleton B.V) :
    Subsingleton (A.prod B).V := by
  haveI := subsingleton_piTwo h
  show Subsingleton (IndSp _ _)
  infer_instance

theorem nontrivial_prod {r t : ℕ} (A : GRep k r) (B : GRep k t) (hA : IsSmooth A.ρ) (hB : IsSmooth B.ρ)
    [Nontrivial A.V] [Nontrivial B.V] : Nontrivial (A.prod B).V := by
  haveI : ∀ x, Nontrivial (TwoT A.V B.V x) := fun x => by cases x <;> assumption
  haveI := GlobalTheory.CompanionTheory.AdjQuot.nontrivial_piTensorProduct (X := TwoT A.V B.V)
  exact GlobalTheory.CompanionTheory.AdjQuot.nontrivial_indSp _ (isSmooth_piTensor fun x => by cases x; exacts [hA, hB])

end Prod

section Top

def IsTop (ψ : AddChar k Circle) {r : ℕ} (π : GRep k r) (h : ℕ) : Prop :=
  h ≤ r ∧ (∀ (n : ℕ) (e : r = n + h), Nontrivial (derivB ψ h (π.cast e)).V) ∧
    ∀ (n h' : ℕ) (e : r = n + h'), h < h' → Subsingleton (derivB ψ h' (π.cast e)).V

theorem exists_isTop (ψ : AddChar k Circle) {r : ℕ} (π : GRep k r) [Nontrivial π.V] : ∃ h, IsTop ψ π h := by
  classical
  let P : ℕ → Prop := fun h => ∃ (n : ℕ) (e : r = n + h), Nontrivial (derivB ψ h (π.cast e)).V
  have hP0 : P 0 := ⟨r, (Nat.add_zero r).symm, (nontrivial_cast_iff (Nat.add_zero r).symm π).2 inferInstance⟩
  refine ⟨Nat.findGreatest P r, Nat.findGreatest_le r, fun n e => ?_, fun n h' e hlt => ?_⟩
  · obtain ⟨n0, e0, h0⟩ := Nat.findGreatest_spec (Nat.zero_le r) hP0
    exact (derivB_nontrivial_congr ψ π e0 e).1 h0
  · have hn := Nat.findGreatest_is_greatest hlt (by omega)
    exact not_nontrivial_iff_subsingleton.1 fun hh => hn ⟨n, e, hh⟩

theorem isTop_pos (ψ : AddChar k Circle) (hc : Continuous ψ) (h1 : ψ ≠ 1) {r : ℕ} (π : GRep k r)
    (hs : IsSmooth π.ρ) [Nontrivial π.V] {h : ℕ} (T : IsTop ψ π h) (hr : 0 < r) : 1 ≤ h := by
  obtain ⟨m, rfl⟩ : ∃ m, r = m + 1 := ⟨r - 1, by omega⟩
  obtain ⟨n0, hn0, hnt⟩ := GlobalTheory.CompanionTheory.BZMirDer.NonZero.exists_derivative_nontrivial k ψ hc h1 m π.V
    (resM k π.ρ).ρ (GlobalTheory.CompanionTheory.BZCuspPair.isSmooth_resM hs) inferInstance
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le hn0
  obtain ⟨E⟩ := _root_.GlobalTheory.CompanionTheory.BZMir.iterPhi_twJacquet_equiv k ψ n0 j (resM k π.ρ)
  by_contra hlt
  have hsub := T.2.2 n0 (j + 1) rfl (by omega)
  have : Nontrivial (TwJacquet (iterPhi k ψ j (resM k π.ρ)).ρ (MirUin k n0) 1) := @Equiv.nontrivial _ _ E.toEquiv hnt
  exact not_nontrivial_iff_subsingleton.2 hsub this

end Top

section Leib

variable (ψ : AddChar k Circle)

theorem piece_sub {r t : ℕ} (π₁ : GRep k r) (π₂ : GRep k t) {h₁ h₂ : ℕ} (T₁ : IsTop ψ π₁ h₁) (T₂ : IsTop ψ π₂ h₂)
    (ℓ i n : ℕ) (h : i ≤ r ∧ ℓ - i ≤ t) (hsz : (r - i) + (t - (ℓ - i)) = n) (hne : ¬ (i ≤ h₁ ∧ ℓ - i ≤ h₂)) :
    Subsingleton ((((derivB ψ i (π₁.cast (Nat.sub_add_cancel h.1).symm)).tw (((ℓ - i : ℕ) : ℝ) / 2)).prod
      ((derivB ψ (ℓ - i) (π₂.cast (Nat.sub_add_cancel h.2).symm)).tw ((i : ℝ) / 2))).cast hsz).V := by
  rw [subsingleton_cast_iff]
  apply subsingleton_prod
  by_cases hi : i ≤ h₁
  · right; exact T₂.2.2 _ _ _ (by omega)
  · left; exact T₁.2.2 _ _ _ (by omega)

theorem deriv_prod_sub (hc : Continuous ψ) (h1 : ψ ≠ 1) (hL : GlobalTheory.RgGu.Leib.LeibnizOrd k) {r t : ℕ}
    (π₁ : GRep k r) (π₂ : GRep k t) (s₁ : IsSmooth π₁.ρ) (s₂ : IsSmooth π₂.ρ) {h₁ h₂ : ℕ} (T₁ : IsTop ψ π₁ h₁)
    (T₂ : IsTop ψ π₂ h₂) (ℓ n : ℕ) (e : r + t = n + ℓ) (hl : h₁ + h₂ < ℓ) :
    Subsingleton (derivB ψ ℓ ((π₁.prod π₂).cast e)).V := by
  obtain ⟨F, hF, h0, hl', hpc⟩ := hL ψ hc h1 r t ℓ n e π₁ π₂ s₁ s₂
  refine subsingleton_of_filt h0 hl' fun i hi => ?_
  have hp := hpc i hi
  by_cases hcond : i ≤ r ∧ ℓ - i ≤ t
  · rw [dite_eq_left hcond] at hp
    obtain ⟨hsz, ⟨E⟩⟩ := hp
    have := piece_sub ψ π₁ π₂ T₁ T₂ ℓ i n hcond hsz (by omega)
    have := E.toLinearEquiv.toEquiv.subsingleton
    exact le_antisymm le_of_subsingleton_subQuot (hF (Nat.le_succ i))
  · rw [dite_eq_right hcond] at hp
    exact hp

theorem piece_iso {r t h₁ n : ℕ} (π₁ : GRep k r) (π₂ : GRep k t) (hh₁ : h₁ ≤ r) (m : ℕ) (hmt : m ≤ t)
    (hsz : (r - h₁) + (t - m) = n) (L : ℝ) (hL : (h₁ : ℝ) + (m : ℝ) = L) :
    GlobalTheory.RgGu.Leib.GIso ((((derivB ψ h₁ (π₁.cast (Nat.sub_add_cancel hh₁).symm)).tw (((m : ℕ) : ℝ) / 2)).prod
                 ((derivB ψ m (π₂.cast (Nat.sub_add_cancel hmt).symm)).tw ((h₁ : ℝ) / 2))).cast hsz)
      (((((derivB ψ h₁ (π₁.cast (Nat.sub_add_cancel hh₁).symm)).tw ((1 - (h₁ : ℝ)) / 2)).prod
        ((derivB ψ m (π₂.cast (Nat.sub_add_cancel hmt).symm)).tw ((1 - (m : ℝ)) / 2))).cast hsz).tw ((L - 1) / 2)) := by
  have e1 : (1 - (h₁ : ℝ)) / 2 + (L - 1) / 2 = ((m : ℕ) : ℝ) / 2 := by rw [← hL]; ring
  have e2 : (1 - (m : ℝ)) / 2 + (L - 1) / 2 = (h₁ : ℝ) / 2 := by rw [← hL]; ring
  have i1 := _root_.GlobalTheory.CompanionTheory.LeibOrd.DerivTw.tw_tw (derivB ψ h₁ (π₁.cast (Nat.sub_add_cancel hh₁).symm)) ((1 - (h₁ : ℝ)) / 2)
    ((L - 1) / 2)
  rw [e1] at i1
  have i2 := _root_.GlobalTheory.CompanionTheory.LeibOrd.DerivTw.tw_tw (derivB ψ m (π₂.cast (Nat.sub_add_cancel hmt).symm)) ((1 - (m : ℝ)) / 2)
    ((L - 1) / 2)
  rw [e2] at i2
  have iPQ := GlobalTheory.CompanionTheory.LeibOrd.giso_symm (GlobalTheory.CompanionTheory.LeibOrd.giso_trans (GlobalTheory.CompanionTheory.LeibOrd.Main.tw_prod _ _ ((L - 1) / 2))
    (GlobalTheory.CompanionTheory.LeibOrd.giso_prod i1 i2))
  exact GlobalTheory.CompanionTheory.LeibOrd.giso_trans (GlobalTheory.CompanionTheory.LeibOrd.giso_cast hsz iPQ)
    (GlobalTheory.CompanionTheory.LeibOrd.giso_symm (GlobalTheory.CompanionTheory.LeibOrd.tw_cast hsz _ _))

theorem dpow_eq_one {m : ℕ} (hm : m = 0) (s : ℝ) (g : GL (Fin m) k) : dpow m s g = 1 := by
  subst hm
  have : GeneralLinearGroup.det g = 1 := Units.ext (by rw [GeneralLinearGroup.val_det_apply, Matrix.det_fin_zero,
    Units.val_one])
  rw [dpow, detChar_apply, this, map_one]

theorem sigma_facts (hT : DerivTop k) (hc : Continuous ψ) (h1 : ψ ≠ 1) {r : ℕ} (π : GRep k r) (hs : IsSmooth π.ρ)
    (hi : π.ρ.IsIrreducible) (hu : IsUnitarisable π.ρ) {h : ℕ} (T : IsTop ψ π h) (hr : 0 < r → 1 ≤ h) (hh : h ≤ r) :
    IsSmooth ((derivB ψ h (π.cast (Nat.sub_add_cancel hh).symm)).tw ((1 - (h : ℝ)) / 2)).ρ ∧
      ((derivB ψ h (π.cast (Nat.sub_add_cancel hh).symm)).tw ((1 - (h : ℝ)) / 2)).ρ.IsIrreducible ∧
      IsUnitarisable ((derivB ψ h (π.cast (Nat.sub_add_cancel hh).symm)).tw ((1 - (h : ℝ)) / 2)).ρ ∧
      Nontrivial ((derivB ψ h (π.cast (Nat.sub_add_cancel hh).symm)).tw ((1 - (h : ℝ)) / 2)).V := by
  set σ := (derivB ψ h (π.cast (Nat.sub_add_cancel hh).symm)).tw ((1 - (h : ℝ)) / 2) with hσ
  suffices hIU : σ.ρ.IsIrreducible ∧ IsUnitarisable σ.ρ by
    exact ⟨isSmooth_tw (isSmooth_derivB ψ h (_root_.GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast _ hs)) _, hIU.1, hIU.2, T.2.1 _ _⟩
  rw [hσ]
  by_cases h0 : h = 0
  · subst h0
    have hr0 : r - 0 = 0 := by
      by_contra hne
      have := hr (by omega)
      omega
    exact ⟨isIrreducible_twist (isIrr_cast _ hi) _,
      isUnitarisable_twist_one (isUnit_cast _ hu) _ (dpow_eq_one hr0 _)⟩
  · exact hT ψ hc h1 (r - h) h (π.cast (Nat.sub_add_cancel hh).symm) (by omega) (_root_.GlobalTheory.CompanionTheory.LeibOrd.Main.isSmooth_gcast _ hs)
      (isIrr_cast _ hi) (isUnit_cast _ hu) (T.2.1 _ _)
      (fun n' h' e2 hlt => by rw [cast_cast]; exact T.2.2 _ _ _ hlt)

end Leib

variable (k) in
theorem topProd_of : DerivTop k → DerivPos k → GlobalTheory.RgGu.Leib.LeibnizOrd k → LFDeriv k → CentralSub k → EigProd k →
    EigFilt k → TopProdD k := by
  intro hT _ hL _ _ _ _ ψ hc h1 r t π₁ π₂ s₁ i₁ u₁ s₂ i₂ u₂ hrt
  haveI := _root_.GlobalTheory.JacFactor.nontrivial_of_isIrreducible i₁
  haveI := _root_.GlobalTheory.JacFactor.nontrivial_of_isIrreducible i₂
  obtain ⟨h₁, T₁⟩ := exists_isTop ψ π₁
  obtain ⟨h₂, T₂⟩ := exists_isTop ψ π₂
  have p₁ : 0 < r → 1 ≤ h₁ := isTop_pos ψ hc h1 π₁ s₁ T₁
  have p₂ : 0 < t → 1 ≤ h₂ := isTop_pos ψ hc h1 π₂ s₂ T₂
  have hm : h₁ + h₂ - h₁ = h₂ := by omega
  have T₂' : IsTop ψ π₂ (h₁ + h₂ - h₁) := by rw [hm]; exact T₂
  have p₂' : 0 < t → 1 ≤ h₁ + h₂ - h₁ := by rw [hm]; exact p₂
  have hh₁ := T₁.1
  have hh₂ := T₂'.1
  have hpos : 0 < h₁ + h₂ := by
    rcases Nat.eq_zero_or_pos r with hr | hr
    · have := p₂ (by omega); omega
    · have := p₁ hr; omega
  have e : r + t = ((r - h₁) + (t - (h₁ + h₂ - h₁))) + (h₁ + h₂) := by omega
  obtain ⟨F, hF, h0, hl, hpc⟩ := hL ψ hc h1 r t (h₁ + h₂) _ e π₁ π₂ s₁ s₂
  have key : ∀ i ≤ h₁ + h₂, i ≠ h₁ → F i = F (i + 1) := by
    intro i hi hne
    have hp := hpc i hi
    by_cases hcond : i ≤ r ∧ h₁ + h₂ - i ≤ t
    · rw [dite_eq_left hcond] at hp
      obtain ⟨hsz, ⟨E⟩⟩ := hp
      have := piece_sub ψ π₁ π₂ T₁ T₂ (h₁ + h₂) i _ hcond hsz (by omega)
      have := E.toLinearEquiv.toEquiv.subsingleton
      exact le_antisymm le_of_subsingleton_subQuot (hF (Nat.le_succ i))
    · rw [dite_eq_right hcond] at hp
      exact hp
  obtain ⟨hA, hB⟩ := filt_single (by omega : h₁ ≤ h₁ + h₂) h0 hl key
  obtain ⟨E1⟩ := equiv_subQuot hA hB
  have hp := hpc h₁ (by omega)
  rw [dite_eq_left (⟨hh₁, hh₂⟩ : h₁ ≤ r ∧ h₁ + h₂ - h₁ ≤ t)] at hp
  obtain ⟨hsz, ⟨E2⟩⟩ := hp
  have i3 := piece_iso ψ π₁ π₂ hh₁ (h₁ + h₂ - h₁) hh₂ hsz (((h₁ + h₂ : ℕ) : ℝ)) (by rw [hm]; push_cast; ring)
  obtain ⟨E3⟩ := GlobalTheory.CompanionTheory.LeibOrd.giso_trans ⟨E1.trans E2⟩ i3
  obtain ⟨sm₁, ir₁, un₁, nt₁⟩ := sigma_facts ψ hT hc h1 π₁ s₁ i₁ u₁ T₁ p₁ hh₁
  obtain ⟨sm₂, ir₂, un₂, nt₂⟩ := sigma_facts ψ hT hc h1 π₂ s₂ i₂ u₂ T₂' p₂' hh₂
  have hQ := nontrivial_prod _ _ sm₁ sm₂
  have hQ' := (nontrivial_cast_iff hsz _).2 hQ
  refine ⟨_, h₁ + h₂, e, hpos, ⟨@Equiv.nontrivial _ _ E3.toLinearEquiv.toEquiv hQ', fun n' h' e2 hlt => ?_⟩,
    r - h₁, t - (h₁ + h₂ - h₁), hsz, _, _, _, sm₁, ir₁, un₁, sm₂, ir₂, un₂, ⟨E3⟩⟩
  rw [cast_cast]
  exact deriv_prod_sub ψ hc h1 hL π₁ π₂ s₁ s₂ T₁ T₂ h' n' (e.trans e2) hlt

end PositivityTheory.RgUd.Prod.Pos2
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.SubquotientBounds.LeOfSubsingletonSubQuot =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.BernOf =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.BernOf", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.GenericUnitaryGL.LeibnizOrders.LeibnizOrd\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.BernsteinExponentBounds.IsInvForm\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.CentralSub\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.EigenInjectivity.SubInjective\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.LeviScalars.EmbScalarMemLevi\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.PositiveProducts.PosProdOf\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.SubquotientBounds.LeOfSubsingletonSubQuot\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.UnitarisableHypotheses.NormEqOneOfUnitarisable\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

namespace PositivityTheory.RgUd.Prod.Final

variable (k : Type) [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

theorem bern_of (hT : DerivTop k) (hP : DerivPos k) (hL : GlobalTheory.RgGu.Leib.LeibnizOrd k) : BernAt k :=
  Asm.bern_of_parts k hT
    (Pos.posProd_of k hT hP hL (LF.lfDeriv k) (_root_.PositivityTheory.RgUd.Prod.CS.centralSub k) (Eig.eigProd k) (Eig.eigFilt k))
    (Pos2.topProd_of k hT hP hL (LF.lfDeriv k) (_root_.PositivityTheory.RgUd.Prod.CS.centralSub k) (Eig.eigProd k) (Eig.eigFilt k))

end PositivityTheory.RgUd.Prod.Final
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.CentralProducts.BernOf =====
