module

import Mathlib.Algebra.Order.Star.Int
import Mathlib.Algebra.Order.Star.Real
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import Mathlib.NumberTheory.LSeries.Nonvanishing
import TauCeti.Analysis.Complex.BorelCaratheodory
import TauCeti.NumberTheory.DirichletCharacter.LFunction.Basic
import TauCeti.NumberTheory.LFunctions.Zeros.ZeroFreeRegion.Dirichlet
import TauCeti.NumberTheory.LSeries.DirichletEulerLog
import TauCeti.NumberTheory.LSeries.RiemannZeta.Bounds
public import Lib.Analytic.PrimeNumberTheorem.LFunctionGrowth
import Lib.Analytic.EntireLFunction

/-!
# A zero-free region for Dirichlet L-functions

For a Dirichlet character `χ` and large `l`, the function `L(s, χ)` has no zero with
`re s ≥ 1 - l⁻²⁵` and `|s| ≤ e^l`, and its logarithmic derivative, with the pole removed, is at most
`2 l²⁵` there. The inequality `|L(σ, 1)³ L(σ + i t, χ)⁴ L(σ + 2 i t, χ²)| ≥ 1` bounds `L` from below
to the right of `re s = 1`, and the bound for the derivative carries this across the line. If `χ²`
is principal, the points near `1` are treated by `𝖿_χ(1) ≠ 0` and continuity; so how large `l` must
be depends on `χ`.

With a fixed neighborhood of `1`, the linear growth estimate gives a region of width `c / l ^ 9`.
The classical region and Borel–Carathéodory also give a strip of width `a / l` with logarithmic
derivative bounded by `B l²`, provided the exceptional real zero is excluded near `1`.

Notions from other files:
* `entireL χ`: the entire function `L(s, χ)`, or `(s - 1) L(s, χ)` if `χ` is principal;
* `regularL χ`, written `𝖿_χ` in comments: `entireL χ`, divided by `s` if `χ` is principal.

## Relation to the literature

Known result: the classical zero-free region, in the crude form with a power of the logarithm that
the 3-4-1 inequality gives directly. Source: Montgomery and Vaughan, Multiplicative Number Theory I,
2007, ch. 11.
-/

@[expose] public section

open Complex Real Filter Topology Metric
namespace New

local notation "K" => (4 * (3 : ℝ) ^ (18 : ℕ))

variable {N : ℕ} [NeZero N]

/-- For all sufficiently small real `r`, the regularized L-function `regularL χ` (`L(s, χ)`, times
`(s - 1) / s` if `χ` is principal) has absolute value at least `r` within distance `r` of `1`. -/
lemma eventually_le_norm_regularL (χ : DirichletCharacter ℂ N) :
    ∀ᶠ r : ℝ in 𝓝 0, ∀ s : ℂ, ‖s - 1‖ ≤ r → r ≤ ‖regularL χ s‖ := by
  have h_pos : 0 < ‖regularL χ 1‖ := by simp [regularL, entireL_ne_zero χ (s := 1) le_rfl]
  have h_near : ∀ᶠ s : ℂ in 𝓝 1, ‖regularL χ 1‖ / 2 ≤ ‖regularL χ s‖ :=
    (differentiableAt_regularL χ one_pos).continuousAt.norm.eventually_const_le (half_lt_self h_pos)
  filter_upwards [eventually_le_nhds (half_pos h_pos), eventually_closedBall_subset h_near]
    with r hr h_ball s hs using hr.trans (h_ball (mem_closedBall_iff_norm.2 hs))

/-- At a fixed level, one neighborhood of `1` works for all regularized L-functions. -/
lemma exists_pos_neighborhood_regularL_ne_zero :
    ∃ a : ℝ, 0 < a ∧ ∀ (χ : DirichletCharacter ℂ N) (s : ℂ),
      ‖s - 1‖ ≤ a → regularL χ s ≠ 0 := by
  have h_inv : Tendsto (fun l : ℝ ↦ 1 / l) atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop tendsto_id
  obtain ⟨l, hl, h_near⟩ := ((eventually_ge_atTop (1 : ℝ)).and
    (h_inv.eventually (eventually_all.2 fun χ : DirichletCharacter ℂ N ↦
      eventually_le_norm_regularL χ))).exists
  have ha : 0 < 1 / l := one_div_pos.2 (one_pos.trans_le hl)
  exact ⟨1 / l, ha, fun χ s hs ↦ norm_pos_iff.1 (ha.trans_le (h_near χ s hs))⟩

