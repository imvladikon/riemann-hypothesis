module

public import Formalism.GaloisCohomology.Statement
public import Formalism.SharpRestriction.RamificationFrobenius.TotientGaloisClasses.PrimePairSizeCondition
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Algebra.Order.Star.Real
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Normed.Algebra.GelfandRadius
import Mathlib.Analysis.SpecialFunctions.Bernstein
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

@[expose] public section

noncomputable section

open NumberField

namespace UpperTheory.Top

open Formalism.HC

def VVle (E : Type) [Field E] [NumberField E] (t : ℕ) (B : ℝ) : Prop :=
  ∀ (Ω : Type) [Field Ω] [Algebra E Ω] [IsAlgClosure E Ω] (ld : ∀ (p : ℕ) [Fact p.Prime], Formalism.GaloisCohomology.LData E Ω p),
    (∀ (p : ℕ) [Fact p.Prime] (e : ℕ), 0 < e → e < t → Formalism.GaloisCohomology.shaLen (ld p) (e : ℤ) ≠ ⊤) ∧
    ∀ S : Finset Nat.Primes,
      ∑ l ∈ S, Real.log (l : ℕ) *
        ∑ e ∈ Finset.Ico 1 t, ((@Formalism.GaloisCohomology.shaLen E Ω _ _ _ _ _ l ⟨l.2⟩ (@ld l ⟨l.2⟩) (e : ℤ)).toNat : ℝ) ≤ B

def IsChiField (ψ : PChar) (e q d : ℕ) (E : Type) [Field E] [NumberField E] : Prop :=
  ∃ (N : ℕ) (_ : NeZero N) (j : E →ₐ[ℚ] CyclotomicField N ℚ) (ζ : CyclotomicField N ℚ),
    2 ^ (e + 2) ∣ N ∧ ψ.N ∣ N ∧ q ∣ N ∧ d ∣ N ∧ IsPrimitiveRoot ζ N ∧
    ∀ (τ : CyclotomicField N ℚ ≃ₐ[ℚ] CyclotomicField N ℚ) (a : ℕ), τ ζ = ζ ^ a →
      ((∀ x : E, τ (j x) = j x) ↔
        (a ≡ 1 [MOD 2 ^ (e + 2)] ∨ a + 1 ≡ 0 [MOD 2 ^ (e + 2)]) ∧ ψ.val a = 1 ∧
          jacobiSym (a : ℤ) q = 1 ∧ jacobiSym (a : ℤ) d = 1)

structure WinPair (eps Y : ℝ) (q d : ℕ) : Prop where
  q_prime : q.Prime
  q_mod : q % 8 = 3
  q_lo : Y ^ (eps / 5) / 2 < Real.log q
  q_up : Real.log q ≤ Y ^ (eps / 5)
  d_prime : d.Prime
  d_mod : d % 16 = 7
  d_lo : Y ^ (eps / 5) * Real.log Y ^ 2 / 2 < Real.log d
  d_up : Real.log d ≤ Y ^ (eps / 5) * Real.log Y ^ 2
  d_q : q ∣ d + 1
  d_small : ∀ p : ℕ, p.Prime → p ≠ 2 → (p : ℝ) ≤ Y ^ (eps / 5) → p ∣ d + 1

def PageN (eps x : ℝ) (e : ℕ) : Prop := x ^ (2 + 8 * eps) ≤ (2 : ℝ) ^ e ∧ (2 : ℝ) ^ e ≤ 2 * x ^ (2 + 8 * eps)

def VAt (ψ : PChar) (eps Ct : ℝ) (q d e : ℕ) (x : ℝ) : Prop :=
  ∀ (E : Type) [Field E] [NumberField E], IsChiField ψ e q d E → VVle E ⌊x ^ Ct⌋₊ (Real.sqrt (Real.exp (x ^ eps)))

def windowIndex (w B : ℝ) (R : ℕ) : ℝ := w * (w * B) ^ R

