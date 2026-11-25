module

import Lean
import all Formalism.LocalToGlobal.Divisibility.RecBridge
import all Formalism.LocalToGlobal.GroupLattices.AdmissibleAtGeneratorPlaces
import all Formalism.SharpRestriction.GrowthBounds.WeilJacquetShalikaLaw
import all Formalism.LocalRingCardinality.CoeNeZeroOfNotMem
import all Formalism.LocalRingCardinality.ConjSqrtMinusD
import all Formalism.LocalToGlobal.GroupLattices.JointServices.VAddEqVw
import all Formalism.QuotientMetricDivisors.HermitianTwistDivisors.TwistedLatticeNaturality

open Lean Elab Command
open NumberField IsDedekindDomain Formalism.DivisionValues Formalism.L2.DIV
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.BasicNotions.RowWeightLemmas
open Formalism.FrobeniusOrbits Formalism.MainNotions.G
open Formalism.MainNotions.WeilJacquetShalikaLaw
open Formalism.L2.G.Adm2InU Formalism.MainNotions.WeightDegreeSizes
open scoped BigOperators

namespace RamifiedPeriodThresholdAudit

open Classical in
theorem row_cutoff_is_natural (D : D7) (u : D.what₂.Word) (j : ℕ)
    (hj : j ∈ SizeData₂.lifts D) (t : HH D) : ∃ n : ℕ, ctD D u j t = n := by
  obtain ⟨hj1, hjm⟩ := Finset.mem_Icc.mp hj
  have hi : j - 1 < D.R.m := by omega
  have hnext : j - 1 + 1 = j := by omega
  have hN : 0 < D.R.N (j - 1) := by
    unfold Ranks.N
    have := D.R.m_add_three_le_k
    omega
  obtain ⟨b, _, hb⟩ := nuRow_nat D u (j - 1) hi (tauPl D (true, t)) 0 hN
  rw [hnext] at hb
  refine ⟨∑ r ∈ Finset.range (D.R.N (j - 1)),
    min (⌊DV.nuRow D u j (tauPl D (false, t)) r⌋₊) b, ?_⟩
  unfold ctD
  rw [Nat.cast_sum]
  refine Finset.sum_congr rfl fun r hr => ?_
  obtain ⟨a, _, ha⟩ := nuRow_nat D u (j - 1) hi (tauPl D (false, t)) r (Finset.mem_range.mp hr)
  rw [hnext] at ha
  simp [ha, hb]

theorem gains_vanish_at_discriminant {D : D7} {L : SizeData₂ D}
    (X : Inst D L) (K : Consts) (j : ℕ) (w : D.what₂.places.Pl)
    (hw : D.what₂.places.resChar w = D.host.d) :
    L.gainD j w = 0 ∧ gainS X K (D.what₂.places.resChar w) j = 0 := by
  have hdvd : D.what₂.places.resChar w ∣ D.host.condN := by
    rw [hw, show D.host.condN = D.host.QS * D.host.q * D.host.d from rfl]
    exact Nat.dvd_mul_left _ _
  have hn := D.host.not_inert_of_dvd (D.what₂.places.resChar_prime w) hdvd
  have hclasses : ¬ (IsResidueClassZero D (D.what₂.places.resChar w) ∨
      IsSg D (D.what₂.places.resChar w)) := hn
  constructor
  · unfold SizeData₂.gainD
    split_ifs
    · rfl
    · exact (L.not_inert w (fun h => hclasses (Or.inr h)) (fun h => hclasses (Or.inl h))).1 j
  · simp [gainS, hclasses]

theorem service_period_threshold_at_discriminant {D : D7} {L : SizeData₂ D}
    {X : Inst D L} {K : Consts} {Xe : ErrX D} {c : ErrC}
    (hE : L.EDef Xe K c) (u : D.what₂.Word) (w : D.what₂.places.Pl)
    (hw : D.what₂.places.resChar w = D.host.d) :
    totS X K Xe c 1 u w - vDG D u w = L.sg u w := by
  unfold totS SizeData₂.sg
  rw [one_mul, add_sub_cancel_right]
  refine Finset.sum_congr rfl fun j hj => ?_
  obtain ⟨hD, hS⟩ := gains_vanish_at_discriminant X K j w hw
  rw [hD, hS, hE u j hj w]
  rfl