/-- The classical region on the scale `q ≤ exp l` and `‖s‖ ≤ 2 exp l`. An exceptional
zero would come from a real character and lie within distance `a` of `1`. -/
lemma exists_entireL_ne_zero_of_classical_log_width :
    ∃ c : ℝ, 0 < c ∧ c ≤ 1 ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)
      {a l : ℝ} {s : ℂ}, 0 < a → a ≤ c → 4 ≤ l → (q : ℝ) ≤ rexp l →
      1 - a / l ≤ s.re → ‖s‖ ≤ 2 * rexp l →
      (χ ^ 2 = 1 → ‖s - 1‖ ≤ a → entireL χ s ≠ 0) → entireL χ s ≠ 0 := by
  obtain ⟨c, hc, -, h_region⟩ := TauCeti.LFunctions.dirichletLFunction_zeroFreeRegion
  refine ⟨min 1 (c / 3), lt_min one_pos (by positivity), min_le_left _ _, ?_⟩
  intro q _ χ a l s ha ha_c hl hq hs hn h_near
  by_cases hs_one : 1 ≤ s.re
  · exact entireL_ne_zero χ hs_one
  have hs_lt : s.re < 1 := lt_of_not_ge hs_one
  have hs_ne : s ≠ 1 := fun h ↦ hs_one (by simp [h])
  have hl_pos : 0 < l := by linarith
  have h_exp : 3 ≤ rexp l := by linarith [add_one_le_exp l]
  have h_im : |s.im| + 3 ≤ rexp (l + l) := by
    rw [Real.exp_add]
    calc
      _ ≤ 3 * rexp l := by linarith [abs_im_le_norm s]
      _ ≤ _ := mul_le_mul_of_nonneg_right h_exp (exp_pos l).le
  have h_arg : 1 < (q : ℝ) * (|s.im| + 3) := calc
    _ < (1 : ℝ) * 3 := by norm_num
    _ ≤ _ := mul_le_mul (Nat.one_le_cast.mpr NeZero.one_le) (by linarith [abs_nonneg s.im])
      (by norm_num) (by positivity)
  have h_log : Real.log ((q : ℝ) * (|s.im| + 3)) ≤ 3 * l := by
    apply (Real.log_le_iff_le_exp (zero_lt_one.trans h_arg)).2
    rw [show 3 * l = l + (l + l) by ring, Real.exp_add l]
    exact mul_le_mul hq h_im (by positivity) (exp_pos l).le
  have h_width : a / l ≤ c / Real.log ((q : ℝ) * (|s.im| + 3)) := calc
    _ ≤ (c / 3) / l := div_le_div_of_nonneg_right (ha_c.trans (min_le_right _ _)) hl_pos.le
    _ = c / (3 * l) := by ring
    _ ≤ _ := div_le_div_of_nonneg_left hc.le (Real.log_pos h_arg) h_log
  intro h_zero
  have hL : χ.LFunction s = 0 := by
    by_contra h
    exact (entireL_ne_zero_iff χ hs_ne).2 h h_zero
  obtain ⟨him, hsq, _⟩ := (h_region q χ).1 s (by linarith)
    (χ.meromorphicOrderAt_LFunction_pos_iff.2 ⟨hL, .inl hs_ne⟩)
  have h_real : s - 1 = ((s.re - 1 : ℝ) : ℂ) := by
    apply Complex.ext <;> simp [him]
  have h_dist : ‖s - 1‖ ≤ a := by
    rw [h_real, norm_real, Real.norm_eq_abs, abs_of_nonpos (sub_nonpos.2 hs_lt.le)]
    linarith only [hs, div_le_self ha.le (show 1 ≤ l by linarith)]
  exact h_near hsq h_dist h_zero

/-- Classical width for all characters of a fixed positive modulus. -/
lemma exists_eventually_entireL_ne_zero_log_strip :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ l : ℝ in atTop, ∀ (χ : DirichletCharacter ℂ N) (s : ℂ),
      1 - a / l ≤ s.re → ‖s‖ ≤ 2 * rexp l → entireL χ s ≠ 0 := by
  obtain ⟨c, hc, hc_one, h_region⟩ := exists_entireL_ne_zero_of_classical_log_width
  obtain ⟨b, hb, h_near⟩ := exists_pos_neighborhood_regularL_ne_zero (N := N)
  refine ⟨min c b, lt_min hc hb, (min_le_left _ _).trans hc_one, ?_⟩
  filter_upwards [eventually_ge_atTop (4 : ℝ), tendsto_exp_atTop.eventually_ge_atTop (N : ℝ)]
    with l hl hN χ s hs hn
  exact h_region N χ (lt_min hc hb) (min_le_left _ _) hl hN hs hn fun _ hdist hzero ↦
    h_near χ s (hdist.trans (min_le_right _ _)) (by simp [regularL, hzero])

private lemma norm_entireL_le_sq (χ : DirichletCharacter ℂ N) {s : ℂ} (hs : 1 / 2 ≤ s.re) :
    ‖entireL χ s‖ ≤ 16 * N * ‖s‖ ^ 2 := by
  have h_factor : ‖(if χ = 1 then s else 1 : ℂ)‖ ≤ 2 * ‖s‖ := by
    split_ifs
    · linarith [norm_nonneg s]
    · simp only [norm_one]
      linarith [re_le_norm s]
  have h_ne : (if χ = 1 then s else 1 : ℂ) ≠ 0 := by
    split_ifs
    · exact ne_zero_of_re_pos (by linarith)
    · exact one_ne_zero
  calc
    _ = ‖regularL χ s‖ * ‖(if χ = 1 then s else 1 : ℂ)‖ := by
      rw [← norm_mul, regularL, div_mul_cancel₀ _ h_ne]
    _ ≤ (8 * N * ‖s‖) * (2 * ‖s‖) :=
      mul_le_mul (norm_regularL_le_linear χ hs) h_factor (norm_nonneg _) (by positivity)
    _ = _ := by ring

