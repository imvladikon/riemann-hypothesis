module

public import Formalism.SharpRestriction.Divisibility.ZetaProductPairs
public import Formalism.SharpRestriction.Divisibility.LiftErrorLocal
public import Formalism.SharpRestriction.Divisibility.LocalQuadraticParts
public import Formalism.SharpRestriction.GrowthBounds.WeilJacquetShalikaLaw
public import Formalism.SharpRestriction.GlobalSchurBounds.ProductFirstZerothParts
public import Formalism.LocalRingCardinality.RankBoundMonotoneInDimension
import Formalism.LocalRingCardinality.HostCls
import Mathlib.Algebra.Order.Floor.Extended
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Algebra.Order.Interval.Basic
import Mathlib.Algebra.Order.Star.Int
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
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
import Mathlib.Tactic.Basify
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
import Mathlib.Tactic.ReduceModChar
import Mathlib.Topology.Sheaves.Init
import Std.Tactic.BVDecide.Normalize.Prop

@[expose] public section

noncomputable section

namespace Formalism.MainNotions.WeightDegreeSizes

section PartG

open Formalism.BasicNotions Formalism.BasicNotions.DV


section Proof

open Formalism.FrobeniusOrbits


end Proof

end PartG

section PartA

open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.MainNotions.G NumberField IsDedekindDomain
open scoped BigOperators

variable {D : D7}

theorem gain_above {L : SizeData₂ D} (X : Inst D L) (K : Consts) (hF : ∀ w, ParametersFill X K w)
    (j : ℕ) (hj : j ∈ SizeData₂.lifts D) (w : D.what₂.places.Pl)
    (hX : L.sc.X'' D.R.n < (D.what₂.places.resChar w : ℝ)) : L.gain j w = 0 := by
  by_cases hs : w ∈ L.supp
  · by_cases hin : IsResidueClassZero D (D.what₂.places.resChar w) ∨ IsSg D (D.what₂.places.resChar w)
    · rw [(hF w).2.2.2.1 hs hin j hj]
      unfold gainP
      rw [if_pos (Or.inr hX)]
    · exact (L.not_inert w (fun h => hin (Or.inr h)) (fun h => hin (Or.inl h))).1 j
  · exact L.gain_supp j w hs

def ConclusionZ (D : D7) (L : SizeData₂ D) : Prop := L.ZeroAbove

def Ovr (D : D7) (p : ℕ) (S : Finset D.what₂.places.Pl) : Prop := ∀ w, w ∈ S ↔ D.what₂.places.resChar w = p