theorem ramified_threshold_is_half_integral {D : D7} {L : SizeData₂ D} (X : Inst D L)
    (K : Consts) (Xe : ErrX D) (c : ErrC) (hF : L.FDef) (hE : L.EDef Xe K c)
    (u : D.what₂.Word) (w : D.what₂.places.Pl) (hw : D.what₂.places.resChar w = D.host.d)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) : ∃ n : ℤ, L.sg u w = (n : ℝ) / 2 := by
  have hT : D.what₂.places.resChar w ≠ (D.mem u).A.T := hw.trans_ne (D.T_ne_d u).symm
  have hg0 : D.what₂.places.resChar w ≠ D.host.g 0 := hw.trans_ne (hg 0)
  have hg1 : D.what₂.places.resChar w ≠ D.host.g 1 := hw.trans_ne (hg 1)
  have hgmem : D.what₂.places.resChar w ∉ L.gTypes := by
    simp only [SizeData₂.gTypes, Finset.mem_insert, Finset.mem_singleton]
    exact fun h => h.elim hg0 hg1
  have hD : D.host.cls (D.what₂.places.resChar w) = PrimeClass.ramD :=
    (primeClass_eq_ramD_iff D.host.toHostRaw).mpr hw
  let cut (j : ℕ) : ℕ := ∑ t : HH D, ⌊ctD D u j t⌋₊
  have hcut (j : ℕ) (hj : j ∈ SizeData₂.lifts D) :
      (cut j : ℝ) = ∑ t : HH D, ctD D u j t := by
    unfold cut
    rw [Nat.cast_sum]
    refine Finset.sum_congr rfl fun t _ => ?_
    obtain ⟨n, hn⟩ := row_cutoff_is_natural D u j hj t
    simp [hn]
  let orders (j : ℕ) : ℤ := -(2 * (padicValNat (D.what₂.places.resChar w) (D.mem u).C.DGam : ℤ) + cut j)
  refine ⟨∑ j ∈ SizeData₂.lifts D, orders j, (eq_div_iff (by norm_num : (2 : ℝ) ≠ 0)).2 ?_⟩
  rw [SizeData₂.sg, Finset.sum_mul, Int.cast_sum]
  refine Finset.sum_congr rfl fun j hj => ?_
  rw [(gains_vanish_at_discriminant X K j w hw).1, hF j hj w, hE u j hj w]
  simp only [Fval, FvalP, ite_eq_right hgmem, ite_eq_left hD, Eval,
    ite_eq_right hT, ite_eq_right hg0, ite_eq_right hg1, EatD, zero_add, orders]
  push_cast
  linarith only [hcut j hj]

private theorem sqrt_discriminant_sq (D : D7) :
    (D.embE D.host.sqrtMinusD) ^ 2 = -(D.host.d : D.what₂.LL) := by
  rw [← map_pow, D.host.sqrtMinusD_sq, map_neg, map_natCast]

theorem discriminant_valuation_is_even (D : D7) (w : D.what₂.places.Pl)
    (hw : D.what₂.places.resChar w = D.host.d) :
    (D.what₂.places.ramIdx w : ℤ) = 2 * vw (D.plEq w) (D.embE D.host.sqrtMinusD) := by
  let a := D.embE D.host.sqrtMinusD
  have hs : a ^ 2 = -(D.host.d : D.what₂.LL) := sqrt_discriminant_sq D
  have hd : (D.host.d : D.what₂.LL) ≠ 0 := Nat.cast_ne_zero.mpr D.host.hyp.2.1.ne_zero
  have ha : a ≠ 0 := by
    intro h
    simp [h, hd] at hs
  have hval := D.val_eq w (D.host.d : D.what₂.LL) hd
  rw [← hw, D.what₂.places.val_resChar, Formalism.L2.G.ServJoint.vAdd_eq_vw _ _
    (Nat.cast_ne_zero.mpr (D.what₂.places.resChar_prime w).ne_zero)] at hval
  have hram : (D.what₂.places.ramIdx w : ℤ) = vw (D.plEq w) (D.host.d : D.what₂.LL) := by
    rw [← hw]
    exact_mod_cast hval
  have hneg : vw (D.plEq w) (-(D.host.d : D.what₂.LL)) = vw (D.plEq w) (D.host.d : D.what₂.LL) := by
    rw [← Formalism.L2.G.ServJoint.vAdd_eq_vw _ _ (neg_ne_zero.mpr hd),
      ← Formalism.L2.G.ServJoint.vAdd_eq_vw _ _ hd]
    simp [vAdd]
  simpa [hs, hneg, ← hram] using shift_vw_pow (D.plEq w) a ha 2

