module

public import Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine
public import ReciprocityTheory.ClassFieldTheory.PadicCompatibleSequences.ExistsPadicIntOfCompatibleSeq
public import Mathlib.LinearAlgebra.FiniteDimensional.Defs
public import Mathlib.RingTheory.LocalRing.Defs
public import Formalism.SharpRestriction.LevelLetterCocycles.LocCoh
public import Mathlib.RingTheory.Filtration
public import Mathlib.Basic.Finite.Defs
public import Mathlib.CategoryTheory.CofilteredSystem
public import Mathlib.CategoryTheory.Functor.OfSequence
public import Mathlib.Basic.Opposite
public import Mathlib.CategoryTheory.Category.Preorder
public import Mathlib.RingTheory.Finiteness.Defs
public import Mathlib.Topology.Algebra.MulAction
public import Mathlib.LinearAlgebra.Finsupp.LinearCombination
public import Mathlib.RingTheory.Finiteness.Basic
public import Formalism.WeaklyAdmissibleFiltrations.StatementTor
public import Mathlib.Algebra.Module.LocalizedModule.Basic
public import Development.AbelianVarietyTheory.BlockTheory.TorsionBlocks.TateLocalDualityTopDegree
public import Development.AbelianVarietyTheory.Proofs.AdelicLatticeProofs.IsAdicCompleteSpanAlgebraMapOfFreeFinite
public import Development.AbelianVarietyTheory.Proofs.FoundationProofs.H2EquivOfTorsionCharacter
public import Development.AbelianVarietyTheory.Proofs.FoundationProofs.IsIntegralOfNormLeOne
public import Development.AutomorphicSpectrum.Proofs.GlobalProofs.CupFlip
public import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualQOfTopInj
public import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsPerfectCharacterQuotient
public import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.GrowthGaloisInvariantsModPrimePowerLattice
public import Development.AbelianVarietyTheory.Definitions.Foundations.HTBasis
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Normed.Algebra.GelfandRadius
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
import Mathlib.Tactic.ReduceModChar
import Mathlib.Topology.Sheaves.Init
import Mathlib.Analysis.SpecialFunctions.Bernstein
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Data.Nat.Choose.Multinomial
import Mathlib.Tactic.Linter.Style
import Formalism.ConjugateSelfDual.Statement
import Formalism.SharpRestriction.CuspSpanNormBounds.Point
import Formalism.SharpRestriction.LevelLetterCocycles.DataNLoc
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.SimpleRing.Principal
import Mathlib.RingTheory.WittVector.IsPoly
import Mathlib.Tactic.Polynomial.Basic
import Std.Tactic.BVDecide.Normalize.Prop
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.TateH2PeriodDatum
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.CyclotomicCharacterPadicBasicProperties
import Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.IsCycCycChar
import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.GoodOAdicCompleteCompactBasis
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.FieldTheory.Galois.Profinite
import Mathlib.RingTheory.Coalgebra.IsFrobenius
import Mathlib.RingTheory.HopfAlgebra.Basic

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualDOfDualQ, Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsFinsetSep, Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.ImportsMore, Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsLimitOfCauchyAdicFiltration, Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.H2LineOfTateH2AndCoboundaries, Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.CompactQuotientSubmodule, Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.FgZ1T, Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.T2SpaceOfLatticeNhdsBasis, Development.AutomorphicSpectrum.Proofs.GlobalProofs.TateDualityH2FiniteCoefficients

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualDOfDualQ =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualDOfDualQ", "h": "module\n\npublic import Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\npublic import ReciprocityTheory.ClassFieldTheory.PadicCompatibleSequences.ExistsPadicIntOfCompatibleSeq\n\n"}
section -- clump:auto
@[expose] public section

open NumberField IsDedekindDomain Formalism Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions Formalism.MainNotions.N Formalism.WeaklyAdmissibleFiltrations Module GlobalTheory.CompanionTheory.LocDual

noncomputable section

namespace GlobalTheory.CompanionTheory.TdDualD

section Gen

