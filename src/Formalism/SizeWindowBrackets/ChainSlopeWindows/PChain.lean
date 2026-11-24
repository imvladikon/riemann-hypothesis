module

public import Formalism.SizeWindowBrackets.SChain
public import Formalism.SizeWindowBrackets.ChainSlopeWindows.SubThreeMulLogTwoLe
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Normed.Algebra.GelfandRadius
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

@[expose] public section

open Finset

noncomputable section

namespace Formalism.LFunctionChainParameters.LChain

open Formalism Formalism.D5 Formalism.RankGapBounds.WeightedMeanData Formalism.LFunctionChainParameters.WeightedSlopeBounds Formalism.LFunctionChainParameters.characterSumData Formalism.LFunctionChainParameters.ThickSetMeanBounds Formalism.LFunctionChainParameters.LErr

theorem size_windows_split : SizeWindowsSplit := by
  intro P ε x n nT nT2 m b k aE Err
  unfold SizeWindows RestSize errorBracketSizeWindows
  tauto

section
variable {U0 : Type} [Fintype U0] {W : U0 → Type} {Top : Type} [Fintype Top] {m f : ℕ}

end

namespace Model

section
variable {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]

end

end Model

end Formalism.LFunctionChainParameters.LChain

section Check
open Formalism.LFunctionChainParameters.LChain
end Check

namespace Formalism.LFunctionChainParameters.LChain

open Formalism Formalism.D5 Formalism.RankGapBounds.WeightedMeanData Formalism.LFunctionChainParameters.WeightedSlopeBounds Formalism.LFunctionChainParameters.characterSumData Formalism.LFunctionChainParameters.ThickSetMeanBounds Formalism.LFunctionChainParameters.LErr