def windowWidth (R : ℕ) : ℝ := (3 / 2 : ℝ) ^ (1 / ((R : ℝ) + 1))

theorem one_lt_windowWidth (R : ℕ) : 1 < windowWidth R :=
  Real.one_lt_rpow (by norm_num) (one_div_pos.mpr (by positivity))

theorem windowIndex_windowWidth (R : ℕ) (B : ℝ) :
    windowIndex (windowWidth R) B R = (3 / 2) * B ^ R := by
  have hR : (R : ℝ) + 1 ≠ 0 := by positivity
  have hpow : windowWidth R ^ (R + 1) = (3 / 2 : ℝ) := by
    rw [← Real.rpow_natCast, windowWidth, ← Real.rpow_mul (by norm_num)]
    rw [Nat.cast_add, Nat.cast_one, one_div_mul_cancel hR, Real.rpow_one]
  unfold windowIndex
  rw [mul_pow, ← mul_assoc, mul_comm (windowWidth R), ← pow_succ, hpow]

def VWinAt (ψ : PChar) (Ct w : ℝ) (J : ℝ → ℝ) : Prop :=
  ∀ eps : ℝ, 0 < eps → eps < 1 / 52 → 1 ≤ J eps ∧ ∀ (A : ℝ) (e : ℝ → ℕ),
    (∀ x ≥ (2 : ℝ), 2 ≤ e x ∧ (2 : ℝ) ^ e x ≤ x ^ A) →
    ∃ X0 : ℝ, ∀ X ≥ X0, ∀ q d : ℕ, WinPair eps (X ^ (1 / J eps)) q d →
      ∃ Y : ℝ, X ^ (1 / J eps) ≤ Y ∧ Y ^ w ≤ X ∧ ∀ x : ℝ, Y ≤ x → x ≤ Y ^ w → VAt ψ eps Ct q d (e x) x

def VWin : Prop :=
  ∃ CK : ℝ, 1 ≤ CK ∧ ∀ ψ : PChar, ∃ R : ℕ, ∀ (Ct w : ℝ), 1 ≤ Ct → 1 ≤ w →
    VWinAt ψ Ct w (fun eps => windowIndex w (2 * CK * Ct / eps) R)

theorem VVle.mono {E : Type} [Field E] [NumberField E] {t t' : ℕ} {B B' : ℝ} (h : VVle E t B) (ht : t' ≤ t) (hB : B ≤ B') :
    VVle E t' B' := by
  intro Ω _ _ _ ld
  obtain ⟨h1, h2⟩ := h Ω ld
  refine ⟨fun p _ e he1 he2 => h1 p e he1 (lt_of_lt_of_le he2 ht), fun S => ?_⟩
  refine le_trans ?_ (le_trans (h2 S) hB)
  apply Finset.sum_le_sum
  intro l _
  apply mul_le_mul_of_nonneg_left _ (Real.log_natCast_nonneg _)
  apply Finset.sum_le_sum_of_subset_of_nonneg
  · intro e he
    simp only [Finset.mem_Ico] at he ⊢
    omega
  · intro e _ _
    positivity

theorem exists_pageN (eps : ℝ) (he : 0 < eps) : ∃ e : ℝ → ℕ, ∀ x ≥ (1 : ℝ), PageN eps x (e x) := by
  have : ∀ x : ℝ, ∃ e : ℕ, x ≥ 1 → PageN eps x e := by
    intro x
    by_cases hx : x ≥ 1
    · have h1 : (1 : ℝ) ≤ x ^ (2 + 8 * eps) := Real.one_le_rpow hx (by linarith)
      obtain ⟨n, a, b⟩ := exists_nat_pow_near h1 (by norm_num : (1 : ℝ) < 2)
      refine ⟨n + 1, fun _ => ⟨b.le, ?_⟩⟩
      rw [pow_succ]; linarith
    · exact ⟨0, fun h => absurd h hx⟩
  choose e he using this
  exact ⟨e, he⟩

