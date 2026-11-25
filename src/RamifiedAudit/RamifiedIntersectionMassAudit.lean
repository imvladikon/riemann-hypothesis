module

import Lean
import all Formalism.SharpRestriction.Divisibility.OrbitPlaces
import all Formalism.SharpRestriction.GlobalSchurBounds.QuadraticLogDerivCongr
import all Formalism.SharpRestriction.SmoothDesignExistence.SumOverPrimesHypotheses
import all RamifiedIntersectionCutoffAudit
import all RamifiedTopThinAudit
import all RamifiedIntersectionPeriodAudit

open Lean Elab Command
open Module NumberField
open Formalism.L2.DIV Formalism.L2.G.Adm2InU Formalism.L2.G.ServJoint Formalism.L2.G.ServJointF
open Formalism.BasicNotions Formalism.BasicNotions.DV Formalism.FrobeniusOrbits
open Formalism.MainNotions Formalism.MainNotions.G Formalism.MainNotions.OrbitPlaces
open Formalism.MainNotions.WeightDegreeSizes
open Formalism.MainNotions.Lnk
open PI.EntAtD.W PI.SzCt.UnitaryGroupMassFormula
open RamifiedIntersectionCutoffAudit RamifiedTopThinAudit RamifiedIntersectionPeriodAudit
open scoped BigOperators

namespace RamifiedIntersectionMassAudit

def outsideTranslate {H : Type} [AddCommGroup H] [DecidableEq H] (S T : Finset H) (u₀ : H) :
    Finset H :=
  S.filter (fun t => t - u₀ ∉ T)

theorem sum_outside_translates {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]
    (S T : Finset H) :
    (∑ u₀ : H, (outsideTranslate S T u₀).card) = S.card * (Fintype.card H - T.card) := by
  have hcount (t : H) : (∑ u₀ : H, if t - u₀ ∉ T then (1 : ℕ) else 0) =
      Fintype.card H - T.card := by
    calc
      _ = ∑ a : H, if a ∉ T then (1 : ℕ) else 0 :=
        Equiv.sum_comp (Equiv.subLeft t) (fun a => if a ∉ T then 1 else 0)
      _ = _ := by
        rw [Finset.sum_boole]
        change ((Finset.univ : Finset H).filter fun a => a ∉ T).card = Fintype.card H - T.card
        rw [← Finset.card_univ]
        have hc := Finset.card_filter_add_card_filter_not (s := Finset.univ) (fun a : H => a ∈ T)
        have heq : (Finset.univ.filter fun a : H => a ∈ T) = T := by ext; simp
        rw [heq] at hc
        omega
  calc
    _ = ∑ u₀ : H, ∑ t ∈ S, if t - u₀ ∉ T then (1 : ℕ) else 0 := by
      apply Finset.sum_congr rfl
      intro u₀ _
      exact (Finset.sum_boole (fun t => t - u₀ ∉ T) S).symm
    _ = ∑ t ∈ S, ∑ u₀ : H, if t - u₀ ∉ T then (1 : ℕ) else 0 := Finset.sum_comm
    _ = _ := by simp only [hcount, Finset.sum_const, nsmul_eq_mul, Nat.cast_id]

noncomputable def thinTopPartners (D : D7) : Finset (HH D) := by
  classical
  exact outsideTranslate D.host.TT (D.host.T2.image D.R.dig) D.host.u0

private theorem thin_partner_of_mem (D : D7) (t : HH D) (ht : t ∈ thinTopPartners D) :
    t ∈ D.host.TT ∧ D.host.IsThin (D.eTau (tauPl D (true, t)) : D.R.GG) := by
  classical
  obtain ⟨htTop, htThin⟩ := Finset.mem_filter.mp ht
  refine ⟨htTop, ((placeFacts D).2.2.2 t).resolve_left ?_⟩
  intro htThick
  have heq : (D.eTau (tauPl D (true, t)) : D.R.GG) = D.R.tau2 t := by
    rw [eTau_tauPl]
    simp [plGG]
  rw [heq] at htThick
  obtain ⟨s, hs, hτ⟩ := Finset.mem_image.mp htThick
  have h : D.R.dig s + D.host.u0 = t :=
    D.R.toFrame.iota_bijective.1 (congrArg Prod.snd hτ)
  exact htThin (Finset.mem_image.mpr ⟨s, hs, eq_sub_iff_add_eq.mpr h⟩)

noncomputable def residualIntersectionGap {D : D7} (E : Ent D) (u : D.what₂.Word)
    (j : ℕ) (t : HH D) : ℝ := by
  classical
  let a := E.nu u (j - 1) (false, t)
  let b := E.nu u (j - 1) (true, t)
  exact (rowContractionBound a b : ℝ) - (intersectionBound a b : ℝ) -
    (if t ∈ thinTopPartners D then 1 else 0)