private lemma mul_exp_neg_re_riemannZeta_le_norm_entireL (χ : DirichletCharacter ℂ N)
    {s : ℂ} {η : ℝ} (hη : 0 < η) (hη_one : η ≤ 1) (hs : 1 + η ≤ s.re) :
    η * rexp (-(riemannZeta s.re).re) ≤ ‖entireL χ s‖ := by
  have hs_gt : 1 < s.re := by linarith
  have h_lower := χ.exp_neg_re_riemannZeta_le_norm_LFunction hs_gt
  by_cases hχ : χ = 1
  · have hs_ne : s ≠ 1 := ne_of_apply_ne re hs_gt.ne'
    have h_factor : η ≤ ‖s - 1‖ := by
      have h_re := re_le_norm (s - 1)
      simp only [sub_re, one_re] at h_re
      linarith
    rw [entireL, ite_eq_left hχ, DirichletCharacter.LFunctionTrivChar₁_apply_of_ne_one N hs_ne, norm_mul]
    exact mul_le_mul h_factor (by simpa only [hχ, DirichletCharacter.LFunctionTrivChar] using h_lower)
      (exp_pos _).le (norm_nonneg _)
  rw [entireL, ite_eq_right hχ]
  exact (mul_le_of_le_one_left (exp_pos _).le hη_one).trans h_lower

/-- A zero-free strip of width `a / l` gives a bound `B l²` on a narrower strip by
Borel–Carathéodory, with the disk centered to the right of the point being estimated. -/
lemma eventually_norm_logDeriv_entireL_le_of_log_strip {a : ℝ} (ha : 0 < a) (ha_one : a ≤ 1) :
    ∃ B : ℝ, 0 < B ∧ ∀ᶠ l : ℝ in atTop, ∀ (q : ℕ) [NeZero q]
      (χ : DirichletCharacter ℂ q) (s : ℂ), (q : ℝ) ≤ rexp l →
      1 - a / (8 * l) ≤ s.re → ‖s‖ ≤ rexp l →
      (∀ w : ℂ, 1 - a / l ≤ w.re → ‖w‖ ≤ 2 * rexp l → entireL χ w ≠ 0) →
      entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ B * l ^ 2 := by
  let D : ℝ := 1 + 8 / a
  refine ⟨48 * (D + 4) / a, by dsimp [D]; positivity, ?_⟩
  have h_poly : ∀ᶠ l : ℝ in atTop, (512 / a) * l ≤ rexp l := by
    filter_upwards [((isLittleO_pow_exp_pos_mul_atTop 1 one_pos).const_mul_left
      (512 / a)).eventuallyLE] with l h
    exact (le_norm_self _).trans (by
      simpa only [one_mul, pow_one, Real.norm_eq_abs, abs_of_pos (exp_pos l)] using h)
  filter_upwards [eventually_ge_atTop (4 : ℝ), h_poly] with l hl hl_poly q _ χ s hq hs hn h_free
  have hl_pos : 0 < l := by linarith
  let r := a / (4 * l)
  let b : ℂ := s + (r : ℂ)
  have hr : 0 < r := by dsimp [r]; positivity
  have h_radius : a / l = 4 * r := by dsimp [r]; ring
  have h_small : a / (8 * l) = r / 2 := by dsimp [r]; ring
  have hr_le : r ≤ 1 / 4 := (div_le_iff₀ (by positivity : 0 < 4 * l)).2
    (by linarith only [ha_one, hl])
  have hb_re : b.re = s.re + r := by simp [b]
  have hb_norm : ‖b‖ ≤ ‖s‖ + r := (norm_add_le _ _).trans_eq (by simp [abs_of_pos hr])
  have h_exp : 1 ≤ rexp l := by linarith [add_one_le_exp l]
  have h_dist : ‖s - b‖ = r := by
    rw [show s - b = -(r : ℂ) by dsimp [b]; ring, norm_neg, norm_real, Real.norm_eq_abs,
      abs_of_pos hr]
  have h_outer (w : ℂ) (hw : w ∈ Metric.ball b (2 * r)) :
      1 - a / l ≤ w.re ∧ 1 / 2 ≤ w.re ∧ ‖w‖ ≤ 2 * rexp l := by
    have h_ball : ‖w - b‖ < 2 * r := by simpa only [mem_ball, dist_eq_norm] using hw
    have h_re := (abs_le.1 ((abs_re_le_norm (w - b)).trans h_ball.le)).1
    simp only [sub_re] at h_re
    have h_norm := norm_le_norm_sub_add w b
    rw [h_small] at hs
    exact ⟨by linarith, by linarith, by linarith⟩
  have hgap : 1 + r / 2 ≤ b.re := by linarith only [hb_re, hs, h_small]
  have hrcp : 1 / (r / 2) = (8 / a) * l := by dsimp [r]; field
  have h_zeta : (riemannZeta b.re).re ≤ D * l := by
    have h_bound := (TauCeti.riemannZeta_re_lt_one_add_one_div_sub_one
      (σ := b.re) (by linarith) (by linarith)).le
    have h_inv := one_div_le_one_div_of_le (half_pos hr) (show r / 2 ≤ b.re - 1 by linarith)
    rw [hrcp] at h_inv
    dsimp [D]
    rw [add_mul, one_mul]
    linarith only [hl, h_bound, h_inv]
  have h_lower : (r / 2) * rexp (-D * l) ≤ ‖entireL χ b‖ :=
    (mul_le_mul_of_nonneg_left (Real.exp_le_exp.2 (by linarith only [h_zeta])) (half_pos hr).le).trans
      (mul_exp_neg_re_riemannZeta_le_norm_entireL χ (s := b) (half_pos hr) (by linarith) hgap)
  have h_absorb : 64 ≤ (r / 2) * rexp l := by
    have h := (div_le_iff₀ (half_pos hr)).1 (show 64 / (r / 2) ≤ rexp l by
      calc
        _ = 64 * (1 / (r / 2)) := by ring
        _ = (512 / a) * l := by rw [hrcp]; ring
        _ ≤ _ := hl_poly)
    simpa only [mul_comm] using h
  have h_relative (w : ℂ) (hw : w ∈ Metric.ball b (2 * r)) :
      ‖entireL χ w‖ ≤ rexp ((D + 4) * l) * ‖entireL χ b‖ := calc
    _ ≤ 16 * q * ‖w‖ ^ 2 := norm_entireL_le_sq χ (h_outer w hw).2.1
    _ ≤ 16 * rexp l * (2 * rexp l) ^ 2 := by gcongr; exact (h_outer w hw).2.2
    _ = 64 * (rexp l) ^ 3 := by ring
    _ ≤ ((r / 2) * rexp l) * (rexp l) ^ 3 := mul_le_mul_of_nonneg_right h_absorb (by positivity)
    _ = rexp ((D + 4) * l) * ((r / 2) * rexp (-D * l)) := by
      rw [mul_left_comm (rexp ((D + 4) * l)), ← Real.exp_add,
        show (D + 4) * l + -D * l = (4 : ℕ) * l by push_cast; ring,
        Real.exp_natCast_mul]
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_left h_lower (exp_pos _).le
  have h_nonzero (w : ℂ) (hw : w ∈ Metric.ball b (2 * r)) : entireL χ w ≠ 0 :=
    h_free w (h_outer w hw).1 (h_outer w hw).2.2
  have hs_ball : s ∈ Metric.ball b (2 * r) := by
    rw [mem_ball, dist_eq_norm, h_dist]
    linarith
  have h_borel := Complex.norm_logDeriv_le_of_forall_mem_ball_norm_le_mul
    (fun w _ ↦ (analyticAt_entireL χ w).differentiableAt.differentiableWithinAt)
    h_nonzero h_relative (by simpa only [mem_ball, dist_eq_norm] using hs_ball)
  rw [Real.log_exp, h_dist] at h_borel
  refine ⟨h_nonzero s hs_ball, h_borel.trans_eq ?_⟩
  dsimp [r]
  field