lemma errX5_le {U0 : Type} [Fintype U0] {W : U0 → Type} [∀ u0, Fintype (W u0)] [∀ u0, Nonempty (W u0)]
    {Top : Type} [Fintype Top] {m f : ℕ} (D : Data U0 W Top m f) (C : Consts) (Xpp eK K : ℝ)
    (hW : ErrWindows D C Xpp eK K) :
    ErrX5 D C Xpp ≤ (errCoefficient K eK D.ε * D.x ^ (CErr C * D.ε)) * ErrText D := by
  obtain ⟨⟨hx, hε, hε1, hb, hxb, hnT, hm, hxm, heK, hk1, hkx, hL0, hL, hLa0, hLa, hb', hkb', hX0,
    hXa, haT, hB0, hNc, hdel, -, -, hC⟩, het⟩ := hW
  obtain ⟨c1, c1', c2, c2', c3, c3', c4, c4', c5, c5', c6, c6', c7, c7', hD, hLs, -⟩ := hC
  have hy : 1 ≤ D.x ^ D.ε := Real.one_le_rpow hx hε.le
  have hyD : 1 ≤ D.x ^ (C.eDiv * D.ε) := Real.one_le_rpow hx (mul_nonneg hD hε.le)
  have hyL : 1 ≤ D.x ^ (C.eLoss * D.ε) := Real.one_le_rpow hx (mul_nonneg hLs hε.le)
  have hb0 : 0 ≤ D.b := by linarith only [hb]
  have hbxb : D.b ≤ D.x * D.b := le_mul_of_one_le_left hb0 hx
  have hba : D.b ≤ D.a := hbxb.trans hxb
  have ha1 : 1 ≤ D.a := hb.trans hba
  have hM : (0 : ℝ) ≤ (m : ℝ) := Nat.cast_nonneg m
  have hk : 0 < D.k := by linarith only [hk1]
  have hmx : (m : ℝ) ≤ D.x := by
    refine hm.trans ?_
    calc D.x ^ ((1 : ℝ) / 2 + D.ε / 2) ≤ D.x ^ (1 : ℝ) :=
          Real.rpow_le_rpow_of_exponent_le hx (by linarith only [hε1])
      _ = D.x := Real.rpow_one _
  have hMk : (m : ℝ) ≤ D.k := (le_mul_of_one_le_left hM hx).trans hxm
  have hMb : (m : ℝ) * D.b ≤ D.a := (mul_le_mul_of_nonneg_right hmx hb0).trans hxb
  have hsA0 : 0 ≤ D.sumA := Finset.sum_nonneg (fun t _ => (haT t).1)
  have hsA : D.sumA ≤ 2 * (D.nT * D.a) := by
    unfold Data.sumA Data.nT
    calc ∑ t, D.aT t ≤ ∑ _t : Top, 2 * D.a := Finset.sum_le_sum (fun t _ => (haT t).2)
      _ = 2 * ((Fintype.card Top : ℝ) * D.a) := by
        rw [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]; ring
  have hlk0 : 0 ≤ Real.log D.k := Real.log_nonneg hk1
  have hx0 : 0 < D.x := by linarith only [hx]
  have hg : 1 ≤ 1 + eK / D.ε := le_add_of_nonneg_right (div_nonneg heK hε.le)
  have hlk : Real.log D.k ≤ (1 + eK / D.ε) * D.x ^ D.ε := by
    calc Real.log D.k ≤ Real.log (D.x ^ eK) := Real.log_le_log hk hkx
      _ = eK * Real.log D.x := Real.log_rpow hx0 _
      _ ≤ eK * (D.x ^ D.ε / D.ε) := mul_le_mul_of_nonneg_left (Real.log_le_rpow_div hx0.le hε) heK
      _ = (eK / D.ε) * D.x ^ D.ε := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_right (by linarith) (by positivity)
  obtain ⟨hdI0, hdI⟩ := inv_one_sub_le_two hdel
  have hpow : D.x ^ (CErr C * D.ε) =
      max (D.x ^ D.ε) (max (D.x ^ (C.eDiv * D.ε)) (D.x ^ (C.eLoss * D.ε))) := by
    have hmono : Monotone (fun e : ℝ => D.x ^ (e * D.ε)) :=
      fun _ _ h => Real.rpow_le_rpow_of_exponent_le hx (mul_le_mul_of_nonneg_right h hε.le)
    simpa only [CErr, one_mul] using
      (hmono.map_max (a := 1) (b := max C.eDiv C.eLoss)).trans
        (congrArg (max (D.x ^ ((1 : ℝ) * D.ε))) (hmono.map_max (a := C.eDiv) (b := C.eLoss)))
  rw [hpow]
  have := core_ineq (nT := D.nT) (a := D.a) (b := D.b) (b' := D.b') (k := D.k) (L := D.L) (La := D.La)
    (B0 := D.B0) (Nc := D.Nc) (M := (m : ℝ)) (sA := D.sumA)
    (lk := Real.log D.k) (dI := (1 - D.delBar)⁻¹)
    (et := (D.etaBar + 4 * Real.sqrt D.eBar) * (D.x ^ C.cHH * D.b)) (Xpp := Xpp)
    (y := D.x ^ D.ε) (yD := D.x ^ (C.eDiv * D.ε)) (yL := D.x ^ (C.eLoss * D.ε)) (K := K)
    (g := 1 + eK / D.ε)
    hy hyD hyL hnT ha1 hb0 hM hk hMk hMb hL0 hL hLa0 hLa hb' hkb' hX0 hXa hsA0 hsA hB0 hNc
    hlk0 hlk hdI0 hdI het c1 c1' c2 c2' c3 c3' c4 c4' c5 c5' c6 c6' c7 c7'
    hg
  unfold ErrX5 UBar5 MLo5 Data.Vvar Data.LoP ErrText errCoefficient
  exact this

namespace ModelEv

open Model

section
variable {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]


end

end ModelEv

namespace ModelText

section
variable {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]

end

end ModelText

end Formalism.LFunctionChainParameters.LChain

section Check2
open Formalism.LFunctionChainParameters.LChain
end Check2
