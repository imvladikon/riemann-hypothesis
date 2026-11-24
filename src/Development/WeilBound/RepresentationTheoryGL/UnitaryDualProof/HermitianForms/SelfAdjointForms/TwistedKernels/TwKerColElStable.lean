module

public import Mathlib.Algebra.Algebra.Basic
public import Mathlib.Algebra.Module.LinearMap.Star
public import Mathlib.Basic.Complex.Basic
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.SelfAdjointForms.FixK
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.AvgData
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.TransversalSums.ContinuousBlkAtApply
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.TransversalSums.SumTranslateTransversal
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.IsotropicAtoms.ChartRestriction
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.IsotropicAtoms.FinSumFinEquivSymmDite
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.IsotropicAtoms.InvSmulEqOfSmulEq
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Algebra.Order.Star.Real
import Mathlib.Algebra.Ring.IsFormallyReal
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
import Mathlib.RingTheory.WittVector.IsPoly
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat
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
import Mathlib.Tactic.ReduceModChar
import Mathlib.Topology.Sheaves.Init
import Mathlib.Tactic.Polynomial.Basic

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HermitianPsdIsotropicRadical, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.SelfAdjointForms.TwistedKernels.TwKerColElStable

-- ===== clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HermitianPsdIsotropicRadical =====
-- clump-header: {"m": "Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HermitianPsdIsotropicRadical", "h": "module\n\npublic import Mathlib.Algebra.Algebra.Basic\npublic import Mathlib.Algebra.Module.LinearMap.Star\npublic import Mathlib.Basic.Complex.Basic\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Algebra.Order.Star.Real\nimport Mathlib.Algebra.Ring.IsFormallyReal\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

namespace GlobalTheory.CompanionTheory.HermitianForm

theorem re_pairing_eq_zero_of_psd {V : Type} [AddCommGroup V] [Module ℂ V]
    (B : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ) (hB : ∀ v w, B w v = starRingEnd ℂ (B v w))
    (hpos : ∀ v, 0 ≤ (B v v).re) (v : V) (hv : B v v = 0) (u : V) : (B v u).re = 0 := by
  have hb : 0 ≤ (B u u).re := hpos u
  have key : ∀ t : ℝ, 0 ≤ 2 * t * (B v u).re + t ^ 2 * (B u u).re := by
    intro t
    have h := hpos (v + (t : ℂ) • u)
    have e : B (v + (t : ℂ) • u) (v + (t : ℂ) • u)
        = B v v + (t : ℂ) * B v u + (t : ℂ) * B u v + (t : ℂ) * (t : ℂ) * B u u := by
      simp only [map_add (f := _), LinearMap.add_apply, map_smul, map_smulₛₗ, LinearMap.smul_apply,
        smul_eq_mul, Complex.conj_ofReal]
      ring
    rw [e, hv, hB v u] at h
    simp only [zero_add, Complex.add_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
      Complex.conj_re, Complex.mul_im, zero_mul, sub_zero, add_zero] at h
    nlinarith [h]
  set a := (B v u).re with ha
  set b := (B u u).re with hb'
  have hb1 : 0 < b + 1 := by linarith
  have h := key (-a / (b + 1))
  have e2 : 2 * (-a / (b + 1)) * a + (-a / (b + 1)) ^ 2 * b
      = -(a ^ 2 * (b + 2)) / (b + 1) ^ 2 := by
    field_simp
    ring
  rw [e2] at h
  have h3 : 0 ≤ -(a ^ 2 * (b + 2)) := by
    by_contra hc
    push Not at hc
    have : -(a ^ 2 * (b + 2)) / (b + 1) ^ 2 < 0 := div_neg_of_neg_of_pos hc (by positivity)
    linarith
  have h4 : a ^ 2 * (b + 2) ≤ 0 := by linarith
  have h5 : a ^ 2 ≤ 0 := by
    by_contra hc
    push Not at hc
    have : 0 < a ^ 2 * (b + 2) := mul_pos hc (by linarith)
    linarith
  have h6 : a ^ 2 = 0 := le_antisymm h5 (sq_nonneg a)
  exact pow_eq_zero_iff (two_ne_zero) |>.mp h6

theorem pairing_eq_zero_of_psd : ∀ (V : Type) [AddCommGroup V] [Module ℂ V]
    (B : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ), (∀ v w, B w v = starRingEnd ℂ (B v w)) →
    (∀ v, 0 ≤ (B v v).re) → ∀ v, B v v = 0 → ∀ w, B v w = 0 := by
  intro V _ _ B hB hpos v hv w
  have hre := re_pairing_eq_zero_of_psd B hB hpos v hv w
  have him := re_pairing_eq_zero_of_psd B hB hpos v hv (Complex.I • w)
  have e : B v (Complex.I • w) = -Complex.I * B v w := by
    simp only [map_smulₛₗ, smul_eq_mul, Complex.conj_I]
  rw [e] at him
  simp only [Complex.mul_re, Complex.neg_re, Complex.neg_im, Complex.I_re, Complex.I_im] at him
  apply Complex.ext
  · simpa using hre
  · simpa using him

end GlobalTheory.CompanionTheory.HermitianForm
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HermitianPsdIsotropicRadical =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.SelfAdjointForms.TwistedKernels.TwKerColElStable =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.SelfAdjointForms.TwistedKernels.TwKerColElStable", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.SelfAdjointForms.FixK\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.AvgData\npublic import Mathlib.Algebra.Algebra.Basic\npublic import Mathlib.Algebra.Module.LinearMap.Star\npublic import Mathlib.Basic.Complex.Basic\npublic import Development.AutomorphicSpectrum.Proofs.BlockDecomposition.HermitianPsdIsotropicRadical\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.TransversalSums.ContinuousBlkAtApply\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.TransversalSums.SumTranslateTransversal\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.IsotropicAtoms.ChartRestriction\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.IsotropicAtoms.FinSumFinEquivSymmDite\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.UnitaryLattices.IsotropicAtoms.InvSmulEqOfSmulEq\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.BZMir

namespace PositivityTheory.RgUd.Form.LeviSmoothness.props

theorem toUnits_val (z : Circle) : ((Circle.toUnits z : ℂˣ) : ℂ) = (z : ℂ) := rfl

open PositivityTheory.RgUd.Form PositivityTheory.RgUd.Form.LeviSmoothness PositivityTheory.RgUd.Form.U.Atom

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k]

variable {ψ : AddChar k Circle} {m N : ℕ} {h : m + 2 ≤ N} {V : Type} [AddCommGroup V] [Module ℂ V]
  {π : Representation ℂ (GL (Fin N) k) V} {s : ℝ} {B : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ}

theorem colInv (hB : Lv ψ h π s B) (x : Fin (m + 1) → k) (v w : V) :
    B (π (colEl k m N h x) v) (π (colEl k m N h x) w) = B v w := by
  have e := hB.mir _ (unip_mem_Mir m x) v w
  have hd : Matrix.GeneralLinearGroup.det (unip k (m + 1) (Multiplicative.ofAdd x)) = 1 := det_unip (m + 1) _
  rw [hd] at e
  have h1 : nabs k (1 : kˣ) ^ s = 1 := by
    have : nabs k (1 : kˣ) = 1 := by simp [nabs]
    rw [this, Real.one_rpow]
  rw [h1, Complex.ofReal_one, one_mul] at e
  exact e

theorem isLat_sup {A A' : AddSubgroup (Fin (m + 1) → k)} (hA : IsLat A) (hA' : IsLat A') : IsLat (A ⊔ A') :=
  ⟨isCompact_sup A A' hA.1 hA'.1, AddSubgroup.isOpen_mono le_sup_left hA.2⟩

theorem avg_idem (hB : Lv ψ h π s B) (ξ : Fin (m + 1) → k) {A : AddSubgroup (Fin (m + 1) → k)} (hA : IsLat A) (v : V) :
    avg ψ h π ξ A (avg ψ h π ξ A v) = avg ψ h π ξ A v := by
  have e := PositivityTheory.RgUd.Form.U.Atom.avg_avg h π ψ hB.cont hB.smooth ξ ξ hA hA le_rfl v
  rw [if_pos (fun _ _ => rfl)] at e
  exact e

theorem form_avg_self (hB : Lv ψ h π s B) (ξ : Fin (m + 1) → k) {A : AddSubgroup (Fin (m + 1) → k)} (hA : IsLat A)
    (v : V) : B (avg ψ h π ξ A v) v = B (avg ψ h π ξ A v) (avg ψ h π ξ A v) := by
  have e1 := form_avg h π ψ hB.cont hB.smooth B (colInv hB) ξ hA (avg ψ h π ξ A v) v
  rw [avg_idem hB ξ hA v] at e1
  exact e1