theorem residual_intersection_gap_nonneg {D : D7} (L : SizeData₂ D) (E : Ent D)
    (hSize : SizesAt L) (hx : 3 ≤ L.sc.x) (u : D.what₂.Word)
    {j : ℕ} (hj : j ∈ SizeData₂.lifts D) (t : HH D) :
    0 ≤ residualIntersectionGap E u j t := by
  classical
  have hj' := Finset.mem_Icc.mp hj
  have hi : j - 1 < D.R.m := by omega
  let a := E.nu u (j - 1) (false, t)
  let b := E.nu u (j - 1) (true, t)
  change 0 ≤ (rowContractionBound a b : ℝ) - (intersectionBound a b : ℝ) -
    (if t ∈ thinTopPartners D then 1 else 0)
  by_cases ht : t ∈ thinTopPartners D
  · obtain ⟨hTop, hThin⟩ := thin_partner_of_mem D t ht
    have h := top_thin_pair_saves_cutoff L E hSize hx ⟨t, hTop⟩ hThin u (j - 1) hi
    have hr : (intersectionBound a b : ℝ) + 1 ≤ rowContractionBound a b := by
      exact_mod_cast Nat.succ_le_of_lt h
    rw [ite_eq_left ht]
    linarith only [hr]
  · rw [ite_eq_right ht, sub_zero]
    apply sub_nonneg.mpr
    exact_mod_cast intersectionBound_le_rowContractionBound a b

private theorem lift_residual_eq {D : D7} (E : Ent D) (u : D.what₂.Word) (j : ℕ) :
    (∑ t : HH D, residualIntersectionGap E u j t) / 2 =
      liftIntersectionGain E u j - (thinTopPartners D).card / 2 := by
  classical
  have hcard : (∑ t : HH D, if t ∈ thinTopPartners D then (1 : ℝ) else 0) = (thinTopPartners D).card := by
    rw [Finset.sum_boole]
    have hset : (Finset.univ.filter fun t : HH D => t ∈ thinTopPartners D) = thinTopPartners D := by
      ext t
      simp
    rw [hset]
  unfold residualIntersectionGap liftIntersectionGain
  dsimp only
  rw [Finset.sum_sub_distrib, hcard, sub_div]

theorem thin_top_partners_gain {D : D7} (L : SizeData₂ D) (E : Ent D)
    (hSize : SizesAt L) (hx : 3 ≤ L.sc.x) (u : D.what₂.Word) :
    (D.R.m : ℝ) / 2 * (thinTopPartners D).card ≤
      ∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j := by
  calc
    _ = ∑ _j ∈ SizeData₂.lifts D, ((thinTopPartners D).card : ℝ) / 2 := by
      simp [SizeData₂.lifts, Nat.card_Icc, div_eq_mul_inv]
      ring
    _ ≤ _ := Finset.sum_le_sum fun j hj => by
      have h : 0 ≤ (∑ t : HH D, residualIntersectionGap E u j t) / 2 :=
        div_nonneg (Finset.sum_nonneg fun t _ => residual_intersection_gap_nonneg L E hSize hx u hj t)
          (by norm_num)
      rw [lift_residual_eq] at h
      exact sub_nonneg.mp h

private def frameEquiv {e e' : Formalism.HC.Frame} (h : e = e') : e.A ≃+ e'.A :=
  h ▸ AddEquiv.refl e.A

private theorem frameEquiv_val {e e' : Formalism.HC.Frame} (h : e = e') (t : e.A) :
    hval e' (frameEquiv h t) = hval e t := by
  cases h
  rfl

private theorem frameEquiv_dig {e e' : Formalism.HC.Frame} (h : e = e') (s : ℕ) :
    frameEquiv h (e.dig s) = e'.dig s := by
  cases h
  rfl

