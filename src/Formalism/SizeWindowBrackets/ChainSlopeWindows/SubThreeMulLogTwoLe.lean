module

public import Formalism.SizeWindowBrackets.ErrorFormsWeakWindowsFalse
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
import Formalism.SizeWindowBrackets.FirstPrimeNeSecondPrime
import Formalism.SizeWindowBrackets.GrowthBoundGivesRiemannHypothesis
import Formalism.SizeWindowBrackets.QuotientSlopeBoundsWith
import Formalism.ThickAverageLoss.PartnersToFactorsAt
public import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

@[expose] public section

open Real

namespace Formalism.LFunctionChainParameters.LErr

open Formalism.RankGapBounds.WeightedMeanData Formalism.LFunctionChainParameters.WeightedSlopeBounds

set_option linter.unusedVariables false



theorem core_ineq {nT a b b' k L La B0 Nc M sA lk dI et Xpp y yD yL K g
    cDiv cE cH cCount cSlope cSl1 cLoss : ℝ}
    (hy : 1 ≤ y) (hyD : 1 ≤ yD) (hyL : 1 ≤ yL)
    (hnT : 1 ≤ nT) (ha1 : 1 ≤ a) (hb0 : 0 ≤ b) (hM : 0 ≤ M) (hk : 0 < k) (hMk : M ≤ k)
    (hMb : M * b ≤ a) (hL0 : 0 ≤ L) (hL : L ≤ 2 * y) (hLa0 : 0 ≤ La) (hLa : La ≤ 2 * y)
    (hb' : 0 ≤ b') (hkb' : k * b' ≤ a) (hX0 : 0 ≤ Xpp) (hX : Xpp ≤ a)
    (hsA0 : 0 ≤ sA) (hsA : sA ≤ 2 * (nT * a)) (hB0 : 0 ≤ B0) (hNc : 0 ≤ Nc)
    (hlk0 : 0 ≤ lk) (hlk : lk ≤ g * y)
    (hdI0 : 0 ≤ dI) (hdI : dI ≤ 2) (het : et ≤ K * y * (nT * a))
    (c1 : 0 ≤ cDiv) (c1' : cDiv ≤ K) (c2 : 0 ≤ cE) (c2' : cE ≤ K) (c3 : 0 ≤ cH) (c3' : cH ≤ K)
    (c4 : 0 ≤ cCount) (c4' : cCount ≤ K) (c5 : 0 ≤ cSlope) (c5' : cSlope ≤ K)
    (c6 : 0 ≤ cSl1) (c6' : cSl1 ≤ K) (c7 : 0 ≤ cLoss) (c7' : cLoss ≤ K)
    (hg : 1 ≤ g) (hbig : 200 * (1 + K) ^ 2 * g ≤ y) :
    sA * (cCount * (La + M ^ 2 * La / k))
      + (cDiv * nT * a * La + cDiv * M * (B0 + Nc) * yD)
      + M * cE * B0
      + cSlope * nT * a * La * (1 + M / k)
      + cLoss * nT * M * b * yL
      + (cSl1 * (cLoss * nT * M * b * yL) + cSl1 * nT * M * (a / k + b') * (cCount * M * L)
          + cSl1 * Xpp + 1)
      + dI * (4 * (cSlope * nT * a * La * (2 + M / k)
            + (2 * M * cE * B0 + cH * (nT * a * La + M * B0) + sA * (cCount * lk))
            + cSl1 * M * B0
            + (cSl1 * (cLoss * nT * M * b * yL) + cSl1 * nT * M * (a / k + b') * (cCount * M * L)
                + cSl1 * Xpp + 1)) + et)
      ≤ max y (max yD yL) * y * (nT * a * (1 + M ^ 2 / k) + M * (B0 + Nc)) := by
  have hK : 0 ≤ K := c1.trans c1'
  have hy0 : 0 ≤ y := by linarith
  have hg0 : 0 ≤ g := by linarith
  have hnT0 : 0 ≤ nT := by linarith
  have ha0 : 0 ≤ a := by linarith
  obtain ⟨r, hr⟩ : ∃ r, r = M ^ 2 / k := ⟨_, rfl⟩
  have hr0 : 0 ≤ r := by rw [hr]; positivity
  obtain ⟨q, hq⟩ : ∃ q, q = M / k := ⟨_, rfl⟩
  have hq0 : 0 ≤ q := by rw [hq]; positivity
  have hq1 : q ≤ 1 := by rw [hq]; exact (div_le_one hk).2 hMk
  obtain ⟨A1, hA1⟩ : ∃ A1, A1 = nT * a := ⟨_, rfl⟩
  have hA1a : a ≤ A1 := by rw [hA1]; exact le_mul_of_one_le_left ha0 hnT
  have hA10 : 0 ≤ A1 := by linarith
  obtain ⟨A3, hA3⟩ : ∃ A3, A3 = M * B0 := ⟨_, rfl⟩
  have hA30 : 0 ≤ A3 := by rw [hA3]; positivity
  obtain ⟨A4, hA4⟩ : ∃ A4, A4 = M * Nc := ⟨_, rfl⟩
  have hA40 : 0 ≤ A4 := by rw [hA4]; positivity
  obtain ⟨E, hE⟩ : ∃ E, E = A1 * (1 + r) + (A3 + A4) := ⟨_, rfl⟩
  have hA1r : 0 ≤ A1 * r := mul_nonneg hA10 hr0
  have hA1E : A1 ≤ E := by rw [hE]; linarith only [hA1r, hA30, hA40]
  have eA1r : A1 * (1 + r) ≤ E := by rw [hE]; linarith only [hA30, hA40]
  have hA1rE : A1 * r ≤ E := by rw [hE]; linarith only [hA10, hA30, hA40]
  have hA3E : A3 ≤ E := by rw [hE]; linarith only [hA10, hA1r, hA40]
  have eA34 : A3 + A4 ≤ E := by rw [hE]; linarith only [hA10, hA1r]
  have hE0 : 0 ≤ E := hA10.trans hA1E
  have e1 : 1 ≤ E := by linarith only [ha1, hA1a, hA1E]
  let Y := max y (max yD yL)
  have yY : y ≤ Y := le_max_left _ _
  have yDY : yD ≤ Y := (le_max_left yD yL).trans (le_max_right y (max yD yL))
  have yLY : yL ≤ Y := (le_max_right yD yL).trans (le_max_right y (max yD yL))
  have oneY : 1 ≤ Y := hy.trans yY
  have hY0 : 0 ≤ Y := by linarith
  obtain ⟨P, hP⟩ : ∃ P, P = Y * E := ⟨_, rfl⟩
  have hP0 : 0 ≤ P := by rw [hP]; positivity
  have EP : E ≤ P := by rw [hP]; exact le_mul_of_one_le_left hE0 oneY
  have hLaY : La ≤ 2 * Y := by linarith only [hLa, yY]
  have hLY : L ≤ 2 * Y := by linarith only [hL, yY]
  have hlkY : lk ≤ g * Y := hlk.trans (by gcongr)

  have T1 : sA * (cCount * (La + M ^ 2 * La / k)) ≤ 4 * K * P := by
    have e : sA * (cCount * (La + M ^ 2 * La / k)) = (sA * (1 + r)) * (cCount * La) := by
      rw [hr]; ring
    have s1 : sA * (1 + r) ≤ 2 * E := by
      have : sA * (1 + r) ≤ 2 * A1 * (1 + r) := by rw [hA1]; gcongr
      linarith only [this, eA1r]
    rw [e]
    calc (sA * (1 + r)) * (cCount * La) ≤ (2 * E) * (K * (2 * Y)) := by gcongr
      _ = 4 * K * P := by rw [hP]; ring
  have T2a : cDiv * nT * a * La ≤ 2 * K * P := by
    calc cDiv * nT * a * La = cDiv * A1 * La := by rw [hA1]; ring
      _ ≤ K * E * (2 * Y) := by gcongr
      _ = 2 * K * P := by rw [hP]; ring
  have T2b : cDiv * M * (B0 + Nc) * yD ≤ K * P := by
    calc cDiv * M * (B0 + Nc) * yD = cDiv * (A3 + A4) * yD := by rw [hA3, hA4]; ring
      _ ≤ K * E * Y := by gcongr
      _ = K * P := by rw [hP]; ring
  have T3 : M * cE * B0 ≤ K * P := by
    calc M * cE * B0 = cE * A3 := by rw [hA3]; ring
      _ ≤ K * P := by gcongr; exact hA3E.trans EP
  have T4 : cSlope * nT * a * La * (1 + M / k) ≤ 4 * K * P := by
    calc cSlope * nT * a * La * (1 + M / k) = cSlope * A1 * La * (1 + q) := by rw [hA1, hq]; ring
      _ ≤ K * E * (2 * Y) * (1 + 1) := by gcongr
      _ = 4 * K * P := by rw [hP]; ring
  have T60 : 0 ≤ cLoss * nT * M * b * yL := by positivity
  have T6 : cLoss * nT * M * b * yL ≤ K * P := by
    calc cLoss * nT * M * b * yL = cLoss * (nT * (M * b)) * yL := by ring
      _ ≤ K * (nT * a) * Y := by gcongr
      _ ≤ K * E * Y := by rw [← hA1]; gcongr
      _ = K * P := by rw [hP]; ring
  have Tmid : cSl1 * nT * M * (a / k + b') * (cCount * M * L) ≤ 4 * K ^ 2 * P := by
    have hb'k : b' ≤ a / k := by rw [le_div_iff₀ hk]; linarith
    have hQ : nT * M ^ 2 * (a / k + b') ≤ 2 * E := by
      calc nT * M ^ 2 * (a / k + b') ≤ nT * M ^ 2 * (a / k + a / k) := by gcongr
        _ = 2 * (A1 * r) := by rw [hA1, hr]; ring
        _ ≤ 2 * E := by linarith
    have hQ0 : 0 ≤ nT * M ^ 2 * (a / k + b') := by positivity
    calc cSl1 * nT * M * (a / k + b') * (cCount * M * L)
        = cSl1 * cCount * L * (nT * M ^ 2 * (a / k + b')) := by ring
      _ ≤ K * K * (2 * Y) * (2 * E) := by gcongr
      _ = 4 * K ^ 2 * P := by rw [hP]; ring
  have T7 : cSl1 * (cLoss * nT * M * b * yL) + cSl1 * nT * M * (a / k + b') * (cCount * M * L)
      + cSl1 * Xpp + 1 ≤ (5 * K ^ 2 + K + 1) * P := by
    have s1 : cSl1 * (cLoss * nT * M * b * yL) ≤ K * (K * P) := by gcongr
    have s2 : cSl1 * Xpp ≤ K * P := by gcongr; linarith only [hX, hA1a, hA1E, EP]
    have s3 : 1 ≤ P := e1.trans EP
    linarith only [s1, s2, s3, Tmid]
  have TU : cSlope * nT * a * La * (2 + M / k)
      + (2 * M * cE * B0 + cH * (nT * a * La + M * B0) + sA * (cCount * lk))
      + cSl1 * M * B0
      + (cSl1 * (cLoss * nT * M * b * yL) + cSl1 * nT * M * (a / k + b') * (cCount * M * L)
          + cSl1 * Xpp + 1) ≤ (5 * K ^ 2 + 13 * K + 2 * K * g + 1) * P := by
    have s1 : cSlope * nT * a * La * (2 + M / k) ≤ 6 * K * P := by
      calc cSlope * nT * a * La * (2 + M / k) = cSlope * A1 * La * (2 + q) := by rw [hA1, hq]; ring
        _ ≤ K * E * (2 * Y) * (2 + 1) := by gcongr
        _ = 6 * K * P := by rw [hP]; ring
    have s2 : cH * (nT * a * La + M * B0) ≤ 3 * K * P := by
      calc cH * (nT * a * La + M * B0) = cH * (A1 * La + A3) := by rw [hA1, hA3]
        _ ≤ K * (E * (2 * Y) + P) := by gcongr; exact hA3E.trans EP
        _ = 3 * K * P := by rw [hP]; ring
    have s3 : sA * (cCount * lk) ≤ 2 * K * g * P := by
      calc sA * (cCount * lk) ≤ (2 * E) * (K * (g * Y)) := by
            gcongr
            rw [← hA1] at hsA; linarith
        _ = 2 * K * g * P := by rw [hP]; ring
    have s4 : cSl1 * M * B0 ≤ K * P := by
      calc cSl1 * M * B0 = cSl1 * A3 := by rw [hA3]; ring
        _ ≤ K * P := by gcongr; exact hA3E.trans EP
    linarith only [s1, s2, s3, s4, T3, T7]
  have Tet : et ≤ K * P := by
    calc et ≤ K * y * A1 := by rw [hA1]; exact het
      _ ≤ K * Y * E := by gcongr
      _ = K * P := by rw [hP]; ring
  obtain ⟨u, hu⟩ : ∃ u, u = 5 * K ^ 2 + 13 * K + 2 * K * g + 1 := ⟨_, rfl⟩
  have hu0 : 0 ≤ u := by rw [hu]; positivity
  rw [← hu] at TU
  have T8 : dI * (4 * (cSlope * nT * a * La * (2 + M / k)
            + (2 * M * cE * B0 + cH * (nT * a * La + M * B0) + sA * (cCount * lk))
            + cSl1 * M * B0
            + (cSl1 * (cLoss * nT * M * b * yL) + cSl1 * nT * M * (a / k + b') * (cCount * M * L)
                + cSl1 * Xpp + 1)) + et)
      ≤ 2 * (4 * (u * P) + K * P) := by
    calc _ ≤ dI * (4 * (u * P) + K * P) := by gcongr
      _ ≤ 2 * (4 * (u * P) + K * P) := by gcongr
  have hbound : 5 * K ^ 2 + 16 * K + 1 + 8 * u ≤ 200 * (1 + K) ^ 2 * g := by
    rw [hu]
    have hbase : 45 * K ^ 2 + 120 * K + 9 ≤ (45 * K ^ 2 + 120 * K + 9) * g :=
      le_mul_of_one_le_right (by positivity) hg
    have hlarge : 45 * K ^ 2 + 136 * K + 9 ≤ 200 * (1 + K) ^ 2 := by
      nlinarith only [hK, sq_nonneg K]
    have hscaled := mul_le_mul_of_nonneg_right hlarge hg0
    nlinarith only [hbase, hscaled]
  have hfin := mul_le_mul_of_nonneg_right (hbound.trans hbig) hP0
  have hR : max y (max yD yL) * y * (nT * a * (1 + M ^ 2 / k) + M * (B0 + Nc)) =
      y * P := by
    rw [hP, hE, hA1, hA3, hA4, hr]
    change Y * y * _ = _
    ring
  rw [hR]
  linarith only [T1, T2a, T2b, T3, T4, T6, T7, T8, hfin]

lemma log_le_of_le_rpow {x k e y : ℝ} (hx : 1 ≤ x) (he : 0 ≤ e) (hk : 0 < k) (hkx : k ≤ x ^ e)
    (hlog : Real.log x ≤ y) (hy : 1 ≤ y) : Real.log k ≤ (1 + e) * y := by
  have hx0 : 0 < x := by linarith
  calc Real.log k ≤ Real.log (x ^ e) := Real.log_le_log hk hkx
    _ = e * Real.log x := Real.log_rpow hx0 _
    _ ≤ e * y := by gcongr
    _ ≤ (1 + e) * y := by linarith

lemma inv_one_sub_le_two {d : ℝ} (hd : d ≤ 1 / 2) : 0 ≤ (1 - d)⁻¹ ∧ (1 - d)⁻¹ ≤ 2 := by
  have hd12 : (1 : ℝ) / 2 ≤ 1 - d := by linarith
  refine ⟨inv_nonneg.2 (by linarith), ?_⟩
  have := inv_anti₀ (by norm_num : (0 : ℝ) < 1 / 2) hd12
  simpa using this


theorem large_x_eventually : LargeXEv := by
  intro ε K cHH eK hε
  have h1 : ∀ᶠ x : ℝ in Filter.atTop, Real.log x ≤ x ^ ε := by
    have hb := (isLittleO_log_rpow_atTop hε).bound (c := 1) one_pos
    filter_upwards [hb, Filter.eventually_ge_atTop (1 : ℝ)] with x hx hx1
    rw [one_mul, Real.norm_of_nonneg (Real.rpow_nonneg (by linarith) _)] at hx
    exact (le_abs_self _).trans hx
  have h2 : ∀ᶠ x : ℝ in Filter.atTop, KBig K cHH eK ≤ x ^ ε :=
    (tendsto_rpow_atTop hε).eventually_ge_atTop _
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 (h1.and h2)
  exact ⟨x0, fun x hx => hx0 x hx⟩

section
open Formalism Formalism.D5 Formalism.LFunctionChainParameters.characterSumData Formalism.LFunctionChainParameters.ThickSetMeanBounds

end

end Formalism.LFunctionChainParameters.LErr

section Check
open Formalism.LFunctionChainParameters.LErr
end Check