variable {G : Type} [Group G] [TopologicalSpace G]
    {LL O : Type} [Field LL] [CommRing O] [Algebra O LL]
    {V V' : Type} [AddCommGroup V] [Module LL V] [Module O V] [IsScalarTower O LL V]
    [AddCommGroup V'] [Module LL V'] [Module O V'] [IsScalarTower O LL V']
    {ρ : Representation LL G V} {ρ' : Representation LL G V'}

abbrev Ip (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (r : ℕ) : Submodule O ↥L.T :=
  (Ideal.span {ϖ ^ r} • ⊤ : Submodule O ↥L.T)

theorem mem_Ip {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {ϖ : O} {r : ℕ} {x : ↥L.T} :
    x ∈ Ip L ϖ r ↔ ∃ y : ↥L.T, x = ϖ ^ r • y := by
  rw [Ip, Submodule.ideal_span_singleton_smul, Submodule.mem_smul_pointwise_iff_exists]
  constructor
  · rintro ⟨y, -, rfl⟩
    exact ⟨y, rfl⟩
  · rintro ⟨y, rfl⟩
    exact ⟨y, trivial, rfl⟩

theorem Ip_anti {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {ϖ : O} {a b : ℕ} (h : a ≤ b) :
    Ip L ϖ b ≤ Ip L ϖ a := by
  intro x hx
  obtain ⟨y, rfl⟩ := mem_Ip.1 hx
  refine mem_Ip.2 ⟨ϖ ^ (b - a) • y, ?_⟩
  rw [smul_smul, ← pow_add, Nat.add_sub_cancel' h]

theorem Ip_stable (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (r : ℕ) : StableSub L (Ip L ϖ r) := by
  intro g x hx
  obtain ⟨y, rfl⟩ := mem_Ip.1 hx
  exact mem_Ip.2 ⟨actT L g y, map_smul _ _ _⟩

def lq (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (I : Submodule O ↥L.T) (c : ↥L.T ⧸ I) : ↥L.T :=
  (Submodule.Quotient.mk_surjective I c).choose

theorem lq_mk (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (I : Submodule O ↥L.T) (c : ↥L.T ⧸ I) :
    (Submodule.Quotient.mk (lq L I c) : ↥L.T ⧸ I) = c :=
  (Submodule.Quotient.mk_surjective I c).choose_spec

theorem liftQ_eq (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (I : Submodule O ↥L.T) (c : ↥L.T ⧸ I) :
    LocalSituation.liftQ L I c = (lq L I c : V) := rfl

theorem liftD_mk (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (e : V ⧸ L.T) :
    (Submodule.Quotient.mk (liftD L e) : V ⧸ L.T) = e :=
  (Submodule.Quotient.mk_surjective L.T e).choose_spec

theorem scale_cancel {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ) (v : V) :
    ((algebraMap O LL ϖ)⁻¹ ^ r) • (ϖ ^ r • v) = v := by
  rw [← algebraMap_smul LL (ϖ ^ r) v, smul_smul, map_pow, ← mul_pow, inv_mul_cancel₀ hϖ, one_pow,
    one_smul]

theorem scale_cancel' {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ) (v : V) :
    ϖ ^ r • (((algebraMap O LL ϖ)⁻¹ ^ r) • v) = v := by
  rw [← algebraMap_smul LL (ϖ ^ r), smul_smul, map_pow, ← mul_pow, mul_inv_cancel₀ hϖ, one_pow,
    one_smul]

def jr (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ) :
    (↥L'.T ⧸ Ip L' ϖ r) →ₗ[O] V' ⧸ L'.T :=
  (Ip L' ϖ r).liftQ
    (L'.T.mkQ ∘ₗ ((((algebraMap O LL ϖ)⁻¹ ^ r) • (LinearMap.id : V' →ₗ[LL] V')).restrictScalars O) ∘ₗ
      L'.T.subtype) (by
    intro x hx
    obtain ⟨y, rfl⟩ := mem_Ip.1 hx
    rw [LinearMap.mem_ker]
    have : ((algebraMap O LL ϖ)⁻¹ ^ r) • (((ϖ ^ r • y : ↥L'.T)) : V') = (y : V') := by
      rw [Submodule.coe_smul]
      exact scale_cancel hϖ r _
    simp only [LinearMap.comp_apply, Submodule.subtype_apply, LinearMap.restrictScalars_apply,
      LinearMap.smul_apply, LinearMap.id_apply, this, Submodule.mkQ_apply]
    exact (Submodule.Quotient.mk_eq_zero _).2 y.2)

theorem jr_mk (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ)
    (t : ↥L'.T) :
    jr L' hϖ r (Submodule.Quotient.mk t) =
      Submodule.Quotient.mk (((algebraMap O LL ϖ)⁻¹ ^ r) • (t : V')) := rfl

theorem jr_inj (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ) :
    Function.Injective (jr L' hϖ r) := by
  set_option backward.isDefEq.respectTransparency.instanceSearchTypes false in rw [injective_iff_map_eq_zero]
  intro x hx
  obtain ⟨t, rfl⟩ := Submodule.Quotient.mk_surjective _ x
  rw [jr_mk, Submodule.Quotient.mk_eq_zero] at hx
  refine (Submodule.Quotient.mk_eq_zero _).2 (mem_Ip.2 ⟨⟨_, hx⟩, ?_⟩)
  apply Subtype.ext
  rw [Submodule.coe_smul]
  exact (scale_cancel' hϖ r _).symm

theorem jr_surj (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ)
    (e : V' ⧸ L'.T) (he : ϖ ^ r • e = 0) : ∃ x, jr L' hϖ r x = e := by
  obtain ⟨v, rfl⟩ := Submodule.Quotient.mk_surjective _ e
  rw [← Submodule.Quotient.mk_smul, Submodule.Quotient.mk_eq_zero] at he
  refine ⟨Submodule.Quotient.mk ⟨_, he⟩, ?_⟩
  rw [jr_mk]
  congr 1
  exact scale_cancel hϖ r v

theorem jr_act (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ)
    (g : G) (x : ↥L'.T ⧸ Ip L' ϖ r) :
    jr L' hϖ r (actQ L' _ (Ip_stable L' ϖ r) g x) = actD L' g (jr L' hϖ r x) := by
  obtain ⟨t, rfl⟩ := Submodule.Quotient.mk_surjective _ x
  change Submodule.Quotient.mk (((algebraMap O LL ϖ)⁻¹ ^ r) • ρ' g (t : V')) =
    Submodule.Quotient.mk (ρ' g (((algebraMap O LL ϖ)⁻¹ ^ r) • (t : V')))
  rw [map_smul]

theorem mem_Z1Q_of_jr (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') {ϖ : O} (hϖ : algebraMap O LL ϖ ≠ 0)
    (r : ℕ) (b : G → ↥L'.T ⧸ Ip L' ϖ r) (hb : (fun g => jr L' hϖ r (b g)) ∈ divisibleCocycles L') :
    b ∈ quotientCocycles L' _ (Ip_stable L' ϖ r) := by
  refine ⟨IsLocallyConstant.desc b (jr L' hϖ r) hb.1 (jr_inj L' hϖ r), fun g h => ?_⟩
  apply jr_inj L' hϖ r
  rw [map_add (f := _), jr_act]
  exact hb.2 g h

theorem cup_congr1 {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ'}
    {P : V →ₗ[LL] V' →ₗ[LL] LL}
    (hP : ∀ x ∈ L.T, ∀ y ∈ L'.T, ∃ a : O, P x y = algebraMap O LL a) {ϖ : O} {r : ℕ}
    (d₁ d₂ : G → V) (e : G → V' ⧸ L'.T) (he : ∀ h, ϖ ^ r • e h = 0)
    (hd : ∀ g, ∃ t : ↥L.T, d₁ g - d₂ g = ϖ ^ r • (t : V)) (x : G × G) :
    ∃ a : O, cupLD L' P d₁ e x - cupLD L' P d₂ e x = algebraMap O LL a := by
  obtain ⟨t, ht⟩ := hd x.1
  have hw : ϖ ^ r • liftD L' (e x.2) ∈ L'.T := by
    rw [← Submodule.Quotient.mk_eq_zero, Submodule.Quotient.mk_smul, liftD_mk]
    exact he _
  obtain ⟨a, ha⟩ := hP t t.2 (ρ' x.1 (ϖ ^ r • liftD L' (e x.2))) (L'.stable _ _ hw)
  refine ⟨a, ?_⟩
  unfold cupLD
  rw [← LinearMap.sub_apply, ← map_sub, ht, ← ha, ← algebraMap_smul LL (ϖ ^ r) (t : V),
    ← algebraMap_smul LL (ϖ ^ r) (liftD L' (e x.2)), map_smul, map_smul, map_smul,
    LinearMap.smul_apply]

theorem cup_congr2 {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ'}
    {P : V →ₗ[LL] V' →ₗ[LL] LL}
    (hP : ∀ x ∈ L.T, ∀ y ∈ L'.T, ∃ a : O, P x y = algebraMap O LL a) {ϖ : O}
    (hϖ : algebraMap O LL ϖ ≠ 0) {r : ℕ}
    (d : G → ↥L.T ⧸ Ip L ϖ r) (c' : G → ↥L'.T ⧸ Ip L' ϖ r) (x : G × G) :
    ∃ a : O, cupQ L L' P ϖ r d c' x -
      cupLD L' P (fun g => (lq L _ (d g) : V)) (fun g => jr L' hϖ r (c' g)) x =
        algebraMap O LL a := by
  set u : ↥L'.T := lq L' _ (c' x.2) with hu
  set w : V' := liftD L' (jr L' hϖ r (c' x.2)) with hw
  have hmem : ((algebraMap O LL ϖ)⁻¹ ^ r) • (u : V') - w ∈ L'.T := by
    rw [← Submodule.Quotient.eq]
    rw [hw, liftD_mk, ← jr_mk L' hϖ, hu, lq_mk]
  obtain ⟨a, ha⟩ := hP _ (lq L _ (d x.1)).2 _ (L'.stable x.1 _ hmem)
  refine ⟨a, ?_⟩
  unfold cupQ cupLD
  rw [← ha, map_sub, map_sub, map_smul, map_smul, smul_eq_mul, liftQ_eq, liftQ_eq]

def XX (Cob : (G × G → LL) → Prop) (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ)
    (L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ') (P : V →ₗ[LL] V' →ₗ[LL] LL) (ϖ : O)
    (S : Submodule O (G → V' ⧸ L'.T)) (c : G → V' ⧸ L'.T) (r : ℕ) :
    Set (G → ↥L.T ⧸ Ip L ϖ r) :=
  {d | d ∈ quotientCocycles L _ (Ip_stable L ϖ r) ∧
    (∀ s ∈ S, (∀ h, ϖ ^ r • s h = 0) → Cob (cupLD L' P (fun g => (lq L _ (d g) : V)) s)) ∧
    ¬ Cob (cupLD L' P (fun g => (lq L _ (d g) : V)) c)}

theorem XX_nonempty {Cob : (G × G → LL) → Prop}
    (hCob : ∀ z z' : G × G → LL, (∀ x, ∃ a : O, z x - z' x = algebraMap O LL a) → (Cob z ↔ Cob z'))
    {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ'}
    {P : V →ₗ[LL] V' →ₗ[LL] LL}
    (hP : ∀ x ∈ L.T, ∀ y ∈ L'.T, ∃ a : O, P x y = algebraMap O LL a) {ϖ : O}
    (hϖ : algebraMap O LL ϖ ≠ 0) (r : ℕ)
    (hdual : ∀ S', BQ L' _ (Ip_stable L' ϖ r) ≤ S' → S' ≤ quotientCocycles L' _ (Ip_stable L' ϖ r) →
      ∀ c' ∈ quotientCocycles L' _ (Ip_stable L' ϖ r),
      (∀ c ∈ quotientCocycles L _ (Ip_stable L ϖ r), (∀ s ∈ S', Cob (cupQ L L' P ϖ r c s)) →
        Cob (cupQ L L' P ϖ r c c')) → c' ∈ S')
    {S : Submodule O (G → V' ⧸ L'.T)} (hBS : BD L' ≤ S) (hSZ : S ≤ divisibleCocycles L')
    {c : G → V' ⧸ L'.T} (hc : c ∈ divisibleCocycles L') (hcS : c ∉ S) (hck : ∀ h, ϖ ^ r • c h = 0) :
    (XX Cob L L' P ϖ S c r).Nonempty := by
  let J : (G → ↥L'.T ⧸ Ip L' ϖ r) →ₗ[O] (G → V' ⧸ L'.T) := (jr L' hϖ r).compLeft G
  have hJ : ∀ b g, J b g = jr L' hϖ r (b g) := fun _ _ => rfl
  have hB : BQ L' _ (Ip_stable L' ϖ r) ≤ S.comap J := by
    rintro b ⟨x, rfl⟩
    refine hBS ⟨jr L' hϖ r x, ?_⟩
    funext g
    simp only [LinearMap.pi_apply, LinearMap.sub_apply, LinearMap.id_apply, hJ, map_sub, jr_act]
  have hZ : S.comap J ≤ quotientCocycles L' _ (Ip_stable L' ϖ r) :=
    fun b hb => mem_Z1Q_of_jr L' hϖ r b (hSZ hb)
  choose c' hc' using fun h => jr_surj L' hϖ r (c h) (hck h)
  have hJc : J c' = c := funext hc'
  have hc'Z : c' ∈ quotientCocycles L' _ (Ip_stable L' ϖ r) :=
    mem_Z1Q_of_jr L' hϖ r c' (by
      have : (fun g => jr L' hϖ r (c' g)) = c := funext hc'
      rw [this]; exact hc)
  by_contra hne
  apply hcS
  rw [← hJc]
  refine hdual (S.comap J) hB hZ c' hc'Z (fun d hd hs => ?_)
  by_contra hnot
  refine hne ⟨d, hd, fun s hsS hsk => ?_, fun hcob => hnot ?_⟩
  · choose s' hs' using fun h => jr_surj L' hϖ r (s h) (hsk h)
    have hJs : J s' = s := funext hs'
    have h1 := hs s' (by rw [Submodule.mem_comap, hJs]; exact hsS)
    have h2 := (hCob _ _ (cup_congr2 hP hϖ d s')).1 h1
    have h3 : (fun g => jr L' hϖ r (s' g)) = s := funext hs'
    rwa [h3] at h2
  · refine (hCob _ _ (cup_congr2 hP hϖ d c')).2 ?_
    have h3 : (fun g => jr L' hϖ r (c' g)) = c := funext hc'
    rwa [h3]

def stp (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (r : ℕ) :
    (↥L.T ⧸ Ip L ϖ (r + 1)) →ₗ[O] (↥L.T ⧸ Ip L ϖ r) :=
  Submodule.mapQ _ _ LinearMap.id (fun _ hx => Ip_anti (Nat.le_succ r) hx)

theorem stp_mk (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (r : ℕ) (t : ↥L.T) :
    stp L ϖ r (Submodule.Quotient.mk t) = Submodule.Quotient.mk t := rfl

theorem stp_act (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (r : ℕ) (g : G)
    (x : ↥L.T ⧸ Ip L ϖ (r + 1)) :
    stp L ϖ r (actQ L _ (Ip_stable L ϖ (r + 1)) g x) =
      actQ L _ (Ip_stable L ϖ r) g (stp L ϖ r x) := by
  obtain ⟨t, rfl⟩ := Submodule.Quotient.mk_surjective _ x
  rw [show actQ L _ (Ip_stable L ϖ (r + 1)) g (Submodule.Quotient.mk t) =
    Submodule.Quotient.mk (actT L g t) from Submodule.mapQ_apply _ _ _ _, stp_mk, stp_mk]
  exact (Submodule.mapQ_apply _ _ _ _).symm

theorem lq_stp (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (r : ℕ) (y : ↥L.T ⧸ Ip L ϖ (r + 1)) :
    ∃ t : ↥L.T, (lq L _ (stp L ϖ r y) : V) - (lq L _ y : V) = ϖ ^ r • (t : V) := by
  have h : lq L _ (stp L ϖ r y) - lq L _ y ∈ Ip L ϖ r := by
    rw [← Submodule.Quotient.eq, lq_mk, ← stp_mk, lq_mk]
  obtain ⟨t, ht⟩ := mem_Ip.1 h
  exact ⟨t, by simpa using congrArg (Subtype.val) ht⟩

theorem XX_step {Cob : (G × G → LL) → Prop}
    (hCob : ∀ z z' : G × G → LL, (∀ x, ∃ a : O, z x - z' x = algebraMap O LL a) → (Cob z ↔ Cob z'))
    {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ'}
    {P : V →ₗ[LL] V' →ₗ[LL] LL}
    (hP : ∀ x ∈ L.T, ∀ y ∈ L'.T, ∃ a : O, P x y = algebraMap O LL a) {ϖ : O} (r : ℕ)
    {S : Submodule O (G → V' ⧸ L'.T)} {c : G → V' ⧸ L'.T} (hck : ∀ h, ϖ ^ r • c h = 0)
    {d : G → ↥L.T ⧸ Ip L ϖ (r + 1)} (hd : d ∈ XX Cob L L' P ϖ S c (r + 1)) :
    (fun g => stp L ϖ r (d g)) ∈ XX Cob L L' P ϖ S c r := by
  have hlift : ∀ g, ∃ t : ↥L.T, (fun g => (lq L _ (stp L ϖ r (d g)) : V)) g -
      (fun g => (lq L _ (d g) : V)) g = ϖ ^ r • (t : V) := fun g => lq_stp L ϖ r (d g)
  refine ⟨⟨hd.1.1.comp _, fun g h => ?_⟩, fun s hs hk => ?_, fun hc => hd.2.2 ?_⟩
  · change stp L ϖ r (d (g * h)) = _
    rw [hd.1.2 g h, map_add (f := _), stp_act]
  · refine (hCob _ _ (cup_congr1 hP _ _ s hk hlift)).2 (hd.2.1 s hs fun h => ?_)
    rw [pow_succ', mul_smul, hk, smul_zero]
  · exact (hCob _ _ (cup_congr1 hP _ _ c hck hlift)).1 hc

theorem span_pow_smul (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O) (k : ℕ) :
    ((Ideal.span {ϖ}) ^ k • ⊤ : Submodule O ↥L.T) = Ip L ϖ k := by
  rw [Ideal.span_singleton_pow]

theorem exists_limit (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) {ϖ : O}
    (hc : IsAdicComplete (Ideal.span {ϖ}) ↥L.T) (r₀ : ℕ) (x : ∀ n, ↥L.T ⧸ Ip L ϖ (r₀ + n))
    (hx : ∀ n, stp L ϖ (r₀ + n) (x (n + 1)) = x n) :
    ∃ t : ↥L.T, ∀ n, (Submodule.Quotient.mk t : ↥L.T ⧸ Ip L ϖ (r₀ + n)) = x n := by
  let u : ℕ → ↥L.T := fun n => lq L _ (x n)
  have hu : ∀ n, (Submodule.Quotient.mk (u n) : ↥L.T ⧸ Ip L ϖ (r₀ + n)) = x n :=
    fun n => lq_mk L _ (x n)
  have h1 : ∀ n, u (n + 1) - u n ∈ Ip L ϖ (r₀ + n) := by
    intro n
    rw [← Submodule.Quotient.eq, hu, ← hx n, ← hu (n + 1)]
    rfl
  have h2 : ∀ m n, m ≤ n → u n - u m ∈ Ip L ϖ (r₀ + m) := by
    intro m n hmn
    induction n, hmn using Nat.le_induction with
    | base => simp
    | succ n hmn ih =>
      have := add_mem (Ip_anti (Nat.add_le_add_left hmn r₀) (h1 n)) ih
      simpa using this
  obtain ⟨t, ht⟩ := hc.toIsPrecomplete.prec (f := u) (fun {m n} hmn => by
    rw [SModEq.sub_mem, span_pow_smul, ← neg_sub, neg_mem_iff]
    exact Ip_anti (Nat.le_add_left m r₀) (h2 m n hmn))
  refine ⟨t, fun n => ?_⟩
  have a := ht (r₀ + n)
  rw [SModEq.sub_mem, span_pow_smul] at a
  have b := h2 n (r₀ + n) (Nat.le_add_left n r₀)
  rw [← hu n, eq_comm, Submodule.Quotient.eq]
  have := sub_mem a b
  simpa using this

theorem eq_zero_of_mem (L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) {ϖ : O}
    (hc : IsAdicComplete (Ideal.span {ϖ}) ↥L.T) (w : ↥L.T) (h : ∀ n, w ∈ Ip L ϖ n) : w = 0 :=
  hc.toIsHausdorff.haus w fun n => by
    rw [SModEq.zero, span_pow_smul]
    exact h n

theorem core [TopologicalSpace V] [ContinuousAdd V] [ContinuousConstSMul LL V] [CompactSpace G]
    {Cob : (G × G → LL) → Prop}
    (hCob : ∀ z z' : G × G → LL, (∀ x, ∃ a : O, z x - z' x = algebraMap O LL a) → (Cob z ↔ Cob z'))
    {L : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ} {L' : Formalism.WeaklyAdmissibleFiltrations.Lattice (O := O) ρ'}
    {P : V →ₗ[LL] V' →ₗ[LL] LL}
    (hP : ∀ x ∈ L.T, ∀ y ∈ L'.T, ∃ a : O, P x y = algebraMap O LL a) {ϖ : O}
    (hϖ : algebraMap O LL ϖ ≠ 0) (hadic : IsAdicComplete (Ideal.span {ϖ}) ↥L.T)
    (hbasis : (nhds (0 : V)).HasBasis (fun _ : ℕ => True) (fun n => (fun x => ϖ ^ n • x) '' (L.T : Set V)))
    (htor : ∀ v : V', ∃ n : ℕ, ϖ ^ n • v ∈ L'.T)
    (hfin : ∀ r, Finite ↥(quotientCocycles L _ (Ip_stable L ϖ r)))
    (hdual : ∀ r, ∀ S', BQ L' _ (Ip_stable L' ϖ r) ≤ S' → S' ≤ quotientCocycles L' _ (Ip_stable L' ϖ r) →
      ∀ c' ∈ quotientCocycles L' _ (Ip_stable L' ϖ r),
      (∀ c ∈ quotientCocycles L _ (Ip_stable L ϖ r), (∀ s ∈ S', Cob (cupQ L L' P ϖ r c s)) →
        Cob (cupQ L L' P ϖ r c c')) → c' ∈ S')
    {S : Submodule O (G → V' ⧸ L'.T)} (hBS : BD L' ≤ S) (hSZ : S ≤ divisibleCocycles L')
    {c : G → V' ⧸ L'.T} (hc : c ∈ divisibleCocycles L')
    (H : ∀ d ∈ latticeCocycles L, (∀ s ∈ S, Cob (cupLD L' P d s)) → Cob (cupLD L' P d c)) : c ∈ S := by
  by_contra hcS
  have tor1 : ∀ e : V' ⧸ L'.T, ∃ n : ℕ, ϖ ^ n • e = 0 := by
    intro e
    obtain ⟨v, rfl⟩ := Submodule.Quotient.mk_surjective _ e
    obtain ⟨n, hn⟩ := htor v
    exact ⟨n, by rw [← Submodule.Quotient.mk_smul]; exact (Submodule.Quotient.mk_eq_zero _).2 hn⟩
  have kill : ∀ s ∈ divisibleCocycles L', ∃ N : ℕ, ∀ h, ϖ ^ N • s h = 0 := by
    intro s hs
    choose nn hnn using tor1
    have hf := hs.1.range_finite
    refine ⟨hf.toFinset.sup nn, fun h => ?_⟩
    have hle : nn (s h) ≤ hf.toFinset.sup nn := Finset.le_sup (by simp)
    rw [← Nat.sub_add_cancel hle, pow_add, mul_smul, hnn, smul_zero]
  have mono : ∀ (e : V' ⧸ L'.T) (a b : ℕ), a ≤ b → ϖ ^ a • e = 0 → ϖ ^ b • e = 0 := by
    intro e a b hab he
    rw [← Nat.sub_add_cancel hab, pow_add, mul_smul, he, smul_zero]
  obtain ⟨r₀, hr₀⟩ := kill c hc
  have hck : ∀ n h, ϖ ^ (r₀ + n) • c h = 0 :=
    fun n h => mono _ _ _ (Nat.le_add_right r₀ n) (hr₀ h)
  obtain ⟨f, hfX, hf⟩ := ReciprocityTheory.DiscreteGroups.PeuVal.exists_compatible_seq
    (Y := fun n => G → ↥L.T ⧸ Ip L ϖ (r₀ + n))
    (fun n => XX Cob L L' P ϖ S c (r₀ + n))
    (fun n d g => stp L ϖ (r₀ + n) (d g))
    (fun n => XX_nonempty hCob hP hϖ (r₀ + n) (hdual (r₀ + n)) hBS hSZ hc hcS (hck n))
    (fun n => by
      haveI := hfin (r₀ + n)
      exact (Set.toFinite (quotientCocycles L _ (Ip_stable L ϖ (r₀ + n)) : Set _)).subset fun d hd => hd.1)
    (fun n d hd => XX_step hCob hP (r₀ + n) (hck n) hd)
  choose t ht using fun g => exists_limit L hadic r₀ (fun n => f n g) (fun n => congrFun (hf n) g)
  have hzero : ∀ w : ↥L.T, (∀ n, w ∈ Ip L ϖ (r₀ + n)) → w = 0 := fun w hw =>
    eq_zero_of_mem L hadic w fun n => Ip_anti (Nat.le_add_left n r₀) (hw n)
  have hcont : Continuous fun g => (t g : V) := by
    rw [continuous_iff_continuousAt]
    intro g₀
    have hF : Filter.Tendsto (fun g => (t g : V) - (t g₀ : V)) (nhds g₀) (nhds 0) := by
      rw [hbasis.tendsto_right_iff]
      intro n _
      filter_upwards [(hfX n).1.1.eventually_eq g₀] with g hg
      have h1 : t g - t g₀ ∈ Ip L ϖ n := Ip_anti (Nat.le_add_left n r₀)
        ((Submodule.Quotient.eq _).1 (by rw [ht g n, ht g₀ n, hg]))
      obtain ⟨y, hy⟩ := mem_Ip.1 h1
      exact ⟨y, y.2, by simpa using (congrArg Subtype.val hy).symm⟩
    have h2 : Filter.Tendsto (fun g => ((t g : V) - (t g₀ : V)) + (t g₀ : V)) (nhds g₀)
        (nhds (0 + (t g₀ : V))) := hF.add tendsto_const_nhds
    simpa [ContinuousAt] using h2
  have hcoc : ∀ g h, (t (g * h) : V) = (t g : V) + ρ g (t h : V) := by
    intro g h
    have h0 : t (g * h) - (t g + actT L g (t h)) = 0 := by
      refine hzero _ fun n => ?_
      rw [← Submodule.Quotient.mk_eq_zero, Submodule.Quotient.mk_sub, Submodule.Quotient.mk_add,
        ht, ht, show (Submodule.Quotient.mk (actT L g (t h)) : ↥L.T ⧸ Ip L ϖ (r₀ + n)) =
          actQ L _ (Ip_stable L ϖ (r₀ + n)) g (Submodule.Quotient.mk (t h)) from
          (Submodule.mapQ_apply _ _ _ _).symm, ht, (hfX n).1.2 g h, sub_self]
    have h3 : (t (g * h) : V) = (t g : V) + ((actT L g (t h) : ↥L.T) : V) := by
      simpa using congrArg Subtype.val (sub_eq_zero.1 h0)
    exact h3
  have hdZ : (fun g => (t g : V)) ∈ latticeCocycles L :=
    ⟨⟨hcont, hcoc⟩, fun g _ => (t g).2⟩
  have hclose : ∀ n g, ∃ y : ↥L.T, (fun g => (t g : V)) g - (fun g => (lq L _ (f n g) : V)) g =
      ϖ ^ (r₀ + n) • (y : V) := by
    intro n g
    have h1 : t g - lq L _ (f n g) ∈ Ip L ϖ (r₀ + n) := by
      rw [← Submodule.Quotient.eq, ht, lq_mk]
    obtain ⟨y, hy⟩ := mem_Ip.1 h1
    exact ⟨y, by simpa using congrArg Subtype.val hy⟩
  refine (hfX 0).2.2 ((hCob _ _ (cup_congr1 hP _ _ c (hck 0) (hclose 0))).1
    (H _ hdZ fun s hs => ?_))
  obtain ⟨N, hN⟩ := kill s (hSZ hs)
  have hkill : ∀ h, ϖ ^ (r₀ + N) • s h = 0 := fun h => mono _ _ _ (Nat.le_add_left N r₀) (hN h)
  exact (hCob _ _ (cup_congr1 hP _ _ s hkill (hclose N))).2 ((hfX N).2.1 s hs hkill)

end Gen


end GlobalTheory.CompanionTheory.TdDualD
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualDOfDualQ =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsFinsetSep =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsFinsetSep", "h": "module\n\npublic import Mathlib.LinearAlgebra.FiniteDimensional.Defs\npublic import Mathlib.RingTheory.LocalRing.Defs\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine\nimport Formalism.ConjugateSelfDual.Statement\nimport Formalism.SharpRestriction.CuspSpanNormBounds.Point\nimport Formalism.SharpRestriction.LevelLetterCocycles.DataNLoc\nimport Formalism.SharpRestriction.LevelLetterCocycles.LocCoh\npublic import Mathlib.RingTheory.Filtration\n\n"}
section -- clump:auto
@[expose] public section

open NumberField IsDedekindDomain Formalism Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions Formalism.MainNotions.N Formalism.WeaklyAdmissibleFiltrations Module GlobalTheory.CompanionTheory.LocDual

namespace GlobalTheory.CompanionTheory.LocDual.Kernels

theorem mem_of_forall_pow {O M : Type} [CommRing O] [IsLocalRing O] [IsNoetherianRing O]
    [AddCommGroup M] [Module O M] (Λ E : Submodule O M) (hΛ : Λ.FG) (ϖ : O) (hϖ : ¬ IsUnit ϖ)
    (w : M) (h : ∀ n : ℕ, ∃ e ∈ E, ∃ t ∈ Λ, w = e + ϖ ^ n • t) : w ∈ E := by
  classical
  set N : Submodule O (M ⧸ E) := Λ.map E.mkQ with hNdef
  have hNfg : N.FG := hΛ.map _
  haveI : Module.Finite O N := Module.Finite.iff_fg.2 hNfg
  have hE : ∀ e ∈ E, E.mkQ e = 0 := fun e he => (Submodule.Quotient.mk_eq_zero E).2 he
  obtain ⟨e₀, he₀, t₀, ht₀, hw₀⟩ := h 0
  have hwN : E.mkQ w ∈ N := ⟨t₀, ht₀, by rw [hw₀, pow_zero, one_smul, map_add (f := _), hE e₀ he₀, zero_add]⟩
  have hI : Ideal.span {ϖ} ≠ ⊤ := fun h' => hϖ (Ideal.span_singleton_eq_top.1 h')
  have hbot := Ideal.iInf_pow_smul_eq_bot_of_isLocalRing (M := N) (Ideal.span {ϖ}) hI
  have hmem : (⟨E.mkQ w, hwN⟩ : N) ∈ (⨅ i : ℕ, Ideal.span {ϖ} ^ i • ⊤ : Submodule O N) := by
    refine Submodule.mem_iInf _ |>.2 fun i => ?_
    obtain ⟨e, he, t, ht, hw⟩ := h i
    have htN : E.mkQ t ∈ N := ⟨t, ht, rfl⟩
    have heq : (⟨E.mkQ w, hwN⟩ : N) = ϖ ^ i • (⟨E.mkQ t, htN⟩ : N) := by
      apply Subtype.ext
      rw [Submodule.coe_smul]
      show E.mkQ w = ϖ ^ i • E.mkQ t
      rw [hw, map_add (f := _), map_smul, hE e he, zero_add]
    rw [heq]
    exact Submodule.smul_mem_smul (Ideal.pow_mem_pow (Ideal.mem_span_singleton_self ϖ) i) Submodule.mem_top
  rw [hbot, Submodule.mem_bot] at hmem
  have h0 : E.mkQ w = 0 := congrArg Subtype.val hmem
  exact (Submodule.Quotient.mk_eq_zero E).1 h0

theorem exists_finset_sep {k U G X : Type} [Field k] [AddCommGroup U] [Module k U]
    [FiniteDimensional k U] [AddCommGroup X] [Module k X] (φ : U →ₗ[k] G → X) :
    ∃ F : Finset G, ∀ u, (∀ g ∈ F, φ u g = 0) → φ u = 0 := by
  classical
  let Kf : Finset G → Submodule k U := fun F => ⨅ g ∈ F, LinearMap.ker ((LinearMap.proj g).comp φ)
  obtain ⟨_, ⟨F, rfl⟩, hmin⟩ := WellFounded.has_min (wellFounded_lt (α := Submodule k U)) (Set.range Kf)
    ⟨Kf ∅, Set.mem_range_self _⟩
  have hall : ∀ g, Kf F ≤ LinearMap.ker ((LinearMap.proj g).comp φ) := by
    intro g
    have hle : Kf (insert g F) ≤ Kf F := by
      refine le_iInf₂ fun g' hg' => iInf₂_le g' (Finset.mem_insert_of_mem hg')
    have heq : Kf (insert g F) = Kf F := by
      by_contra hne
      exact hmin _ (Set.mem_range_self _) (lt_of_le_of_ne hle hne)
    rw [← heq]
    exact iInf₂_le g (Finset.mem_insert_self g F)
  refine ⟨F, fun u hu => funext fun g => ?_⟩
  have huF : u ∈ Kf F := by
    simp only [Kf, Submodule.mem_iInf, LinearMap.mem_ker, LinearMap.coe_comp, Function.comp_apply, LinearMap.coe_proj, Function.eval]
    exact hu
  have := hall g huF
  simpa using this

end GlobalTheory.CompanionTheory.LocDual.Kernels
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsFinsetSep =====

-- ===== clump member: Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.ImportsMore =====
-- clump-header: {"m": "Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.ImportsMore", "h": "module\n\npublic import Mathlib.Basic.Finite.Defs\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\npublic import Mathlib.CategoryTheory.CofilteredSystem\npublic import Mathlib.CategoryTheory.Functor.OfSequence\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.Basic.Opposite\npublic import Mathlib.CategoryTheory.Category.Preorder\n\n"}
section -- clump:auto
@[expose] public section

theorem UpperTheory.Reformulated.B.DYdc6.main :
    ∀ {X : ℕ → Type} [∀ (n : ℕ), Finite (X n)] [∀ (n : ℕ), Nonempty (X n)] (f : (n : ℕ) → X (n + (1 : ℕ)) → X n),
      ∃ (x : (n : ℕ) → X n), ∀ (n : ℕ), f n (x (n + (1 : ℕ))) = x n := by
  intro X _ _ f
  let F : CategoryTheory.Functor ℕᵒᵖ Type :=
    CategoryTheory.Functor.ofOpSequence (X := X) (fun n => TypeCat.ofHom (f n))
  haveI : ∀ j : ℕᵒᵖ, Finite (F.obj j) := fun j => inferInstanceAs (Finite (X j.unop))
  haveI : ∀ j : ℕᵒᵖ, Nonempty (F.obj j) := fun j => inferInstanceAs (Nonempty (X j.unop))
  obtain ⟨s, hs⟩ := nonempty_sections_of_finite_inverse_system F
  refine ⟨fun n => s (Opposite.op n), fun n => ?_⟩
  have h := hs (CategoryTheory.homOfLE (Nat.le_add_right n 1)).op
  rw [CategoryTheory.Functor.ofOpSequence_map_homOfLE_succ] at h
  exact h
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.ImportsMore =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsLimitOfCauchyAdicFiltration =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsLimitOfCauchyAdicFiltration", "h": "module\n\npublic import Formalism.SharpRestriction.LevelLetterCocycles.LocCoh\npublic import Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.ImportsMore\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine\nimport Formalism.ConjugateSelfDual.Statement\nimport Formalism.SharpRestriction.LevelLetterCocycles.DataNLoc\n\n"}
section -- clump:auto
@[expose] public section

open NumberField IsDedekindDomain Formalism Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions Formalism.MainNotions.N Formalism.WeaklyAdmissibleFiltrations Module GlobalTheory.CompanionTheory.LocDual

noncomputable section

namespace GlobalTheory.CompanionTheory.LocDual.CobDetect


section Lim

variable {G : Type} [Group G] [TopologicalSpace G] {LL : Type} [Field LL] {O : Type} [CommRing O]
    [Algebra O LL] {V : Type} [AddCommGroup V] [Module LL V] [Module O V] [IsScalarTower O LL V]
    {ρ : Representation LL G V} (L : WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (ϖ : O)

abbrev pw (n : ℕ) : Submodule O ↥L.T := Ideal.span {ϖ ^ n} • ⊤

theorem mem_pw {n : ℕ} {x : ↥L.T} : x ∈ pw L ϖ n ↔ ∃ y : ↥L.T, x = ϖ ^ n • y := by
  rw [pw, Submodule.ideal_span_singleton_smul, Submodule.mem_smul_pointwise_iff_exists]
  constructor
  · rintro ⟨y, -, rfl⟩
    exact ⟨y, rfl⟩
  · rintro ⟨y, rfl⟩
    exact ⟨y, trivial, rfl⟩

theorem stable_pw (n : ℕ) : StableSub L (pw L ϖ n) := by
  intro g x hx
  obtain ⟨y, rfl⟩ := (mem_pw L ϖ).1 hx
  exact (mem_pw L ϖ).2 ⟨actT L g y, map_smul _ _ _⟩

theorem pw_succ_le (n : ℕ) : pw L ϖ (n + 1) ≤ pw L ϖ n := by
  intro x hx
  obtain ⟨y, rfl⟩ := (mem_pw L ϖ).1 hx
  exact (mem_pw L ϖ).2 ⟨ϖ • y, by rw [pow_succ, mul_smul]⟩

def proj (n : ℕ) : (↥L.T ⧸ pw L ϖ (n + 1)) →ₗ[O] (↥L.T ⧸ pw L ϖ n) :=
  Submodule.mapQ _ _ LinearMap.id (pw_succ_le L ϖ n)

theorem proj_mk (n : ℕ) (y : ↥L.T) :
    proj L ϖ n (Submodule.Quotient.mk y) = Submodule.Quotient.mk y :=
  Submodule.mapQ_apply _ _ _ _

theorem actQ_mk (I : Submodule O ↥L.T) (hI : StableSub L I) (g : G) (y : ↥L.T) :
    actQ L I hI g (Submodule.Quotient.mk y) = Submodule.Quotient.mk (actT L g y) :=
  Submodule.mapQ_apply _ _ _ _

def Sol (w : G × G → ↥L.T) (n : ℕ) (c : G → ↥L.T ⧸ pw L ϖ n) : Prop :=
  IsLocallyConstant c ∧ ∀ g h, actQ L _ (stable_pw L ϖ n) g (c h) - c (g * h) + c g =
    Submodule.Quotient.mk (w (g, h))

theorem Sol.proj {w : G × G → ↥L.T} {n : ℕ} {c : G → ↥L.T ⧸ pw L ϖ (n + 1)} (hc : Sol L ϖ w (n + 1) c) :
    Sol L ϖ w n fun g => proj L ϖ n (c g) := by
  refine ⟨hc.1.comp _, fun g h => ?_⟩
  have h1 := congrArg (CobDetect.proj L ϖ n) (hc.2 g h)
  rw [map_add (f := _), map_sub, proj_mk] at h1
  rw [← h1]
  obtain ⟨y, hy⟩ := Submodule.Quotient.mk_surjective _ (c h)
  beta_reduce
  rw [← hy, proj_mk, actQ_mk, actQ_mk, proj_mk]

theorem finite_sol (w : G × G → ↥L.T) (n : ℕ) (hfin : Finite ↥(quotientCocycles L (pw L ϖ n) (stable_pw L ϖ n))) :
    Finite {c // Sol L ϖ w n c} := by
  by_cases hne : Nonempty {c // Sol L ϖ w n c}
  · obtain ⟨c₀, h₀⟩ := hne
    have hm : ∀ c : {c // Sol L ϖ w n c}, c.1 - c₀ ∈ quotientCocycles L (pw L ϖ n) (stable_pw L ϖ n) := by
      rintro ⟨c, hc⟩
      refine ⟨hc.1.sub h₀.1, fun g h => ?_⟩
      have h1 := (hc.2 g h).trans (h₀.2 g h).symm
      simp only [Pi.sub_apply, map_sub]
      grind
    refine Finite.of_injective (fun c => (⟨c.1 - c₀, hm c⟩ :
      ↥(quotientCocycles L (pw L ϖ n) (stable_pw L ϖ n)))) fun a b hab => ?_
    exact Subtype.ext (sub_left_injective (congrArg Subtype.val hab))
  · haveI := not_nonempty_iff.1 hne
    infer_instance

theorem exists_limit (w : G × G → ↥L.T)
    (hfin : ∀ n, Finite ↥(quotientCocycles L (pw L ϖ n) (stable_pw L ϖ n)))
    (hne : ∀ n, ∃ c, Sol L ϖ w n c)
    (hC : ∀ a : ℕ → ↥L.T, (∀ n, a (n + 1) - a n ∈ pw L ϖ n) → ∃ b, ∀ n, b - a n ∈ pw L ϖ n)
    (hS : ∀ x : ↥L.T, (∀ n, x ∈ pw L ϖ n) → x = 0) :
    ∃ F : G → ↥L.T, (∀ n, IsLocallyConstant fun g => (Submodule.Quotient.mk (F g) : ↥L.T ⧸ pw L ϖ n)) ∧
      ∀ g h, actT L g (F h) - F (g * h) + F g = w (g, h) := by
  haveI : ∀ n, Finite {c // Sol L ϖ w n c} := fun n => finite_sol L ϖ w n (hfin n)
  haveI : ∀ n, Nonempty {c // Sol L ϖ w n c} := fun n =>
    let ⟨c, hc⟩ := hne n
    ⟨⟨c, hc⟩⟩
  obtain ⟨x, hx⟩ := _root_.UpperTheory.Reformulated.B.DYdc6.main (X := fun n => {c // Sol L ϖ w n c})
    (fun n c => ⟨fun g => proj L ϖ n (c.1 g), c.2.proj⟩)
  choose a ha using fun n g => Submodule.Quotient.mk_surjective (pw L ϖ n) ((x n).1 g)
  have step : ∀ g n, a (n + 1) g - a n g ∈ pw L ϖ n := by
    intro g n
    rw [← Submodule.Quotient.eq]
    have h1 : proj L ϖ n ((x (n + 1)).1 g) = (x n).1 g := congrFun (congrArg Subtype.val (hx n)) g
    rw [ha n g, ← h1, ← ha (n + 1) g, proj_mk]
  choose F hF using fun g => hC (fun n => a n g) (step g)
  have hmk : ∀ n g, (Submodule.Quotient.mk (F g) : ↥L.T ⧸ pw L ϖ n) = (x n).1 g := by
    intro n g
    rw [← ha n g]
    exact (Submodule.Quotient.eq _).2 (hF g n)
  refine ⟨F, fun n => ?_, fun g h => ?_⟩
  · simp_rw [hmk n]
    exact (x n).2.1
  · rw [← sub_eq_zero]
    refine hS _ fun n => ?_
    rw [← Submodule.Quotient.mk_eq_zero, Submodule.Quotient.mk_sub, Submodule.Quotient.mk_add,
      Submodule.Quotient.mk_sub, sub_eq_zero, hmk n, hmk n, ← (x n).2.2 g h, ← hmk n h, actQ_mk]

end Lim

section Adic

variable {O : Type} [CommRing O] (ϖ : O)

theorem pow_smul_top (m : ℕ) :
    ((Ideal.span {ϖ}) ^ m • ⊤ : Submodule O O) = Ideal.span {ϖ ^ m} := by
  rw [smul_eq_mul, Ideal.mul_top, Ideal.span_singleton_pow]

theorem lim_O (hc : IsAdicComplete (Ideal.span {ϖ}) O) (a : ℕ → O)
    (h : ∀ n, a (n + 1) - a n ∈ Ideal.span {ϖ ^ n}) :
    ∃ b, ∀ n, b - a n ∈ Ideal.span {ϖ ^ n} := by
  have hle : ∀ m n, m ≤ n → a n - a m ∈ Ideal.span {ϖ ^ m} := by
    intro m n hmn
    induction n, hmn using Nat.le_induction with
    | base => simp
    | succ n hmn ih =>
      have h1 : Ideal.span {ϖ ^ n} ≤ Ideal.span {ϖ ^ m} :=
        Ideal.span_singleton_le_span_singleton.2 (pow_dvd_pow ϖ hmn)
      have h2 := Ideal.add_mem _ (h1 (h n)) ih
      simpa using h2
  obtain ⟨L, hL⟩ := hc.toIsPrecomplete.prec (f := a) (fun {m n} hmn => by
    rw [SModEq.sub_mem, pow_smul_top, ← neg_sub]
    exact Ideal.neg_mem_iff _ |>.2 (hle m n hmn))
  refine ⟨L, fun n => ?_⟩
  have h1 := SModEq.sub_mem.1 (hL n)
  rw [pow_smul_top, ← neg_sub] at h1
  exact (Ideal.neg_mem_iff _).1 h1

theorem sep_O (hc : IsAdicComplete (Ideal.span {ϖ}) O) (x : O)
    (h : ∀ n, x ∈ Ideal.span {ϖ ^ n}) : x = 0 := by
  refine hc.toIsHausdorff.haus' x fun n => ?_
  rw [SModEq.zero, pow_smul_top]
  exact h n

end Adic

section Cyc

variable {G : Type} [Group G] [TopologicalSpace G] {Qp K₀ K : Type} [Field Qp] [Field K₀] [Field K]
    [Algebra Qp K₀] [Algebra Qp K] [Algebra K₀ K] [IsScalarTower Qp K₀ K]
    {B BdR : Type} [CommRing B] [CommRing BdR] [Algebra Qp B] [Algebra K₀ B] [IsScalarTower Qp K₀ B]
    [Algebra Qp BdR] [Algebra K₀ BdR] [Algebra K BdR] [IsScalarTower Qp K BdR]
    [IsScalarTower K₀ K BdR] [IsScalarTower Qp K₀ BdR]
    (PD : PeriodData G Qp K₀ K B BdR)
    {LL : Type} [Field LL] [Algebra Qp LL] [TopologicalSpace LL] {O : Type} [CommRing O] [Algebra O LL]

theorem charRep_apply (g : G) (y : LL) :
    charRep (cycLL PD LL) g y = ((cycLL PD LL g : LLˣ) : LL) * y := by
  simp [charRep]

theorem repD_mk {V : Type} [AddCommGroup V] [Module LL V] [Module O V] [IsScalarTower O LL V]
    {ρ : Representation LL G V} (L : WeaklyAdmissibleFiltrations.Lattice (O := O) ρ) (g : G) (y : V) :
    repD L g (Submodule.Quotient.mk y) = Submodule.Quotient.mk (ρ g y) :=
  rfl

variable {PD} (L1 : WeaklyAdmissibleFiltrations.Lattice (O := O) (charRep (cycLL PD LL)))

theorem cobO_of_cobL [IsTopologicalRing LL] (hop : IsOpen (L1.T : Set LL)) {z : G × G → LL}
    (h : CobL PD z) (a : LL) : CobO PD L1 (a • z) := by
  obtain ⟨f, hf, rfl⟩ := h
  unfold CobO
  refine Submodule.mem_map.2 ⟨fun g => Submodule.Quotient.mk (a * f g), ⟨?_, fun _ => trivial⟩, ?_⟩
  · rw [IsLocallyConstant.iff_eventually_eq]
    intro g₀
    have hc : Continuous fun g => a * f g - a * f g₀ :=
      (continuous_const.mul hf).sub continuous_const
    have h0 : (L1.T : Set LL) ∈ nhds ((fun g => a * f g - a * f g₀) g₀) := by
      simpa using hop.mem_nhds L1.T.zero_mem
    filter_upwards [hc.continuousAt h0] with g hg
    exact (Submodule.Quotient.eq _).2 hg
  · funext x
    change repD L1 x.1 (Submodule.Quotient.mk (a * f x.2)) - Submodule.Quotient.mk (a * f (x.1 * x.2)) +
      Submodule.Quotient.mk (a * f x.1) = Submodule.Quotient.mk
        (a * (charRep (cycLL PD LL) x.1 (f x.2) - f (x.1 * x.2) + f x.1))
    rw [repD_mk, ← Submodule.Quotient.mk_sub, ← Submodule.Quotient.mk_add, charRep_apply, charRep_apply]
    congr 1
    ring

theorem mem_T (hT : L1.T = LinearMap.range (Algebra.linearMap O LL)) {y : LL} :
    y ∈ L1.T ↔ ∃ o : O, algebraMap O LL o = y := by
  rw [hT]
  rfl

def eT (hT : L1.T = LinearMap.range (Algebra.linearMap O LL))
    (hinj : Function.Injective (algebraMap O LL)) : O ≃ₗ[O] ↥L1.T :=
  LinearEquiv.ofBijective
    (LinearMap.codRestrict L1.T (Algebra.linearMap O LL) fun o => (mem_T L1 hT).2 ⟨o, rfl⟩)
    ⟨fun a b h => hinj (congrArg Subtype.val h), fun y => by
      obtain ⟨o, ho⟩ := (mem_T L1 hT).1 y.2
      exact ⟨o, Subtype.ext ho⟩⟩

theorem eT_mem_pw_iff (hT : L1.T = LinearMap.range (Algebra.linearMap O LL))
    (hinj : Function.Injective (algebraMap O LL)) (ϖ : O) (n : ℕ) (o : O) :
    eT L1 hT hinj o ∈ pw L1 ϖ n ↔ o ∈ Ideal.span {ϖ ^ n} := by
  rw [mem_pw, Ideal.mem_span_singleton']
  constructor
  · rintro ⟨y, hy⟩
    refine ⟨(eT L1 hT hinj).symm y, (eT L1 hT hinj).injective ?_⟩
    rw [mul_comm, ← smul_eq_mul, map_smul, LinearEquiv.apply_symm_apply, hy]
  · rintro ⟨c, rfl⟩
    refine ⟨eT L1 hT hinj c, ?_⟩
    rw [mul_comm, ← smul_eq_mul, map_smul]

theorem exists_limit_of_cauchy_adic_filtration (hT : L1.T = LinearMap.range (Algebra.linearMap O LL))
    (hinj : Function.Injective (algebraMap O LL)) (ϖ : O) (hc : IsAdicComplete (Ideal.span {ϖ}) O)
    (a : ℕ → ↥L1.T) (h : ∀ n, a (n + 1) - a n ∈ pw L1 ϖ n) :
    ∃ b, ∀ n, b - a n ∈ pw L1 ϖ n := by
  set e := eT L1 hT hinj with he
  obtain ⟨b, hb⟩ := lim_O ϖ hc (fun n => e.symm (a n)) fun n => by
    rw [← eT_mem_pw_iff L1 hT hinj, ← he, map_sub, e.apply_symm_apply, e.apply_symm_apply]
    exact h n
  refine ⟨e b, fun n => ?_⟩
  have h1 := (eT_mem_pw_iff L1 hT hinj ϖ n _).2 (hb n)
  rwa [← he, map_sub, e.apply_symm_apply] at h1

theorem sep_T (hT : L1.T = LinearMap.range (Algebra.linearMap O LL))
    (hinj : Function.Injective (algebraMap O LL)) (ϖ : O) (hc : IsAdicComplete (Ideal.span {ϖ}) O)
    (x : ↥L1.T) (h : ∀ n, x ∈ pw L1 ϖ n) : x = 0 := by
  set e := eT L1 hT hinj with he
  have h0 : e.symm x = 0 := sep_O ϖ hc _ fun n => by
    rw [← eT_mem_pw_iff L1 hT hinj, ← he, e.apply_symm_apply]
    exact h n
  simpa using h0

theorem exists_scale {X : Type} [TopologicalSpace X] [CompactSpace X] [IsTopologicalRing LL] [IsDomain O]
    [IsDiscreteValuationRing O] [IsFractionRing O LL] {ϖ : O} (hϖ : Irreducible ϖ)
    (hop : IsOpen (Set.range (algebraMap O LL))) {z : X → LL} (hz : Continuous z) :
    ∃ s : ℕ, ∀ x, algebraMap O LL ϖ ^ s * z x ∈ Set.range (algebraMap O LL) := by
  let U : ℕ → Set LL := fun n => {y | algebraMap O LL ϖ ^ n * y ∈ Set.range (algebraMap O LL)}
  have hU : ∀ n, IsOpen (U n) := fun n => hop.preimage (continuous_const.mul continuous_id)
  have hmono : Monotone U := by
    refine monotone_nat_of_le_succ fun n y hy => ?_
    obtain ⟨o, ho⟩ := hy
    refine ⟨ϖ * o, ?_⟩
    rw [map_mul, ho, pow_succ]
    ring
  have hcov : Set.range z ⊆ ⋃ n, U n := by
    intro y _
    obtain ⟨a, b, hb, rfl⟩ := IsFractionRing.div_surjective (A := O) y
    have hb0 : b ≠ 0 := nonZeroDivisors.ne_zero hb
    obtain ⟨n, u, hu⟩ := IsDiscreteValuationRing.associated_pow_irreducible hb0 hϖ
    have hb1 : algebraMap O LL b ≠ 0 := fun h0 =>
      hb0 (IsFractionRing.injective O LL (h0.trans (map_zero _).symm))
    refine Set.mem_iUnion.2 ⟨n, (u : O) * a, ?_⟩
    have hu' : algebraMap O LL b * algebraMap O LL (u : O) = algebraMap O LL ϖ ^ n := by
      rw [← map_mul, hu, map_pow]
    rw [← hu', map_mul]
    field_simp
  obtain ⟨s, hs⟩ := (isCompact_range hz).elim_directed_cover U hU hcov hmono.directed_le
  exact ⟨s, fun x => hs ⟨x, rfl⟩⟩

theorem exists_sol (hT : L1.T = LinearMap.range (Algebra.linearMap O LL)) {ϖ : O}
    (hu : algebraMap O LL ϖ ≠ 0) {z : G × G → LL}
    (h : ∀ a : LL, CobO PD L1 (a • z)) (s : ℕ)
    (w : G × G → ↥L1.T) (hw : ∀ x, ((w x : ↥L1.T) : LL) = algebraMap O LL ϖ ^ s * z x)
    (hTop : ∀ (r : ℕ) (z : G × G → LL), (∀ x, algebraMap O LL ϖ ^ r * z x ∈ L1.T) → CobO PD L1 z →
      ∃ f : G → LL, (∀ g, algebraMap O LL ϖ ^ r * f g ∈ L1.T) ∧
        IsLocallyConstant (fun g => (Submodule.Quotient.mk (f g) : LL ⧸ L1.T)) ∧
        ∀ x, ReciprocityTheory.Def.d1 (charRep (cycLL PD LL)) f x - z x ∈ L1.T) (n : ℕ) :
    ∃ c, Sol L1 ϖ w n c := by
  set u := algebraMap O LL ϖ with hudef
  set a : LL := u⁻¹ ^ n * u ^ s with ha
  have hna : u ^ n * a = u ^ s := by
    rw [ha, ← mul_assoc, ← mul_pow, mul_inv_cancel₀ hu, one_pow, one_mul]
  obtain ⟨f, hf1, hf2, hf3⟩ := hTop n (a • z) (fun x => by
    have h1 : u ^ n * (a • z) x = ((w x : ↥L1.T) : LL) := by
      rw [hw, Pi.smul_apply, smul_eq_mul, ← mul_assoc, hna]
    rw [h1]
    exact (w x).2) (h a)
  have hsm : ∀ y : ↥L1.T, ((ϖ ^ n • y : ↥L1.T) : LL) = u ^ n * (y : LL) := by
    intro y
    rw [Submodule.coe_smul, Algebra.smul_def, map_pow]
  refine ⟨fun g => Submodule.Quotient.mk (⟨u ^ n * f g, hf1 g⟩ : ↥L1.T), ?_, fun g h' => ?_⟩
  · rw [IsLocallyConstant.iff_eventually_eq]
    intro g₀
    filter_upwards [(IsLocallyConstant.iff_eventually_eq _).1 hf2 g₀] with g hg
    have h1 : f g - f g₀ ∈ L1.T := (Submodule.Quotient.eq _).1 hg
    refine (Submodule.Quotient.eq _).2 ((mem_pw L1 ϖ).2 ⟨⟨_, h1⟩, Subtype.ext ?_⟩)
    rw [hsm]
    change u ^ n * f g - u ^ n * f g₀ = _
    ring
  · rw [actQ_mk, ← Submodule.Quotient.mk_sub, ← Submodule.Quotient.mk_add]
    refine (Submodule.Quotient.eq _).2 ((mem_pw L1 ϖ).2 ⟨⟨_, hf3 (g, h')⟩, Subtype.ext ?_⟩)
    rw [hsm]
    change charRep (cycLL PD LL) g (u ^ n * f h') - u ^ n * f (g * h') + u ^ n * f g - ((w (g, h') : ↥L1.T) : LL) =
      u ^ n * (charRep (cycLL PD LL) g (f h') - f (g * h') + f g - (a • z) (g, h'))
    rw [hw, charRep_apply, charRep_apply, Pi.smul_apply, smul_eq_mul]
    linear_combination (z (g, h')) * hna

theorem cobL_of_all [CompactSpace G] [IsTopologicalRing LL] [IsDomain O] [IsDiscreteValuationRing O]
    [IsFractionRing O LL] (hT : L1.T = LinearMap.range (Algebra.linearMap O LL)) {ϖ : O}
    (hϖ : Irreducible ϖ) (hop : IsOpen (Set.range (algebraMap O LL)))
    (hc : IsAdicComplete (Ideal.span {ϖ}) O)
    (hb : (nhds (0 : LL)).HasBasis (fun _ : ℕ => True)
      (fun n => (fun o : O => algebraMap O LL (ϖ ^ n * o)) '' Set.univ))
    (hfin : ∀ n, Finite ↥(quotientCocycles L1 (pw L1 ϖ n) (stable_pw L1 ϖ n)))
    (hTop : ∀ (r : ℕ) (z : G × G → LL), (∀ x, algebraMap O LL ϖ ^ r * z x ∈ L1.T) → CobO PD L1 z →
      ∃ f : G → LL, (∀ g, algebraMap O LL ϖ ^ r * f g ∈ L1.T) ∧
        IsLocallyConstant (fun g => (Submodule.Quotient.mk (f g) : LL ⧸ L1.T)) ∧
        ∀ x, ReciprocityTheory.Def.d1 (charRep (cycLL PD LL)) f x - z x ∈ L1.T)
    {z : G × G → LL} (hz : Continuous z) (h : ∀ a : LL, CobO PD L1 (a • z)) : CobL PD z := by
  have hinj : Function.Injective (algebraMap O LL) := IsFractionRing.injective O LL
  have hu : algebraMap O LL ϖ ≠ 0 := fun h0 => hϖ.ne_zero (hinj (h0.trans (map_zero _).symm))
  obtain ⟨s, hs⟩ := exists_scale hϖ hop hz
  have hs' : ∀ x, algebraMap O LL ϖ ^ s * z x ∈ L1.T := fun x => (mem_T L1 hT).2 (hs x)
  let w : G × G → ↥L1.T := fun x => ⟨_, hs' x⟩
  obtain ⟨F, hF1, hF2⟩ := exists_limit L1 ϖ w hfin
    (exists_sol L1 hT hu h s w (fun _ => rfl) hTop) (exists_limit_of_cauchy_adic_filtration L1 hT hinj ϖ hc) (sep_T L1 hT hinj ϖ hc)
  have hFc : Continuous fun g => ((F g : ↥L1.T) : LL) := by
    rw [continuous_iff_continuousAt]
    intro g₀
    rw [ContinuousAt, ← tendsto_sub_nhds_zero_iff, hb.tendsto_right_iff]
    intro n _
    filter_upwards [(IsLocallyConstant.iff_eventually_eq _).1 (hF1 n) g₀] with g hg
    obtain ⟨y, hy⟩ := (mem_pw L1 ϖ).1 ((Submodule.Quotient.eq _).1 hg)
    obtain ⟨o, ho⟩ := (mem_T L1 hT).1 y.2
    refine ⟨o, trivial, ?_⟩
    have h1 := congrArg Subtype.val hy
    rw [Submodule.coe_smul, Algebra.smul_def, ← ho, ← map_mul] at h1
    exact h1.symm
  refine ⟨fun g => (algebraMap O LL ϖ)⁻¹ ^ s * (F g : LL), continuous_const.mul hFc, ?_⟩
  funext ⟨g, h'⟩
  have h1 : charRep (cycLL PD LL) g (F h' : LL) - (F (g * h') : LL) + (F g : LL) =
      algebraMap O LL ϖ ^ s * z (g, h') := congrArg Subtype.val (hF2 g h')
  change charRep (cycLL PD LL) g ((algebraMap O LL ϖ)⁻¹ ^ s * (F h' : LL)) -
    (algebraMap O LL ϖ)⁻¹ ^ s * (F (g * h') : LL) + (algebraMap O LL ϖ)⁻¹ ^ s * (F g : LL) = z (g, h')
  rw [charRep_apply] at h1 ⊢
  have h2 : (algebraMap O LL ϖ)⁻¹ ^ s * algebraMap O LL ϖ ^ s = 1 := by
    rw [← mul_pow, inv_mul_cancel₀ hu, one_pow]
  linear_combination ((algebraMap O LL ϖ)⁻¹ ^ s) * h1 + z (g, h') * h2

end Cyc

end GlobalTheory.CompanionTheory.LocDual.CobDetect
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsLimitOfCauchyAdicFiltration =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.H2LineOfTateH2AndCoboundaries =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.H2LineOfTateH2AndCoboundaries", "h": "module\n\npublic import Formalism.SharpRestriction.LevelLetterCocycles.LocCoh\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Henselian\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.RegularLocalRing.Defs\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\nimport Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine\nimport Formalism.ConjugateSelfDual.Statement\nimport Formalism.SharpRestriction.LevelLetterCocycles.DataNLoc\n\n"}
section -- clump:auto
@[expose] public section

open NumberField IsDedekindDomain Formalism Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions Formalism.MainNotions.N Formalism.WeaklyAdmissibleFiltrations Module GlobalTheory.CompanionTheory.LocDual

noncomputable section

namespace GlobalTheory.CompanionTheory.LocDual.Top

section Hom

variable {O LL : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Field LL] [Algebra O LL]
  [IsFractionRing O LL]

theorem exists_mul_of_linear (T : Submodule O LL) (hT : T = LinearMap.range (Algebra.linearMap O LL))
    {ϖ : O} (hϖ : Irreducible ϖ) (hc : IsAdicComplete (Ideal.span {ϖ}) O) (ψ : LL →ₗ[O] LL ⧸ T) :
    ∃ u : LL, ∀ a, ψ a = Submodule.Quotient.mk (a * u) := by
  obtain ⟨p, hp⟩ : ∃ p : LL, p = algebraMap O LL ϖ := ⟨_, rfl⟩
  have hp0 : p ≠ 0 := fun h => hϖ.ne_zero (IsFractionRing.injective O LL (by simpa [hp] using h))
  have hmem : ∀ x : LL, x ∈ T ↔ ∃ o : O, algebraMap O LL o = x := by
    intro x
    rw [hT]
    simp [LinearMap.mem_range]
  choose u hu using fun n : ℕ => Submodule.Quotient.mk_surjective T (ψ ((p⁻¹) ^ n))
  have step : ∀ n, ∃ o : O, algebraMap O LL o = p * u (n + 1) - u n := by
    intro n
    rw [← hmem, ← Submodule.Quotient.eq]
    have h1 : (Submodule.Quotient.mk (p * u (n + 1)) : LL ⧸ T) =
        ϖ • Submodule.Quotient.mk (u (n + 1)) := by
      rw [← Submodule.Quotient.mk_smul, Algebra.smul_def, hp]
    rw [h1, hu, hu, ← map_smul, Algebra.smul_def, ← hp]
    congr 1
    rw [pow_succ]
    field_simp
  choose o ho using step
  obtain ⟨y, hyd⟩ : ∃ y : ℕ → O, y = fun n => ∑ i ∈ Finset.range n, ϖ ^ i * o i := ⟨_, rfl⟩
  have hys : ∀ n, y (n + 1) = y n + ϖ ^ n * o n := by
    intro n
    simp [hyd, Finset.sum_range_succ]
  have hy0 : y 0 = 0 := by simp [hyd]
  have hy : ∀ n, p ^ n * u n = u 0 + algebraMap O LL (y n) := by
    intro n
    induction n with
    | zero => simp [hy0]
    | succ n ih =>
      have h2 : p ^ (n + 1) * u (n + 1) = p ^ n * u n + p ^ n * (p * u (n + 1) - u n) := by ring
      rw [h2, ih, ← ho n, hys, map_add (f := _), map_mul, map_pow, ← hp]
      ring
  have hI : ∀ m, ((Ideal.span {ϖ}) ^ m • ⊤ : Submodule O O) = Ideal.span {ϖ ^ m} := by
    intro m
    simp [Ideal.span_singleton_pow]
  have hcauchy : ∀ {m n}, m ≤ n → y m ≡ y n [SMOD ((Ideal.span {ϖ}) ^ m • ⊤ : Submodule O O)] := by
    intro m n hmn
    rw [SModEq.sub_mem, hI, Ideal.mem_span_singleton]
    induction n, hmn using Nat.le_induction with
    | base => simp
    | succ n hmn ih =>
      rw [hys]
      have h3 : y m - (y n + ϖ ^ n * o n) = (y m - y n) - ϖ ^ n * o n := by ring
      rw [h3]
      exact dvd_sub ih (Dvd.dvd.mul_right (pow_dvd_pow _ hmn) _)
  obtain ⟨Y, hY⟩ := IsPrecomplete.prec hc.toIsPrecomplete hcauchy
  refine ⟨u 0 + algebraMap O LL Y, ?_⟩
  have hpow : ∀ n, ψ ((p⁻¹) ^ n) = Submodule.Quotient.mk ((p⁻¹) ^ n * (u 0 + algebraMap O LL Y)) := by
    intro n
    rw [← hu, Submodule.Quotient.eq, hmem]
    have h4 := hY n
    rw [SModEq.sub_mem, hI, Ideal.mem_span_singleton] at h4
    obtain ⟨t, ht⟩ := h4
    refine ⟨t, ?_⟩
    have h5 : algebraMap O LL (y n) - algebraMap O LL Y = p ^ n * algebraMap O LL t := by
      rw [← map_sub, ht, map_mul, map_pow, ← hp]
    have h6 : u n = (p⁻¹) ^ n * (u 0 + algebraMap O LL (y n)) := by
      rw [← hy, ← mul_assoc, ← mul_pow, inv_mul_cancel₀ hp0, one_pow, one_mul]
    rw [h6, ← mul_sub]
    have h7 : u 0 + algebraMap O LL (y n) - (u 0 + algebraMap O LL Y) = p ^ n * algebraMap O LL t := by
      rw [← h5]
      ring
    rw [h7, ← mul_assoc, ← mul_pow, inv_mul_cancel₀ hp0, one_pow, one_mul]
  intro a
  obtain ⟨x, w, hw, rfl⟩ := IsFractionRing.div_surjective (A := O) a
  have hw0 : w ≠ 0 := nonZeroDivisors.ne_zero hw
  obtain ⟨n, e, he⟩ := IsDiscreteValuationRing.associated_pow_irreducible hw0 hϖ
  have hw1 : algebraMap O LL w ≠ 0 := fun h => hw0 (IsFractionRing.injective O LL (by simpa using h))
  have ha : algebraMap O LL x / algebraMap O LL w = (x * e) • (p⁻¹) ^ n := by
    rw [Algebra.smul_def, map_mul, div_eq_iff hw1]
    have h8 : p ^ n = algebraMap O LL w * algebraMap O LL (e : O) := by
      rw [hp, ← map_pow, ← he, map_mul]
    have h9 : p ^ n ≠ 0 := pow_ne_zero _ hp0
    rw [inv_pow]
    field_simp
    rw [h8]
    ring
  rw [ha, map_smul, hpow, ← Submodule.Quotient.mk_smul, Algebra.smul_def, Algebra.smul_def, mul_assoc]

end Hom

section Red

variable {G : Type} [Group G] [TopologicalSpace G] {Qp K₀ K : Type} [Field Qp] [Field K₀] [Field K]
    [Algebra Qp K₀] [Algebra Qp K] [Algebra K₀ K] [IsScalarTower Qp K₀ K]
    {B BdR : Type} [CommRing B] [CommRing BdR] [Algebra Qp B] [Algebra K₀ B] [IsScalarTower Qp K₀ B]
    [Algebra Qp BdR] [Algebra K₀ BdR] [Algebra K BdR] [IsScalarTower Qp K BdR]
    [IsScalarTower K₀ K BdR] [IsScalarTower Qp K₀ BdR]
    {PD : PeriodData G Qp K₀ K B BdR}
    {LL : Type} [Field LL] [Algebra Qp LL] {O : Type} [CommRing O] [Algebra O LL]

def red (L1 : Lattice (O := O) (charRep (cycLL PD LL))) : (G × G → LL) →ₗ[O] (G × G → LL ⧸ L1.T) :=
  LinearMap.compLeft L1.T.mkQ (G × G)

def Zc (L1 : Lattice (O := O) (charRep (cycLL PD LL))) : Submodule O (G × G → LL) :=
  (ReciprocityTheory.Def.Z2 (repD L1) ⊤).comap (red L1)

def cls (L1 : Lattice (O := O) (charRep (cycLL PD LL))) : Zc L1 →ₗ[O] ReciprocityTheory.Def.H2 (repD L1) ⊤ :=
  (Submodule.mkQ _) ∘ₗ ((red L1).restrict (q := ReciprocityTheory.Def.Z2 (repD L1) ⊤) (fun _ h => h))

theorem cls_eq_zero_iff (L1 : Lattice (O := O) (charRep (cycLL PD LL))) (w : Zc L1) :
    cls L1 w = 0 ↔ CobO PD L1 (w : G × G → LL) := by
  simp only [cls, LinearMap.comp_apply, Submodule.mkQ_apply]
  rw [Submodule.Quotient.mk_eq_zero]
  rfl

theorem mem_Zc [TopologicalSpace LL] [IsTopologicalRing LL]
    (L1 : Lattice (O := O) (charRep (cycLL PD LL)))
    (hop : IsOpen (L1.T : Set LL)) {z : G × G → LL} (hz : Continuous z)
    (hd : ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) z = 0) : z ∈ Zc L1 := by
  refine ⟨⟨?_, fun _ => trivial⟩, ?_⟩
  · intro s
    have h1 : IsOpen ((Submodule.Quotient.mk : LL → LL ⧸ L1.T) ⁻¹' s) := by
      rw [isOpen_iff_forall_mem_open]
      intro y hy
      refine ⟨(fun t => t - y) ⁻¹' (L1.T : Set LL), ?_, hop.preimage (by fun_prop), ?_⟩
      · intro t ht
        have h2 : (Submodule.Quotient.mk t : LL ⧸ L1.T) = Submodule.Quotient.mk y :=
          (Submodule.Quotient.eq _).2 ht
        simpa [Set.mem_preimage, h2] using hy
      · simp [Set.mem_preimage]
    exact h1.preimage hz
  · ext x
    have h3 := congrFun hd x
    have h4 : (Submodule.Quotient.mk (ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) z x) : LL ⧸ L1.T) = 0 := by
      rw [h3]
      simp
    exact h4

theorem topLine_at [TopologicalSpace LL] [IsTopologicalRing LL] [IsDomain O] [IsDiscreteValuationRing O]
    [IsFractionRing O LL] (L1 : Lattice (O := O) (charRep (cycLL PD LL)))
    (hT : L1.T = LinearMap.range (Algebra.linearMap O LL)) (hop : IsOpen (L1.T : Set LL))
    {ϖ : O} (hϖ : Irreducible ϖ) (hc : IsAdicComplete (Ideal.span {ϖ}) O)
    (φ : ReciprocityTheory.Def.H2 (repD L1) ⊤ ≃ₗ[O] (LL ⧸ L1.T))
    (hC : ∀ z : G × G → LL, Continuous z → (CobL PD z ↔ ∀ a : LL, CobO PD L1 (a • z)))
    {z z' : G × G → LL} (hz : Continuous z) (hz' : Continuous z')
    (hd : ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) z = 0)
    (hd' : ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) z' = 0) (hn : ¬ CobL PD z) :
    ∃ a : LL, CobL PD (z' - a • z) := by
  have hsm : ∀ {w : G × G → LL}, Continuous w → ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) w = 0 →
      ∀ a : LL, a • w ∈ Zc L1 := by
    intro w hw hdw a
    refine mem_Zc L1 hop (hw.const_smul a) ?_
    rw [map_smul, hdw, smul_zero]
  have key : ∀ {w : G × G → LL} (hw : Continuous w) (hdw : ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) w = 0),
      ∃ u : LL, ∀ a : LL, φ (cls L1 ⟨a • w, hsm hw hdw a⟩) = Submodule.Quotient.mk (a * u) := by
    intro w hw hdw
    let ι : LL →ₗ[O] Zc L1 :=
      { toFun := fun a => ⟨a • w, hsm hw hdw a⟩
        map_add' := fun a b => Subtype.ext (add_smul a b w)
        map_smul' := fun r a => Subtype.ext (by
          ext x
          simp [Algebra.smul_def, mul_assoc]) }
    exact exists_mul_of_linear L1.T hT hϖ hc ((φ.toLinearMap ∘ₗ cls L1) ∘ₗ ι)
  obtain ⟨u, hu⟩ := key hz hd
  obtain ⟨u', hu'⟩ := key hz' hd'
  have hu0 : u ≠ 0 := by
    rintro rfl
    apply hn
    rw [hC z hz]
    intro a
    have h1 := hu a
    rw [mul_zero, Submodule.Quotient.mk_zero, map_eq_zero_iff φ φ.injective, cls_eq_zero_iff] at h1
    exact h1
  refine ⟨u' / u, ?_⟩
  have hwc : Continuous (z' - (u' / u) • z) := hz'.sub (hz.const_smul _)
  have hdw : ReciprocityTheory.Def.d2 (charRep (cycLL PD LL)) (z' - (u' / u) • z) = 0 := by
    rw [map_sub, map_smul, hd, hd', smul_zero, sub_zero]
  rw [hC _ hwc]
  intro b
  have h2 : (⟨b • (z' - (u' / u) • z), hsm hwc hdw b⟩ : Zc L1) =
      ⟨b • z', hsm hz' hd' b⟩ - ⟨(b * (u' / u)) • z, hsm hz hd _⟩ := by
    apply Subtype.ext
    simp [smul_sub, mul_smul]
  have h3 : φ (cls L1 ⟨b • (z' - (u' / u) • z), hsm hwc hdw b⟩) = 0 := by
    rw [h2, map_sub, map_sub, hu, hu', ← Submodule.Quotient.mk_sub]
    have h4 : b * u' - b * (u' / u) * u = 0 := by
      field_simp
      ring
    rw [h4, Submodule.Quotient.mk_zero]
  rw [map_eq_zero_iff φ φ.injective, cls_eq_zero_iff] at h3
  exact h3

end Red

end GlobalTheory.CompanionTheory.LocDual.Top
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.H2LineOfTateH2AndCoboundaries =====

-- ===== clump member: Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.CompactQuotientSubmodule =====
-- clump-header: {"m": "Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.CompactQuotientSubmodule", "h": "module\n\npublic import Mathlib.RingTheory.Finiteness.Defs\npublic import Mathlib.Topology.Algebra.MulAction\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.LinearAlgebra.Finsupp.LinearCombination\npublic import Mathlib.RingTheory.Finiteness.Basic\n\n"}
section -- clump:auto
@[expose] public section

theorem UpperTheory.compact_quotient_submodule :
    ∀ {LL O W Q : Type} [Field LL] [CommRing O] [Algebra O LL] [AddCommGroup W] [Module LL W] [Module O W]
        [IsScalarTower O LL W] [TopologicalSpace LL] [TopologicalSpace W] [ContinuousSMul LL W]
        [IsTopologicalAddGroup W] [T2Space W] [AddCommGroup Q] [Module O Q] [Finite Q]
        (Z : Submodule O W) (p : O) (f : Z →ₗ[O] Q),
        IsCompact (Set.range (algebraMap O LL)) →
        (∀ U ∈ nhds (0 : W), ∃ n : ℕ, ∀ z ∈ Z, p ^ n • z ∈ U) →
        (∀ z : Z, f z = 0 → ∃ w ∈ Z, (z : W) = p • w) →
        Z.FG := by
  intro LL O W Q _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ Z p f hK hsmall hker
  classical
  have := Fintype.ofFinite Q
  let s : Q → Z := Function.invFun f
  have hs : ∀ z : Z, f (s (f z)) = f z := fun z => Function.invFun_eq ⟨z, rfl⟩
  let v : Q → W := fun q => (s q : W)
  let N : Submodule O W := Submodule.span O (Set.range v)
  have hNZ : N ≤ Z := by
    refine Submodule.span_le.2 ?_
    rintro _ ⟨q, rfl⟩
    exact (s q).2
  have hstep : ∀ z ∈ Z, ∃ a ∈ N, ∃ w ∈ Z, z = a + p • w := by
    intro z hz
    obtain ⟨w, hw, e⟩ := hker (⟨z, hz⟩ - s (f ⟨z, hz⟩)) (by rw [map_sub, hs, sub_self])
    refine ⟨v (f ⟨z, hz⟩), Submodule.subset_span ⟨_, rfl⟩, w, hw, ?_⟩
    rw [← e]
    simp [v]
  have hiter : ∀ n : ℕ, ∀ z ∈ Z, ∃ a ∈ N, ∃ w ∈ Z, z = a + p ^ n • w := by
    intro n
    induction n with
    | zero => exact fun z hz => ⟨0, N.zero_mem, z, hz, by simp⟩
    | succ n ih =>
      intro z hz
      obtain ⟨a, ha, w, hw, e⟩ := ih z hz
      obtain ⟨b, hb, u, hu, e'⟩ := hstep w hw
      refine ⟨a + p ^ n • b, N.add_mem ha (N.smul_mem _ hb), u, hu, ?_⟩
      rw [e, e', smul_add, smul_smul, pow_succ, add_assoc]
  have hcomp : IsCompact (N : Set W) := by
    have hc : Continuous (fun c : Q → LL => ∑ q, c q • v q) := by fun_prop
    have h1 := (isCompact_univ_pi (fun _ : Q => hK)).image hc
    convert h1 using 1
    ext x
    simp only [SetLike.mem_coe, N, Submodule.mem_span_range_iff_exists_fun, Set.mem_image]
    constructor
    · rintro ⟨c, rfl⟩
      exact ⟨fun q => algebraMap O LL (c q), fun q _ => ⟨c q, rfl⟩, by simp⟩
    · rintro ⟨c, hc, rfl⟩
      choose d hd using fun q => hc q (Set.mem_univ q)
      exact ⟨d, by simp [← hd]⟩
  have hZN : Z ≤ N := by
    intro z hz
    by_contra hzN
    have hopen : IsOpen ((fun x : W => z - x) ⁻¹' (N : Set W)ᶜ) :=
      hcomp.isClosed.isOpen_compl.preimage (by fun_prop)
    obtain ⟨n, hn⟩ := hsmall _ (hopen.mem_nhds (by simpa using hzN))
    obtain ⟨a, ha, w, hw, e⟩ := hiter n z hz
    apply hn w hw
    have : z - p ^ n • w = a := by rw [e]; simp
    simpa [this] using ha
  rw [le_antisymm hZN hNZ]
  exact Submodule.fg_span (Set.finite_range v)
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.CompactQuotientSubmodule =====

-- ===== clump member: Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.FgZ1T =====
-- clump-header: {"m": "Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.FgZ1T", "h": "module\n\npublic import Formalism.WeaklyAdmissibleFiltrations.StatementTor\npublic import Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.CompactQuotientSubmodule\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open Formalism.WeaklyAdmissibleFiltrations in
/-- Apply compact-quotient finite generation to the lattice cocycles, using reduction modulo `ϖ`. -/
theorem UpperTheory.Reformulated.B.Gub2.fg_Z1T
    {G : Type} [inst : Group G] [inst_1 : TopologicalSpace G]
    {LL O V : Type} [inst_2 : Field LL] [inst_3 : CommRing O] [inst_4 : Algebra O LL]
    [inst_5 : AddCommGroup V] [inst_6 : Module LL V] [inst_7 : Module O V]
    [inst_8 : IsScalarTower O LL V] {ρ : Representation LL G V}
    [inst_9 : TopologicalSpace V] [inst_10 : ContinuousAdd V] [inst_11 : ContinuousConstSMul LL V]
    [inst_12 : TopologicalSpace LL] [ContinuousSMul LL V] [IsTopologicalAddGroup V] [T2Space V]
    (L : Lattice (O := O) ρ) {ϖ : O}
    (hϖ : algebraMap O LL ϖ ≠ 0)
    (hb : (nhds (0 : V)).HasBasis (fun _ : ℕ => True) (fun n => (fun x => ϖ ^ n • x) '' (L.T : Set V)))
    (hc : IsCompact (Set.range (algebraMap O LL)))
    (hI : StableSub L (Ideal.span {ϖ ^ 1} • ⊤ : Submodule O ↥L.T))
    (hfin : Finite ↥(quotientCocycles L _ hI)) :
    (latticeCocycles L).FG := by
  have hmem : ∀ x : L.T, x ∈ (Ideal.span {ϖ ^ 1} • (⊤ : Submodule O L.T)) ↔
      ∃ y ∈ L.T, ϖ • y = (x : V) := by
    intro x
    rw [pow_one, Submodule.ideal_span_singleton_smul, Submodule.mem_smul_pointwise_iff_exists]
    constructor
    · rintro ⟨y, -, rfl⟩
      exact ⟨y, y.2, rfl⟩
    · rintro ⟨y, hy, h⟩
      exact ⟨⟨y, hy⟩, trivial, Subtype.ext h⟩
  have hred : ∀ c : latticeCocycles L, redT L _ c ∈ quotientCocycles L _ hI := by
    intro c
    have hcont : Continuous (c : G → V) := c.2.1.1
    refine ⟨(IsLocallyConstant.iff_eventually_eq _).2 fun g => ?_, fun g h => ?_⟩
    · have h0 : Filter.Tendsto (fun y => (c : G → V) y - (c : G → V) g) (nhds g) (nhds 0) := by
        have := (hcont.sub (continuous_const (y := (c : G → V) g))).tendsto g
        rw [Pi.sub_apply, sub_self] at this
        exact this
      filter_upwards [h0 (hb.mem_of_mem (i := 1) trivial)] with y hy
      obtain ⟨v, hv, hvy⟩ := hy
      refine (Submodule.Quotient.eq _).2 ((hmem _).2 ⟨v, hv, ?_⟩)
      rw [← pow_one ϖ]
      exact hvy
    · have : evT L (g * h) c = evT L g c + actT L g (evT L h c) :=
        Subtype.ext (c.2.1.2 g h)
      change Submodule.mkQ _ (evT L (g * h) c) = _
      rw [this, map_add (f := _)]
      rfl
  refine UpperTheory.compact_quotient_submodule (LL := LL) (latticeCocycles L) ϖ
    ((redT L _).codRestrict (quotientCocycles L _ hI) hred) hc ?_ ?_
  · intro U hU
    rw [nhds_pi, Filter.mem_pi] at hU
    obtain ⟨I, hIf, t, ht, hsub⟩ := hU
    obtain ⟨n, -, hn⟩ := hb.mem_iff.1 ((Filter.biInter_mem hIf).2 fun i _ => ht i)
    refine ⟨n, fun z hz => hsub fun i hi => ?_⟩
    exact Set.mem_iInter₂.1 (hn ⟨z i, hz.2 i trivial, rfl⟩) i hi
  · intro z hz
    have hz' : ∀ g, ∃ y ∈ L.T, ϖ • y = (z : G → V) g := fun g =>
      (hmem (evT L g z)).1
        ((Submodule.Quotient.mk_eq_zero _).1 (congrFun (congrArg Subtype.val hz) g))
    refine ⟨(algebraMap O LL ϖ)⁻¹ • (z : G → V),
      ⟨(continuousCocycles ρ).smul_mem _ z.2.1, fun g _ => ?_⟩, ?_⟩
    · obtain ⟨y, hy, h⟩ := hz' g
      have : ((algebraMap O LL ϖ)⁻¹ • (z : G → V)) g = y := by
        rw [Pi.smul_apply, ← h, ← algebraMap_smul LL ϖ y, inv_smul_smul₀ hϖ]
      rw [this]
      exact hy
    · rw [← algebraMap_smul LL ϖ, smul_inv_smul₀ hϖ]
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.FgZ1T =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.T2SpaceOfLatticeNhdsBasis =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.T2SpaceOfLatticeNhdsBasis", "h": "module\n\npublic import Formalism.WeaklyAdmissibleFiltrations.StatementTor\npublic import Mathlib.Algebra.Module.LocalizedModule.Basic\npublic import Development.AutomorphicArithmetic.IntegralCasts.CapelliIdentities.FgZ1T\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.SimpleRing.Principal\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\nimport Std.Tactic.BVDecide.Normalize.Prop\nimport Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine\nimport Formalism.ConjugateSelfDual.Statement\nimport Formalism.SharpRestriction.CuspSpanNormBounds.Point\nimport Formalism.SharpRestriction.LevelLetterCocycles.DataNLoc\nimport Formalism.SharpRestriction.LevelLetterCocycles.LocCoh\npublic import Mathlib.RingTheory.Filtration\n\n"}
section -- clump:auto
@[expose] public section

open NumberField IsDedekindDomain Formalism Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions Formalism.MainNotions.N Formalism.WeaklyAdmissibleFiltrations Module GlobalTheory.CompanionTheory.LocDual

noncomputable section

namespace GlobalTheory.CompanionTheory.LocDual.FinT

section Gen

variable {G : Type} [Group G] [TopologicalSpace G] {LL O V : Type} [Field LL] [CommRing O] [Algebra O LL]
    [AddCommGroup V] [Module LL V] [Module O V] [IsScalarTower O LL V] {ρ : Representation LL G V}
    [TopologicalSpace V] [ContinuousAdd V] [ContinuousConstSMul LL V]

theorem mem_smulTop (L : Lattice (O := O) ρ) (ϖ : O) (x : ↥L.T) :
    x ∈ (Ideal.span {ϖ ^ 1} • ⊤ : Submodule O ↥L.T) ↔ ∃ y : ↥L.T, ϖ • y = x := by
  rw [Submodule.ideal_span_singleton_smul, Submodule.mem_smul_pointwise_iff_exists]
  simp

theorem fg_Z1T [TopologicalSpace LL] [ContinuousSMul LL V] [IsTopologicalAddGroup V] [T2Space V] (L : Lattice (O := O) ρ) {ϖ : O}
    (h0 : algebraMap O LL ϖ ≠ 0)
    (hB : (nhds (0 : V)).HasBasis (fun _ : ℕ => True) (fun n => (fun x => ϖ ^ n • x) '' (L.T : Set V)))
    (hK : IsCompact (Set.range (algebraMap O LL)))
    (hI : StableSub L (Ideal.span {ϖ ^ 1} • ⊤ : Submodule O ↥L.T)) (hfin : Finite ↥(quotientCocycles L _ hI)) :
    (latticeCocycles L).FG :=
  _root_.UpperTheory.Reformulated.B.Gub2.fg_Z1T L h0 hB hK hI hfin

theorem t2Space_of_lattice_nhds_basis [IsTopologicalAddGroup V] [IsNoetherianRing O] [IsLocalRing O] (L : Lattice (O := O) ρ) {ϖ : O}
    (hϖ : ¬ IsUnit ϖ)
    (hB : (nhds (0 : V)).HasBasis (fun _ : ℕ => True) (fun n => (fun x => ϖ ^ n • x) '' (L.T : Set V))) :
    T2Space V := by
  refine IsTopologicalAddGroup.t2Space_of_zero_sep fun x hx => ?_
  by_contra hcon
  push_neg at hcon
  have hin : ∀ n : ℕ, ∃ t ∈ L.T, ϖ ^ n • t = x := fun n => hcon _ (hB.mem_of_mem (i := n) trivial)
  haveI : Module.Finite O ↥L.T := Module.Finite.iff_fg.2 L.fg
  have hbot := Ideal.iInf_pow_smul_eq_bot_of_isLocalRing (M := ↥L.T) (Ideal.span {ϖ})
    (fun h => hϖ (Ideal.span_singleton_eq_top.1 h))
  obtain ⟨t₀, ht₀, he₀⟩ := hin 0
  have hxT : x ∈ L.T := by
    rw [pow_zero, one_smul] at he₀
    exact he₀ ▸ ht₀
  have hmem : (⟨x, hxT⟩ : ↥L.T) ∈ (⨅ i : ℕ, (Ideal.span {ϖ}) ^ i • (⊤ : Submodule O ↥L.T)) := by
    rw [Submodule.mem_iInf]
    intro n
    obtain ⟨t, ht, he⟩ := hin n
    rw [Ideal.span_singleton_pow, Submodule.ideal_span_singleton_smul,
      Submodule.mem_smul_pointwise_iff_exists]
    exact ⟨⟨t, ht⟩, trivial, Subtype.ext he⟩
  rw [hbot, Submodule.mem_bot] at hmem
  exact hx (congrArg Subtype.val hmem)

def toV (L : Lattice (O := O) ρ) : LatticeCohomology L →ₗ[O] H1V ρ :=
  Submodule.liftQ _
    (((Submodule.mkQ ((B1 ρ).comap (continuousCocycles ρ).subtype)).restrictScalars O) ∘ₗ
      { toFun := fun c => ⟨(c : G → V), c.2.1⟩
        map_add' := fun _ _ => rfl
        map_smul' := fun _ _ => rfl })
    (by
      rintro c ⟨x, _, hx⟩
      refine (Submodule.Quotient.mk_eq_zero _).2 ?_
      exact ⟨x, hx⟩)

theorem toV_mk (L : Lattice (O := O) ρ) (c : ↥(latticeCocycles L)) :
    toV L (Submodule.Quotient.mk c) = Submodule.Quotient.mk ⟨(c : G → V), c.2.1⟩ := rfl

theorem isLocalized_toV [IsDomain O] [IsFractionRing O LL] (L : Lattice (O := O) ρ) {ϖ : O} (h0 : ϖ ≠ 0)
    (hInt : ∀ c : G → V, Continuous c → ∃ n : ℕ, ∀ g, ϖ ^ n • c g ∈ L.T) :
    IsLocalizedModule (nonZeroDivisors O) (toV L) := by
  refine { map_units := ?_, surj := ?_, exists_of_eq := ?_ }
  · intro s
    have hs : algebraMap O LL (s : O) ≠ 0 :=
      IsFractionRing.to_map_ne_zero_of_mem_nonZeroDivisors s.2
    rw [Module.End.isUnit_iff]
    constructor
    · intro x y hxy
      have hxy' : (s : O) • x = (s : O) • y := hxy
      rw [← algebraMap_smul LL (s : O) x, ← algebraMap_smul LL (s : O) y] at hxy'
      exact smul_right_injective _ hs hxy'
    · intro y
      refine ⟨(algebraMap O LL (s : O))⁻¹ • y, ?_⟩
      change (s : O) • ((algebraMap O LL (s : O))⁻¹ • y) = y
      rw [← algebraMap_smul LL (s : O), smul_smul, mul_inv_cancel₀ hs, one_smul]
  · intro y
    obtain ⟨c, rfl⟩ := Submodule.Quotient.mk_surjective _ y
    obtain ⟨n, hn⟩ := hInt (c : G → V) c.2.1
    have hz : ϖ ^ n • (c : G → V) ∈ latticeCocycles L :=
      ⟨(continuousCocycles ρ).restrictScalars O |>.smul_mem _ c.2, fun g _ => hn g⟩
    refine ⟨⟨Submodule.Quotient.mk ⟨_, hz⟩, ⟨ϖ ^ n, pow_mem (mem_nonZeroDivisors_of_ne_zero h0) n⟩⟩, ?_⟩
    rfl
  · intro x₁ x₂ h
    obtain ⟨a, rfl⟩ := Submodule.Quotient.mk_surjective _ x₁
    obtain ⟨b, rfl⟩ := Submodule.Quotient.mk_surjective _ x₂
    rw [toV_mk, toV_mk, Submodule.Quotient.eq] at h
    obtain ⟨v, hv⟩ := h
    obtain ⟨n, hn⟩ := hInt (fun _ => v) continuous_const
    refine ⟨⟨ϖ ^ n, pow_mem (mem_nonZeroDivisors_of_ne_zero h0) n⟩, ?_⟩
    rw [Submonoid.mk_smul, Submonoid.mk_smul, ← Submodule.Quotient.mk_smul, ← Submodule.Quotient.mk_smul, Submodule.Quotient.eq]
    refine ⟨ϖ ^ n • v, hn 1, ?_⟩
    funext g
    have hvg : ρ g v - v = (a : G → V) g - (b : G → V) g := congrFun hv g
    change ρ g (ϖ ^ n • v) - ϖ ^ n • v = ϖ ^ n • (a : G → V) g - ϖ ^ n • (b : G → V) g
    rw [← smul_sub, ← hvg, ← algebraMap_smul LL (ϖ ^ n) v, map_smul, ← smul_sub, algebraMap_smul]

end Gen

end GlobalTheory.CompanionTheory.LocDual.FinT
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.T2SpaceOfLatticeNhdsBasis =====

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.GlobalProofs.TateDualityH2FiniteCoefficients =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.GlobalProofs.TateDualityH2FiniteCoefficients", "h": "module\n\npublic import Development.AutomorphicSpectrum.Definitions.NonGaloisLines.TopLine\npublic import Development.AbelianVarietyTheory.BlockTheory.TorsionBlocks.TateLocalDualityTopDegree\npublic import Development.AbelianVarietyTheory.Proofs.AdelicLatticeProofs.IsAdicCompleteSpanAlgebraMapOfFreeFinite\npublic import Development.AbelianVarietyTheory.Proofs.FoundationProofs.H2EquivOfTorsionCharacter\npublic import Development.AbelianVarietyTheory.Proofs.FoundationProofs.IsIntegralOfNormLeOne\npublic import Development.AutomorphicSpectrum.Proofs.GlobalProofs.CupFlip\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualDOfDualQ\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.DualQOfTopInj\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsFinsetSep\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsLimitOfCauchyAdicFiltration\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.ExistsPerfectCharacterQuotient\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.GrowthGaloisInvariantsModPrimePowerLattice\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.H2LineOfTateH2AndCoboundaries\npublic import Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.T2SpaceOfLatticeNhdsBasis\npublic import Development.AbelianVarietyTheory.Definitions.Foundations.HTBasis\nimport Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.TateH2PeriodDatum\nimport Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.CyclotomicCharacterPadicBasicProperties\nimport Development.AbelianVarietyTheory.Proofs.InertiaEigenvalues.IsCycCycChar\nimport Development.AutomorphicSpectrum.Proofs.NonGaloisProofs.GoodOAdicCompleteCompactBasis\nimport Formalism.SharpRestriction.LevelLetterCocycles.LocCoh\nimport Mathlib.NumberTheory.Padics.PadicIntegers\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.FieldTheory.Galois.Profinite\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Coalgebra.IsFrobenius\nimport Mathlib.RingTheory.HopfAlgebra.Basic\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.HaveILetI\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

open NumberField IsDedekindDomain Formalism Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions Formalism.MainNotions.N Formalism.WeaklyAdmissibleFiltrations Module GlobalTheory.CompanionTheory.LocDual

noncomputable section

namespace GlobalTheory.CompanionTheory.Hypotheses₂.BK

open GlobalTheory.CompanionTheory.LocDual.Q in
theorem actLoc (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l)
    (LL : Type) [Field LL] [Algebra ℚ_[l] LL] [TopologicalSpace LL] (O : Type) [CommRing O]
    [Algebra O LL] (hG : GoodO (Qp := ℚ_[l]) LL O)
    (A : GRep ↥(GK K) ℚ_[l] LL O) (LA : Lattice (O := O) A.ρ) (ϖ : O) (hϖ : Irreducible ϖ) (r : ℕ)
    (hI : StableSub LA (Ideal.span {ϖ ^ r} • ⊤ : Submodule O ↥LA.T))
    (m : ↥LA.T ⧸ (Ideal.span {ϖ ^ r} • ⊤ : Submodule O ↥LA.T)) :
    IsLocallyConstant fun g => actQ LA _ hI g m :=
  act_lc A LA ϖ r hI (latTop l Lp K LL O hG A LA ϖ hϖ).2.1 m


open GlobalTheory.CompanionTheory.LocDual.Q in

theorem dualQ : Formalism.GaloisCohomology.LocalTateDualityK → ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l),
    TopInj (Lp.PD K) → DualQ (Lp.PD K) := by
  intro hT l _ Lp K hTop LL _ _ _ O _ _ hG L1 hL1 A A' LA LA' P hdual ϖ hϖ r hI hI'
  have hG0 : ∃ hO : IsDomain O, @IsDiscreteValuationRing O _ hO ∧ IsFractionRing O LL := hG.1
  haveI hDom : IsDomain O := hG0.choose
  haveI hDVR : IsDiscreteValuationRing O := hG0.choose_spec.1
  haveI hFrac : IsFractionRing O LL := hG0.choose_spec.2
  have h50 := GlobalTheory.CompanionTheory.GoodCoeff.goodO_structure l LL O hG ϖ hϖ
  have hFin := h50.2.1
  have hle : (l : O) ∈ Ideal.span {ϖ} := h50.2.2.2.1.choose_spec.1
  have hInt := h50.2.2.2.2.2
  have hdual' := (latTop l Lp K LL O hG A LA ϖ hϖ).2.2.2.2 A' LA' P hdual
  have hF1 := finite_quot O A.V LA.T ϖ r hFin LA.fg
  have hF2 := finite_quot O A'.V LA'.T ϖ r hFin LA'.fg
  have hlp : l.Prime := Fact.out
  have hn : 0 < r + 1 := Nat.succ_pos r
  have hlO : ((l ^ (r + 1) : ℕ) : O) ∈ Ideal.span {ϖ ^ r} := by
    refine (Ideal.mem_span_singleton.1 hle).elim fun b hb => Ideal.mem_span_singleton.2 ?_
    rw [Nat.cast_pow, hb, mul_pow, pow_succ ϖ r]
    exact ⟨ϖ * b ^ (r + 1), by ring⟩
  let w : ↥(GK K) →* ℤ_[l] := GlobalTheory.IndefiniteRowSideFullHecke.TateLocalDualityDegreeTwo.chiInt Lp K
  let χ : ↥(GK K) →* (ZMod (l ^ (r + 1)))ˣ := ((PadicInt.toZModPow (r + 1)).toMonoidHom.comp w).toHomUnits
  have hcomp : ∀ g, ∃ u : ℤ_[l], (u : ℚ_[l]) = (((Lp.PD K).χ g : ℚ_[l]ˣ) : ℚ_[l]) ∧
      PadicInt.toZModPow (r + 1) u = (χ g : ZMod (l ^ (r + 1))) := fun g => ⟨w g, rfl, rfl⟩
  have hu0 : ∀ g, ∃ o : O, algebraMap O LL o = algebraMap ℚ_[l] LL (w g : ℚ_[l]) := fun g => hInt (w g)
  refine (GlobalTheory.CompanionTheory.LocDual.GenChar.exists_generating_character O ϖ hϖ r (l ^ (r + 1)) (pow_pos hlp.pos _) hF1.1 hlO).elim fun ψ₀ hψ => ?_
  exact dual_core (Lp.PD K) hTop hG L1 hL1 A A' LA LA' P hdual (fun x => hdual'.2 x) ϖ hϖ r hI hI'
    hF1.1 hF1.2 hF2.2 (l ^ (r + 1)) hlO χ ψ₀ hψ.1 hψ.2 (fun g => (hu0 g).choose)
    (fun g => (hu0 g).choose_spec)
    (fun g => exists_nat_rep (IsFractionRing.injective O LL) hInt _ (r + 1) hlO (w g) _ (hu0 g).choose_spec)
    (actLoc l Lp K LL O hG A LA ϖ hϖ r hI) (actLoc l Lp K LL O hG A' LA' ϖ hϖ r hI')
    (cobChar hT l Lp K (r + 1) χ hn hcomp) (dblAnn hT l Lp K (r + 1) χ hn hcomp)
    (dblAnnR hT l Lp K (r + 1) χ hn hcomp)


open GlobalTheory.CompanionTheory.TdDualD in
open GlobalTheory.CompanionTheory.LocDual in
theorem dualDL : ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l), FinZQ (Lp.PD K) →
    DualQ (Lp.PD K) → DualD (Lp.PD K) := by
  intro l _ Lp K hF hQ LL _ _ _ O _ _ hG L1 hL1 A A' LA LA' P hP S hBS hSZ c hc H
  obtain ⟨⟨hdom, hdvr, hfrac⟩, -⟩ := id hG
  haveI := hdom
  haveI := hdvr
  haveI := hfrac
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  have hne : algebraMap O LL ϖ ≠ 0 := fun h =>
    hϖ.ne_zero ((IsFractionRing.injective O LL) (by rw [h, map_zero]))
  obtain ⟨hO, -⟩ := _root_.GlobalTheory.CompanionTheory.GoodCoeff.goodO_structure l LL O hG ϖ hϖ
  obtain ⟨-, hb, -, -, -⟩ := latTop l Lp K LL O hG A LA ϖ hϖ
  obtain ⟨-, -, -, hbd', -⟩ := latTop l Lp K LL O hG A' LA' ϖ hϖ
  haveI : CompactSpace ↥(GK K) :=
    haveI := K.2
    isCompact_iff_compactSpace.1 (InfiniteGalois.fixingSubgroup_isClosed K.1).isCompact
  haveI : Module.Free O ↥LA.T := LA.free
  haveI : Module.Finite O ↥LA.T := Module.Finite.iff_fg.2 LA.fg
  refine core (Cob := CobO (Lp.PD K) L1) ?_ (fun x hx y hy => (hP.2 y).1 hy x hx) hne
    (GlobalTheory.CNorm.isAdicComplete_of_free_finite _ hO) hb ?_
    (fun r => hF LL O hG A LA ϖ hϖ r (Ip_stable LA ϖ r))
    (fun r => (hQ LL O hG L1 hL1 A A' LA LA' P hP ϖ hϖ r (Ip_stable LA ϖ r) (Ip_stable LA' ϖ r)).2)
    hBS hSZ hc H
  · intro z z' h
    have : (fun x => (Submodule.Quotient.mk (z x) : LL ⧸ L1.T)) =
        fun x => (Submodule.Quotient.mk (z' x) : LL ⧸ L1.T) := by
      funext x
      obtain ⟨a, ha⟩ := h x
      refine (Submodule.Quotient.eq _).2 ?_
      rw [ha, hL1]
      exact ⟨a, rfl⟩
    unfold CobO
    rw [this]
  · intro v
    obtain ⟨n, hn⟩ := hbd' (fun _ => v) continuous_const
    exact ⟨n, hn 1⟩


open GlobalTheory.CompanionTheory.LocDual.CobDetect in
theorem cobLO : ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l), FinZQ (Lp.PD K) → TopInj (Lp.PD K) → CobLO (Lp.PD K) := by
  intro l _ Lp K hfin htop LL _ _ _ O _ _ hO L1 hL1 z hz
  have hO' := hO
  obtain ⟨⟨hdom, hdvr, hfr⟩, hfd, hmt, htr, hop⟩ := hO'
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨hc, -, -, -, hb, -⟩ := _root_.GlobalTheory.CompanionTheory.GoodCoeff.goodO_structure l LL O hO ϖ hϖ
  haveI : CompactSpace ↥(GK K) := GlobalTheory.BlochKatoIntegralScalars.compactSpace_GK K
  haveI : ContinuousSMul ℚ_[l] LL := IsModuleTopology.toContinuousSMul ℚ_[l] LL
  have hAlg : Continuous (algebraMap ℚ_[l] LL) := continuous_algebraMap ℚ_[l] LL
  have hχ : Continuous fun g : ↥(GK K) => ((cycLL (Lp.PD K) LL g : LLˣ) : LL) := by
    have h1 : (fun g : ↥(GK K) => ((cycLL (Lp.PD K) LL g : LLˣ) : LL)) =
        fun g : ↥(GK K) => algebraMap ℚ_[l] LL (Lp.χQ (g : GQ l) : ℚ_[l]) := by
      funext g
      rw [← Lp.PD_χ K g]
      rfl
    rw [h1]
    exact hAlg.comp ((GlobalTheory.Cyc.IsCyc.continuous Lp.χQ_cyc).comp continuous_subtype_val)
  let A : GRep ↥(GK K) ℚ_[l] LL O :=
    { V := LL
      ρ := charRep (cycLL (Lp.PD K) LL)
      cont := fun x => by
        simp only [charRep_apply]
        exact hχ.mul continuous_const }
  have hopT : IsOpen (L1.T : Set LL) := by
    have h1 : (L1.T : Set LL) = Set.range (algebraMap O LL) := by
      ext y
      exact mem_T L1 hL1
    rw [h1]
    exact hop
  exact ⟨fun h a => cobO_of_cobL L1 hopT h a, fun h =>
    cobL_of_all L1 hL1 hϖ hop hc hb (fun n => hfin LL O hO A L1 ϖ hϖ n (stable_pw L1 ϖ n))
      (fun r z hr hz' => htop LL O hO L1 hL1 ϖ hϖ r z hr hz') hz h⟩


open GlobalTheory.TateTop Formalism.MainNotions.LocalSituation GlobalTheory.Cyc GlobalTheory.Cyc.TwistLift Filter Topology in
theorem tate_duality_H2_finite_coefficients (hT : Formalism.GaloisCohomology.LocalTateDualityK) (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l) :
    LocalTateTopDegree (Lp.PD K) := by
  apply GlobalTheory.TateTop.tateH2_of_duality_loc <;> assumption


open GlobalTheory.CompanionTheory.LocDual.Top in
theorem topLine : ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l),
    LocalTateTopDegree (Lp.PD K) → CobLO (Lp.PD K) → TopLine (Lp.PD K) := by
  intro l _ Lp K hT hC LL _ _ _ O _ _ hO z z' hz hz' hd hd' hn
  obtain ⟨L1, hL1⟩ := (dualLat l Lp K).1 LL O hO
  obtain ⟨⟨hD, hDVR, hFrac⟩, -, -, htr, hopen⟩ := id hO
  haveI := hD
  haveI := hDVR
  haveI := hFrac
  haveI := htr
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  have hc := (_root_.GlobalTheory.CompanionTheory.GoodCoeff.goodO_structure l LL O hO ϖ hϖ).1
  have hop : IsOpen (L1.T : Set LL) := by
    have : (L1.T : Set LL) = Set.range (algebraMap O LL) := by
      rw [hL1]
      ext x
      simp [LinearMap.mem_range]
    rw [this]
    exact hopen
  obtain ⟨φ⟩ := hT LL O hO L1 hL1
  exact topLine_at L1 hL1 hop hϖ hc φ (hC LL O hO L1 hL1) hz hz' hd hd' hn


open GlobalTheory.CompanionTheory.LocDual.Kernels in
theorem rightKernel (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l)
    (hD : DualD (Lp.PD K)) (hC : CobLO (Lp.PD K))
    (LL : Type) [Field LL] [Algebra ℚ_[l] LL] [TopologicalSpace LL] (O : Type) [CommRing O]
    [Algebra O LL] (hO : GoodO (Qp := ℚ_[l]) LL O) (A A' : GRep ↥(GK K) ℚ_[l] LL O)
    (P : A.V →ₗ[LL] A'.V →ₗ[LL] LL) (hP : IsDual1 (Lp.PD K) A.ρ A'.ρ P)
    (b : ↥(GK K) → A'.V) (hb : b ∈ continuousCocycles A'.ρ)
    (hab : ∀ a ∈ continuousCocycles A.ρ, CobL (Lp.PD K) (cupL A'.ρ P a b)) : b ∈ B1 A'.ρ := by
  classical
  obtain ⟨⟨hDom, hDVR, hFrac⟩, -⟩ := id hO
  haveI := hDom
  haveI := hDVR
  haveI := hFrac
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨hCyc, hLat⟩ := dualLat l Lp K
  obtain ⟨L1, hL1⟩ := hCyc LL O hO
  obtain ⟨LA, LA', hLA, -⟩ := hLat LL O hO A A' P hP
  have hflip := cupFlip l Lp K LL O hO A A' P hP
  have hopen : IsOpen (LA'.T : Set A'.V) := (latTop l Lp K LL O hO A' LA' ϖ hϖ).1
  have hint : ∀ x ∈ LA.T, ∀ y ∈ LA'.T, P x y ∈ L1.T := by
    intro x hx y hy
    obtain ⟨a, ha⟩ := (hLA.2 y).mp hy x hx
    rw [hL1, ha]
    exact ⟨a, rfl⟩
  have hlc : ∀ f : ↥(GK K) → A'.V, Continuous f →
      IsLocallyConstant (fun g => (Submodule.Quotient.mk (f g) : A'.V ⧸ LA'.T)) := by
    intro f hf
    refine (IsLocallyConstant.iff_exists_open _).2 fun x => ?_
    refine ⟨(fun g => f g + -f x) ⁻¹' (LA'.T : Set A'.V),
      hopen.preimage (hf.add continuous_const), ?_, fun g hg => ?_⟩
    · simp
    · refine (Submodule.Quotient.eq _).mpr ?_
      rw [sub_eq_add_neg]
      exact hg
  have hact : ∀ (g : ↥(GK K)) (v : A'.V), actD LA' g (Submodule.Quotient.mk v) =
      Submodule.Quotient.mk (A'.ρ g v) := fun _ _ => rfl
  have hBZ : BD LA' ≤ divisibleCocycles LA' := by
    rintro _ ⟨x, rfl⟩
    obtain ⟨v, rfl⟩ := Submodule.Quotient.mk_surjective _ x
    refine ⟨?_, fun g h => ?_⟩
    · have hc : Continuous fun g => A'.ρ g v - v := by
        simp only [sub_eq_add_neg]
        exact (A'.cont v).add continuous_const
      have he : (LinearMap.pi fun g => actD LA' g - LinearMap.id)
          (Submodule.Quotient.mk v : A'.V ⧸ LA'.T) =
          fun g => (Submodule.Quotient.mk (A'.ρ g v - v) : A'.V ⧸ LA'.T) := by
        funext g
        rfl
      rw [he]
      exact hlc _ hc
    · simp only [LinearMap.pi_apply, LinearMap.sub_apply, LinearMap.id_apply, hact, map_mul,
        Module.End.mul_apply, map_sub]
      abel
  have key : ∀ n : ℕ, ∃ y : A'.V, ∀ g, ∃ t ∈ LA'.T, b g = cob A'.ρ y g + ϖ ^ n • t := by
    intro n
    have hϖ0 : algebraMap O LL ϖ ≠ 0 :=
      (map_ne_zero_iff _ (IsFractionRing.injective O LL)).mpr hϖ.ne_zero
    obtain ⟨u, hu⟩ : ∃ u : LL, algebraMap O LL (ϖ ^ n) * u = 1 :=
      ⟨(algebraMap O LL ϖ)⁻¹ ^ n, by rw [map_pow, ← mul_pow, mul_inv_cancel₀ hϖ0, one_pow]⟩
    have huv : ∀ x : A'.V, ϖ ^ n • (u • x) = x := by
      intro x
      rw [← algebraMap_smul LL (ϖ ^ n) (u • x), smul_smul, hu, one_smul]
    let c : ↥(GK K) → A'.V ⧸ LA'.T := fun g => Submodule.Quotient.mk (u • b g)
    have hc : c ∈ divisibleCocycles LA' := by
      refine ⟨hlc _ (hb.1.const_smul u), fun g h => ?_⟩
      show Submodule.Quotient.mk (u • b (g * h)) =
        Submodule.Quotient.mk (u • b g) + actD LA' g (Submodule.Quotient.mk (u • b h))
      rw [hb.2 g h, hact, map_smul, smul_add]
      rfl
    have horth : ∀ d ∈ latticeCocycles LA, CobO (Lp.PD K) L1 (cupLD LA' P d c) := by
      intro d hd
      have hdc : d ∈ continuousCocycles A.ρ := hd.1
      have hdT : ∀ g, d g ∈ LA.T := fun g => hd.2 g (Set.mem_univ g)
      have h1 := (hC LL O hO L1 hL1 _ (hflip.2 d hdc b hb).1).mp (hab d hdc) u
      have he : (fun x => (Submodule.Quotient.mk (cupLD LA' P d c x) : LL ⧸ L1.T)) =
          fun x => Submodule.Quotient.mk ((u • cupL A'.ρ P d b) x) := by
        funext x
        refine (Submodule.Quotient.eq _).mpr ?_
        have hl : liftD LA' (c x.2) - u • b x.2 ∈ LA'.T :=
          (Submodule.Quotient.eq _).mp (Submodule.Quotient.mk_surjective LA'.T (c x.2)).choose_spec
        have h2 := hint _ (hdT x.1) _ (LA'.stable x.1 _ hl)
        simpa [cupLD, cupL, map_sub, map_smul, smul_eq_mul] using h2
      unfold CobO
      rw [he]
      exact h1
    obtain ⟨xb, hxb⟩ := hD LL O hO L1 hL1 A A' LA LA' P hLA (BD LA') le_rfl hBZ c hc
      (fun d hd _ => horth d hd)
    obtain ⟨x, rfl⟩ := Submodule.Quotient.mk_surjective _ xb
    refine ⟨ϖ ^ n • x, fun g => ?_⟩
    have hg : (Submodule.Quotient.mk (u • b g) : A'.V ⧸ LA'.T) =
        Submodule.Quotient.mk (A'.ρ g x - x) := (congrFun hxb g).symm
    refine ⟨_, (Submodule.Quotient.eq _).mp hg, ?_⟩
    rw [smul_sub, huv, smul_sub]
    have hρ : A'.ρ g (ϖ ^ n • x) = ϖ ^ n • A'.ρ g x := LinearMap.map_smul_of_tower _ _ _
    simp only [cob, LinearMap.pi_apply, LinearMap.sub_apply, LinearMap.id_apply, hρ]
    abel
  obtain ⟨F, hF⟩ := exists_finset_sep (k := LL)
    ((cob A'.ρ).coprod (LinearMap.toSpanSingleton LL (↥(GK K) → A'.V) b))
  let res : (↥(GK K) → A'.V) →ₗ[O] (↥F → A'.V) := LinearMap.funLeft O A'.V Subtype.val
  haveI : Module.Finite O ↥LA'.T := Module.Finite.iff_fg.mpr LA'.fg
  have hΛ : (LinearMap.range (LinearMap.compLeft LA'.T.subtype ↥F)).FG :=
    Module.Finite.iff_fg.mp (Module.Finite.range _)
  have hw : res b ∈ ((B1 A'.ρ).restrictScalars O).map res := by
    refine mem_of_forall_pow _ _ hΛ ϖ hϖ.not_isUnit _ fun n => ?_
    obtain ⟨y, hy⟩ := key n
    choose t ht hbt using hy
    refine ⟨res (cob A'.ρ y), Submodule.mem_map_of_mem ⟨y, rfl⟩,
      (LinearMap.compLeft LA'.T.subtype ↥F) (fun i => ⟨t i, ht i⟩), ⟨_, rfl⟩, ?_⟩
    funext i
    exact hbt i
  obtain ⟨_, ⟨y, rfl⟩, hres⟩ := hw
  have hz := hF (y, -1) (fun g hg => by
    have h1 : cob A'.ρ y g = b g := congrFun hres ⟨g, hg⟩
    simp [h1])
  refine ⟨y, ?_⟩
  have hz' : cob A'.ρ y + (-1 : LL) • b = 0 := by simpa using hz
  rw [neg_one_smul, ← sub_eq_add_neg] at hz'
  exact sub_eq_zero.mp hz'


open GlobalTheory.CompanionTheory.LocDual.Kernels in
theorem nondegLL : ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l), DualD (Lp.PD K) →
    CobLO (Lp.PD K) → NondegL (Lp.PD K) := by
  intro l _ Lp K hD hC LL _ _ _ O _ _ hO A A' P hP
  have hf := cupFlip l Lp K LL O hO A A' P hP
  refine ⟨fun a ha h => ?_, fun b hb h => rightKernel l Lp K hD hC LL O hO A A' P hP b hb h⟩
  exact rightKernel l Lp K hD hC LL O hO A' A P.flip hf.1 a ha
    (fun b hb => ((hf.2 a ha b hb).2.2.1).mp (h b hb))


open GlobalTheory.CompanionTheory.LocDual.FinT in
theorem finrank_H1_rational_eq_lattice : ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l), FinZQ (Lp.PD K) → TateFiniteness (Lp.PD K) ∧ ∀ (LL : Type) [Field LL] [Algebra ℚ_[l] LL] [TopologicalSpace LL] (O : Type) [CommRing O] [Algebra O LL], GoodO (Qp := ℚ_[l]) LL O → ∀ (A : GRep ↥(GK K) ℚ_[l] LL O) (LA : Lattice (O := O) A.ρ), Module.Finite LL (H1V A.ρ) ∧ finrank LL (H1V A.ρ) = finrank O (LatticeCohomology LA) := by
  intro l _ Lp K hZ
  have key : ∀ (LL : Type) [Field LL] [Algebra ℚ_[l] LL] [TopologicalSpace LL] (O : Type) [CommRing O]
      [Algebra O LL], GoodO (Qp := ℚ_[l]) LL O → ∀ (A : GRep ↥(GK K) ℚ_[l] LL O)
      (LA : Lattice (O := O) A.ρ), Module.Finite O (LatticeCohomology LA) := by
    intro LL _ _ _ O _ _ hO A LA
    obtain ⟨⟨hD, hV, hF⟩, -, -, hTR, -⟩ := id hO
    obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
    obtain ⟨-, -, hK, -⟩ := _root_.GlobalTheory.CompanionTheory.GoodCoeff.goodO_structure l LL O hO ϖ hϖ
    obtain ⟨-, hB, -⟩ := latTop l Lp K LL O hO A LA ϖ hϖ
    haveI : IsTopologicalAddGroup A.V := IsModuleTopology.topologicalAddGroup LL A.V
    haveI : ContinuousSMul LL A.V := IsModuleTopology.toContinuousSMul LL A.V
    haveI : T2Space A.V := t2Space_of_lattice_nhds_basis LA hϖ.not_isUnit hB
    have h0 : algebraMap O LL ϖ ≠ 0 :=
      IsFractionRing.to_map_ne_zero_of_mem_nonZeroDivisors (mem_nonZeroDivisors_of_ne_zero hϖ.ne_zero)
    have hI : StableSub LA (Ideal.span {ϖ ^ 1} • ⊤ : Submodule O ↥LA.T) := by
      intro g x hx
      obtain ⟨y, rfl⟩ := (mem_smulTop LA ϖ x).1 hx
      exact (mem_smulTop LA ϖ _).2 ⟨actT LA g y, (map_smul _ _ _).symm⟩
    have hfg := fg_Z1T LA h0 hB hK hI (hZ LL O hO A LA ϖ hϖ 1 hI)
    haveI : Module.Finite O ↥(latticeCocycles LA) := Module.Finite.iff_fg.2 hfg
    infer_instance
  refine ⟨key, ?_⟩
  intro LL _ _ _ O _ _ hO A LA
  haveI := key LL O hO A LA
  obtain ⟨⟨hD, hV, hF⟩, -, -, hTR, -⟩ := id hO
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨-, -, -, hInt, -⟩ := latTop l Lp K LL O hO A LA ϖ hϖ
  haveI := isLocalized_toV LA hϖ.ne_zero hInt
  refine ⟨Module.Finite.of_isLocalizedModule (nonZeroDivisors O) (Rₚ := LL) (toV LA), ?_⟩
  have h1 : Module.rank LL (H1V A.ρ) = Module.rank O (H1V A.ρ) :=
    IsLocalization.rank_eq LL (nonZeroDivisors O) le_rfl
  have h2 : Module.rank O (H1V A.ρ) = Module.rank O (LatticeCohomology LA) :=
    IsLocalizedModule.rank_eq (nonZeroDivisors O) le_rfl (toV LA)
  rw [finrank, finrank, h1, h2]


open GlobalTheory.CompanionTheory.GrowthOfInvariants in
theorem H0_torsion_growth_bound : ∀ (l : ℕ) [Fact l.Prime] (Lp : LocPrime l) (K : FinExt l), TateFiniteness (Lp.PD K) → ∀ (LL : Type) [Field LL] [Algebra ℚ_[l] LL] [TopologicalSpace LL] (O : Type) [CommRing O] [Algebra O LL], GoodO (Qp := ℚ_[l]) LL O → ∀ (A : GRep ↥(GK K) ℚ_[l] LL O) (LA : Lattice (O := O) A.ρ) (ϖ : O), Irreducible ϖ → ∃ C : ℕ, ∀ (r : ℕ) (hI : StableSub LA (Ideal.span {ϖ ^ r} • ⊤ : Submodule O ↥LA.T)), Nat.card (O ⧸ Ideal.span {ϖ}) ^ (r * finrank LL ↥(H0V A.ρ)) ≤ Nat.card {x : ↥LA.T ⧸ (Ideal.span {ϖ ^ r} • ⊤ : Submodule O ↥LA.T) // ∀ g, actQ LA _ hI g x = x} ∧ Nat.card {x : ↥LA.T ⧸ (Ideal.span {ϖ ^ r} • ⊤ : Submodule O ↥LA.T) // ∀ g, actQ LA _ hI g x = x} ≤ C * Nat.card (O ⧸ Ideal.span {ϖ}) ^ (r * finrank LL ↥(H0V A.ρ)) := by
  intro l _ Lp K hcore LL _ _ _ O _ _ hG A LA ϖ hϖ
  obtain ⟨⟨hO, hD, hF⟩, -⟩ := id hG
  haveI := hO
  haveI := hD
  haveI := hF
  exact growth A LA (hcore LL O hG A LA) hϖ (_root_.GlobalTheory.CompanionTheory.GoodCoeff.goodO_structure l LL O hG ϖ hϖ).2.1

end GlobalTheory.CompanionTheory.Hypotheses₂.BK
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.GlobalProofs.TateDualityH2FiniteCoefficients =====