/-- Choose the dyadic conductor factor at the original scale, with a polynomial upper bound. -/
theorem exists_scaled_pageN {eps c : ℝ} (heps : 0 < eps) (heps' : eps < 1 / 52) (hc : 1 ≤ c) :
    ∃ e : ℝ → ℕ, (∀ x ≥ (2 : ℝ), 2 ≤ e x ∧ (2 : ℝ) ^ e x ≤ x ^ (4 : ℝ)) ∧
      ∀ x ≥ 4 * c, x ^ (2 + 8 * eps) ≤ c * 2 ^ e x ∧ c * 2 ^ e x ≤ 2 * x ^ (2 + 8 * eps) := by
  let z (x : ℝ) := max 4 (x ^ (2 + 8 * eps) / c)
  have hpoint (x : ℝ) : ∃ n : ℕ, z x ≤ (2 : ℝ) ^ n ∧ (2 : ℝ) ^ n ≤ 2 * z x := by
    obtain ⟨n, hlo, hhi⟩ := exists_nat_pow_near (le_trans (by norm_num : (1 : ℝ) ≤ 4) (le_max_left _ _ : 4 ≤ z x))
      (by norm_num : (1 : ℝ) < 2)
    exact ⟨n + 1, hhi.le, by rw [pow_succ, mul_comm]; gcongr⟩
  choose e hlo hhi using hpoint
  refine ⟨e, fun x hx => ?_, fun x hx => ?_⟩
  · have hx1 : 1 ≤ x := by linarith
    have hfour : (4 : ℝ) ≤ x ^ (2 + 8 * eps) := by
      calc (4 : ℝ) = (2 : ℝ) ^ (2 : ℝ) := by norm_num [Real.rpow_two]
        _ ≤ x ^ (2 : ℝ) := Real.rpow_le_rpow (by norm_num) hx (by norm_num)
        _ ≤ x ^ (2 + 8 * eps) := Real.rpow_le_rpow_of_exponent_le hx1 (by linarith)
    have hz : z x ≤ x ^ (2 + 8 * eps) := max_le hfour (div_le_self (by positivity) hc)
    have he : (2 : ℝ) ^ (2 : ℕ) ≤ (2 : ℝ) ^ e x := by
      exact (show (2 : ℝ) ^ (2 : ℕ) ≤ 4 by norm_num).trans ((le_max_left _ _ : 4 ≤ z x).trans (hlo x))
    refine ⟨(pow_le_pow_iff_right₀ (by norm_num)).1 he, ?_⟩
    calc (2 : ℝ) ^ e x ≤ 2 * x ^ (2 + 8 * eps) := (hhi x).trans (mul_le_mul_of_nonneg_left hz (by norm_num))
      _ ≤ x * x ^ (2 + 8 * eps) := mul_le_mul_of_nonneg_right hx (by positivity)
      _ = x ^ (1 + (2 + 8 * eps)) := by rw [Real.rpow_add (by linarith) 1 (2 + 8 * eps), Real.rpow_one]
      _ ≤ x ^ (4 : ℝ) := Real.rpow_le_rpow_of_exponent_le hx1 (by linarith)
  · have hc0 : 0 < c := by linarith
    have hx1 : 1 ≤ x := by linarith
    have hz : z x = x ^ (2 + 8 * eps) / c :=
      max_eq_right ((le_div_iff₀ hc0).2 (hx.trans (Real.self_le_rpow_of_one_le hx1 (by linarith))))
    have hl := hlo x
    have hu := hhi x
    rw [hz] at hl hu
    refine ⟨?_, ?_⟩
    · rw [mul_comm c]
      exact (div_le_iff₀ hc0).1 hl
    · calc c * (2 : ℝ) ^ e x ≤ c * (2 * (x ^ (2 + 8 * eps) / c)) := mul_le_mul_of_nonneg_left hu hc0.le
        _ = 2 * x ^ (2 + 8 * eps) := by field_simp

end UpperTheory.Top

end