theorem model_thin_top_count {eps x : ℝ} {Fm : FamP eps} (M : Mod Fm x) (u₀ : M.e.A) :
    (thinTopPartners (Fm.D x (M.pt u₀))).card = (outsideTranslate M.TT M.T2 u₀).card := by
  classical
  let D := Fm.D x (M.pt u₀)
  let g : D.R.A ≃+ M.e.A := frameEquiv (M.he u₀)
  have hu : g D.host.u0 = u₀ := by
    apply hval_injective M.e
    exact (frameEquiv_val (M.he u₀) _).trans (M.point_base_value u₀)
  have hTop (t : D.R.A) : g t ∈ M.TT ↔ t ∈ D.host.TT := by
    have hv : hval M.e (g t) = t.val := frameEquiv_val (M.he u₀) t
    rw [M.mem_TT, hv, ← Fm.TT_eq x (M.pt u₀), Finset.mem_image]
    exact ⟨fun ⟨s, hs, he⟩ => (Formalism.HC.Frame.A.val_injective _ he) ▸ hs,
      fun ht => ⟨t, ht, rfl⟩⟩
  have hThick (t : D.R.A) : g t ∈ M.T2 ↔ t ∈ D.host.T2.image D.R.dig := by
    rw [M.mem_thick_set_model_iff, ← Fm.realisedChain_torus_eq x (M.pt u₀) M.i0, Finset.mem_image]
    constructor
    · rintro ⟨s, hs, he⟩
      exact ⟨s, hs, g.injective ((frameEquiv_dig (M.he u₀) s).trans he.symm)⟩
    · rintro ⟨s, hs, rfl⟩
      exact ⟨s, hs, frameEquiv_dig (M.he u₀) s⟩
  have heq : (thinTopPartners D).image g = outsideTranslate M.TT M.T2 u₀ := by
    ext t
    obtain ⟨s, rfl⟩ := g.surjective t
    have hsub : g (s - D.host.u0) = g s - u₀ := by rw [map_sub, hu]
    have hmem : g s ∈ outsideTranslate M.TT M.T2 u₀ ↔ s ∈ thinTopPartners D := by
      simp only [outsideTranslate, thinTopPartners, Finset.mem_filter, hTop, ← hsub, hThick]
    rw [hmem, Finset.mem_image]
    exact ⟨fun ⟨b, hb, h⟩ => (g.injective h) ▸ hb, fun hs => ⟨s, hs, rfl⟩⟩
  rw [← heq, Finset.card_image_of_injective _ g.injective]

theorem model_sum_thin_top_counts {eps x : ℝ} {Fm : FamP eps} (M : Mod Fm x) :
    (∑ u₀ : M.e.A, (thinTopPartners (Fm.D x (M.pt u₀))).card) =
      M.TT.card * (Fintype.card M.e.A - M.T2.card) := by
  simp only [model_thin_top_count, sum_outside_translates]

/-- A common integral exponent for every word of one realised shift. -/
noncomputable def thinPartnerExponent (D : D7) : ℕ :=
  (D.R.m / 2) * (thinTopPartners D).card

theorem intersection_gain_sub_thin_partner_exponent {D : D7} (E : Ent D) (u : D.what₂.Word) :
    (∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j) - thinPartnerExponent D =
      (∑ j ∈ SizeData₂.lifts D, ∑ t : HH D, residualIntersectionGap E u j t) / 2 := by
  have hMass : ∑ _j ∈ SizeData₂.lifts D, ((thinTopPartners D).card : ℝ) / 2 =
      (thinPartnerExponent D : ℝ) := by
    rw [thinPartnerExponent, Nat.cast_mul, half_chain_length_cast]
    simp [SizeData₂.lifts, Nat.card_Icc, div_eq_mul_inv]
    ring
  classical
  rw [Finset.sum_div]
  simp only [lift_residual_eq, Finset.sum_sub_distrib, hMass]

/-- Two uncompensated row defects, of size one each, give one further integral power. -/
theorem one_le_residual_gain_of_pairs {D : D7} (L : SizeData₂ D) (E : Ent D)
    (hSize : SizesAt L) (hx : 3 ≤ L.sc.x) (u : D.what₂.Word)
    (S : Finset (ℕ × HH D)) (hS : S ⊆ (SizeData₂.lifts D) ×ˢ Finset.univ)
    (hTwo : 2 ≤ S.card) (hGap : ∀ p ∈ S, 1 ≤ residualIntersectionGap E u p.1 p.2) :
    1 ≤ (∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j) - thinPartnerExponent D := by
  classical
  rw [intersection_gain_sub_thin_partner_exponent]
  apply (le_div_iff₀ (by norm_num : (0 : ℝ) < 2)).mpr
  calc
    1 * 2 ≤ (S.card : ℝ) := by simpa only [one_mul] using (show (2 : ℝ) ≤ S.card by exact_mod_cast hTwo)
    _ = ∑ _p ∈ S, (1 : ℝ) := by simp
    _ ≤ ∑ p ∈ S, residualIntersectionGap E u p.1 p.2 := Finset.sum_le_sum hGap
    _ ≤ ∑ p ∈ (SizeData₂.lifts D) ×ˢ Finset.univ, residualIntersectionGap E u p.1 p.2 :=
      Finset.sum_le_sum_of_subset_of_nonneg hS (fun p hp _ =>
        residual_intersection_gap_nonneg L E hSize hx u (Finset.mem_product.mp hp).1 p.2)
    _ = _ := Finset.sum_product ..

