module

public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop
public import Mathlib.RingTheory.Idempotents
public import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiBelow
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
import Mathlib.RingTheory.PiTensorProduct
import Mathlib.RingTheory.WittVector.IsPoly
import Mathlib.Tactic.Polynomial.Basic
import Mathlib.Tactic.ReduceModChar
import Mathlib.Tactic.Basify
import Mathlib.Tactic.ENatToNat
import Mathlib.Tactic.Linter.Style

-- This file was produced by scripts/clump.py from the modules listed below.
-- Members: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.AddMulSelfEqOfOrthogonalIdempotents, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SxToSub, Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.AddMulSelfEqOfOrthogonalIdempotents =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.AddMulSelfEqOfOrthogonalIdempotents", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PieceTop\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}

open PositivityTheory.RgUd.TP.Desc.Piece

section
variable {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {x : Matrix (Fin N) (Fin N) k}

theorem cx_gens (hZ : CR Z) (hx : x ∈ Bz Z) :
    ∀ a ∈ insert x (Z : Set (Matrix (Fin N) (Fin N) k)), ∀ b ∈ insert x (Z : Set (Matrix (Fin N) (Fin N) k)),
      a * b = b * a := by
  intro a ha b hb
  rcases Set.mem_insert_iff.1 ha with h1 | h1
  · rcases Set.mem_insert_iff.1 hb with h2 | h2
    · rw [h1, h2]
    · rw [h1]
      exact (hx b h2).symm
  · rcases Set.mem_insert_iff.1 hb with h2 | h2
    · rw [h2]
      exact hx a h1
    · exact hZ.1 a h1 b h2

theorem cx_comm (hZ : CR Z) (hx : x ∈ Bz Z) : ∀ a ∈ _root_.PositivityTheory.RgUd.T.adj Z x, ∀ b ∈ _root_.PositivityTheory.RgUd.T.adj Z x, a * b = b * a := by
  intro a ha b hb
  have key := cx_gens hZ hx
  have h : Commute a b := by
    refine Algebra.commute_of_mem_adjoin_of_forall_mem_commute hb ?_
    intro c hc
    refine (Algebra.commute_of_mem_adjoin_of_forall_mem_commute ha ?_).symm
    intro d hd
    exact key c hc d hd
  exact h.eq

theorem z_le_cx : Z ≤ _root_.PositivityTheory.RgUd.T.adj Z x := fun _ h => Algebra.subset_adjoin (Set.mem_insert_of_mem _ h)

theorem x_mem_cx : x ∈ _root_.PositivityTheory.RgUd.T.adj Z x := Algebra.subset_adjoin (Set.mem_insert _ _)

theorem pe_mem {d : ℕ} {c : Fin d → Matrix (Fin N) (Fin N) k} (hc : ∀ l, c l ∈ Z) : pe c x ∈ _root_.PositivityTheory.RgUd.T.adj Z x :=
  Subalgebra.sum_mem _ fun l _ => Subalgebra.mul_mem _ (z_le_cx (hc l)) (Subalgebra.pow_mem _ x_mem_cx _)

end

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.AddMulSelfEqOfOrthogonalIdempotents =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SxToSub =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SxToSub", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.AddMulSelfEqOfOrthogonalIdempotents\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.PiTensorProduct\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.RingTheory.WittVector.IsPoly\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Tactic.Polynomial.Basic\nimport Mathlib.Tactic.ReduceModChar\nimport Mathlib.Topology.Sheaves.Init\npublic import Mathlib.RingTheory.Idempotents\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}

open PositivityTheory.RgUd.TP.Desc.Piece

section
variable {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {χ : k[X]} {q : ℕ} (D : SData Z χ q)
  {x : Matrix (Fin N) (Fin N) k}

def Nx (x : Matrix (Fin N) (Fin N) k) : Submodule k (Matrix (Fin N) (Fin N) k) :=
  (_root_.PositivityTheory.RgUd.T.adj Z x).toSubmodule.map (LinearMap.mulLeft k (pe D.b x))

theorem s_mem (j : Fin D.r) : pe (D.a j) x ∈ Sx D x := Algebra.subset_adjoin ⟨j, rfl⟩

theorem sx_le : Sx D x ≤ _root_.PositivityTheory.RgUd.T.adj Z x := Algebra.adjoin_le (by rintro _ ⟨j, rfl⟩; exact pe_mem (D.ha j))

theorem sx_toSub (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) :
    (Sx D x).toSubmodule = Submodule.span k (Set.range fun j => pe (D.a j) x) := by
  obtain ⟨h1, h2, -⟩ := D.spec x hx hχ
  apply le_antisymm
  · let P : Subalgebra k (Matrix (Fin N) (Fin N) k) :=
      (Submodule.span k (Set.range fun j => pe (D.a j) x)).toSubalgebra ?one ?mul
    · have hle : Sx D x ≤ P := by
        refine Algebra.adjoin_le ?_
        intro y hy
        exact Submodule.subset_span hy
      intro y hy
      exact hle hy
    case one =>
      rw [← h2]
      refine Submodule.sum_mem _ ?_
      intro j _
      exact Submodule.smul_mem _ _ (Submodule.subset_span ⟨j, rfl⟩)
    case mul =>
      intro a b ha hb
      have hab : a * b ∈ Submodule.span k (Set.range fun j => pe (D.a j) x) *
          Submodule.span k (Set.range fun j => pe (D.a j) x) := Submodule.mul_mem_mul ha hb
      rw [Submodule.span_mul_span] at hab
      refine (Submodule.span_le.2 ?_) hab
      rintro _ ⟨u, ⟨i, rfl⟩, v, ⟨j, rfl⟩, rfl⟩
      have e := h1 i j
      simp only at e ⊢
      rw [e]
      refine Submodule.sum_mem _ ?_
      intro t _
      exact Submodule.smul_mem _ _ (Submodule.subset_span ⟨t, rfl⟩)
  · refine Submodule.span_le.2 ?_
    intro y hy
    exact Algebra.subset_adjoin hy

theorem sx_nil (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) : ∀ y ∈ Sx D x, IsNilpotent y → y = 0 := by
  obtain ⟨-, -, -, -, -, hred, -⟩ := D.spec x hx hχ
  intro y hy hn
  have : y ∈ (Sx D x).toSubmodule := hy
  rw [sx_toSub D hx hχ] at this
  exact hred y this hn

theorem sx_cr (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) : CR (Sx D x) := by
  refine ⟨fun a ha b hb => cx_comm hZ hx a (sx_le D ha) b (sx_le D hb), ⟨fun y hy => ?_⟩⟩
  exact Subtype.ext (sx_nil D hx hχ y.1 y.2 (hy.map (Sx D x).val))

theorem nx_le : Nx D x ≤ (_root_.PositivityTheory.RgUd.T.adj Z x).toSubmodule := by
  refine Submodule.map_le_iff_le_comap.2 ?_
  intro y hy
  rw [Submodule.mem_comap, LinearMap.mulLeft_apply]
  exact (_root_.PositivityTheory.RgUd.T.adj Z x).mul_mem (pe_mem D.hb) hy

theorem nx_nil (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) : ∀ n ∈ Nx D x, IsNilpotent n := by
  obtain ⟨-, -, -, -, hεq, -⟩ := D.spec x hx hχ
  rintro _ ⟨c, hc, rfl⟩
  refine ⟨q, ?_⟩
  simp only [LinearMap.mulLeft_apply]
  rw [(Commute.mul_pow (cx_comm hZ hx _ (pe_mem D.hb) c hc) q), hεq, zero_mul]

theorem nx_mul (hZ : CR Z) (hx : x ∈ Bz Z) : ∀ c ∈ _root_.PositivityTheory.RgUd.T.adj Z x, ∀ n ∈ Nx D x, c * n ∈ Nx D x := by
  intro c hc n hn
  obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.1 hn
  refine Submodule.mem_map.2 ⟨c * y, (_root_.PositivityTheory.RgUd.T.adj Z x).mul_mem hc hy, ?_⟩
  rw [LinearMap.mulLeft_apply, LinearMap.mulLeft_apply, ← mul_assoc, ← mul_assoc,
    cx_comm hZ hx _ hc _ (pe_mem D.hb)]

theorem re_mem (hZ : CR Z) (hx : x ∈ Bz Z) (γ' : Fin D.d → Fin D.r → k) :
    re γ' (fun j => pe (D.a j) x) (pe D.b x) ∈ (Sx D x).toSubmodule ⊔ Nx D x := by
  simp only [re]
  refine Submodule.sum_mem _ ?_
  intro l _
  refine Submodule.sum_mem _ ?_
  intro j _
  refine Submodule.smul_mem _ _ ?_
  obtain h | ⟨m, hm⟩ : (l : ℕ) = 0 ∨ ∃ m, (l : ℕ) = m + 1 := by
    rcases (l : ℕ) with _ | m
    · exact Or.inl rfl
    · exact Or.inr ⟨m, rfl⟩
  · rw [h, pow_zero, mul_one]
    exact Submodule.mem_sup_left (s_mem D j)
  · have hs : pe (D.a j) x ∈ _root_.PositivityTheory.RgUd.T.adj Z x := pe_mem (D.ha j)
    have he : pe D.b x ∈ _root_.PositivityTheory.RgUd.T.adj Z x := pe_mem D.hb
    rw [hm, pow_succ', ← mul_assoc, cx_comm hZ hx _ hs _ he, mul_assoc]
    refine Submodule.mem_sup_right (Submodule.mem_map.2 ⟨pe (D.a j) x * pe D.b x ^ m, ?_, ?_⟩)
    · exact (_root_.PositivityTheory.RgUd.T.adj Z x).mul_mem hs ((_root_.PositivityTheory.RgUd.T.adj Z x).pow_mem he m)
    · rw [LinearMap.mulLeft_apply]

theorem z_le (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) : Z.toSubmodule ≤ (Sx D x).toSubmodule ⊔ Nx D x := by
  obtain ⟨-, -, -, -, -, -, hz, -⟩ := D.spec x hx hχ
  rw [D.hz]
  refine Submodule.span_le.mpr ?_
  rintro _ ⟨i, rfl⟩
  rw [hz i]
  exact re_mem D hZ hx (D.γ i)

theorem x_mem (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) : x ∈ (Sx D x).toSubmodule ⊔ Nx D x := by
  obtain ⟨-, -, -, -, -, -, -, hxb, -⟩ := D.spec x hx hχ
  have := re_mem D hZ hx D.β
  rwa [← hxb] at this

theorem idem_mem (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0) {f : Matrix (Fin N) (Fin N) k} (hf : f ∈ Z)
    (hfi : IsIdempotentElem f) : f ∈ Sx D x := by
  have hfm : f ∈ (Sx D x).toSubmodule ⊔ Nx D x := z_le D hZ hx hχ hf
  obtain ⟨s, hs, n, hn, hsn⟩ := Submodule.mem_sup.1 hfm
  have hsS : s ∈ Sx D x := hs
  have hsC : s ∈ _root_.PositivityTheory.RgUd.T.adj Z x := sx_le D hsS
  have hnC : n ∈ _root_.PositivityTheory.RgUd.T.adj Z x := nx_le D hn
  have hfC : f ∈ _root_.PositivityTheory.RgUd.T.adj Z x := z_le_cx hf
  have hnn : IsNilpotent n := nx_nil D hZ hx hχ n hn
  have cfn : Commute f n := cx_comm hZ hx f hfC n hnC
  have cfs : Commute f s := cx_comm hZ hx f hfC s hsC
  have hs_eq : s = f - n := by rw [← hsn]; abel
  have key : s * s - s = n * (n + 1 - 2 * f) := by
    have e : (f - n) * (f - n) - (f - n) - n * (n + 1 - 2 * f) = (f * f - f) + (n * f - f * n) := by
      noncomm_ring
    rw [hfi.eq, cfn.eq, sub_self, sub_self, add_zero, sub_eq_zero] at e
    rw [hs_eq]
    exact e
  have c2 : Commute n (2 * f) := by
    rw [two_mul]
    exact cfn.symm.add_right cfn.symm
  have cn2 : Commute n (n + 1 - 2 * f) :=
    ((Commute.refl n).add_right (Commute.one_right n)).sub_right c2
  have hnil : IsNilpotent (s * s - s) := by
    rw [key]
    exact Commute.isNilpotent_mul_right cn2 hnn
  have hz : s * s - s = 0 :=
    sx_nil D hx hχ _ (Subalgebra.sub_mem _ (Subalgebra.mul_mem _ hsS hsS) hsS) hnil
  have hsi : IsIdempotentElem s := sub_eq_zero.1 hz
  have hfs : f - s = n := by rw [← hsn]; abel
  have hfeq : f = s :=
    eq_of_isNilpotent_sub_of_isIdempotentElem_of_commute hfi hsi (by rw [hfs]; exact hnn) cfs
  rw [hfeq]
  exact hsS

end

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SxToSub =====

-- ===== clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero =====
-- clump-header: {"m": "Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero", "h": "module\n\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.SxToSub\npublic import Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.PiBelow\nimport Mathlib.Algebra.Order.Floor.Extended\nimport Mathlib.Algebra.Order.Floor.Semifield\nimport Mathlib.Algebra.Order.Interval.Basic\nimport Mathlib.Analysis.Complex.UpperHalfPlane.Basic\nimport Mathlib.Analysis.Normed.Algebra.GelfandRadius\nimport Mathlib.Analysis.SpecialFunctions.Bernstein\nimport Mathlib.Analysis.SpecialFunctions.Gamma.Basic\nimport Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp\nimport Mathlib.Combinatorics.Enumerative.DyckWord\nimport Mathlib.Combinatorics.SimpleGraph.Triangle.Removal\nimport Mathlib.Data.NNRat.Floor\nimport Mathlib.Data.Nat.Choose.Multinomial\nimport Mathlib.Geometry.Euclidean.Volume.Basic\nimport Mathlib.NumberTheory.Chebyshev\nimport Mathlib.NumberTheory.Height.NumberField\nimport Mathlib.NumberTheory.Height.Projectivization\nimport Mathlib.NumberTheory.LucasLehmer\nimport Mathlib.NumberTheory.SelbergSieve\nimport Mathlib.RingTheory.Radical.NatInt\nimport Mathlib.Tactic.Basify\nimport Mathlib.Tactic.ENatToNat\nimport Mathlib.Tactic.Echelon.Zsqrtd\nimport Mathlib.Tactic.Inclusion.Extension.Core.Core\nimport Mathlib.Tactic.Inclusion.Extension.Interval.BinarySplit\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Exp\nimport Mathlib.Tactic.Inclusion.Extension.IntervalDyadicReal.Hypotheses\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Basic\nimport Mathlib.Tactic.Inclusion.Extension.IntervalInt.Hypotheses\nimport Mathlib.Tactic.Linter.Style\nimport Mathlib.Tactic.NormNum.Irrational\nimport Mathlib.Tactic.NormNum.IsCoprime\nimport Mathlib.Tactic.NormNum.IsSquare\nimport Mathlib.Tactic.NormNum.LegendreSymbol\nimport Mathlib.Tactic.NormNum.ModEq\nimport Mathlib.Tactic.NormNum.NatFib\nimport Mathlib.Tactic.NormNum.NatLog\nimport Mathlib.Tactic.NormNum.NatSqrt\nimport Mathlib.Tactic.NormNum.Ordinal\nimport Mathlib.Tactic.NormNum.Parity\nimport Mathlib.Tactic.NormNum.Prime\nimport Mathlib.Tactic.NormNum.RealSqrt\nimport Mathlib.Topology.Sheaves.Init\n\n"}
section -- clump:auto
@[expose] public section

noncomputable section

open Matrix Polynomial

namespace PositivityTheory.RgUd.TP.Desc.Piece.PDich

open PositivityTheory.RgUd.T PositivityTheory.RgUd.TP PositivityTheory.RgUd.TP.Desc

variable {k : Type} [Field k] [ValuativeRel k] [TopologicalSpace k] [IsNonarchimedeanLocalField k] {N : ℕ}

open PositivityTheory.RgUd.TP.Desc.Piece

section
variable {Z : Subalgebra k (Matrix (Fin N) (Fin N) k)} {χ : k[X]} {q : ℕ} (D : SData Z χ q)
  {x : Matrix (Fin N) (Fin N) k} (hZ : CR Z) (hx : x ∈ Bz Z) (hχ : aeval x χ = 0)
include hZ hx hχ

theorem pz_mem_S {f : Matrix (Fin N) (Fin N) k} (hf : f ∈ primIdem Z) : f ∈ Sx D x :=
  idem_mem D hZ hx hχ hf.1 hf.2.1

theorem ef_cases {e f : Matrix (Fin N) (Fin N) k} (he : e ∈ primIdem (Sx D x)) (hf : f ∈ primIdem Z) :
    e * f = 0 ∨ e * f = e := by
  have hfS := pz_mem_S D hZ hx hχ hf
  have hc : f * e = e * f := (sx_cr D hZ hx hχ).1 f hfS e he.1
  apply he.2.2.2 (e * f) (Subalgebra.mul_mem _ he.1 hfS)
  · show e * f * (e * f) = e * f
    calc e * f * (e * f) = e * (f * e) * f := by simp only [mul_assoc]
      _ = e * (e * f) * f := by rw [hc]
      _ = (e * e) * (f * f) := by simp only [mul_assoc]
      _ = e * f := by rw [he.2.1.eq, hf.2.1.eq]
  · calc e * f * e = e * (f * e) := mul_assoc _ _ _
      _ = e * (e * f) := by rw [hc]
      _ = e * f := by rw [← mul_assoc, he.2.1.eq]

theorem ef_exists {e : Matrix (Fin N) (Fin N) k} (he : e ∈ primIdem (Sx D x)) : ∃ f ∈ primIdem Z, e * f = e := by
  by_contra hno
  push_neg at hno
  apply he.2.2.1
  have hsum := pi_sum hZ
  calc e = e * ∑ g ∈ (pi_fin hZ).toFinset, g := by rw [hsum, mul_one]
    _ = ∑ g ∈ (pi_fin hZ).toFinset, e * g := Finset.mul_sum _ _ _
    _ = ∑ g ∈ (pi_fin hZ).toFinset, (0 : Matrix (Fin N) (Fin N) k) := by
      refine Finset.sum_congr rfl ?_
      intro g hg
      have hg' : g ∈ primIdem Z := (Set.Finite.mem_toFinset _).1 hg
      rcases ef_cases D hZ hx hχ he hg' with h0 | h0
      · exact h0
      · exact absurd h0 (hno g hg')
    _ = 0 := Finset.sum_const_zero

theorem ef_unique {e f f' : Matrix (Fin N) (Fin N) k} (he : e ∈ primIdem (Sx D x)) (hf : f ∈ primIdem Z)
    (hf' : f' ∈ primIdem Z) (hef : e * f = e) (hef' : e * f' = e) : f = f' := by
  by_contra hff
  have h0 := pi_orth hZ hf' hf (Ne.symm hff)
  apply he.2.2.1
  calc e = e * f := hef.symm
    _ = e * f' * f := by rw [hef']
    _ = e * (f' * f) := mul_assoc _ _ _
    _ = 0 := by rw [h0, mul_zero]

open Classical in
theorem fib_sum {f : Matrix (Fin N) (Fin N) k} (hf : f ∈ primIdem Z) :
    ∑ e ∈ (pi_fin (sx_cr D hZ hx hχ)).toFinset with e * f = e, e = f := by
  rw [Finset.sum_filter]
  have h1 := pi_sum (sx_cr D hZ hx hχ)
  calc (∑ e ∈ (pi_fin (sx_cr D hZ hx hχ)).toFinset, if e * f = e then e else 0)
      = ∑ e ∈ (pi_fin (sx_cr D hZ hx hχ)).toFinset, e * f := by
        refine Finset.sum_congr rfl ?_
        intro e he
        have he' : e ∈ primIdem (Sx D x) := (Set.Finite.mem_toFinset _).1 he
        split_ifs with h
        · exact h.symm
        · rcases ef_cases D hZ hx hχ he' hf with h0 | h0
          · exact h0.symm
          · exact absurd h0 h
    _ = (∑ e ∈ (pi_fin (sx_cr D hZ hx hχ)).toFinset, e) * f := (Finset.sum_mul _ _ _).symm
    _ = f := by rw [h1, one_mul]

def Tef (e f : Matrix (Fin N) (Fin N) k) : Submodule k (Matrix (Fin N) (Fin N) k) :=
  (Z.toSubmodule.map (LinearMap.mulLeft k f)).map (LinearMap.mulLeft k e)

omit hχ in
theorem tef_zero {e f : Matrix (Fin N) (Fin N) k} (heid : IsIdempotentElem e) (hne : e ≠ 0) (hf : f ∈ primIdem Z)
    (hef : e * f = e) (hC : e ∈ _root_.PositivityTheory.RgUd.T.adj Z x) {z : Matrix (Fin N) (Fin N) k} (hz : z ∈ Z) (hn : IsNilpotent (e * (f * z))) :
    f * z = 0 := by
  rcases pi_field hZ hf hz with h0 | ⟨b, hb, hfb⟩
  · exact h0
  · exfalso
    apply hne
    have hfzC : f * z ∈ _root_.PositivityTheory.RgUd.T.adj Z x := (_root_.PositivityTheory.RgUd.T.adj Z x).mul_mem (z_le_cx hf.1) (z_le_cx hz)
    have hefz : e * (f * z) ∈ _root_.PositivityTheory.RgUd.T.adj Z x := (_root_.PositivityTheory.RgUd.T.adj Z x).mul_mem hC hfzC
    have hcb : Commute (e * (f * z)) b := cx_comm hZ hx _ hefz b (z_le_cx hb)
    have hnb : IsNilpotent (e * (f * z) * b) := Commute.isNilpotent_mul_right hcb hn
    have heq : e * (f * z) * b = e := by
      rw [mul_assoc, hfb, hef]
    rw [heq] at hnb
    exact heid.eq_zero_of_isNilpotent hnb

end

end PositivityTheory.RgUd.TP.Desc.Piece.PDich
end -- clump:auto
end -- clump:auto
end -- clump:auto
-- ===== end clump member: Development.WeilBound.RepresentationTheoryGL.UnitaryDualProof.TwistedPieces.FiniteDimensionalDescent.ClosedOrbitPieces.IdemNilZero =====