theorem sqrt_discriminant_arch_norm_sq (D : D7) (v : InfinitePlace D.what₂.LL) :
    ‖v.embedding (D.embE D.host.sqrtMinusD)‖ ^ 2 = (D.host.d : ℝ) := by
  rw [← norm_pow, ← map_pow, sqrt_discriminant_sq, map_neg, map_natCast, norm_neg, Complex.norm_natCast]

theorem ramified_rounding_is_exact {D : D7} {L : SizeData₂ D} (X : Inst D L)
    (K : Consts) (Xe : ErrX D) (c : ErrC) (hF : L.FDef) (hE : L.EDef Xe K c)
    (u : D.what₂.Word) (w : D.what₂.places.Pl) (hw : D.what₂.places.resChar w = D.host.d)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) : sgRec L u (D.plEq w) = ur D w (L.sg u w) := by
  obtain ⟨n, hn⟩ := ramified_threshold_is_half_integral X K Xe c hF hE u w hw hg
  let v := vw (D.plEq w) (D.embE D.host.sqrtMinusD)
  have he : (D.what₂.places.ramIdx w : ℝ) = 2 * (v : ℝ) := by
    exact_mod_cast discriminant_valuation_is_even D w hw
  have hs : ur D w (L.sg u w) = ((v * n : ℤ) : ℝ) := by
    rw [ur, he, hn, Int.cast_mul]
    ring
  rw [sgRec, Equiv.symm_apply_apply, hs, Int.floor_intCast]

theorem service_bound_is_active_threshold {D : D7} {L : SizeData₂ D}
    {X : Inst D L} {K : Consts} {Xe : ErrX D} {c : ErrC} (hF : L.FDef) (hE : L.EDef Xe K c)
    (u : D.what₂.Word) (w : D.what₂.places.Pl) (hw : D.what₂.places.resChar w = D.host.d)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) :
    ur D w (totS X K Xe c 1 u w - vDG D u w) = sgRec L u (D.plEq w) := by
  rw [service_period_threshold_at_discriminant hE u w hw]
  exact (ramified_rounding_is_exact X K Xe c hF hE u w hw hg).symm

theorem ramified_service_gain_transfers_to_period {D : D7} {L : SizeData₂ D}
    {X : Inst D L} {K : Consts} {Xe : ErrX D} {c : ErrC} {Dx : DivX D} {T : TwForms D}
    (hF : L.FDef) (hE : L.EDef Xe K c) (h0 : MemberChainIntegral D)
    (hT : TwistedPointIntegral D T) (hp0 : PeriodClassSumWeyl D) (hpT : TwistedPeriodAdmissible D Dx T)
    (hD : DGamDef D) (u : D.what₂.Word) (w : D.what₂.places.Pl)
    (hw : D.what₂.places.resChar w = D.host.d) (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i)
    (φ : (D.div.Nu u).V) (q : ℝ) (hQ : D.what₂.places.resChar w ∉ Dx.Qp (D.what₂.muAt w))
    (hcol : ColGe T u (D.what₂.muAt w) w (D.nuIn u φ) (totS X K Xe c 1 u w + q))
    (F : D.what₂.Amb (D.what₂.muAt w)) (hF1 : F ∈ (D.what₂.Mtilde (D.what₂.muAt w)).carrier)
    (hF0 : F ∈ D.what₂.V0 (D.what₂.muAt w)) :
    ∃ y : D.what₂.LL, D.what₂.embLL y = D.what₂.perCol u (D.what₂.muAt w) (D.jN u φ) F ∧
      (y = 0 ∨ sgRec L u (D.plEq w) + q * D.what₂.places.ramIdx w ≤ (vAdd (D.plEq w) y : ℝ)) := by
  obtain ⟨y, hy, hv⟩ := period_geTU h0 hT hp0 hpT hD u w φ _ (D.what₂.muAt w)
    (Or.inr ⟨w, rfl⟩) hQ hcol F hF1 hF0
  have he : ur D w (totS X K Xe c 1 u w + q - vDG D u w) =
      ur D w (totS X K Xe c 1 u w - vDG D u w) + q * D.what₂.places.ramIdx w := by
    unfold ur
    ring
  rw [he, service_bound_is_active_threshold (X := X) hF hE u w hw hg] at hv
  exact ⟨y, hy, hv⟩

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``row_cutoff_is_natural, ``gains_vanish_at_discriminant,
      ``service_period_threshold_at_discriminant, ``ramified_threshold_is_half_integral,
      ``discriminant_valuation_is_even, ``sqrt_discriminant_arch_norm_sq, ``ramified_rounding_is_exact,
      ``service_bound_is_active_threshold,
      ``ramified_service_gain_transfers_to_period] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedPeriodThresholdAudit
