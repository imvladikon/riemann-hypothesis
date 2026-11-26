module

import Lib.Analytic.Primes
public import New.Reduction.Data.Existence

/-!
# A subexponential window for the admissible data

At `y = log x`, balance the dimension of the sparse set against the modulus bound. The window
width `W` then satisfies `log W = O (√(y * log y))`. The explicit prime-window estimate applies
with a modulus bounded by `exp (C * y)`, and the same `W` controls `log b` and the density loss.
-/

@[expose] public section

open Asymptotics Filter Finset NumberField Real

namespace New

/-- The window width obtained by balancing the modulus and sparse-set requirements. -/
noncomputable def Parameters.subexponentialWindowWidth (P : Parameters) (y : ℝ) : ℝ :=
  exp (3 * sqrt ((99 * (P.q₀ : ℝ) * P.d + 1) * y * log (5184 * y)))

private lemma eventually_log_scale_le (c : ℝ) (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, log (5184 * y) ≤ c * y := by
  filter_upwards [isLittleO_log_id_atTop.def (half_pos hc),
    eventually_ge_atTop (max 1 (log 5184 / (c / 2)))] with y h_log hy
  have hy_pos : 0 < y := one_pos.trans_le ((le_max_left _ _).trans hy)
  have h_const : log 5184 ≤ c / 2 * y := by
    simpa only [mul_comm] using (div_le_iff₀ (half_pos hc)).1 ((le_max_right _ _).trans hy)
  have h_le : log y ≤ c / 2 * y :=
    (le_norm_self _).trans (by simpa only [id, Real.norm_eq_abs, abs_of_pos hy_pos] using h_log)
  rw [log_mul (by norm_num : (5184 : ℝ) ≠ 0) hy_pos.ne']
  linarith only [h_const, h_le]

private lemma eventually_sqrt_scale_le {A c : ℝ} (hA : 0 < A) (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, sqrt (A * y * log (5184 * y)) ≤ c * y := by
  filter_upwards [eventually_log_scale_le (c ^ 2 / A) (by positivity),
    eventually_ge_atTop (0 : ℝ)] with y h_log hy
  have h_compare : A * y * log (5184 * y) ≤ (c * y) ^ 2 := calc
    _ ≤ A * y * (c ^ 2 / A * y) := mul_le_mul_of_nonneg_left h_log (by positivity)
    _ = _ := by field_simp [hA.ne']
  exact (sqrt_le_sqrt h_compare).trans_eq (sqrt_sq (by positivity))

/-- The logarithm of the window is eventually smaller than any positive multiple of `y`. -/
theorem Parameters.eventually_log_subexponentialWindowWidth_le (P : Parameters) {c : ℝ}
    (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, log (P.subexponentialWindowWidth y) ≤ c * y := by
  have hA : 0 < 99 * (P.q₀ : ℝ) * P.d + 1 := by positivity
  filter_upwards [eventually_sqrt_scale_le hA (div_pos hc (by norm_num : (0 : ℝ) < 3))] with y hy
  rw [Parameters.subexponentialWindowWidth, log_exp]
  linarith only [hy]

/-- The modulus and left endpoint can both be bounded by an exponential linear in `y`.
The window itself has logarithm of order `sqrt (y * log y)`. -/
theorem Parameters.eventually_isLargeScale_subexponential (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, ∃ n : ℕ, P.IsLargeScale n y (P.subexponentialWindowWidth y) ∧
      ((n : ℝ) + 7) * log (P.subexponentialWindowWidth y) ≤
        (3 * (99 * (P.q₀ : ℝ) * P.d + 1) + 1) * y ∧
      exp (3 * sqrt y) ≤ P.subexponentialWindowWidth y := by
  let A : ℝ := 99 * (P.q₀ : ℝ) * P.d + 1
  let K : ℝ := 1e12 * P.constantBound
  have hA : 1 ≤ A := le_add_of_nonneg_left
    (show 0 ≤ 99 * (P.q₀ : ℝ) * P.d by positivity)
  have hA_pos : 0 < A := one_pos.trans_le hA
  have h_log : Tendsto (fun y : ℝ ↦ log (5184 * y)) atTop atTop :=
    tendsto_log_atTop.comp (tendsto_id.const_mul_atTop (by norm_num))
  filter_upwards [eventually_sqrt_scale_le hA_pos (by norm_num : 0 < (1 / 3600 : ℝ)),
    eventually_log_scale_le 1 one_pos, h_log.eventually_ge_atTop 1, eventually_ge_atTop (200 : ℝ),
    eventually_ge_atTop (K ^ 2), eventually_ge_atTop (2 * (classNumber P.K : ℝ) + 2)]
    with y h_log_small h_log_le h_log_one hy hK h_class
  let L := log (5184 * y)
  let S := sqrt (A * y * L)
  let W := exp (3 * S)
  let t := A * y / S
  let n : ℕ := ⌈t⌉₊ + 1
  change ∃ n : ℕ, P.IsLargeScale n y W ∧ ((n : ℝ) + 7) * log W ≤ (3 * A + 1) * y ∧
    exp (3 * sqrt y) ≤ W
  have hy_one : 1 ≤ y := by linarith
  have hy_pos : 0 < y := one_pos.trans_le hy_one
  have hL_one : 1 ≤ L := h_log_one
  have hL_pos : 0 < L := one_pos.trans_le hL_one
  have hS_pos : 0 < S := sqrt_pos_of_pos (by positivity)
  have hS_sq : S ^ 2 = A * y * L := sq_sqrt (by positivity)
  have hS_le : S ≤ (1 / 3600 : ℝ) * y := h_log_small
  have hL_le_y : L ≤ y := by simpa only [one_mul] using h_log_le
  have hy_le_Ay : y ≤ A * y := le_mul_of_one_le_left hy_pos.le hA
  have hL_le_S : L ≤ S := by
    have h_mul := mul_le_mul_of_nonneg_right (hL_le_y.trans hy_le_Ay) hL_pos.le
    simpa only [sqrt_mul_self hL_pos.le] using sqrt_le_sqrt h_mul
  have h_sqrt_y : sqrt y ≤ S := sqrt_le_sqrt
    (hy_le_Ay.trans (le_mul_of_one_le_right (by positivity : 0 ≤ A * y) hL_one))
  have ht_pos : 0 < t := div_pos (by positivity) hS_pos
  have hn_two : 2 ≤ n := Nat.succ_le_succ (Nat.ceil_pos.2 ht_pos)
  have ht_le_n : t ≤ (n : ℝ) := by
    dsimp [n]
    exact (Nat.le_ceil t).trans (by push_cast; linarith)
  have hn_le : (n : ℝ) ≤ t + 2 := by
    dsimp [n]
    push_cast
    linarith only [Nat.ceil_lt_add_one ht_pos.le]
  have h_tS : t * S = A * y := div_mul_cancel₀ _ hS_pos.ne'
  have h_tL : t * L = S := by
    dsimp [t]
    field_simp [hS_pos.ne']
    nlinarith only [hS_sq]
  have h_nL : (n : ℝ) * L ≤ 3 * S := calc
    _ ≤ (t + 2) * L := mul_le_mul_of_nonneg_right hn_le hL_pos.le
    _ = S + 2 * L := by rw [add_mul, h_tL]
    _ ≤ _ := by linarith only [hL_le_S]
  have h_room : (5184 * y) ^ n ≤ W := by
    have h_base : 0 < 5184 * y := by positivity
    apply (log_le_iff_le_exp (pow_pos h_base n)).1
    rw [log_pow]
    exact h_nL
  have h_base_one : 1 ≤ 5184 * y := by linarith
  have h_base_sq : (5184 * y) ^ 2 ≤ W :=
    (pow_le_pow_right₀ h_base_one hn_two).trans h_room
  have h_large : 2e6 * y ≤ W := (show 2e6 * y ≤ (5184 * y) ^ 2 by nlinarith).trans h_base_sq
  have hn_pow : (n : ℝ) + 1 ≤ (2 : ℝ) ^ n := by
    exact_mod_cast (Nat.succ_le_of_lt n.lt_two_pow_self)
  have h_count : 7776 * y * (n : ℝ) * 2 ^ n ≤ W := calc
    _ ≤ 7776 * y * (2 : ℝ) ^ n * 2 ^ n := by
      gcongr
      linarith only [hn_pow]
    _ = 7776 * y * (4 : ℝ) ^ n := by rw [mul_assoc, ← mul_pow]; norm_num
    _ ≤ (1296 * y) ^ n * (4 : ℝ) ^ n := by
      refine mul_le_mul_of_nonneg_right ?_ (by positivity)
      exact (show 7776 * y ≤ (1296 * y) ^ 2 by nlinarith).trans
        (pow_le_pow_right₀ (by linarith) hn_two)
    _ = (5184 * y) ^ n := by rw [← mul_pow]; congr 1; ring
    _ ≤ W := h_room
  have h_logW : log W = 3 * S := log_exp _
  have hK_le : K ≤ S := calc
    K ≤ |K| := le_abs_self _
    _ = sqrt (K ^ 2) := (sqrt_sq_eq_abs _).symm
    _ ≤ sqrt y := sqrt_le_sqrt hK
    _ ≤ S := h_sqrt_y
  refine ⟨n, {
    log_W_le := by rw [h_logW]; linarith only [hS_le, hy]
    const_le := by rw [h_logW]; change K ≤ 3 * S; linarith only [hK_le, hS_pos]
    mul_y_le_W := h_large
    classNumber_le := h_class.trans ((show y ≤ 2e6 * y by linarith).trans h_large)
    n_pos := by omega
    add_one_le := hn_pow.trans ((pow_le_pow_left₀ (by norm_num) (by linarith) n).trans h_room)
    le_mul_log_W := ?_
    pow_le := h_room
    mul_two_pow_le := h_count
  }, ?_, exp_le_exp.2 (mul_le_mul_of_nonneg_left h_sqrt_y (by norm_num))⟩
  · rw [h_logW]
    have h_lower := mul_le_mul_of_nonneg_right ht_le_n hS_pos.le
    have h_coeff : 99 * (P.q₀ : ℝ) * P.d ≤ A := by dsimp [A]; linarith
    calc
      _ ≤ A * y := mul_le_mul_of_nonneg_right h_coeff hy_pos.le
      _ = t * S := h_tS.symm
      _ ≤ (n : ℝ) * S := h_lower
      _ ≤ _ := by nlinarith only [mul_nonneg (Nat.cast_nonneg n) hS_pos.le]
  · rw [h_logW]
    have h_upper := mul_le_mul_of_nonneg_right hn_le hS_pos.le
    nlinarith only [h_upper, h_tS, hS_le, hy_pos]

private lemma eventually_mul_pow_le_exp_sqrt (C : ℝ) (n : ℕ) :
    ∀ᶠ y : ℝ in atTop, C * y ^ n ≤ exp (sqrt y) := by
  have h_exp : ∀ᶠ t : ℝ in atTop, C * t ^ (2 * n) ≤ exp t := by
    filter_upwards [((isLittleO_pow_exp_pos_mul_atTop (2 * n) one_pos).const_mul_left C).eventuallyLE]
      with t ht
    exact (le_norm_self _).trans (by simpa only [one_mul, norm_of_nonneg (exp_pos t).le] using ht)
  filter_upwards [tendsto_sqrt_atTop.eventually h_exp, eventually_ge_atTop (0 : ℝ)] with y hy hy₀
  simpa only [pow_mul, sq_sqrt hy₀] using hy

/-- Every fixed polynomial cutoff fits the subexponential window width. -/
theorem Parameters.eventually_mul_pow_le_subexponentialWindowWidth (P : Parameters) (C : ℝ) (n : ℕ) :
    ∀ᶠ y : ℝ in atTop, C * y ^ n ≤ P.subexponentialWindowWidth y := by
  filter_upwards [P.eventually_isLargeScale_subexponential, eventually_mul_pow_le_exp_sqrt C n]
    with y ⟨_, _, _, hW⟩ hy
  exact hy.trans ((exp_le_exp.2 (by linarith [sqrt_nonneg y])).trans hW)

/-- The subexponential width supplies every prime window required by admissible data. -/
theorem Parameters.eventually_isLargeScale_with_prime_windows (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, ∃ n : ℕ, P.IsLargeScale n y (P.subexponentialWindowWidth y) ∧
      ∀ k : ℕ, 1 < k →
        ((P.q₀ * P.d : ℕ) : ℝ) ^ k ≤ (P.subexponentialWindowWidth y) ^ (n + 7) →
        ∀ U ∈ Set.Icc (P.subexponentialWindowWidth y) ((P.subexponentialWindowWidth y) ^ (n + 7)),
          ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD (P.q₀ * P.d) ^ k] ∧
            Real.log p ∈ Set.Icc U (U + P.subexponentialWindowWidth y) := by
  let D : ℝ := 3 * (99 * (P.q₀ : ℝ) * P.d + 1) + 1
  have hD : 0 < D := by dsimp [D]; positivity
  have hD_top : Tendsto (fun y : ℝ ↦ D * y) atTop atTop := tendsto_id.const_mul_atTop hD
  have h_four : 4 ∣ P.q₀ * P.d := Dvd.dvd.mul_right (.trans (by norm_num) P.dvd_q₀) P.d
  obtain ⟨C, -, h_prime⟩ := exists_eventually_prime_modEq_one_log_mem_of_quadratic_width _ h_four
  have h_width : ∀ᶠ y : ℝ in atTop, C * (D * y) ^ (2 : ℕ) ≤ P.subexponentialWindowWidth y := by
    simpa only [mul_pow, ← mul_assoc] using P.eventually_mul_pow_le_subexponentialWindowWidth (C * D ^ 2) 2
  filter_upwards [P.eventually_isLargeScale_subexponential,
    hD_top.eventually h_prime, h_width] with y ⟨n, h_scale, h_top, _⟩ h_window hW_le
  let W := P.subexponentialWindowWidth y
  let l := D * y
  have hW : 0 < W := one_pos.trans_le h_scale.one_le
  have h_exp_upper : W ^ (n + 7) ≤ exp l := calc
    _ = exp (((n + 7 : ℕ) : ℝ) * log W) := by rw [exp_natCast_mul, exp_log hW]
    _ ≤ _ := exp_le_exp.2 (by push_cast; exact h_top)
  refine ⟨n, h_scale, ?_⟩
  intro k hk hq U hU
  exact h_window W U k hk hW_le (hq.trans h_exp_upper) hU.1 (hU.2.trans h_exp_upper)

/-- The polylogarithmic cutoff of degree `27` fits the window. -/
theorem Parameters.eventually_polylog_cutoff_le_window (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, 2 * (64 * y) ^ (27 : ℕ) ≤ P.subexponentialWindowWidth y := by
  simpa only [mul_pow, ← mul_assoc] using
    P.eventually_mul_pow_le_subexponentialWindowWidth (2 * 64 ^ 27) 27

/-- Use the same subexponential width for the prime windows and for the density estimate. -/
theorem eventually_exists_data_with_subexponential_windows (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let W := P.subexponentialWindowWidth (log x)
      1 ≤ W ∧ ∀ V : ℝ, 2e6 * log x ≤ V → V ≤ W → ∃ D : Data P,
        D.x = x ∧ D.natX₁ = ⌊exp V⌋₊ ∧ √x ≤ D.m ∧ D.logX₁ ∈ Set.Icc (V - 1) V ∧
        D.logB ≤ 2 * W ^ 6 ∧ towerDeg D.towerExp ≤ #D.bPlaces * W ^ 6 := by
  filter_upwards [(tendsto_log_atTop.comp tendsto_natCast_atTop_atTop).eventually
    P.eventually_isLargeScale_with_prime_windows] with x ⟨_, h_scale, h_windows⟩
  simp only [Function.comp_apply] at h_scale h_windows
  refine ⟨h_scale.one_le, ?_⟩
  intro V hV hVW
  obtain ⟨D, hx, hx₁, _, hm, _, h_logX₁, h_logB, h_density⟩ :=
    h_scale.exists_data_at_cutoff h_scale le_rfl hV hVW h_windows
  have hx_eq : D.x = x := by rw [← hx, ← D.exp_logX]
  have h_W6 := one_le_pow₀ (n := 6) h_scale.one_le
  exact ⟨D, hx_eq, hx₁, hm.1.2, h_logX₁, by linarith only [h_W6, h_logB.2], h_density⟩

end New