private lemma pow_three_le_mul_norm_regularL_pow_of_fixed_neighborhood
    (χ : DirichletCharacter ℂ N) {s : ℂ} {l L : ℝ}
    (hl : 10 ^ 10 ≤ l) (hN : N ≤ rexp l) {η : ℝ} (hη : 0 < η) (hη_le : η ≤ 1)
    (hL : 1 ≤ L) (h_far : χ ^ 2 = 1 → 1 / L ≤ ‖s - 1‖) (h_re : 1 + η ≤ s.re)
    (h_norm : ‖s‖ ≤ 3 / 2 * rexp l) :
    η ^ 3 ≤ 8 * (2 * L) ^ 5 * K * l * ‖regularL χ s‖ ^ 4 := by
  have hl_one : 1 ≤ l := by linarith
  -- the three points are `re s`, `s` and `s₂ = re s + 2 i im s`
  let s₂ : ℂ := s + s.im * I
  have re_s₂ : s₂.re = s.re := by simp [s₂]
  have norm_s₂ : ‖s₂‖ ≤ 3 * rexp l := by
    have h_im : ‖s.im * I‖ ≤ ‖s‖ := by simpa using abs_im_le_norm s
    linarith [norm_add_le s (s.im * I)]
  have dist_s₂ : ‖s - 1‖ ≤ ‖s₂ - 1‖ := by
    have h_sq : ‖s₂ - 1‖ ^ 2 = ‖s - 1‖ ^ 2 + 3 * s.im ^ 2 := by
      have im_s₂ : s₂.im = 2 * s.im := by simp [s₂, two_mul]
      simp only [Complex.sq_norm, normSq_apply, sub_re, sub_im, re_s₂, im_s₂, one_im]
      ring
    exact (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).1 (by linarith [sq_nonneg s.im])
  have product : 1 ≤ ‖LSeries ((1 : DirichletCharacter ℂ N) ·) s.re‖ ^ 3 * ‖LSeries (χ ·) s‖ ^ 4 *
      ‖LSeries ((χ ^ 2) ·) s₂‖ := by
    have at_re : (1 : ℂ) + (s.re - 1 : ℝ) = s.re := by simp
    have at_s : s.re + I * s.im = s := by rw [mul_comm, re_add_im]
    have at_s₂ : s.re + 2 * I * s.im = s₂ := by linear_combination at_s
    simpa only [at_re, at_s, at_s₂, norm_mul, norm_pow] using
      χ.norm_LSeries_product_ge_one (by linarith : 0 < s.re - 1) s.im
  have trivial_char_le : ‖LSeries ((1 : DirichletCharacter ℂ N) ·) s.re‖ ≤ 2 / η := calc
    _ ≤ 1 + 1 / η := norm_LSeries_char_le 1 (one_div_pos.2 hη) (by simpa using h_re)
    _ ≤ 1 / η + 1 / η := by linarith [one_le_one_div hη hη_le]
    _ = 2 / η := by ring
  have char_le : ‖LSeries (χ ·) s‖ ≤ 2 * L * ‖regularL χ s‖ :=
    norm_LSeries_le_mul_norm_regularL χ (by linarith) hL fun hχ ↦ h_far (by simp [hχ])
  have sq_char_le : ‖LSeries ((χ ^ 2) ·) s₂‖ ≤ 2 * L * (K * l) := by
    have h_far₂ : χ ^ 2 = 1 → 1 / L ≤ ‖s₂ - 1‖ := fun hχ ↦ (h_far hχ).trans dist_s₂
    have re_s₂_ge : 1 - 1 / l ≤ s₂.re := by linarith [one_div_pos.2 (one_pos.trans_le hl_one)]
    grw [norm_LSeries_le_mul_norm_regularL (χ ^ 2) (by linarith) hL h_far₂,
      norm_regularL_le_log_linear (χ ^ 2) hl hN re_s₂_ge norm_s₂]
  calc η ^ 3 ≤ η ^ 3 * ((2 / η) ^ 3 * (2 * L * ‖regularL χ s‖) ^ 4 * (2 * L * (K * l))) := by
        grw [← trivial_char_le, ← char_le, ← sq_char_le, ← product, mul_one]
    _ = 8 * (2 * L) ^ 5 * K * l * ‖regularL χ s‖ ^ 4 := by field