theorem resChar_iff (D : D7) (l : ℕ) (hl : l.Prime) (w : D.what₂.places.Pl) :
    D.what₂.places.resChar w = l ↔ (l : 𝓞 D.what₂.LL) ∈ (D.plEq w).asIdeal := by
  constructor
  · intro h; rw [← h]; exact resChar_mem D w
  · intro hmem
    by_contra hne
    have h1 := resChar_mem D w
    have hcop : Nat.Coprime (D.what₂.places.resChar w) l :=
      (Nat.coprime_primes (D.what₂.places.resChar_prime w) hl).mpr hne
    obtain ⟨a, b, hab⟩ : ∃ a b : ℤ, a * (D.what₂.places.resChar w : ℤ) + b * (l : ℤ) = 1 := by
      refine ⟨Nat.gcdA (D.what₂.places.resChar w) l, Nat.gcdB (D.what₂.places.resChar w) l, ?_⟩
      have := Nat.gcd_eq_gcd_ab (D.what₂.places.resChar w) l
      rw [hcop] at this
      push_cast at this
      linarith
    have h1' : (1 : 𝓞 D.what₂.LL) ∈ (D.plEq w).asIdeal := by
      have : ((a * (D.what₂.places.resChar w : ℤ) + b * (l : ℤ) : ℤ) : 𝓞 D.what₂.LL) ∈ (D.plEq w).asIdeal := by
        push_cast
        exact Ideal.add_mem _ (Ideal.mul_mem_left _ _ h1) (Ideal.mul_mem_left _ _ hmem)
      rwa [hab, Int.cast_one] at this
    exact (D.plEq w).isPrime.ne_top ((Ideal.eq_top_iff_one _).mpr h1')

theorem exists_ovr (D : D7) (p : ℕ) (hp : p.Prime) : ∃ S, Ovr D p S := by
  classical
  obtain ⟨S, hS⟩ := finite_places_over (K := D.what₂.LL) p hp
  refine ⟨S.map D.plEq.symm.toEmbedding, fun w => ?_⟩
  rw [Finset.mem_map_equiv, Equiv.symm_symm, hS, resChar_iff D p hp]

theorem loss_bound_nonneg (L : SizeData₂ D) : 0 ≤ L.B0 := by
  have hx0 : 0 < L.sc.x := lt_trans zero_lt_one L.sc.one_lt_alt
  simp only [SizeData₂.B0, sizeBudget, bSize]
  have := Real.rpow_nonneg hx0.le L.sc.eps
  have := Real.exp_pos (L.sc.x ^ L.sc.eps)
  positivity

def sumA (L : SizeData₂ D) : ℝ := ∑ t : D.host.TT, (L.aT t : ℝ)


open Classical in
def C2atG (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop :=
  ∀ (i : Fin 2) u, ∀ j ∈ SizeData₂.lifts D,
    |(∑ w ∈ L.supp.filter (fun w => D.what₂.places.resChar w = D.host.g i), SizeData₂.sz w (L.E u j w)) -
      sumA L * Real.log (D.host.g i : ℝ)| ≤ C * L.B0

def totalErrorOn (L : SizeData₂ D) (u : D.what₂.Word) (S : Finset D.what₂.places.Pl) : ℝ :=
  ∑ j ∈ SizeData₂.lifts D, ∑ w ∈ S, SizeData₂.sz w (L.E u j w)

def C2off (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop :=
  ∀ u, |totalErrorOn L u (L.supp.filter (fun w => D.what₂.places.resChar w ∉ L.gTypes))| ≤
    C * (D.R.m : ℝ) * L.B0

private theorem sum_const_lifts (D : D7) (b : ℝ) :
    (∑ _ ∈ SizeData₂.lifts D, b) = (D.R.m : ℝ) * b := by
  simp [SizeData₂.lifts, Nat.card_Icc, nsmul_eq_mul]

private theorem sum_lifts_le {f : ℕ → ℝ} {b : ℝ} (h : ∀ j ∈ SizeData₂.lifts D, f j ≤ b) :
    (∑ j ∈ SizeData₂.lifts D, f j) ≤ (D.R.m : ℝ) * b := by
  rw [← sum_const_lifts]
  exact Finset.sum_le_sum h

private theorem abs_sum_lifts_le {f : ℕ → ℝ} {b : ℝ} (h : ∀ j ∈ SizeData₂.lifts D, |f j| ≤ b) :
    |∑ j ∈ SizeData₂.lifts D, f j| ≤ (D.R.m : ℝ) * b :=
  (Finset.abs_sum_le_sum_abs _ _).trans (sum_lifts_le h)

def IsotypicRank (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop := LocalQuadraticParts.adm11 D L C

/-- Combines the `g`-place local energy bound `C2atG` (over places `w | g_i` for `i ∈ {0, 1}`,
using `log (g 0 * g 1) = log (g 0) + log (g 1)`) and the off-`g` bound `C2off` into
`IsotypicRank D L (2 * C1 + C2)` (i.e. `LocalQuadraticParts.adm11`). -/
theorem secondComplement_of_split (L : SizeData₂ D) (C1 C2 : ℝ) (h1 : C2atG D L C1) (h2 : C2off D L C2) :
    IsotypicRank D L (2 * C1 + C2) := by
  classical
  intro u
  have hg0 : (0 : ℝ) < (D.host.g 0 : ℝ) := by exact_mod_cast (D.host.g_prime 0).pos
  have hg1 : (0 : ℝ) < (D.host.g 1 : ℝ) := by exact_mod_cast (D.host.g_prime 1).pos
  have hlog : Real.log (∏ g ∈ L.gTypes, (g : ℝ)) = Real.log (D.host.g 0 : ℝ) + Real.log (D.host.g 1 : ℝ) := by
    unfold SizeData₂.gTypes
    rw [Finset.prod_pair D.host.g_ne, Real.log_mul hg0.ne' hg1.ne']
  let f (j : ℕ) (w : D.what₂.places.Pl) := SizeData₂.sz w (L.E u j w)
  have hsplit (j : ℕ) : ∑ w ∈ L.supp, f j w =
      (∑ w ∈ L.supp.filter (fun w => D.what₂.places.resChar w = D.host.g 0), f j w) +
      (∑ w ∈ L.supp.filter (fun w => D.what₂.places.resChar w = D.host.g 1), f j w) +
      ∑ w ∈ L.supp.filter (fun w => D.what₂.places.resChar w ∉ L.gTypes), f j w := by
    rw [← Finset.sum_filter_add_sum_filter_not L.supp (fun w => D.what₂.places.resChar w = D.host.g 0) (f j),
      ← Finset.sum_filter_add_sum_filter_not
        (L.supp.filter (fun w => ¬ D.what₂.places.resChar w = D.host.g 0))
        (fun w => D.what₂.places.resChar w = D.host.g 1) (f j), Finset.filter_filter, Finset.filter_filter, add_assoc]
    congr 2
    · refine Finset.sum_congr (Finset.filter_congr fun w _ => ?_) fun _ _ => rfl
      constructor
      · exact fun h => h.2
      · exact fun h => ⟨fun h' => D.host.g_ne (h'.symm.trans h), h⟩
    · refine Finset.sum_congr (Finset.filter_congr fun w _ => ?_) fun _ _ => rfl
      simp [SizeData₂.gTypes]
  have hG (i : Fin 2) : |totalErrorOn L u (L.supp.filter (fun w => D.what₂.places.resChar w = D.host.g i)) -
      (D.R.m : ℝ) * sumA L * Real.log (D.host.g i : ℝ)| ≤ C1 * (D.R.m : ℝ) * L.B0 := by
    unfold totalErrorOn
    calc
      _ = |∑ j ∈ SizeData₂.lifts D,
          ((∑ w ∈ L.supp.filter (fun w => D.what₂.places.resChar w = D.host.g i), f j w) -
            sumA L * Real.log (D.host.g i : ℝ))| := by
        rw [Finset.sum_sub_distrib, sum_const_lifts]
        dsimp only [f]
        ring_nf
      _ ≤ (D.R.m : ℝ) * (C1 * L.B0) := abs_sum_lifts_le (h1 i u)
      _ = _ := by ring
  have a0 := hG 0
  have a1 := hG 1
  have a2 := h2 u
  unfold totalErrorOn at a0 a1 a2
  change |(∑ j ∈ SizeData₂.lifts D, ∑ w ∈ L.supp, f j w) -
      (D.R.m : ℝ) * sumA L * Real.log (∏ g ∈ L.gTypes, (g : ℝ))| ≤ _
  simp only [hlog, hsplit, Finset.sum_add_distrib]
  rw [abs_le] at a0 a1 a2 ⊢
  constructor <;> linarith only [a0.1, a0.2, a1.1, a1.2, a2.1, a2.2]

theorem stmtZ {L : SizeData₂ D} (Gi : Inst D L) (K : Consts) (X : ErrX D) (c : ErrC)
    (hF : ∀ w, ParametersFill Gi K w) (hE : L.EDef X K c) : ConclusionZ D L :=
  fun u j hj w hX hT hg hd hG => ⟨gain_above Gi K hF j hj w hX, hE.zeroAbove u j hj w hX hT hg hd hG⟩

theorem zero_gain_above_family {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) : ∀ x, Fm.x1 < x → ∀ i : Fm.Ix x, ConclusionZ (Fm.D x i) (Fm.L x i) :=
  fun x hx i => stmtZ (Fm.Gx x i) Fm.GK (Fm.ex x hx i).errX Fm.cX.err (Fm.fills x hx i) (Fm.ex x hx i).err.edef

/-- Local norm-decomposition condition at places `w` over `g_i`: the weighted sum of `vNN` over
the places above `g_i` equals `(∑ τ, nuAbs D u j τ) * log (g_i)`. -/
def NormDecompositionCond (D : D7) (X : ErrX D) : Prop :=
  ∀ (i : Fin 2) u, ∀ j ∈ SizeData₂.lifts D, ∀ S : Finset D.what₂.places.Pl, Ovr D (D.host.g i) S →
    ∑ w ∈ S, SizeData₂.sz w (vNN X i u j w) = (∑ τ : D.what₂.Tau, nuAbs D u j τ) * Real.log (D.host.g i : ℝ)

def LevelPrimeNotTypePrime (D : D7) : Prop := ∀ u (i : Fin 2), D.host.g i ≠ (D.mem u).A.T

def errG (L : SizeData₂ D) (C : ℝ) (j : ℕ) : ℝ :=
  2 * (∑ τ : D.what₂.Tau, wj D j τ) +
    C * ((D.R.f : ℝ) * ((D.R.k : ℝ) * L.Sc + (D.R.m : ℝ) * D.R.t * L.etaSz + (D.R.k : ℝ) * Nm D) +
      (D.host.TT.card : ℝ) * L.sc.b' / L.sc.x)

/-- Degree-count bound at lift `j`: the sum of `nuAbs D u j τ` over archimedean places `τ`,
shifted by the Fock degree `fockDeg D j`, matches `sumA L = ∑ t, aT t` up to `errG L C j`. -/
def DegreeCountBound (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop :=
  ∀ u, ∀ j ∈ SizeData₂.lifts D,
    |(∑ τ : D.what₂.Tau, nuAbs D u j τ) - (fockDeg D j : ℝ) - sumA L| ≤ errG L C j

def TypePrimeSizeBound (D : D7) (L : SizeData₂ D) (c : ErrC) (Cd C : ℝ) : Prop :=
  ∀ (i : Fin 2) u, ∀ j ∈ SizeData₂.lifts D,
    (errG L Cd j + 2 * (padicValNat (D.host.g i) (D.mem u).C.DGam : ℝ) +
      2 * (c.g * (D.R.f : ℝ) * (Nm D ^ 2 + (D.R.m : ℝ) ^ 2 * L.etaSz))) *
        Real.log (D.host.g i : ℝ) ≤ C * L.B0

theorem Eval_atG (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC) (hT : LevelPrimeNotTypePrime D) (i : Fin 2) (u : D.what₂.Word) (j : ℕ)
    (w : D.what₂.places.Pl) (hw : D.what₂.places.resChar w = D.host.g i) :
    Eval L X K c u j w = (padicValNat (D.host.g i) (D.mem u).C.DGam : ℝ) + EatG L X c i u j w := by
  unfold Eval
  simp only [hw, if_neg (hT u i)]
  fin_cases i
  · simp
  · have : D.host.g 1 ≠ D.host.g 0 := D.host.g_ne.symm
    simp [this]

theorem C2atG_of (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC) (Cd C : ℝ) (hc : c.Large)
    (hE : L.EDef X K c) (hT : LevelPrimeNotTypePrime D) (hN : NormDecompositionCond D X) (hD : DegreeCountBound D L Cd) (hS : TypePrimeSizeBound D L c Cd C) :
    C2atG D L C := by
  classical
  intro i u j hj
  obtain ⟨S, hSo⟩ := exists_ovr D (D.host.g i) (D.host.g_prime i)
  obtain ⟨er, her⟩ : ∃ er : ℝ, er = c.g * (D.R.f : ℝ) * (Nm D ^ 2 + (D.R.m : ℝ) ^ 2 * L.etaSz) := ⟨_, rfl⟩
  obtain ⟨vd, hvd⟩ : ∃ vd : ℝ, vd = (padicValNat (D.host.g i) (D.mem u).C.DGam : ℝ) := ⟨_, rfl⟩
  have her0 : 0 ≤ er := by
    rw [her]
    have h1 : 0 ≤ c.g := le_trans (by norm_num) hc.2.2
    have h2 := L.etaSz_pos.le
    have h3 : 0 ≤ Nm D := by unfold Nm; positivity
    positivity
  have hvd0 : 0 ≤ vd := by rw [hvd]; positivity
  have h1 : ∑ w ∈ L.supp.filter (fun w => D.what₂.places.resChar w = D.host.g i), SizeData₂.sz w (L.E u j w) =
      ∑ w ∈ S, SizeData₂.sz w (L.E u j w) := by
    refine Finset.sum_subset (fun w hw => (hSo w).2 (Finset.mem_filter.1 hw).2) fun w hw hn => ?_
    have : w ∉ L.supp := fun h => hn (Finset.mem_filter.2 ⟨h, (hSo w).1 hw⟩)
    rw [L.E_supp u j w this]
    simp [SizeData₂.sz]
  have h2 : ∀ w ∈ S, SizeData₂.sz w (L.E u j w) =
      2 * (vd + FTypeG D j + er) * (lw D.what₂.LL (D.plEq w) * (D.what₂.places.ramIdx w : ℝ)) +
        SizeData₂.sz w (vNN X i u j w) := by
    intro w hw
    rw [hE u j hj w, Eval_atG L X K c hT i u j w ((hSo w).1 hw)]
    unfold EatG SizeData₂.sz SizeData₂.lwP
    rw [← her, ← hvd]
    ring
  have hlg : 0 ≤ Real.log (D.host.g i : ℝ) :=
    Real.log_nonneg (by exact_mod_cast (D.host.g_prime i).one_lt.le)
  rw [h1, Finset.sum_congr rfl h2, Finset.sum_add_distrib, ← Finset.mul_sum,
    factEtaMean D (D.host.g i) (D.host.g_prime i) S hSo, hN i u j hj S hSo]
  have hd := hD u j hj
  have hs := hS i u j hj
  rw [← her, ← hvd] at hs
  have e1 : 2 * (vd + FTypeG D j + er) * Real.log (D.host.g i : ℝ) +
      (∑ τ : D.what₂.Tau, nuAbs D u j τ) * Real.log (D.host.g i : ℝ) - sumA L * Real.log (D.host.g i : ℝ) =
      (((∑ τ : D.what₂.Tau, nuAbs D u j τ) - (fockDeg D j : ℝ) - sumA L) + (2 * vd + 2 * er)) *
        Real.log (D.host.g i : ℝ) := by
    unfold FTypeG; ring
  rw [e1, abs_mul, abs_of_nonneg hlg]
  refine le_trans (mul_le_mul_of_nonneg_right ?_ hlg) hs
  refine (abs_add_le _ _).trans ?_
  rw [abs_of_nonneg (by positivity : 0 ≤ 2 * vd + 2 * er)]
  linarith

theorem logWeight_nonneg (w : D.what₂.places.Pl) : 0 ≤ SizeData₂.lwP w := by
  unfold SizeData₂.lwP lw
  exact div_nonneg (Real.log_natCast_nonneg _) (Nat.cast_nonneg _)

theorem sum_by_prime (S : Finset D.what₂.places.Pl) (h : ℕ → ℝ) (h0 : ∀ p, 0 ≤ h p) :
    ∑ w ∈ S, SizeData₂.lwP w * (D.what₂.places.ramIdx w : ℝ) * h (D.what₂.places.resChar w) ≤
      ∑ p ∈ S.image D.what₂.places.resChar, Real.log (p : ℝ) * h p := by
  classical
  rw [← Finset.sum_fiberwise_of_maps_to (g := D.what₂.places.resChar) (t := S.image D.what₂.places.resChar)
    (fun w hw => Finset.mem_image_of_mem _ hw)]
  refine Finset.sum_le_sum fun p hp => ?_
  obtain ⟨w0, _, hw0⟩ := Finset.mem_image.1 hp
  have hpp : p.Prime := hw0 ▸ D.what₂.places.resChar_prime w0
  obtain ⟨Sp, hSp⟩ := exists_ovr D p hpp
  have e1 : ∑ w ∈ S.filter (fun w => D.what₂.places.resChar w = p),
      SizeData₂.lwP w * (D.what₂.places.ramIdx w : ℝ) * h (D.what₂.places.resChar w) =
      (∑ w ∈ S.filter (fun w => D.what₂.places.resChar w = p), SizeData₂.lwP w * (D.what₂.places.ramIdx w : ℝ)) * h p := by
    rw [Finset.sum_mul]
    refine Finset.sum_congr rfl fun w hw => ?_
    rw [(Finset.mem_filter.1 hw).2]
  rw [e1]
  refine mul_le_mul_of_nonneg_right ?_ (h0 p)
  rw [← factEtaMean D p hpp Sp hSp]
  exact Finset.sum_le_sum_of_subset_of_nonneg (fun w hw => (hSp w).2 (Finset.mem_filter.1 hw).2)
    fun w _ _ => mul_nonneg (logWeight_nonneg w) (Nat.cast_nonneg _)

theorem sum_val_log_le (n : ℕ) (hn : 0 < n) (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) :
    ∑ p ∈ P, Real.log (p : ℝ) * (padicValNat p n : ℝ) ≤ Real.log (n : ℝ) := by
  classical
  have h1 : (∏ p ∈ P, p ^ padicValNat p n) ∣ n := by
    induction P using Finset.induction_on with
    | empty => simp
    | insert a s ha ih =>
      rw [Finset.prod_insert ha]
      refine Nat.Coprime.mul_dvd_of_dvd_of_dvd ?_ (_root_.Dvd.intro_left _ (_root_.Nat.divMaxPow_mul_pow_padicValNat _ _))
        (ih fun p hp => hP p (Finset.mem_insert_of_mem hp))
      refine Nat.Coprime.prod_right fun q hq => ?_
      exact Nat.Coprime.pow _ _ ((Nat.coprime_primes (hP a (Finset.mem_insert_self _ _))
        (hP q (Finset.mem_insert_of_mem hq))).2 (fun h => ha (h ▸ hq)))
  have h2 : (∏ p ∈ P, p ^ padicValNat p n) ≤ n := Nat.le_of_dvd hn h1
  have h3 : (0 : ℝ) < ((∏ p ∈ P, p ^ padicValNat p n : ℕ) : ℝ) := by
    exact_mod_cast Finset.prod_pos fun p hp => pow_pos (hP p hp).pos _
  calc ∑ p ∈ P, Real.log (p : ℝ) * (padicValNat p n : ℝ)
      = Real.log ((∏ p ∈ P, p ^ padicValNat p n : ℕ) : ℝ) := by
        push_cast
        rw [Real.log_prod (fun p hp => by
          have := (hP p hp).pos
          positivity)]
        refine Finset.sum_congr rfl fun p _ => ?_
        rw [Real.log_pow]; ring
    _ ≤ Real.log (n : ℝ) := Real.log_le_log h3 (by exact_mod_cast h2)


private theorem sum_val_log_with_offset_bounds {n d m : ℕ} (hn : 0 < n) (hd : d.Prime)
    (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) (b : ℝ) :
    let q (p : ℕ) := (m : ℝ) * padicValNat p n + (if p = d then b else 0)
    (∑ p ∈ P, Real.log (p : ℝ) * max 0 (q p)) ≤
      (m : ℝ) * (Real.log (n : ℝ) - Real.log (d : ℝ) * padicValNat d n) +
        Real.log (d : ℝ) * max 0 (q d) ∧
    (∑ p ∈ P, Real.log (p : ℝ) * max 0 (-q p)) ≤ Real.log (d : ℝ) * max 0 (-q d) := by
  intro q
  classical
  let Q := P.erase d
  have hdQ : d ∉ Q := Finset.notMem_erase d P
  have hSubset : P ⊆ insert d Q := by
    intro p hp
    by_cases he : p = d
    · exact Finset.mem_insert.2 (Or.inl he)
    · exact Finset.mem_insert_of_mem (Finset.mem_erase.2 ⟨he, hp⟩)
  have hRest := sum_val_log_le n hn (insert d Q) (fun p hp =>
    (Finset.mem_insert.1 hp).elim (· ▸ hd) (fun h => hP p (Finset.mem_erase.1 h).2))
  rw [Finset.sum_insert hdQ] at hRest
  have hExtend (f : ℕ → ℝ) (hf : ∀ p, 0 ≤ f p) :
      (∑ p ∈ P, Real.log (p : ℝ) * f p) ≤ ∑ p ∈ insert d Q, Real.log (p : ℝ) * f p :=
    Finset.sum_le_sum_of_subset_of_nonneg hSubset fun p _ _ => mul_nonneg (Real.log_natCast_nonneg p) (hf p)
  have qRest (p : ℕ) (hp : p ∈ Q) : q p = (m : ℝ) * padicValNat p n := by
    simp [q, (Finset.mem_erase.1 hp).1]
  constructor
  · refine (hExtend _ (fun _ => le_max_left _ _)).trans ?_
    rw [Finset.sum_insert hdQ]
    have hEq : (∑ p ∈ Q, Real.log (p : ℝ) * max 0 (q p)) =
        (m : ℝ) * ∑ p ∈ Q, Real.log (p : ℝ) * (padicValNat p n : ℝ) := by
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun p hp => ?_
      rw [qRest p hp, max_eq_right (by positivity)]
      ring
    rw [hEq]
    linarith only [mul_le_mul_of_nonneg_left hRest (Nat.cast_nonneg (α := ℝ) m)]
  · refine (hExtend _ (fun _ => le_max_left _ _)).trans ?_
    rw [Finset.sum_insert hdQ, Finset.sum_eq_zero, add_zero]
    intro p hp
    rw [qRest p hp, max_eq_left (neg_nonpos.mpr (by positivity)), mul_zero]

private theorem weighted_sum_le_by_prime (S : Finset D.what₂.places.Pl) (f g : ℕ → ℝ)
    (hfg : ∀ p, f p ≤ g p) (hg : ∀ p, 0 ≤ g p) :
    (∑ w ∈ S, SizeData₂.sz w (f (D.what₂.places.resChar w))) ≤
      2 * ∑ p ∈ S.image D.what₂.places.resChar, Real.log (p : ℝ) * g p := by
  calc
    _ ≤ ∑ w ∈ S, SizeData₂.sz w (g (D.what₂.places.resChar w)) :=
      Finset.sum_le_sum fun w _ => by
        unfold SizeData₂.sz
        exact mul_le_mul_of_nonneg_left
          (mul_le_mul_of_nonneg_left (hfg _) (Nat.cast_nonneg _))
          (mul_nonneg (by norm_num) (logWeight_nonneg w))
    _ = 2 * ∑ w ∈ S, SizeData₂.lwP w * (D.what₂.places.ramIdx w : ℝ) * g (D.what₂.places.resChar w) := by
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun w _ => ?_
      unfold SizeData₂.sz
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_left (sum_by_prime S g hg) (by norm_num)

def stabiliserDiscriminantCost (m n d : ℕ) (b : ℝ) : ℝ :=
  let q := (m : ℝ) * padicValNat d n + b
  max ((m : ℝ) * (Real.log (n : ℝ) - Real.log (d : ℝ) * padicValNat d n) +
    Real.log (d : ℝ) * max 0 q) (Real.log (d : ℝ) * max 0 (-q))

theorem abs_weighted_val_with_offset_le (S : Finset D.what₂.places.Pl) {m n : ℕ} (hn : 0 < n) (b : ℝ) :
    |∑ w ∈ S, SizeData₂.sz w ((m : ℝ) * padicValNat (D.what₂.places.resChar w) n +
      (if D.what₂.places.resChar w = D.host.d then b else 0))| ≤
      2 * stabiliserDiscriminantCost m n D.host.d b := by
  classical
  let q (p : ℕ) := (m : ℝ) * padicValNat p n + (if p = D.host.d then b else 0)
  have hPr : ∀ p ∈ S.image D.what₂.places.resChar, p.Prime := by
    intro p hp
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.1 hp
    exact D.what₂.places.resChar_prime w
  have ⟨hPos, hNeg⟩ := sum_val_log_with_offset_bounds (m := m) hn D.host.hyp.2.1 _ hPr b
  have hUpper := weighted_sum_le_by_prime S q (fun p => max 0 (q p))
    (fun _ => le_max_right _ _) (fun _ => le_max_left _ _)
  have hLower := weighted_sum_le_by_prime S (fun p => -q p) (fun p => max 0 (-q p))
    (fun _ => le_max_right _ _) (fun _ => le_max_left _ _)
  have hUpper' := hUpper.trans (mul_le_mul_of_nonneg_left hPos (by norm_num))
  have hLower' := hLower.trans (mul_le_mul_of_nonneg_left hNeg (by norm_num))
  simp only [ite_true] at hUpper' hLower'
  change |∑ w ∈ S, SizeData₂.sz w (q (D.what₂.places.resChar w))| ≤ _
  unfold stabiliserDiscriminantCost
  rw [abs_le, mul_max_of_nonneg _ _ (by norm_num : (0 : ℝ) ≤ 2)]
  constructor
  · simp only [SizeData₂.sz, mul_neg, Finset.sum_neg_distrib] at hLower'
    exact neg_le.1 (hLower'.trans (le_max_right _ _))
  · exact hUpper'.trans (le_max_left _ _)


open Classical in
def EatCI (L : SizeData₂ D) (K : Consts) (c : ErrC) (j p : ℕ) : ℝ :=
  if IsResidueClassZero D p ∧ hP D p = 0 then EatC L c j p else EatI L K c j p

def LevelPrimeBudget (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop := ∀ u, Formalism.MainNotions.product_first_zeroth_parts.WeightBudgetBound D u L C

def StabiliserLogBound (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop := ∀ u, 2 * Real.log ((D.mem u).C.DGam : ℝ) ≤ C * L.B0

def DiscriminantOffsetBound (D : D7) (L : SizeData₂ D) (Cneg Cpos : ℝ) : Prop :=
  ∀ u, ∀ j ∈ SizeData₂.lifts D,
    -(Cneg * L.B0) ≤ 2 * Real.log (D.host.d : ℝ) * EatD D u j ∧
    2 * Real.log (D.host.d : ℝ) * EatD D u j ≤ Cpos * L.B0

def StabiliserDiscriminantBound (D : D7) (L : SizeData₂ D) (C : ℝ) : Prop :=
  ∀ u, 2 * stabiliserDiscriminantCost D.R.m (D.mem u).C.DGam D.host.d
    (∑ j ∈ SizeData₂.lifts D, EatD D u j) ≤ C * (D.R.m : ℝ) * L.B0

theorem stabiliserDiscriminantBound_of_separate {L : SizeData₂ D} {CG Cneg Cpos : ℝ}
    (hn : 0 ≤ Cneg) (hp : 0 ≤ Cpos) (hG : StabiliserLogBound D L CG)
    (hD : DiscriminantOffsetBound D L Cneg Cpos) :
    StabiliserDiscriminantBound D L (max (CG + Cpos) Cneg) := by
  intro u
  let m : ℝ := D.R.m
  let dlog := Real.log (D.host.d : ℝ)
  let a : ℝ := padicValNat D.host.d (D.mem u).C.DGam
  let b := ∑ j ∈ SizeData₂.lifts D, EatD D u j
  have hm : 0 ≤ m := Nat.cast_nonneg _
  have hd : 0 ≤ dlog := Real.log_natCast_nonneg _
  have ha : 0 ≤ m * a := mul_nonneg hm (Nat.cast_nonneg _)
  have hB := loss_bound_nonneg L
  have hup : 2 * dlog * b ≤ m * (Cpos * L.B0) := by
    rw [show b = _ from rfl, Finset.mul_sum]
    exact sum_lifts_le fun j hj => (hD u j hj).2
  have hlo : -(m * (Cneg * L.B0)) ≤ 2 * dlog * b := by
    rw [show b = _ from rfl, Finset.mul_sum]
    have h := sum_lifts_le (D := D) (f := fun j => -(2 * dlog * EatD D u j))
      (fun j hj => neg_le.2 (hD u j hj).1)
    simpa only [Finset.sum_neg_distrib, neg_neg] using neg_le_neg h
  have hLog := mul_le_mul_of_nonneg_left (hG u) hm
  have dpos : 2 * dlog * max 0 (m * a + b) ≤ 2 * dlog * (m * a) + m * (Cpos * L.B0) := by
    rw [mul_max_of_nonneg _ _ (mul_nonneg (by norm_num) hd), mul_zero]
    have h1 := mul_nonneg (mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) hd) ha
    have h2 := mul_nonneg hm (mul_nonneg hp hB)
    exact max_le (by linarith only [h1, h2]) (by linarith only [hup])
  have dneg : 2 * dlog * max 0 (-(m * a + b)) ≤ m * (Cneg * L.B0) := by
    rw [mul_max_of_nonneg _ _ (mul_nonneg (by norm_num) hd), mul_zero]
    refine max_le (mul_nonneg hm (mul_nonneg hn hB)) ?_
    have h1 := mul_nonneg (mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) hd) ha
    linarith only [hlo, h1]
  change 2 * max (m * (Real.log ((D.mem u).C.DGam : ℝ) - dlog * a) +
      dlog * max 0 (m * a + b)) (dlog * max 0 (-(m * a + b))) ≤ max (CG + Cpos) Cneg * m * L.B0
  rw [mul_max_of_nonneg _ _ (by norm_num : (0 : ℝ) ≤ 2), max_mul_of_nonneg _ _ hm, max_mul_of_nonneg _ _ hB]
  exact max_le_max (by linarith only [dpos, hLog]) (by linarith only [dneg])

def InertPrimeLossBound (D : D7) (L : SizeData₂ D) (K : Consts) (c : ErrC) (C : ℝ) : Prop :=
  ∀ j ∈ SizeData₂.lifts D, ∀ P : Finset ℕ,
    (∀ p ∈ P, p.Prime ∧ (IsResidueClassZero D p ∨ IsSg D p) ∧ (p : ℝ) ≤ L.sc.X'' D.R.n) →
    ∑ p ∈ P, 2 * Real.log (p : ℝ) * |EatCI L K c j p| ≤ C * L.B0


open Classical in
private def inertOffset (L : SizeData₂ D) (K : Consts) (c : ErrC) (j p : ℕ) : ℝ :=
  if (IsResidueClassZero D p ∨ IsSg D p) ∧ (p : ℝ) ≤ L.sc.X'' D.R.n then EatCI L K c j p else 0

private theorem Eval_off (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC) (u : D.what₂.Word) (j : ℕ)
    (w : D.what₂.places.Pl) (hT : D.what₂.places.resChar w ≠ (D.mem u).A.T)
    (hg : D.what₂.places.resChar w ∉ L.gTypes) :
    Eval L X K c u j w = ((padicValNat (D.what₂.places.resChar w) (D.mem u).C.DGam : ℝ) +
      (if D.what₂.places.resChar w = D.host.d then EatD D u j else 0)) +
        inertOffset L K c j (D.what₂.places.resChar w) := by
  have h0 : D.what₂.places.resChar w ≠ D.host.g 0 := fun h => hg (by simp [SizeData₂.gTypes, h])
  have h1 : D.what₂.places.resChar w ≠ D.host.g 1 := fun h => hg (by simp [SizeData₂.gTypes, h])
  have hram : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD ↔ D.what₂.places.resChar w = D.host.d :=
    primeClass_eq_ramD_iff D.host.toHostRaw
  simp only [Eval, inertOffset, EatCI, ite_eq_right hT, ite_eq_right h0, ite_eq_right h1, hram]
  by_cases hd : D.what₂.places.resChar w = D.host.d
  · have hr := hram.2 hd
    have hI : ¬ (IsResidueClassZero D (D.what₂.places.resChar w) ∨ IsSg D (D.what₂.places.resChar w)) := by
      change ¬ (D.host.cls (D.what₂.places.resChar w) = PrimeClass.inertClass ∨
        D.host.cls (D.what₂.places.resChar w) = PrimeClass.signal)
      simp [hr]
    have hInert : ¬ ((IsResidueClassZero D (D.what₂.places.resChar w) ∨ IsSg D (D.what₂.places.resChar w)) ∧
        (D.what₂.places.resChar w : ℝ) ≤ L.sc.X'' D.R.n) := fun h => hI h.1
    simp only [ite_eq_left hd, ite_eq_right hInert, add_zero]
  · simp [hd]

private theorem abs_sz (w : D.what₂.places.Pl) (y : ℝ) :
    |SizeData₂.sz w y| = SizeData₂.sz w |y| := by
  unfold SizeData₂.sz
  simp only [abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2), abs_of_nonneg (logWeight_nonneg w),
    abs_of_nonneg (Nat.cast_nonneg (α := ℝ) (D.what₂.places.ramIdx w))]

theorem C2off_of (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC) (CT CGD CI : ℝ)
    (hE : L.EDef X K c) (hT : LevelPrimeBudget D L CT) (hGD : StabiliserDiscriminantBound D L CGD)
    (hI : InertPrimeLossBound D L K c CI) : C2off D L (CT + CGD + CI) := by
  classical
  intro u
  let S := L.supp.filter (fun w => D.what₂.places.resChar w ∉ L.gTypes)
  let Slevel := S.filter (fun w => D.what₂.places.resChar w = (D.mem u).A.T)
  let Srest := S.filter (fun w => ¬ D.what₂.places.resChar w = (D.mem u).A.T)
  let P := Srest.image D.what₂.places.resChar
  let offset := ∑ j ∈ SizeData₂.lifts D, EatD D u j
  let q (w : D.what₂.places.Pl) := (D.R.m : ℝ) * padicValNat (D.what₂.places.resChar w) (D.mem u).C.DGam +
    (if D.what₂.places.resChar w = D.host.d then offset else 0)
  have hLevel : ∀ j ∈ SizeData₂.lifts D, 0 ≤ ∑ w ∈ Slevel, SizeData₂.sz w (L.E u j w) ∧
      ∑ w ∈ Slevel, SizeData₂.sz w (L.E u j w) ≤ CT * L.B0 := by
    intro j hj
    have he : (∑ w ∈ Slevel, SizeData₂.sz w (L.E u j w)) =
        ∑ w ∈ Slevel, SizeData₂.sz w (EatT D u w) := by
      apply Finset.sum_congr rfl
      intro w hw
      rw [hE u j hj w, Eval, ite_eq_left (Finset.mem_filter.1 hw).2]
    rw [he]
    have hb := (hT u).1 Slevel (fun w hw => (Finset.mem_filter.1 hw).2)
    exact ⟨hb.1, hb.2.trans (hT u).2⟩
  have hLevel0 : 0 ≤ totalErrorOn L u Slevel := Finset.sum_nonneg fun j hj => (hLevel j hj).1
  have hLevelLe : totalErrorOn L u Slevel ≤ (D.R.m : ℝ) * (CT * L.B0) :=
    sum_lifts_le fun j hj => (hLevel j hj).2
  have hSplit : totalErrorOn L u S = totalErrorOn L u Slevel + totalErrorOn L u Srest := by
    unfold totalErrorOn
    rw [← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun j _ => (Finset.sum_filter_add_sum_filter_not S _ _).symm
  have hRest : totalErrorOn L u Srest = (∑ w ∈ Srest, SizeData₂.sz w (q w)) +
      ∑ j ∈ SizeData₂.lifts D, ∑ w ∈ Srest, SizeData₂.sz w (inertOffset L K c j (D.what₂.places.resChar w)) := by
    unfold totalErrorOn
    calc
      _ = ∑ j ∈ SizeData₂.lifts D, ∑ w ∈ Srest,
          (SizeData₂.sz w ((padicValNat (D.what₂.places.resChar w) (D.mem u).C.DGam : ℝ) +
            (if D.what₂.places.resChar w = D.host.d then EatD D u j else 0)) +
            SizeData₂.sz w (inertOffset L K c j (D.what₂.places.resChar w))) := by
        refine Finset.sum_congr rfl fun j hj => Finset.sum_congr rfl fun w hw => ?_
        have hr := Finset.mem_filter.1 hw
        rw [hE u j hj w, Eval_off L X K c u j w hr.2 (Finset.mem_filter.1 hr.1).2]
        unfold SizeData₂.sz
        ring
      _ = _ := by
        simp only [Finset.sum_add_distrib]
        congr 1
        rw [Finset.sum_comm]
        refine Finset.sum_congr rfl fun w _ => ?_
        unfold SizeData₂.sz q
        simp only [← Finset.mul_sum]
        rw [Finset.sum_add_distrib, sum_const_lifts]
        split_ifs <;> simp [offset]
  have hVal : |∑ w ∈ Srest, SizeData₂.sz w (q w)| ≤ CGD * (D.R.m : ℝ) * L.B0 :=
    (abs_weighted_val_with_offset_le Srest (D.mem u).C.DGam_pos offset).trans (hGD u)
  have hP : ∀ p ∈ P, p.Prime := by
    intro p hp
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.1 hp
    exact D.what₂.places.resChar_prime w
  have hInert : |∑ j ∈ SizeData₂.lifts D, ∑ w ∈ Srest, SizeData₂.sz w
      (inertOffset L K c j (D.what₂.places.resChar w))| ≤ (D.R.m : ℝ) * (CI * L.B0) := by
    apply abs_sum_lifts_le
    intro j hj
    refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
    simp only [abs_sz]
    refine (weighted_sum_le_by_prime Srest (fun p => |inertOffset L K c j p|) _
      (fun _ => le_rfl) (fun _ => abs_nonneg _)).trans ?_
    change 2 * (∑ p ∈ P, Real.log (p : ℝ) * |inertOffset L K c j p|) ≤ _
    simp only [inertOffset, apply_ite abs, abs_zero, Finset.mul_sum, mul_ite, mul_zero, ← Finset.sum_filter, ← mul_assoc]
    exact hI j hj _ fun p hp => ⟨hP p (Finset.mem_filter.1 hp).1, (Finset.mem_filter.1 hp).2⟩
  change |totalErrorOn L u S| ≤ _
  rw [hSplit, hRest, ← add_assoc]
  have h1 := abs_add_le (totalErrorOn L u Slevel) (∑ w ∈ Srest, SizeData₂.sz w (q w))
  rw [abs_of_nonneg hLevel0] at h1
  have h2 := abs_add_le (totalErrorOn L u Slevel + ∑ w ∈ Srest, SizeData₂.sz w (q w))
    (∑ j ∈ SizeData₂.lifts D, ∑ w ∈ Srest, SizeData₂.sz w (inertOffset L K c j (D.what₂.places.resChar w)))
  linarith only [h1, h2, hLevelLe, hVal, hInert]

def SecondComplementInputs (D : D7) (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC) (Cdeg Cg CT CGD CI : ℝ) : Prop :=
  LevelPrimeNotTypePrime D ∧ NormDecompositionCond D X ∧ DegreeCountBound D L Cdeg ∧ TypePrimeSizeBound D L c Cdeg Cg ∧
    LevelPrimeBudget D L CT ∧ StabiliserDiscriminantBound D L CGD ∧ InertPrimeLossBound D L K c CI

theorem secondComplement_of_inputs (L : SizeData₂ D) (X : ErrX D) (K : Consts) (c : ErrC) (Cdeg Cg CT CGD CI : ℝ) (hc : c.Large)
    (hE : L.EDef X K c) (h : SecondComplementInputs D L X K c Cdeg Cg CT CGD CI) :
    IsotypicRank D L (2 * Cg + (CT + CGD + CI)) := by
  obtain ⟨a1, a2, a3, a4, a5, a6, a7⟩ := h
  exact secondComplement_of_split L Cg _ (C2atG_of L X K c Cdeg Cg hc hE a1 a2 a3 a4) (C2off_of L X K c CT CGD CI hE a5 a6 a7)

def FamilySecondComplementInputs {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) : Prop :=
  ∃ Cdeg Cg CT CGD CI x0 : ℝ, ∀ x, x0 ≤ x → ∀ hx : Fm.x1 < x, ∀ i : Fm.Ix x,
    SecondComplementInputs (Fm.D x i) (Fm.L x i) (Fm.ex x hx i).errX Fm.GK Fm.cX.err Cdeg Cg CT CGD CI

def familySecondComplement {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) : Prop :=
  ∃ C x0 : ℝ, ∀ x, x0 ≤ x → Fm.x1 < x → ∀ i : Fm.Ix x, IsotypicRank (Fm.D x i) (Fm.L x i) C

theorem secondComplement_family_of_inputs {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) (h : FamilySecondComplementInputs Fm) : familySecondComplement Fm := by
  obtain ⟨Cdeg, Cg, CT, CGD, CI, x0, h⟩ := h
  exact ⟨_, x0, fun x hx0 hx i => secondComplement_of_inputs (Fm.L x i) (Fm.ex x hx i).errX Fm.GK Fm.cX.err Cdeg Cg CT CGD CI
    (Fm.ex x hx i).err.large (Fm.ex x hx i).err.edef (h x hx0 hx i)⟩

end PartA

section PartB

open scoped BigOperators
open NumberField IsDedekindDomain Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.MainNotions.G Formalism.MainNotions.WeilJacquetShalikaLaw

def PairAtT (D : D7) (Dx : DivX D) (T : TwForms D) : Prop :=
  DGamDef D → (∀ u (w : D.what₂.places.Pl), D.what₂.places.resChar w = (D.mem u).A.T →
    ∀ z ∈ locW D.what₂.places w ((D.fm u).lat D.R.m).L,
    ∀ F ∈ (D.what₂.Mtilde D.what₂.mu0).carrier, F ∈ D.what₂.V0 D.what₂.mu0 →
      ∃ y : D.what₂.LL, D.what₂.embLL y = (D.mem u).P.Ptil ((D.fm u).emb D.R.m z) ((D.eMt u).symm F) ∧
        (y = 0 ∨ -ur D w (vDG D u w) ≤ (vAdd (D.plEq w) y : ℝ))) ∧
  ∀ u μ, μ ≠ D.what₂.mu0 → ∀ w : D.what₂.places.Pl, D.what₂.places.resChar w = (D.mem u).A.T →
    D.what₂.places.resChar w ∉ Dx.Qp μ → ∀ z ∈ locW D.what₂.places w ((T.fm u μ).lat D.R.m).L,
    ∀ F ∈ (D.what₂.Mtilde μ).carrier, F ∈ D.what₂.V0 μ →
      ∃ y : D.what₂.LL, D.what₂.embLL y = (D.PTw u μ).Ptil ((T.fm u μ).emb D.R.m z) ((D.eMtTw u μ).symm F) ∧
        (y = 0 ∨ -ur D w (vDG D u w) ≤ (vAdd (D.plEq w) y : ℝ))

def MemberChainIntegral (D : D7) : Prop := ∀ u, Formalism.MainNotions.product_first_zeroth_parts.Conclusion6 D u

def TwistedChainIntegral (D : D7) (T : TwForms D) : Prop :=
  ∀ u μ, μ ≠ D.what₂.mu0 → ∃ h : (T.fm u μ).PRat, (T.fm u μ).PtilIntegral h

def PeriodClassSumWeyl (D : D7) : Prop :=
  DGamDef D → ∀ u, ∀ x ∈ (D.fm u).ptLat.L, ∀ F ∈ (D.what₂.Mtilde D.what₂.mu0).carrier, F ∈ D.what₂.V0 D.what₂.mu0 →
    ∃ y : D.what₂.LL, D.what₂.embLL y = (D.mem u).P.period ((D.fm u).ptEmb x) ((D.eMt u).symm F) ∧
      ∀ w : D.what₂.places.Pl, y = 0 ∨ -ur D w (vDG D u w) ≤ (vAdd (D.plEq w) y : ℝ)

def TwistedPeriodIntegral (D : D7) (Dx : DivX D) (T : TwForms D) : Prop :=
  DGamDef D → ∀ u μ, μ ≠ D.what₂.mu0 → ∀ x ∈ (T.fm u μ).ptLat.L, ∀ F ∈ (D.what₂.Mtilde μ).carrier, F ∈ D.what₂.V0 μ →
    ∃ y : D.what₂.LL, D.what₂.embLL y = (D.PTw u μ).period ((T.fm u μ).ptEmb x) ((D.eMtTw u μ).symm F) ∧
      ∀ w : D.what₂.places.Pl, D.what₂.places.resChar w ∉ Dx.Qp μ →
        y = 0 ∨ -ur D w (vDG D u w) ≤ (vAdd (D.plEq w) y : ℝ)

theorem pair_add_ge (D : D7) (w : D.what₂.places.Pl) {a b : D.what₂.LL} {B : ℝ}
    (ha : a = 0 ∨ B ≤ (vAdd (D.plEq w) a : ℝ)) (hb : b = 0 ∨ B ≤ (vAdd (D.plEq w) b : ℝ)) :
    a + b = 0 ∨ B ≤ (vAdd (D.plEq w) (a + b) : ℝ) := by
  rcases ha with rfl | ha
  · simpa using hb
  rcases hb with rfl | hb
  · simpa using Or.inr ha
  by_cases ha0 : a = 0
  · subst ha0; simpa using Or.inr hb
  by_cases hb0 : b = 0
  · subst hb0; simpa using Or.inr ha
  by_cases hab : a + b = 0
  · exact Or.inl hab
  right
  have h := (D.what₂.places.val w).map_add a b
  rw [D.val_eq w _ ha0, D.val_eq w _ hb0, D.val_eq w _ hab] at h
  have h' : min (vAdd (D.plEq w) a) (vAdd (D.plEq w) b) ≤ vAdd (D.plEq w) (a + b) := by
    rcases le_total (vAdd (D.plEq w) a) (vAdd (D.plEq w) b) with h1 | h1
    · rw [min_eq_left h1]
      rw [min_eq_left (by exact_mod_cast h1)] at h
      exact_mod_cast h
    · rw [min_eq_right h1]
      rw [min_eq_right (by exact_mod_cast h1)] at h
      exact_mod_cast h
  have h2 : (min (vAdd (D.plEq w) a) (vAdd (D.plEq w) b) : ℝ) ≤ (vAdd (D.plEq w) (a + b) : ℝ) := by
    exact_mod_cast h'
  exact le_trans (le_min ha hb) h2

theorem pair_smul_ge (D : D7) (w : D.what₂.places.Pl) {r b : D.what₂.LL} {B : ℝ}
    (hr : r ∈ intW D.what₂.places w) (hb : b = 0 ∨ B ≤ (vAdd (D.plEq w) b : ℝ)) :
    r * b = 0 ∨ B ≤ (vAdd (D.plEq w) (r * b) : ℝ) := by
  rcases hb with rfl | hb
  · left; simp
  by_cases hr0 : r = 0
  · left; simp [hr0]
  by_cases hb0 : b = 0
  · left; simp [hb0]
  right
  rw [vAdd_mul' _ hr0 hb0]
  have h0 : (0 : WithTop ℤ) ≤ D.what₂.places.val w r := hr
  rw [D.val_eq w _ hr0] at h0
  have h1 : (0 : ℤ) ≤ vAdd (D.plEq w) r := by exact_mod_cast h0
  have h2 : (0 : ℝ) ≤ (vAdd (D.plEq w) r : ℝ) := by exact_mod_cast h1
  push_cast
  linarith

theorem pair_core (D : D7) (w : D.what₂.places.Pl) {V : Type} [AddCommGroup V] [Module D.what₂.LL V] [Module (𝓞 D.what₂.LL) V]
    (Λ : Submodule (𝓞 D.what₂.LL) V) (g : V →ₛₗ[D.what₂.embLL] ℂ) (B : ℝ)
    (h : ∀ x ∈ Λ, ∃ y : D.what₂.LL, D.what₂.embLL y = g x ∧ (y = 0 ∨ B ≤ (vAdd (D.plEq w) y : ℝ))) :
    ∀ z ∈ locW D.what₂.places w Λ, ∃ y : D.what₂.LL, D.what₂.embLL y = g z ∧ (y = 0 ∨ B ≤ (vAdd (D.plEq w) y : ℝ)) := by
  intro z hz
  unfold locW at hz
  induction hz using Submodule.span_induction with
  | mem x hx => exact h x hx
  | zero => exact ⟨0, by simp, Or.inl rfl⟩
  | add x y _ _ hx hy =>
    obtain ⟨a, ha, ha'⟩ := hx
    obtain ⟨b, hb, hb'⟩ := hy
    exact ⟨a + b, by rw [map_add (f := _), map_add (f := _), ha, hb], pair_add_ge D w ha' hb'⟩
  | smul r x _ hx =>
    obtain ⟨a, ha, ha'⟩ := hx
    refine ⟨(r : D.what₂.LL) * a, ?_, pair_smul_ge D w r.2 ha'⟩
    rw [map_mul, ha, Subring.smul_def, LinearMap.map_smulₛₗ]
    rfl

def LevelPrimeCoprimeStabiliser (D : D7) : Prop := ∀ u, ¬ (D.mem u).A.T ∣ (D.mem u).C.DGam

def LevelPrimeSizes (D : D7) (L : SizeData₂ D) : Prop := ∀ u, Formalism.MainNotions.product_first_zeroth_parts.ETDef D u L

def ServedHasModel {D : D7} {L : SizeData₂ D} (X : Inst D L) (K : Consts) : Prop :=
  ∀ u (w : D.what₂.places.Pl), D.what₂.places.resChar w ≠ (D.mem u).A.T →
    VV X K (aL L) (bL L) (D.what₂.places.resChar w) ≠ ∅ → GIdx D.host (D.mem u).A.T (D.what₂.places.resChar w)

def GainLe {D : D7} {L : SizeData₂ D} (X : Inst D L) (K : Consts) : Prop :=
  ∀ (w : D.what₂.places.Pl), ∀ j ∈ SizeData₂.lifts D, L.gainD j w ≤ gainS X K (D.what₂.places.resChar w) j

def NuInM (D : D7) (L : SizeData₂ D) : Prop :=
  ∀ u (w : D.what₂.places.Pl), D.what₂.places.resChar w ≠ (D.mem u).A.T → LocLe (D.plEq w) 0 (L.NuLat u) (MramL D u)

def L2BoundAlt (D : D7) (L : SizeData₂ D) : Prop := Formalism.MainNotions.LocalQuadraticParts.adm2 D L

def FourthComplement (D : D7) (L : SizeData₂ D) : Prop := Formalism.MainNotions.LocalQuadraticParts.adm12 D L

variable {D : D7} {L : SizeData₂ D}

theorem sg_atT (hE : LevelPrimeSizes D L) (u : D.what₂.Word) (w : D.what₂.places.Pl)
    (hw : D.what₂.places.resChar w = (D.mem u).A.T) : L.sg u w = -((D.R.m : ℝ) * EatT D u w) := by
  unfold SizeData₂.sg
  have h : ∀ j ∈ SizeData₂.lifts D, L.gainD j w + L.F j w - L.E u j w = -EatT D u w := by
    intro j hj
    obtain ⟨h1, h2, h3⟩ := (hE u w hw).2 j hj
    have h4 : L.gainD j w = 0 := by
      unfold SizeData₂.gainD
      split_ifs
      · rfl
      · exact h1
    rw [h4, h2, h3]
    simp
  rw [Finset.sum_congr rfl h, Finset.sum_const]
  simp [SizeData₂.lifts]

theorem gainLe_of_fills {X : Inst D L} {K : Consts} (hF : ∀ w, ParametersFill X K w)
    (hcs : ∀ p : ℕ, p.Prime → IsCs D p → p ∈ L.drop) : GainLe X K :=
  fun w j hj => WeilJacquetShalikaLaw.gainD_le_gainS hF hcs w j hj

theorem inv_mem_intW (D : D7) (w : D.what₂.places.Pl) (s : 𝓞 D.what₂.LL) (hs : s ∉ (D.plEq w).asIdeal) :
    ((s : D.what₂.LL))⁻¹ ∈ intW D.what₂.places w := by
  have hs0 : (s : D.what₂.LL) ≠ 0 := by
    intro h
    apply hs
    have : s = 0 := by exact_mod_cast h
    rw [this]; exact Submodule.zero_mem _
  show (0 : WithTop ℤ) ≤ D.what₂.places.val w ((s : D.what₂.LL))⁻¹
  rw [D.val_eq w _ (inv_ne_zero hs0)]
  have h1 : (D.plEq w).valuation D.what₂.LL (s : D.what₂.LL) = 1 := by
    have := (D.plEq w).valuation_of_algebraMap (K := D.what₂.LL) s
    rw [show (s : D.what₂.LL) = algebraMap (𝓞 D.what₂.LL) D.what₂.LL s from rfl, this]
    exact (HeightOneSpectrum.intValuation_eq_one_iff).2 hs
  have h2 : vAdd (D.plEq w) ((s : D.what₂.LL))⁻¹ = 0 := by
    unfold vAdd
    rw [map_inv₀, h1]
    simp
  rw [h2]
  rfl

theorem nuIn_mem_Sram_loc (u : D.what₂.Word) (w : D.what₂.places.Pl) (φ : (D.div.Nu u).V)
    (h : LocLe (D.plEq w) 0 (L.NuLat u) (MramL D u)) (hφ : φ ∈ L.NuLat u) : D.nuIn u φ ∈ LT.Sram D u w := by
  obtain ⟨s, hs, hm⟩ := h φ hφ
  rw [pow_zero, Ideal.one_eq_top, Submodule.top_smul] at hm
  have h1 := nuIn_mem_Sram D u w (s • φ) hm
  have h2 := (LT.Sram D u w).smul_mem ⟨_, inv_mem_intW D w s hs⟩ h1
  have hs0 : (s : D.what₂.LL) ≠ 0 := by
    intro h
    apply hs
    have : s = 0 := by exact_mod_cast h
    rw [this]; exact Submodule.zero_mem _
  have h3 : (⟨_, inv_mem_intW D w s hs⟩ : intW D.what₂.places w) • D.nuIn u (s • φ) = D.nuIn u φ := by
    rw [Subring.smul_def, ← algebraMap_smul D.what₂.LL s φ, map_smul, smul_smul]
    show (((s : D.what₂.LL))⁻¹ * (s : D.what₂.LL)) • D.nuIn u φ = D.nuIn u φ
    rw [inv_mul_cancel₀ hs0, one_smul]
  rw [h3] at h2
  exact h2

def PerColSmul (D : D7) : Prop :=
  ∀ u (μ : D.what₂.Tup) (c : ℂ) (φ : D.what₂.Mu u) (F : D.what₂.Amb μ), D.what₂.perCol u μ (c • φ) F = c * D.what₂.perCol u μ φ F

def SgAtG (D : D7) (L : SizeData₂ D) (Xe : ErrX D) (C1 : ℝ) : Prop :=
  ∀ (i : Fin 2) (w : D.what₂.places.Pl), D.what₂.places.resChar w = D.host.g i → ∀ u : D.what₂.Word,
    D.what₂.places.resChar w ≠ (D.mem u).A.T →
      (∑ j ∈ SizeData₂.lifts D, (L.F j w - L.E u j w)) ≤ -(∑ j ∈ Formalism.MainNotions.LiftErrorLocal.lifts D, vNN Xe i u j w) - C1 * Formalism.MainNotions.LiftErrorLocal.errC D L

theorem sg_atG (u : D.what₂.Word) (w : D.what₂.places.Pl) (hg : D.what₂.places.resChar w ∈ ({D.host.g 0, D.host.g 1} : Finset ℕ)) :
    L.sg u w = ∑ j ∈ SizeData₂.lifts D, (L.F j w - L.E u j w) := by
  unfold SizeData₂.sg
  refine Finset.sum_congr rfl fun j _ => ?_
  have h0 : L.gainD j w = 0 := by
    unfold SizeData₂.gainD
    split_ifs
    · rfl
    · exact L.gain_g j w hg
  rw [h0, zero_add]

theorem mem_gTypes_of (w : D.what₂.places.Pl) (i : Fin 2) (hi : D.what₂.places.resChar w = D.host.g i) :
    D.what₂.places.resChar w ∈ ({D.host.g 0, D.host.g 1} : Finset ℕ) := by
  rw [hi]; fin_cases i <;> simp

section Fam

variable {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)

def familySizeBoundAtTypePrime (C1 : ℝ) : Prop :=
  ∃ x0 : ℝ, ∀ x (hx : Fm.x1 < x), x0 ≤ x → ∀ i : Fm.Ix x, SgAtG (Fm.D x i) (Fm.L x i) (Fm.ex x hx i).errX C1

end Fam

end PartB

section PartC

open Formalism.BasicNotions NumberField

section Arch

variable {D : D7} {T : ThetaX D}

structure LocC (X : ZetaProductPairs.Loc D T) where

  Vc : D.what₂.Word → Type
  [acVc : ∀ u, AddCommGroup (Vc u)]
  [moVc : ∀ u, Module ℂ (Vc u)]

  VD : D.what₂.Word → Type
  [acVD : ∀ u, AddCommGroup (VD u)]
  [moVD : ∀ u, Module ℂ (VD u)]

  ell : ∀ u, Vc u →ₗ[ℂ] VD u →ₗ[ℂ] ℂ

  vOf : ∀ u, X.ArchDat u → Vc u

  TOf : ∀ u, X.ArchDat u → VD u

  ellT_eq : ∀ u da, X.ellT u da = ell u (vOf u da) (TOf u da)

  v_free : ∀ u (v : Vc u) (da : X.ArchDat u), ∃ da', vOf u da' = v ∧ TOf u da' = TOf u da

attribute [instance] LocC.acVc LocC.moVc LocC.acVD LocC.moVD

end Arch

section Rat

variable (D : D7)

def RationalMapValues : Prop :=
  ∀ u (φ : (D.div.Nu u).V) (x : D.div.RR.V), ∃ y : D.what₂.LL, D.what₂.embLL y = D.what₂.Bu u (D.jN u φ) (D.jEE x)


end Rat

section C5

variable {D : D7} {T : ThetaX D}

end C5

section Family

variable {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)
  (XF : ∀ x (hx : Fm.x1 < x) (i : Fm.Ix x), ZetaProductPairs.Loc (Fm.D x i) (Fm.ex x hx i).th)

end Family

end PartC

section PartE

open Formalism.BasicNotions NumberField IsDedekindDomain

section Lat

variable {K : Type} [Field K] [NumberField K] {V : Type} [AddCommGroup V] [Module K V] [Module (𝓞 K) V]
  [IsScalarTower (𝓞 K) K V]

end Lat

section Form

variable {K : Type} [Field K] {σ : K →+* ℂ} {V : Type} [AddCommGroup V] [Module K V]
  {E : Type} [AddCommGroup E] [Module ℂ E] {ι : Type} [Fintype ι] [DecidableEq ι]
  (b : Module.Basis ι K V) (j : V →ₛₗ[σ] E)

end Form

section Side

variable {D : D7} {EE : Type} [NormedAddCommGroup EE] [InnerProductSpace ℂ EE] [FiniteDimensional ℂ EE]
  (S : RowSide D EE)

end Side

section SideAI

variable {D : D7} {EE : Type} [NormedAddCommGroup EE] [InnerProductSpace ℂ EE] [FiniteDimensional ℂ EE]
  (S : RowSide D EE)

end SideAI

section Fam

variable {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)

end Fam

end PartE

section PartEJ

open Formalism.BasicNotions NumberField IsDedekindDomain

end PartEJ

section PartF

open Formalism.BasicNotions Formalism.BasicNotions.DV

variable (D : D7)




end PartF

section PartF2

open Formalism.BasicNotions Formalism.BasicNotions.DV

variable (D : D7)

section Fam

variable {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)

end Fam


section IV

open NumberField IsDedekindDomain

variable {D}

theorem vAdd_lpow (D : D7) (w : D.what₂.places.Pl) (k : ℕ) :
    vAdd (D.plEq w) ((((D.what₂.places.resChar w : ℕ) : 𝓞 D.what₂.LL) ^ k : 𝓞 D.what₂.LL) : D.what₂.LL) =
      (D.what₂.places.ramIdx w : ℤ) * k := by
  have hl : ((D.what₂.places.resChar w : ℕ) : D.what₂.LL) ≠ 0 :=
    Nat.cast_ne_zero.mpr (D.what₂.places.resChar_prime w).ne_zero
  have hne : ((D.what₂.places.resChar w : ℕ) : D.what₂.LL) ^ k ≠ 0 := pow_ne_zero _ hl
  have e1 : ((((D.what₂.places.resChar w : ℕ) : 𝓞 D.what₂.LL) ^ k : 𝓞 D.what₂.LL) : D.what₂.LL) =
      ((D.what₂.places.resChar w : ℕ) : D.what₂.LL) ^ k := by simp
  rw [e1]
  have h1 := D.val_eq w _ hne
  rw [AddValuation.map_pow, D.what₂.places.val_resChar] at h1
  have h2 : (((k • ((D.what₂.places.ramIdx w : ℕ) : ℤ)) : ℤ) : WithTop ℤ) =
      ((vAdd (D.plEq w) (((D.what₂.places.resChar w : ℕ) : D.what₂.LL) ^ k) : ℤ) : WithTop ℤ) := by
    rw [WithTop.coe_nsmul]; exact h1
  rw [← WithTop.coe_inj.mp h2, nsmul_eq_mul]
  ring

end IV



section FamJ

variable {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)


end FamJ

end PartF2

end Formalism.MainNotions.WeightDegreeSizes

end