theorem dens_psd (hB : Lv ψ h π s B) {A₀ : AddSubgroup (Fin (m + 1) → k)} (hA₀ : IsLat A₀) {B' : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ}
    (hD : IsDens ψ h π A₀ B B') : IsPsd B' := by
  refine ⟨fun v w => ?_, fun v => ?_⟩
  · obtain ⟨A₁, hA₁, -, e₁⟩ := hD v w
    obtain ⟨A₂, hA₂, -, e₂⟩ := hD w v
    have hA := isLat_sup hA₁ hA₂
    rw [e₁ _ hA le_sup_left, e₂ _ hA le_sup_right,
      form_avg h π ψ hB.cont hB.smooth B (colInv hB) (xi0 k m) hA w v, hB.psd.1 (avg ψ h π (xi0 k m) (A₁ ⊔ A₂) v) w,
      map_mul, map_natCast]
  · obtain ⟨A₁, hA₁, -, e₁⟩ := hD v v
    rw [e₁ _ hA₁ le_rfl, form_avg_self hB _ hA₁ v]
    rw [show ((A₀.relIndex A₁ : ℕ) : ℂ) = ((A₀.relIndex A₁ : ℝ) : ℂ) by push_cast; rfl, Complex.re_ofReal_mul]
    exact mul_nonneg (Nat.cast_nonneg _) (hB.psd.2 _)

theorem twKer_colEl_stable (hB : Lv ψ h π s B) (x : Fin (m + 1) → k) {z : V}
    (hz : z ∈ twKer π (derUnip k N (m + 2)) (lvlChar k ψ N (m + 2))) :
    π (colEl k m N h x) z ∈ twKer π (derUnip k N (m + 2)) (lvlChar k ψ N (m + 2)) := by
  unfold twKer at hz ⊢
  induction hz using Submodule.span_induction with
  | mem y hy =>
    obtain ⟨u, v, rfl⟩ := hy
    obtain ⟨hm, hc⟩ := _root_.PositivityTheory.RgUd.Form.ColumnElementGluing.Glue.colEl_conj_derUnip' ψ h x u
    refine Submodule.subset_span ⟨⟨_, hm⟩, π (colEl k m N h x) v, ?_⟩
    rw [hc, map_sub, map_smul]
    congr 1
    rw [← Module.End.mul_apply, ← Module.End.mul_apply, ← map_mul, ← map_mul]
    congr 2
    simp [mul_assoc]
  | zero => rw [map_zero]; exact Submodule.zero_mem _
  | add a b _ _ ha hb => rw [map_add (f := _)]; exact Submodule.add_mem _ ha hb
  | smul c a _ ha => rw [map_smul]; exact Submodule.smul_mem _ c ha

theorem avg_twKer (hB : Lv ψ h π s B) (ξ : Fin (m + 1) → k) {A : AddSubgroup (Fin (m + 1) → k)} (hA : IsLat A) {z : V}
    (hz : z ∈ twKer π (derUnip k N (m + 2)) (lvlChar k ψ N (m + 2))) :
    avg ψ h π ξ A z ∈ twKer π (derUnip k N (m + 2)) (lvlChar k ψ N (m + 2)) := by
  obtain ⟨p, hp, -⟩ := exists_avgData h π ψ hB.cont hB.smooth ξ hA z ⊤ isOpen_univ
  rw [avg_eq h π ψ hp]
  refine Submodule.smul_mem _ _ (Submodule.sum_mem _ fun t _ => Submodule.smul_mem _ _ ?_)
  exact twKer_colEl_stable hB t hz

theorem dens_kills2 (hB : Lv ψ h π s B) {A₀ : AddSubgroup (Fin (m + 1) → k)} {B' : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ}
    (hD : IsDens ψ h π A₀ B B') {z : V} (hz : z ∈ twKer π (derUnip k N (m + 2)) (lvlChar k ψ N (m + 2))) (w : V) :
    B' z w = 0 := by
  obtain ⟨A₁, hA₁, -, e₁⟩ := hD z w
  rw [e₁ _ hA₁ le_rfl, hB.kills _ (avg_twKer hB _ hA₁ hz) w, mul_zero]

theorem dens_kills (hB : Lv ψ h π s B) {A₀ : AddSubgroup (Fin (m + 1) → k)} (hA₀ : IsLat A₀) {B' : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ}
    (hD : IsDens ψ h π A₀ B B') : Kills ψ π (m + 1) B' := by
  intro v hv
  unfold twKer at hv
  induction hv using Submodule.span_induction with
  | mem y hy =>
    obtain ⟨u, v₀, rfl⟩ := hy
    obtain ⟨x, u', hu, hc⟩ := _root_.PositivityTheory.RgUd.Form.ColumnElementGluing.Glue.derUnip_decomp' ψ h u
    intro w
    have hsplit : π (u : GL (Fin N) k) v₀ - ((lvlChar k ψ N (m + 1) u : ℂˣ) : ℂ) • v₀ =
        π (colEl k m N h x) (π (u' : GL (Fin N) k) v₀ - ((lvlChar k ψ N (m + 2) u' : ℂˣ) : ℂ) • v₀) +
          ((lvlChar k ψ N (m + 2) u' : ℂˣ) : ℂ) •
            (π (colEl k m N h x) v₀ - ((ψ (xi0 k m ⬝ᵥ x) : Circle) : ℂ) • v₀) := by
      rw [hc, hu, map_mul, Module.End.mul_apply, map_sub, map_smul, smul_sub, smul_smul]
      simp only [Units.val_mul, toUnits_val]
      rw [mul_comm ((lvlChar k ψ N (m + 2) u' : ℂˣ) : ℂ)]
      abel
    rw [hsplit, map_add (f := _), LinearMap.add_apply, map_smul, LinearMap.smul_apply,
      dens_kills2 hB hD (twKer_colEl_stable hB x (Submodule.subset_span ⟨u', v₀, rfl⟩)) w, zero_add]
    obtain ⟨A₁, hA₁, -, e₁⟩ := hD (π (colEl k m N h x) v₀ - ((ψ (xi0 k m ⬝ᵥ x) : Circle) : ℂ) • v₀) w
    obtain ⟨Ax, hAx1, hAx2, hxA⟩ := exists_lat_mem (m + 1) x
    have hA := isLat_sup hA₁ ⟨hAx1, hAx2⟩
    rw [e₁ _ hA le_sup_left, sub_eq_add_neg, ← neg_smul, avg_add h π ψ hB.cont hB.smooth _ hA,
      avg_smul h π ψ hB.cont hB.smooth _ hA, avg_colEl h π ψ hB.cont hB.smooth _ hA
        (AddSubgroup.mem_sup_right hxA), neg_smul, ← sub_eq_add_neg, sub_self, map_zero, LinearMap.zero_apply,
      mul_zero, smul_zero]
  | zero => intro w; simp
  | add a b _ _ ha hb => intro w; rw [map_add (f := _), LinearMap.add_apply, ha w, hb w, add_zero]
  | smul c a _ ha => intro w; rw [map_smul, LinearMap.smul_apply, ha w, smul_zero]

theorem dens_rad (hB : Lv ψ h π s B) {A₀ : AddSubgroup (Fin (m + 1) → k)} (hA₀ : IsLat A₀) {B' : V →ₗ[ℂ] V →ₗ⋆[ℂ] ℂ}
    (hD : IsDens ψ h π A₀ B B') (v : V) (hv : B' v v = 0) :
    v ∈ twKer π (derUnip k N (m + 1)) (lvlChar k ψ N (m + 1)) ⊔ LinearMap.ker B := by
  obtain ⟨A₁, hA₁, hA01, e₁⟩ := hD v v
  have hc : ((A₀.relIndex A₁ : ℕ) : ℂ) ≠ 0 := Nat.cast_ne_zero.2 (relIndex_ne_zero' A₁ A₀ hA₁.1 hA₀.2 hA01)
  rw [e₁ _ hA₁ le_rfl, form_avg_self hB _ hA₁ v] at hv
  have h0 : B (avg ψ h π (xi0 k m) A₁ v) (avg ψ h π (xi0 k m) A₁ v) = 0 := (mul_eq_zero.1 hv).resolve_left hc
  have hker : avg ψ h π (xi0 k m) A₁ v ∈ LinearMap.ker B := by
    rw [LinearMap.mem_ker]
    exact LinearMap.ext fun w => _root_.GlobalTheory.CompanionTheory.HermitianForm.pairing_eq_zero_of_psd V B hB.psd.1 hB.psd.2 _ h0 w
  have e : v = (v - avg ψ h π (xi0 k m) A₁ v) + avg ψ h π (xi0 k m) A₁ v := by abel
  rw [e]
  exact Submodule.add_mem_sup (ColumnElementGluing.sub_avg_mem ψ h π hB.cont hB.smooth A₁ hA₁ v) hker

end PositivityTheory.RgUd.Form.LeviSmoothness.props
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.HermitianForms.SelfAdjointForms.TwistedKernels.TwKerColElStable =====