/-- A lower bound from the 3-4-1 inequality with neighborhood radius `1 / l`. -/
lemma pow_three_le_mul_norm_regularL_pow (χ : DirichletCharacter ℂ N) {s : ℂ} {l : ℝ}
    (hl : 10 ^ 10 ≤ l) (hN : N ≤ rexp l) {η : ℝ} (hη : 0 < η) (hη_le : η ≤ 1)
    (h_far : χ ^ 2 = 1 → 1 / l ≤ ‖s - 1‖) (h_re : 1 + η ≤ s.re)
    (h_norm : ‖s‖ ≤ 3 / 2 * rexp l) :
    η ^ 3 ≤ 256 * l ^ 7 * ‖regularL χ s‖ ^ 4 := by
  have hK : K ≤ l := (by norm_num : K ≤ (10 : ℝ) ^ 10).trans hl
  calc η ^ 3 ≤ 8 * (2 * l) ^ 5 * K * l * ‖regularL χ s‖ ^ 4 :=
        pow_three_le_mul_norm_regularL_pow_of_fixed_neighborhood χ hl hN hη hη_le
          (by linarith) h_far h_re h_norm
    _ ≤ 8 * (2 * l) ^ 5 * l * l * ‖regularL χ s‖ ^ 4 := by gcongr
    _ = _ := by ring

/-- Let `l ≥ 10¹⁰` and `N ≤ e^l`; if `χ²` is principal, let `|𝖿_χ| ≥ 1 / l` within `1 / l` of `1`,
where `𝖿_χ = regularL χ` is `L(s, χ)`, times `(s - 1) / s` if `χ` is principal.
Then `|𝖿_χ(s)| ≥ 12 / l²²` for `re s ≥ 1 + l⁻²⁵` and `|s| ≤ 3 e^l / 2`. -/
lemma div_pow_le_norm_regularL (χ : DirichletCharacter ℂ N) {s : ℂ} {l : ℝ}
    (hl : 10 ^ 10 ≤ l) (hN : N ≤ rexp l)
    (h_near : χ ^ 2 = 1 → ∀ z : ℂ, ‖z - 1‖ ≤ 1 / l → 1 / l ≤ ‖regularL χ z‖)
    (h_re : 1 + 1 / l ^ 25 ≤ s.re) (h_norm : ‖s‖ ≤ 3 / 2 * rexp l) :
    12 / l ^ 22 ≤ ‖regularL χ s‖ := by
  have hl_one : 1 ≤ l := by linarith
  by_cases! h_far : χ ^ 2 = 1 → 1 / l ≤ ‖s - 1‖
  · -- if `χ²` is not principal or `s` is not near `1`, the 3-4-1 bound with `η = l⁻²⁵` applies
    have hη_le : 1 / l ^ 25 ≤ 1 := div_le_one_of_le₀ (one_le_pow₀ hl_one) (by positivity)
    have h_const : 256 * 12 ^ 4 ≤ l ^ 6 := by linarith [le_self_pow₀ hl_one (by norm_num : 6 ≠ 0)]
    have h_mul : 256 * l ^ 7 * (12 / l ^ 22) ^ 4 ≤ 256 * l ^ 7 * ‖regularL χ s‖ ^ 4 := calc
      _ = 256 * 12 ^ 4 / l ^ 81 := by field
      _ ≤ l ^ 6 / l ^ 81 := by gcongr
      _ = (1 / l ^ 25) ^ 3 := by field
      _ ≤ _ := pow_three_le_mul_norm_regularL_pow χ hl hN (by positivity) hη_le h_far h_re h_norm
    exact le_of_pow_le_pow_left₀ four_ne_zero (norm_nonneg _)
      (le_of_mul_le_mul_left h_mul (by positivity))
  · obtain ⟨hχ, h_close⟩ : χ ^ 2 = 1 ∧ ‖s - 1‖ < 1 / l := h_far
    calc 12 / l ^ 22 ≤ l / l ^ 2 := by gcongr <;> linarith
      _ = 1 / l := by field
      _ ≤ ‖regularL χ s‖ := h_near hχ s h_close.le

private lemma norm_logDeriv_regularL_le_of_shift (χ : DirichletCharacter ℂ N) {s : ℂ} {l η : ℝ}
    (hl : 10 ^ 10 ≤ l) (hN : N ≤ rexp l)
    (hη_pos : 0 < η) (hη_le : η ≤ 1 / l / 6)
    (h_right : ∀ z : ℂ, 1 + η ≤ z.re → ‖z‖ ≤ 3 / 2 * rexp l →
      12 * K * l ^ 2 * η ≤ ‖regularL χ z‖)
    (h_re : 1 - η ≤ s.re) (h_norm : ‖s‖ ≤ rexp l) :
    regularL χ s ≠ 0 ∧ ‖logDeriv (regularL χ) s‖ ≤ 1 / (4 * η) := by
  have exp_ge : l + 1 ≤ rexp l := add_one_le_exp l
  have inv_le : 1 / l ≤ 1 / 6 := one_div_le_one_div_of_le (by norm_num) (by linarith)
  have bounds (z : ℂ) (hz : z ∈ closedBall s (2 * η)) :
      1 - 1 / l / 2 ≤ z.re ∧ ‖z‖ ≤ 2 * rexp l := by
    rw [mem_closedBall_iff_norm] at hz
    have h_dist : |z.re - s.re| ≤ ‖z - s‖ := by simpa using abs_re_le_norm (z - s)
    exact ⟨by linarith [(abs_le.1 h_dist).1], by linarith [norm_le_norm_sub_add z s]⟩
  have deriv_le (z : ℂ) (hz : z ∈ closedBall s (2 * η)) :
      ‖deriv (regularL χ) z‖ ≤ 2 * K * l ^ 2 :=
    norm_deriv_regularL_le_log_quadratic χ hl hN (bounds z hz).1 (bounds z hz).2
  have hs_mem : s ∈ closedBall s (2 * η) := mem_closedBall_self (by positivity)
  let v : ℂ := s + (2 * η : ℝ)
  have dist_v : ‖v - s‖ = 2 * η := by simp [v, hη_pos.le]
  have re_v : v.re = s.re + 2 * η := by simp [v]
  have change_le : ‖regularL χ v - regularL χ s‖ ≤ 4 * K * l ^ 2 * η := calc
    _ ≤ 2 * K * l ^ 2 * ‖v - s‖ :=
      (convex_closedBall s (2 * η)).norm_image_sub_le_of_norm_deriv_le
        (fun z hz ↦ differentiableAt_regularL χ (by linarith [(bounds z hz).1])) deriv_le hs_mem
        (mem_closedBall_iff_norm.2 dist_v.le)
    _ = 4 * K * l ^ 2 * η := by rw [dist_v]; ring
  have large_v : 12 * K * l ^ 2 * η ≤ ‖regularL χ v‖ :=
    h_right v (by linarith) (by linarith [norm_le_norm_sub_add v s])
  have large_s : 8 * K * l ^ 2 * η ≤ ‖regularL χ s‖ := calc
    _ = 12 * K * l ^ 2 * η - 4 * K * l ^ 2 * η := by ring
    _ ≤ ‖regularL χ s‖ := by linarith [norm_sub_norm_le (regularL χ v) (regularL χ s)]
  refine ⟨norm_pos_iff.1 (lt_of_lt_of_le (by positivity) large_s), ?_⟩
  calc ‖logDeriv (regularL χ) s‖ ≤ (2 * K * l ^ 2) / (8 * K * l ^ 2 * η) := by
        grw [logDeriv_apply, norm_div, deriv_le s hs_mem, ← large_s]
    _ = 1 / (4 * η) := by field

/-- The logarithmic derivative bound with width `l⁻²⁵` and neighborhood radius `1 / l`. -/
lemma norm_logDeriv_regularL_le (χ : DirichletCharacter ℂ N) {s : ℂ} {l : ℝ}
    (hl : 10 ^ 10 ≤ l) (hN : N ≤ rexp l)
    (h_near : χ ^ 2 = 1 → ∀ z : ℂ, ‖z - 1‖ ≤ 1 / l → 1 / l ≤ ‖regularL χ z‖)
    (h_re : 1 - 1 / l ^ 25 ≤ s.re) (h_norm : ‖s‖ ≤ rexp l) :
    regularL χ s ≠ 0 ∧ ‖logDeriv (regularL χ) s‖ ≤ l ^ 25 := by
  have hl_pos : 0 < l := by linarith
  have hK : K ≤ l := (by norm_num : K ≤ (10 : ℝ) ^ 10).trans hl
  have hη_le : 1 / l ^ 25 ≤ 1 / l / 6 := calc
    _ ≤ 1 / l ^ 2 := by gcongr <;> linarith
    _ = 1 / l * (1 / l) := by ring
    _ ≤ _ := by grw [div_eq_mul_one_div (1 / l) 6,
      ← one_div_le_one_div_of_le (show (0 : ℝ) < 6 by norm_num) (show 6 ≤ l by linarith)]
  have h_right (z : ℂ) (hz_re : 1 + 1 / l ^ 25 ≤ z.re) (hz : ‖z‖ ≤ 3 / 2 * rexp l) :
      12 * K * l ^ 2 * (1 / l ^ 25) ≤ ‖regularL χ z‖ := calc
    _ ≤ 12 * l * l ^ 2 * (1 / l ^ 25) := by gcongr
    _ = 12 / l ^ 22 := by field
    _ ≤ _ := div_pow_le_norm_regularL χ hl hN h_near hz_re hz
  obtain ⟨h_ne, h_le⟩ := norm_logDeriv_regularL_le_of_shift χ hl hN (by positivity)
    hη_le h_right h_re h_norm
  refine ⟨h_ne, h_le.trans ?_⟩
  calc 1 / (4 * (1 / l ^ 25)) = l ^ 25 / 4 := by field
    _ ≤ _ := div_le_self (by positivity) (by norm_num)

private lemma norm_logDeriv_entireL_le_of_regularL (χ : DirichletCharacter ℂ N) {s : ℂ} {C : ℝ}
    (h_re : 1 / 2 ≤ s.re) (h_ne : regularL χ s ≠ 0)
    (h_bound : ‖logDeriv (regularL χ) s‖ ≤ C) :
    entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ C + 2 := by
  -- `regularL χ` is `entireL χ` divided by the factor `u`, which is `s` or `1`
  let u (z : ℂ) : ℂ := if χ = 1 then z else 1
  have h_eq : regularL χ = fun z : ℂ ↦ entireL χ z / u z := by
    ext z
    by_cases hχ : χ = 1 <;> simp [regularL, u, hχ]
  obtain ⟨h_entire, hu⟩ : entireL χ s ≠ 0 ∧ u s ≠ 0 := by rwa [h_eq, div_ne_zero_iff] at h_ne
  have u_diff : DifferentiableAt ℂ u s := by by_cases hχ : χ = 1 <;> simp [u, hχ]
  have h_split : logDeriv (entireL χ) s = logDeriv (regularL χ) s + logDeriv u s := by
    have h_div : logDeriv (fun z : ℂ ↦ entireL χ z / u z) s =
        logDeriv (entireL χ) s - logDeriv u s :=
      logDeriv_div s h_entire hu (analyticAt_entireL χ s).differentiableAt u_diff
    rw [h_eq, h_div, sub_add_cancel]
  have u_bound : ‖logDeriv u s‖ ≤ 2 := by
    have hs_norm : 1 / 2 ≤ ‖s‖ := h_re.trans (re_le_norm s)
    by_cases hχ : χ = 1
    · simpa [u, hχ] using (one_div_le (by linarith) two_pos).2 hs_norm
    · simp [u, hχ]
  refine ⟨h_entire, ?_⟩
  rw [h_split]
  linarith [norm_add_le (logDeriv (regularL χ) s) (logDeriv u s)]

/-- The zero-free and logarithmic derivative bounds with width `l⁻²⁵`. -/
lemma norm_logDeriv_entireL_le (χ : DirichletCharacter ℂ N) {s : ℂ} {l : ℝ}
    (hl : 10 ^ 10 ≤ l) (hN : N ≤ rexp l)
    (h_near : χ ^ 2 = 1 → ∀ z : ℂ, ‖z - 1‖ ≤ 1 / l → 1 / l ≤ ‖regularL χ z‖)
    (h_re : 1 - 1 / l ^ 25 ≤ s.re) (h_norm : ‖s‖ ≤ rexp l) :
    entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ 2 * l ^ 25 := by
  have two_le : 2 ≤ l ^ 25 := by
    linarith [le_self_pow₀ (by linarith : 1 ≤ l) (by norm_num : 25 ≠ 0)]
  have h_half : 1 / 2 ≤ s.re := by linarith [one_div_le_one_div_of_le two_pos two_le]
  obtain ⟨h_ne, h_bound⟩ := norm_logDeriv_regularL_le χ hl hN h_near h_re h_norm
  exact (norm_logDeriv_entireL_le_of_regularL χ h_half h_ne h_bound).imp_right
    (fun h ↦ h.trans (by linarith))

/-- **Zero-free region** for a fixed character: for all large `l`, on `re s ≥ 1 - l⁻²⁵`,
`|s| ≤ e^l` the function `entireL χ` (`L(s, χ)` with the pole removed) does not vanish and its
logarithmic derivative is at most `2 l²⁵`. -/
theorem eventually_norm_logDeriv_entireL_le (χ : DirichletCharacter ℂ N) :
    ∀ᶠ l : ℝ in atTop, ∀ s : ℂ, 1 - 1 / l ^ 25 ≤ s.re → ‖s‖ ≤ rexp l →
      entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ 2 * l ^ 25 := by
  have inv_tendsto : Tendsto (fun l : ℝ ↦ 1 / l) atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop tendsto_id
  filter_upwards [eventually_ge_atTop (10 ^ 10), eventually_ge_atTop (N : ℝ),
    inv_tendsto.eventually (eventually_le_norm_regularL χ)] with l hl hN h_near s
  exact norm_logDeriv_entireL_le χ hl (by linarith [add_one_le_exp l]) fun _ ↦ h_near

/-- The width multiplier for a neighborhood of radius `1 / L`. -/
noncomputable def fixedZeroFreeWidth (L : ℝ) : ℝ := 1 / max 1 (8 * (2 * L) ^ 5 * K * (12 * K) ^ 4)

lemma fixedZeroFreeWidth_pos (L : ℝ) : 0 < fixedZeroFreeWidth L :=
  one_div_pos.2 (zero_lt_one.trans_le (le_max_left _ _))

lemma fixedZeroFreeWidth_le_one (L : ℝ) : fixedZeroFreeWidth L ≤ 1 :=
  (div_le_one (zero_lt_one.trans_le (le_max_left (1 : ℝ) _))).2 (le_max_left _ _)

/-- A fixed neighborhood of `1` gives a zero-free region of width `c / l ^ 9`, uniformly for all
moduli at most `exp l` and all characters with the stated neighborhood bound. -/
theorem eventually_norm_logDeriv_entireL_le_of_fixed_neighborhood_uniform {L : ℝ} (hL : 1 ≤ L) :
    ∀ᶠ l : ℝ in atTop, ∀ {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q), (q : ℝ) ≤ rexp l →
      (χ ^ 2 = 1 → ∀ z : ℂ, ‖z - 1‖ ≤ 1 / L → 1 / L ≤ ‖regularL χ z‖) →
      ∀ s : ℂ, 1 - fixedZeroFreeWidth L / l ^ 9 ≤ s.re → ‖s‖ ≤ rexp l →
        entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ l ^ 9 / fixedZeroFreeWidth L := by
  let C := 8 * (2 * L) ^ 5 * K * (12 * K) ^ 4
  let c := fixedZeroFreeWidth L
  have hc : 0 < c := fixedZeroFreeWidth_pos L
  have hc_le : c ≤ 1 := fixedZeroFreeWidth_le_one L
  have h_constant : C * c ≤ 1 := by
    change C * (1 / max 1 C) ≤ 1
    rw [mul_one_div]
    exact (div_le_one (zero_lt_one.trans_le (le_max_left _ _))).2 (le_max_right _ _)
  filter_upwards [eventually_ge_atTop (10 ^ 10), eventually_ge_atTop (12 * K * L)]
    with l hl h_near_scale
  intro q _ χ hN_exp h_near s h_re h_norm
  have hl_one : 1 ≤ l := by linarith
  have hl_pos : 0 < l := one_pos.trans_le hl_one
  let η := c / l ^ 9
  have hη_pos : 0 < η := by positivity
  have inv_le : 1 / l ≤ 1 / 6 := one_div_le_one_div_of_le (by norm_num) (by linarith)
  have hη_le : η ≤ 1 / l / 6 := calc
    _ ≤ 1 / l ^ 9 := div_le_div_of_nonneg_right hc_le (by positivity)
    _ ≤ 1 / l ^ 2 := one_div_le_one_div_of_le (by positivity)
      (pow_le_pow_right₀ hl_one (by decide : (2 : ℕ) ≤ 9))
    _ = 1 / l * (1 / l) := by ring
    _ ≤ _ := by grw [div_eq_mul_one_div (1 / l) 6, ← inv_le]
  have hη_small : η ≤ 1 / 4 := by linarith
  have h_right (z : ℂ) (hz_re : 1 + η ≤ z.re) (hz : ‖z‖ ≤ 3 / 2 * rexp l) :
      12 * K * l ^ 2 * η ≤ ‖regularL χ z‖ := by
    by_cases! h_far : χ ^ 2 = 1 → 1 / L ≤ ‖z - 1‖
    · have h_width : l ^ 9 * η = c := by dsimp only [η]; field
      have h_mul : 8 * (2 * L) ^ 5 * K * l * (12 * K * l ^ 2 * η) ^ 4 ≤
          8 * (2 * L) ^ 5 * K * l * ‖regularL χ z‖ ^ 4 := calc
        _ = C * (l ^ 9 * η) * η ^ 3 := by dsimp only [C]; ring
        _ = C * c * η ^ 3 := by rw [h_width]
        _ ≤ η ^ 3 := by
          simpa only [one_mul] using mul_le_mul_of_nonneg_right h_constant (by positivity : 0 ≤ η ^ 3)
        _ ≤ _ := pow_three_le_mul_norm_regularL_pow_of_fixed_neighborhood χ hl hN_exp hη_pos
          (hη_small.trans (by norm_num)) hL h_far hz_re hz
      exact le_of_pow_le_pow_left₀ four_ne_zero (norm_nonneg _)
        (le_of_mul_le_mul_left h_mul (by positivity))
    · obtain ⟨hχ, h_close⟩ : χ ^ 2 = 1 ∧ ‖z - 1‖ < 1 / L := h_far
      calc 12 * K * l ^ 2 * η = 12 * K * c / l ^ 7 := by dsimp only [η]; field
        _ ≤ 12 * K / l ^ 7 :=
          div_le_div_of_nonneg_right
            (mul_le_of_le_one_right (by positivity : 0 ≤ 12 * K) hc_le) (by positivity)
        _ ≤ 12 * K / l :=
          div_le_div_of_nonneg_left (by positivity) hl_pos (le_self_pow₀ hl_one (by decide))
        _ ≤ 1 / L := (div_le_div_iff₀ hl_pos (one_pos.trans_le hL)).2 (by simpa using h_near_scale)
        _ ≤ _ := h_near hχ z h_close.le
  obtain ⟨h_ne, h_le⟩ := norm_logDeriv_regularL_le_of_shift χ hl hN_exp hη_pos hη_le h_right h_re h_norm
  have h_half : 1 / 2 ≤ s.re := by
    change 1 - η ≤ s.re at h_re
    linarith
  refine (norm_logDeriv_entireL_le_of_regularL χ h_half h_ne h_le).imp_right fun h ↦ h.trans ?_
  calc 1 / (4 * η) + 2 ≤ 1 / η := by
        apply (le_div_iff₀ hη_pos).2
        rw [show (1 / (4 * η) + 2) * η = 1 / 4 + 2 * η by field]
        linarith
    _ = l ^ 9 / c := by dsimp only [η]; field

/-- The fixed-neighborhood estimate for a character of fixed modulus. -/
theorem eventually_norm_logDeriv_entireL_le_of_fixed_neighborhood (χ : DirichletCharacter ℂ N) {L : ℝ}
    (hL : 1 ≤ L)
    (h_near : χ ^ 2 = 1 → ∀ z : ℂ, ‖z - 1‖ ≤ 1 / L → 1 / L ≤ ‖regularL χ z‖) :
    ∀ᶠ l : ℝ in atTop, ∀ s : ℂ, 1 - fixedZeroFreeWidth L / l ^ 9 ≤ s.re → ‖s‖ ≤ rexp l →
      entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ l ^ 9 / fixedZeroFreeWidth L := by
  filter_upwards [eventually_norm_logDeriv_entireL_le_of_fixed_neighborhood_uniform hL,
    eventually_ge_atTop (N : ℝ)] with l h hN
  exact h χ (hN.trans (by linarith [add_one_le_exp l])) h_near

end New