theorem thin_partner_exponent_le_gain {D : D7} (L : SizeData₂ D) (E : Ent D)
    (hSize : SizesAt L) (hx : 3 ≤ L.sc.x) (u : D.what₂.Word) :
    (thinPartnerExponent D : ℝ) ≤ ∑ j ∈ SizeData₂.lifts D, liftIntersectionGain E u j := by
  rw [thinPartnerExponent, Nat.cast_mul, half_chain_length_cast]
  exact thin_top_partners_gain L E hSize hx u

theorem thin_partner_exponent_divides_active_map {D : D7} {L : SizeData₂ D} {Rw : DivisionRowsFace L}
    {C Cabs : ℝ} (P : DivisionPackageFace Rw C Cabs) {E : Ent D} {Dx : DivX D} {T : TwForms D}
    {X : Inst D L} {K : Consts} {lev : LevelData D} {Xe : ErrX D} {c : ErrC}
    (hshape : ThetaKernelShapeAtD E Dx) (hform : KForm E Dx T 1) (hcomp : ValuationComposition D T)
    (hF : L.FDef) (hE : ErrDefs D L Xe lev K c) (hN : NuInM D L) (h0 : MemberChainIntegral D)
    (hT : TwistedPointIntegral D T) (hp0 : PeriodClassSumWeyl D) (hpT : TwistedPeriodAdmissible D Dx T)
    (h2 : LocalQuadraticParts.adm2 D L) (hcut : ∀ μ, Used D μ → CutUp D μ) (hPrime : NprimeDef D L)
    (hg : ∀ i : Fin 2, D.host.d ≠ D.host.g i) (hSize : SizesAt L) (hx : 3 ≤ L.sc.x) (u : D.what₂.Word) :
    (D.div.Nu u).L.map ((((D.host.d : D.what₂.LL) ^ thinPartnerExponent D)⁻¹ • D.div.Bk u).restrictScalars
      (𝓞 D.what₂.LL)) ≤ D.div.RR.dualL := by
  exact intersection_gain_divides_active_map P (X := X) hshape hform hcomp hF hE hN h0 hT hp0 hpT h2
    hcut hPrime hg u (thinPartnerExponent D) (thin_partner_exponent_le_gain L E hSize hx u)

theorem model_sum_thin_partner_exponents {eps x : ℝ} {Fm : FamP eps} (M : Mod Fm x) :
    (∑ u₀ : M.e.A, thinPartnerExponent (Fm.D x (M.pt u₀))) =
      (M.m / 2) * (M.TT.card * (Fintype.card M.e.A - M.T2.card)) := by
  simp only [thinPartnerExponent, M.hm, ← Finset.mul_sum, model_sum_thin_top_counts]

/-- Each realised shift uses its own words and source lattices. The sum counts their thin partners. -/
theorem model_mean_intersection_gain {eps x : ℝ} {Fm : FamP eps} (M : Mod Fm x)
    (hx : Fm.x1 < x) (hx3 : 3 ≤ x)
    (E : ∀ s : M.e.A, Ent (Fm.D x (M.pt s))) (u : ∀ s : M.e.A, (Fm.D x (M.pt s)).what₂.Word) :
    (M.m : ℝ) / 2 * M.TT.card * (1 - (M.T2.card : ℝ) / Fintype.card M.e.A) ≤
      (∑ s : M.e.A, ∑ j ∈ SizeData₂.lifts (Fm.D x (M.pt s)),
        liftIntersectionGain (E s) (u s) j) / Fintype.card M.e.A := by
  have hpos : (0 : ℝ) < Fintype.card M.e.A := by exact_mod_cast Fintype.card_pos
  have hsum := Finset.sum_le_sum (s := Finset.univ) (fun s _ =>
    thin_top_partners_gain (Fm.L x (M.pt s)) (E s) (Fm.sizes x hx (M.pt s))
      (by rw [Fm.L_x x (M.pt s) hx]; exact hx3) (u s))
  simp only [M.hm, ← Finset.mul_sum] at hsum
  rw [← Nat.cast_sum, model_sum_thin_top_counts, Nat.cast_mul,
    Nat.cast_sub (Finset.card_le_univ _)] at hsum
  apply (le_div_iff₀ hpos).mpr
  calc
    _ = (M.m : ℝ) / 2 * ((M.TT.card : ℝ) * (Fintype.card M.e.A - M.T2.card)) := by
      field_simp [hpos.ne']
    _ ≤ _ := hsum

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``sum_outside_translates, ``thin_top_partners_gain, ``model_thin_top_count,
      ``model_sum_thin_top_counts, ``model_mean_intersection_gain, ``thin_partner_exponent_le_gain,
      ``residual_intersection_gap_nonneg, ``intersection_gain_sub_thin_partner_exponent,
      ``one_le_residual_gain_of_pairs, ``thin_partner_exponent_divides_active_map,
      ``model_sum_thin_partner_exponents] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedIntersectionMassAudit
