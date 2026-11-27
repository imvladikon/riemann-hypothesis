module

public import New.Reduction.Data.Existence
import Lib.Analytic.Primes

/-!
# Admissible data with a polynomial scale for the logarithmic weight

The Behrend count bounds the ratio of place counts. A polynomial in the logarithmic variable
provides the scale for the weights, prime windows and auxiliary cutoff.
-/

@[expose] public section

open Asymptotics Filter Finset NumberField Real

namespace New

/-- The window width obtained by balancing the modulus and sparse-set requirements,
rounding the resulting number of digits up to a natural number. -/
noncomputable def Parameters.subexponentialWindowWidth (P : Parameters) (y : ℝ) : ℝ :=
  let L := log (5184 * y)
  let S := sqrt (99 * (P.q₀ : ℝ) * P.d * y * L)
  let n : ℕ := ⌈S / L⌉₊
  exp ((n : ℝ) * L)

private lemma Parameters.window_coefficient_ge (P : Parameters) : (256 : ℝ) ≤ 99 * (P.q₀ : ℝ) * P.d := by
  have hq : (18480 : ℝ) ≤ P.q₀ := by exact_mod_cast Nat.le_of_dvd (NeZero.pos P.q₀) P.dvd_q₀
  have hd : (1 : ℝ) ≤ P.d := by exact_mod_cast P.d_prime.one_lt.le
  calc
    _ ≤ 99 * (18480 : ℝ) * 1 := by norm_num
    _ ≤ _ := by gcongr

private lemma Parameters.one_le_window_coefficient (P : Parameters) :
    1 ≤ 99 * (P.q₀ : ℝ) * P.d :=
  (by norm_num : (1 : ℝ) ≤ 256).trans P.window_coefficient_ge

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

/-- Rounding the digit count adds at most one digit to the logarithmic width. The resulting scale
keeps the modulus and the left endpoint bounded by `exp ((A + 1) * y)`. -/
theorem Parameters.eventually_isLargeScale_subexponential_rounded (P : Parameters) :
    ∀ᶠ y : ℝ in atTop,
      let A := 99 * (P.q₀ : ℝ) * P.d
      let L := log (5184 * y)
      let S := sqrt (A * y * L)
      let W := P.subexponentialWindowWidth y
      (S ≤ log W ∧ log W ≤ S + L) ∧
        ∃ n : ℕ, P.IsLargeScale n y W ∧ ((n : ℝ) + 7) * log W ≤ (A + 1) * y ∧
          exp (3 * sqrt y) ≤ W := by
  let A : ℝ := 99 * (P.q₀ : ℝ) * P.d
  let K : ℝ := 1e12 * P.constantBound
  have hA : 1 ≤ A := P.one_le_window_coefficient
  have hA_pos : 0 < A := one_pos.trans_le hA
  have h_log : Tendsto (fun y : ℝ ↦ log (5184 * y)) atTop atTop :=
    tendsto_log_atTop.comp (tendsto_id.const_mul_atTop (by norm_num))
  filter_upwards [eventually_sqrt_scale_le hA_pos (by norm_num : 0 < (1 / 2400 : ℝ)),
    eventually_log_scale_le (1 / 4) (by norm_num), h_log.eventually_ge_atTop 9,
    eventually_ge_atTop (200 : ℝ),
    eventually_ge_atTop (K ^ 2), eventually_ge_atTop (2 * (classNumber P.K : ℝ) + 2)]
    with y h_log_small h_log_le h_log_nine hy hK h_class
  let L := log (5184 * y)
  let S := sqrt (A * y * L)
  let t := S / L
  let n : ℕ := ⌈t⌉₊
  let W := P.subexponentialWindowWidth y
  change (S ≤ log W ∧ log W ≤ S + L) ∧
    ∃ n : ℕ, P.IsLargeScale n y W ∧ ((n : ℝ) + 7) * log W ≤ (A + 1) * y ∧
      exp (3 * sqrt y) ≤ W
  have hy_one : 1 ≤ y := by linarith
  have hy_pos : 0 < y := one_pos.trans_le hy_one
  have hL_nine : 9 ≤ L := h_log_nine
  have hL_pos : 0 < L := by linarith
  have hS_pos : 0 < S := sqrt_pos_of_pos (by positivity)
  have hS_le : S ≤ (1 / 2400 : ℝ) * y := h_log_small
  have hy_le_Ay : y ≤ A * y := le_mul_of_one_le_left hy_pos.le hA
  have hL_le_y : 4 * L ≤ y := by
    change L ≤ 1 / 4 * y at h_log_le
    linarith only [h_log_le]
  have h_twoL : 2 * L ≤ S := by
    have h_mul := mul_le_mul_of_nonneg_right (hL_le_y.trans hy_le_Ay) hL_pos.le
    have h_square : (2 * L) ^ 2 ≤ A * y * L := by nlinarith only [h_mul]
    exact (sqrt_sq (by positivity : 0 ≤ 2 * L)).symm.trans_le (sqrt_le_sqrt h_square)
  have hL_le_S : L ≤ S := by linarith only [h_twoL, hL_pos]
  have h_sqrt_y : 3 * sqrt y ≤ S := by
    have h_compare : 9 * y ≤ A * y * L := calc
      _ ≤ 9 * (A * y) := mul_le_mul_of_nonneg_left hy_le_Ay (by norm_num)
      _ = (A * y) * 9 := mul_comm _ _
      _ ≤ _ := mul_le_mul_of_nonneg_left hL_nine (by positivity)
    simpa only [sqrt_mul (by norm_num : 0 ≤ (9 : ℝ)), show sqrt 9 = 3 by norm_num]
      using sqrt_le_sqrt h_compare
  have ht_two : 2 ≤ t := (le_div_iff₀ hL_pos).2 h_twoL
  have ht_le_n : t ≤ (n : ℝ) := Nat.le_ceil t
  have hn_two : 2 ≤ n := by exact_mod_cast ht_two.trans ht_le_n
  have hn_le : (n : ℝ) ≤ t + 1 := (Nat.ceil_lt_add_one (by linarith only [ht_two])).le
  have h_tL : t * L = S := div_mul_cancel₀ _ hL_pos.ne'
  have h_tS : t * S = A * y := by
    dsimp [t]
    rw [div_mul_eq_mul_div, ← pow_two, show S ^ 2 = A * y * L from sq_sqrt (by positivity)]
    exact mul_div_cancel_right₀ _ hL_pos.ne'
  have h_logW : log W = (n : ℝ) * L := log_exp _
  have h_logW_lower : S ≤ log W := by
    rw [h_logW, ← h_tL]
    exact mul_le_mul_of_nonneg_right ht_le_n hL_pos.le
  have h_logW_upper : log W ≤ S + L := calc
    _ ≤ (t + 1) * L := by rw [h_logW]; exact mul_le_mul_of_nonneg_right hn_le hL_pos.le
    _ = S + L := by rw [add_mul, h_tL, one_mul]
  have h_room : (5184 * y) ^ n ≤ W := by
    have h_base : 0 < 5184 * y := by positivity
    change (5184 * y) ^ n ≤ exp ((n : ℝ) * L)
    rw [exp_natCast_mul, exp_log h_base]
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
  have hK_le : K ≤ S := calc
    K ≤ |K| := le_abs_self _
    _ = sqrt (K ^ 2) := (sqrt_sq_eq_abs _).symm
    _ ≤ sqrt y := sqrt_le_sqrt hK
    _ ≤ S := by linarith only [h_sqrt_y, sqrt_nonneg y]
  refine ⟨⟨h_logW_lower, h_logW_upper⟩, n, {
    log_W_le := by linarith only [h_logW_upper, hL_le_S, hS_le, hy]
    const_le := hK_le.trans h_logW_lower
    mul_y_le_W := h_large
    classNumber_le := h_class.trans ((show y ≤ 2e6 * y by linarith).trans h_large)
    n_pos := by omega
    add_one_le := hn_pow.trans ((pow_le_pow_left₀ (by norm_num) (by linarith) n).trans h_room)
    le_mul_log_W := ?_
    pow_le := h_room
    mul_two_pow_le := h_count
  }, ?_, ?_⟩
  · change A * y ≤ (n : ℝ) * log W
    calc
      _ = t * S := h_tS.symm
      _ ≤ (n : ℝ) * S := mul_le_mul_of_nonneg_right ht_le_n hS_pos.le
      _ ≤ _ := mul_le_mul_of_nonneg_left h_logW_lower (Nat.cast_nonneg n)
  · calc
      _ ≤ (t + 8) * (S + L) := mul_le_mul (by linarith only [hn_le]) h_logW_upper
        (hS_pos.le.trans h_logW_lower) (by linarith only [ht_two])
      _ = A * y + 9 * S + 8 * L := by
        linear_combination h_tS + h_tL
      _ ≤ _ := by linarith only [hS_le, hL_le_S, hy]
  · change exp (3 * sqrt y) ≤ exp ((n : ℝ) * L)
    exact exp_le_exp.2 (h_sqrt_y.trans (h_logW_lower.trans_eq h_logW))

/-- The logarithm of the window is eventually smaller than any positive multiple of `y`. -/
theorem Parameters.eventually_log_subexponentialWindowWidth_le (P : Parameters) {c : ℝ}
    (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, log (P.subexponentialWindowWidth y) ≤ c * y := by
  have hc' := half_pos hc
  filter_upwards [P.eventually_isLargeScale_subexponential_rounded,
    eventually_sqrt_scale_le (one_pos.trans_le P.one_le_window_coefficient) hc',
    eventually_log_scale_le (c / 2) hc'] with y ⟨⟨_, h_width⟩, _⟩ h_sqrt h_log
  exact h_width.trans (by linarith only [h_sqrt, h_log])

/-- The modulus and left endpoint can both be bounded by an exponential linear in `y`.
The window itself has logarithm of order `sqrt (y * log y)`. -/
theorem Parameters.eventually_isLargeScale_subexponential (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, ∃ n : ℕ, P.IsLargeScale n y (P.subexponentialWindowWidth y) ∧
      ((n : ℝ) + 7) * log (P.subexponentialWindowWidth y) ≤
        (3 * (99 * (P.q₀ : ℝ) * P.d + 1) + 1) * y ∧
      exp (3 * sqrt y) ≤ P.subexponentialWindowWidth y := by
  filter_upwards [P.eventually_isLargeScale_subexponential_rounded, eventually_ge_atTop (0 : ℝ)]
    with y ⟨_, n, h_scale, h_top, h_lower⟩ hy
  refine ⟨n, h_scale, h_top.trans (mul_le_mul_of_nonneg_right ?_ hy), h_lower⟩
  linarith only [P.one_le_window_coefficient]

private lemma eventually_mul_pow_le_exp_sqrt (C : ℝ) (n : ℕ) :
    ∀ᶠ y : ℝ in atTop, C * y ^ n ≤ exp (sqrt y) := by
  have h_exp : ∀ᶠ t : ℝ in atTop, C * t ^ (2 * n) ≤ exp t := by
    filter_upwards [((isLittleO_pow_exp_pos_mul_atTop (2 * n) one_pos).const_mul_left C).eventuallyLE]
      with t ht
    exact (le_norm_self _).trans (by simpa only [one_mul, norm_of_nonneg (exp_pos t).le] using ht)
  filter_upwards [tendsto_sqrt_atTop.eventually h_exp, eventually_ge_atTop (0 : ℝ)] with y hy hy₀
  simpa only [pow_mul, sq_sqrt hy₀] using hy

/-- Any fixed polynomial in the log scale fits the subexponential width eventually. -/
theorem Parameters.eventually_mul_pow_le_subexponentialWindowWidth (P : Parameters) (C : ℝ) (n : ℕ) :
    ∀ᶠ y : ℝ in atTop, C * y ^ n ≤ P.subexponentialWindowWidth y := by
  filter_upwards [P.eventually_isLargeScale_subexponential, eventually_mul_pow_le_exp_sqrt C n]
    with y ⟨_, _, _, h_lower⟩ hy
  exact hy.trans ((exp_le_exp.2 (by linarith [sqrt_nonneg y])).trans h_lower)

/-- The subexponential width supplies every prime window required by admissible data. -/
theorem Parameters.eventually_isLargeScale_with_prime_windows (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, ∃ n : ℕ, P.IsLargeScale n y (P.subexponentialWindowWidth y) ∧
      exp (3 * sqrt y) ≤ P.subexponentialWindowWidth y ∧
      ∀ k : ℕ, 1 < k →
        ((P.q₀ * P.d : ℕ) : ℝ) ^ k ≤ (P.subexponentialWindowWidth y) ^ (n + 7) →
        ∀ U ∈ Set.Icc (P.subexponentialWindowWidth y) ((P.subexponentialWindowWidth y) ^ (n + 7)),
          ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD (P.q₀ * P.d) ^ k] ∧
            Real.log p ∈ Set.Icc U (U + P.subexponentialWindowWidth y) := by
  let C : ℝ := 99 * (P.q₀ : ℝ) * P.d + 1
  have hC : 0 < C := by dsimp [C]; positivity
  have hC_top : Tendsto (fun y : ℝ ↦ C * y) atTop atTop := tendsto_id.const_mul_atTop hC
  have h_four : 4 ∣ P.q₀ * P.d := Dvd.dvd.mul_right (.trans (by norm_num) P.dvd_q₀) P.d
  have h_pow : ∀ᶠ y : ℝ in atTop, 2 * (C * y) ^ (25 : ℕ) ≤ exp (sqrt y) := by
    simpa only [mul_pow, ← mul_assoc] using eventually_mul_pow_le_exp_sqrt (2 * C ^ 25) 25
  filter_upwards [P.eventually_isLargeScale_subexponential_rounded,
    hC_top.eventually (eventually_exists_prime_modEq_one_log_mem_of_exp _ h_four),
    hC_top.eventually_ge_atTop 8, h_pow] with y ⟨_, n, h_scale, h_top, h_lower⟩ h_window hl h_sq
  let W := P.subexponentialWindowWidth y
  let l := C * y
  let X := sqrt W
  have hW : 0 < W := one_pos.trans_le h_scale.one_le
  have hX_sq : X ^ 2 = W := sq_sqrt hW.le
  have h_exp_sqrt : exp (sqrt y) ≤ X := (le_sqrt (exp_pos _).le hW.le).2 <| calc
    exp (sqrt y) ^ 2 = exp (sqrt y + sqrt y) := by rw [exp_add, pow_two]
    _ ≤ exp (3 * sqrt y) := exp_le_exp.2 (by linarith [sqrt_nonneg y])
    _ ≤ W := h_lower
  have hX : 2 * l ^ 25 ≤ X := h_sq.trans h_exp_sqrt
  have h_lX : 16 * l ≤ X := calc
    _ ≤ 2 * l ^ 2 := by nlinarith only [mul_nonneg (show 0 ≤ l by linarith) (sub_nonneg.2 hl)]
    _ ≤ 2 * l ^ 25 := mul_le_mul_of_nonneg_left
      (pow_le_pow_right₀ (by linarith) (by norm_num : (2 : ℕ) ≤ 25)) (by norm_num)
    _ ≤ X := hX
  have h_exp_upper : W ^ (n + 7) ≤ exp l := calc
    _ = exp (((n + 7 : ℕ) : ℝ) * log W) := by rw [exp_natCast_mul, exp_log hW]
    _ ≤ _ := exp_le_exp.2 (by push_cast; exact h_top)
  refine ⟨n, h_scale, h_lower, ?_⟩
  intro k hk hq U hU
  have hU_pos : 0 < U := hW.trans_le hU.1
  have h_total : 3 * U * exp l * exp 2 < exp (4⁻¹ * X) := calc
    _ ≤ 3 * exp l * exp l * exp 2 := by grw [hU.2, h_exp_upper]
    _ = exp (log 3 + l + l + 2) := by simp only [exp_add, exp_log (by norm_num : (0 : ℝ) < 3)]
    _ ≤ exp (3 * l) := exp_le_exp.2 (by linarith [log_le_self (by norm_num : (0 : ℝ) ≤ 3)])
    _ < _ := exp_lt_exp.2 (by linarith only [hl, h_lX])
  have h_modulus := hq.trans h_exp_upper
  have h_bound : 3 * U * ((P.q₀ * P.d : ℕ) : ℝ) ^ k * exp 2 < exp (4⁻¹ * X) :=
    lt_of_le_of_lt (by grw [h_modulus]) h_total
  simpa only [hX_sq] using h_window X U k hk hX h_modulus (hX_sq.le.trans hU.1) h_bound

/-- The number of Behrend digits, chosen from the size of the tower and the spacing of digits. -/
noncomputable def behrendDigitCount (y : ℝ) : ℕ :=
  ⌈sqrt (22 * y * log (5184 * y)) / log (5184 * y)⌉₊

/-- A bound for the ratio of place counts, with leading exponent
`2 * sqrt (22 * y * log (5184 * y))`. -/
noncomputable def subexponentialWeightBound (y : ℝ) : ℝ :=
  exp (2 * sqrt (22 * y * log (5184 * y)) + 3 * log (5184 * y) + behrendDigitCount y + 44)

private lemma tendsto_log_behrend_base :
    Tendsto (fun y : ℝ ↦ log (5184 * y)) atTop atTop :=
  tendsto_log_atTop.comp (tendsto_id.const_mul_atTop (by norm_num))

private lemma eventually_log_scale_le_behrend {c : ℝ} (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, log (5184 * y) ≤ c * sqrt (22 * y * log (5184 * y)) := by
  filter_upwards [tendsto_log_behrend_base.eventually_ge_atTop 1,
    eventually_log_scale_le (22 * c ^ 2) (by positivity)] with y hL h_log
  let L := log (5184 * y)
  have hL_nonneg : 0 ≤ L := zero_le_one.trans hL
  have hL_sq : L ^ 2 ≤ c ^ 2 * (22 * y * L) := calc
    _ = L * L := pow_two _
    _ ≤ (22 * c ^ 2 * y) * L := mul_le_mul_of_nonneg_right h_log hL_nonneg
    _ = _ := by ring
  have h := sqrt_le_sqrt hL_sq
  rwa [sqrt_sq hL_nonneg, sqrt_mul (sq_nonneg c), sqrt_sq hc.le] at h

private lemma eventually_behrend_digit_bounds :
    ∀ᶠ y : ℝ in atTop,
      let L := log (5184 * y)
      let S := sqrt (22 * y * L)
      let n := behrendDigitCount y
      1 ≤ L ∧ sqrt y ≤ S ∧ 0 < n ∧ (n : ℝ) ≤ y ∧
        (n : ℝ) ≤ S / L + 1 ∧ (n : ℝ) * L ≤ S + L ∧ 22 * y ≤ (n : ℝ) * S ∧
        (5184 * y) ^ n ≤ exp (11 * y) := by
  filter_upwards [eventually_ge_atTop (2 : ℝ), tendsto_log_behrend_base.eventually_ge_atTop 1,
    eventually_log_scale_le (1 / 2) (by norm_num),
    eventually_sqrt_scale_le (A := 22) (by norm_num) (c := 1 / 2) (by norm_num)]
    with y hy hL hL_upper hS_upper
  let L := log (5184 * y)
  let S := sqrt (22 * y * L)
  let n := behrendDigitCount y
  have hy_pos : 0 < y := by linarith
  have hL_pos : 0 < L := one_pos.trans_le hL
  have hS_pos : 0 < S := sqrt_pos_of_pos (by positivity)
  have ht_pos : 0 < S / L := div_pos hS_pos hL_pos
  have hn_pos : 0 < n := Nat.ceil_pos.2 ht_pos
  have hn_lower : S / L ≤ (n : ℝ) := Nat.le_ceil _
  have hn_upper : (n : ℝ) ≤ S / L + 1 := (Nat.ceil_lt_add_one ht_pos.le).le
  have h_ratio : S / L ≤ S :=
    (div_le_iff₀ hL_pos).2 (le_mul_of_one_le_right hS_pos.le hL)
  have hn_y : (n : ℝ) ≤ y := by linarith only [hn_upper, h_ratio, hS_upper, hy]
  have hnL : (n : ℝ) * L ≤ S + L := calc
    _ ≤ (S / L + 1) * L := mul_le_mul_of_nonneg_right hn_upper hL_pos.le
    _ = _ := by rw [add_mul, div_mul_cancel₀ _ hL_pos.ne', one_mul]
  have hnS : 22 * y ≤ (n : ℝ) * S := calc
    _ = S / L * S := by
      rw [div_mul_eq_mul_div, ← pow_two, show S ^ 2 = 22 * y * L from sq_sqrt (by positivity)]
      exact (mul_div_cancel_right₀ _ hL_pos.ne').symm
    _ ≤ _ := mul_le_mul_of_nonneg_right hn_lower hS_pos.le
  have h_sqrt : sqrt y ≤ S := sqrt_le_sqrt ((show y ≤ 22 * y by linarith).trans
    (le_mul_of_one_le_right (by positivity) hL))
  refine ⟨hL, h_sqrt, hn_pos, hn_y, hn_upper, hnL, hnS, ?_⟩
  have h_exp : (5184 * y) ^ n = exp ((n : ℝ) * L) := by
    rw [exp_natCast_mul, exp_log (show 0 < 5184 * y by positivity)]
  rw [h_exp]
  exact exp_le_exp.2 (by linarith only [hnL, hS_upper, hL_upper, hy])

/-- The log of the place count ratio is bounded by two times the Behrend scale plus lower-order terms. -/
theorem eventually_log_subexponentialWeightBound_le_behrend {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop,
      log (subexponentialWeightBound y) ≤ (2 + ε) * sqrt (22 * y * log (5184 * y)) := by
  filter_upwards [eventually_behrend_digit_bounds,
    tendsto_log_behrend_base.eventually_ge_atTop (3 / ε),
    eventually_log_scale_le_behrend (c := ε / 9) (by positivity),
    tendsto_sqrt_atTop.eventually_ge_atTop (45 / (ε / 3))]
    with y ⟨hL, h_sqrt, _, _, hn_upper, _, _, _⟩ h_inv hL_fit h_const
  let L := log (5184 * y)
  let S := sqrt (22 * y * L)
  have hL_pos : 0 < L := one_pos.trans_le hL
  have hS_nonneg : 0 ≤ S := sqrt_nonneg _
  have h_inv_mul : 1 ≤ (ε / 3) * L := by
    have h_inv' : 3 ≤ L * ε := (div_le_iff₀ hε).1 h_inv
    nlinarith only [h_inv']
  have h_ratio : S / L ≤ (ε / 3) * S := (div_le_iff₀ hL_pos).2 (by
    calc
      S ≤ S * ((ε / 3) * L) := le_mul_of_one_le_right hS_nonneg h_inv_mul
      _ = ((ε / 3) * S) * L := by ring)
  have hn : (behrendDigitCount y : ℝ) ≤ (ε / 3) * S + 1 :=
    hn_upper.trans (add_le_add h_ratio le_rfl)
  have h45 : (45 : ℝ) ≤ (ε / 3) * S :=
    (div_le_iff₀ (by positivity : 0 < ε / 3)).1 (h_const.trans h_sqrt) |>.trans_eq (mul_comm _ _)
  rw [subexponentialWeightBound, log_exp]
  change 2 * S + 3 * L + (behrendDigitCount y : ℝ) + 44 ≤ (2 + ε) * S
  linarith only [hn, hL_fit, h45]

/-- The logarithm of the density bound is sublinear in `y`. -/
theorem eventually_log_subexponentialWeightBound_le {c : ℝ} (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, log (subexponentialWeightBound y) ≤ c * y := by
  filter_upwards [eventually_log_subexponentialWeightBound_le_behrend (ε := 1) one_pos,
    eventually_sqrt_scale_le (A := 22) (by norm_num) (c := c / 3) (by positivity)]
    with y h_weight h_sqrt
  linarith only [h_weight, h_sqrt]

/-- The weight bound eventually dominates every fixed monomial in the logarithmic scale. -/
theorem eventually_mul_pow_le_subexponentialWeightBound (C : ℝ) (n : ℕ) :
    ∀ᶠ y : ℝ in atTop, C * y ^ n ≤ subexponentialWeightBound y := by
  filter_upwards [eventually_behrend_digit_bounds, eventually_mul_pow_le_exp_sqrt C n]
    with y ⟨hL, h_sqrt, _, _, _, _, _, _⟩ h_poly
  refine h_poly.trans (exp_le_exp.2 ?_)
  linarith only [hL, h_sqrt, sqrt_nonneg (22 * y * log (5184 * y)), (behrendDigitCount y).cast_nonneg (α := ℝ)]

private lemma log_two_le_one : log (2 : ℝ) ≤ 1 := by
  have h := log_le_sub_one_of_pos (by norm_num : 0 < (2 : ℝ))
  norm_num at h
  exact h

/-- The Behrend density fits the weight scale when the digits are chosen from the tower size. -/
theorem Parameters.eventually_exists_isSparse_with_weightBound (P : Parameters) :
    ∀ᶠ y : ℝ in atTop,
      ∀ m r s : ℕ, exp (y / 2) ≤ m → m ≤ 2 * exp (y / 2) → r ≤ 3 * exp (5 * y) →
        2 ^ s = m ^ 22 → s ≤ 32 * y →
        ∃ T : Finset (P.Φ s),
          (∀ σ ∈ T, P.placeClass (P.q₀.dvd_mul_right (towerDeg s)) σ = -1) ∧
            towerDeg s ≤ #T * subexponentialWeightBound y ∧
            P.IsSparse s ((r + 1 - m) * (5 * r)) T := by
  filter_upwards [eventually_behrend_digit_bounds,
    eventually_mul_pow_le_exp_sqrt 1e6 1, eventually_ge_atTop (2 : ℝ)]
    with y ⟨hL, _, hn_pos, hn_y, _, hnL, hnS, hW_upper⟩ h_large hy
  intro m r s hm_lower hm_upper hr h_pow hs
  let L := log (5184 * y)
  let S := sqrt (22 * y * L)
  let n := behrendDigitCount y
  let W := (5184 * y) ^ n
  have hy_pos : 0 < y := by linarith
  have hb_pos : 0 < 5184 * y := by positivity
  have hW_one : 1 ≤ W := one_le_pow₀ (by linarith)
  have hm_pos : 0 < (m : ℝ) := (exp_pos _).trans_le hm_lower
  have h_tower : (2 : ℝ) ^ s = (m : ℝ) ^ 22 := by exact_mod_cast h_pow
  have hW_le : W ≤ (2 : ℝ) ^ s := hW_upper.trans (calc
    exp (11 * y) = (exp (y / 2)) ^ (22 : ℕ) := by
      rw [← exp_natCast_mul]; congr 1; ring
    _ ≤ (m : ℝ) ^ 22 := pow_le_pow_left₀ (exp_pos _).le hm_lower 22
    _ = _ := h_tower.symm)
  have hs_ne : s ≠ 0 := by
    intro hs0
    simp [hs0] at h_tower
    have hm_one : 1 < (m : ℝ) := (one_lt_exp_iff.2 (by positivity)).trans_le hm_lower
    linarith only [one_lt_pow₀ hm_one (by decide : (22 : ℕ) ≠ 0), h_tower]
  have hl : (l₀ s : ℝ) ≤ 2592 * y := by
    linarith only [hs, show (l₀ s : ℝ) ≤ 81 * s from mod_cast l₀_le_mul hs_ne]
  have hroom : (2 * (l₀ s : ℝ)) ^ n ≤ W := pow_le_pow_left₀ (by positivity) (by linarith) n
  have h_rank : 2 * l₀ s * ((r + 1 - m) * (5 * r) + 1) < 2 ^ s :=
    mul_rank_lt_two_pow hy_pos (by
      rw [pow_one] at h_large
      refine h_large.trans (exp_le_exp.2 ?_)
      exact (sqrt_le_left (by linarith)).2 (by
        nlinarith only [mul_nonneg hy_pos.le (show 0 ≤ y - 1 by linarith)])) hm_lower hr h_pow hl
  obtain ⟨T, k, h_class, hk, h_count, h_sparse⟩ :=
    P.exists_isSparse_card_bound hn_pos hW_one hW_le hroom h_rank
  let H : ℝ := (2 : ℝ) ^ k
  have hH_pos : 0 < H := by positivity
  have hHn : H ^ n ≤ (2 : ℝ) ^ s :=
    (le_mul_of_one_le_right (by positivity) hW_one).trans hk
  have hH_log : (n : ℝ) * log H ≤ (s : ℝ) * log 2 := by
    simpa only [log_pow] using log_le_log (pow_pos hH_pos n) hHn
  have hs_log : (s : ℝ) * log 2 = 22 * log m := by
    simpa only [log_pow, Nat.cast_ofNat] using congrArg log h_tower
  have hm_log : log m ≤ log 2 + y / 2 := by
    have h := log_le_log hm_pos hm_upper
    rwa [log_mul (by norm_num) (exp_ne_zero _), log_exp] at h
  have hs_upper : 2 * ((s : ℝ) * log 2) ≤ 22 * y + 44 := by
    linarith only [hm_log, hs_log, log_two_le_one]
  have hn_one : (1 : ℝ) ≤ n := by exact_mod_cast hn_pos
  have h_mul : (n : ℝ) * (2 * log H) ≤ (n : ℝ) * (S + 44) := by
    nlinarith only [hH_log, hs_upper, hnS,
      mul_le_mul_of_nonneg_right hn_one (show (0 : ℝ) ≤ 44 by norm_num)]
  have hH_fit : H ^ 2 ≤ exp (S + 44) := (log_le_iff_le_exp (pow_pos hH_pos 2)).1 (by
    rw [log_pow]
    exact le_of_mul_le_mul_left h_mul (by linarith))
  have h_coefficient : 3 * (l₀ s : ℝ) * n ≤ exp (2 * L) := calc
    _ ≤ 3 * (2592 * y) * y := by gcongr
    _ ≤ (5184 * y) ^ 2 := by nlinarith only [sq_nonneg y]
    _ = _ := by simp only [two_mul, exp_add, L, exp_log hb_pos, pow_two]
  have hn_fit : (2 : ℝ) ^ n ≤ exp n := calc
    _ = exp ((n : ℝ) * log 2) := by rw [exp_natCast_mul, exp_log (by norm_num : (0 : ℝ) < 2)]
    _ ≤ _ := exp_le_exp.2 (by nlinarith only [mul_le_mul_of_nonneg_left log_two_le_one (n.cast_nonneg (α := ℝ))])
  have hW_fit : W ≤ exp (S + L) := calc
    _ = exp ((n : ℝ) * L) := by rw [exp_natCast_mul, exp_log hb_pos]
    _ ≤ _ := exp_le_exp.2 hnL
  refine ⟨T, h_class, h_count.trans ?_, h_sparse⟩
  apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg T.card)
  change 3 * (l₀ s : ℝ) * n * 2 ^ n * W * H ^ 2 ≤ subexponentialWeightBound y
  calc
    _ ≤ exp (2 * L) * exp n * exp (S + L) * exp (S + 44) := by gcongr
    _ = _ := by
      rw [← exp_add, ← exp_add, ← exp_add, subexponentialWeightBound]
      change exp _ = exp (2 * S + 3 * L + n + 44)
      congr 1
      ring

/-- The logarithmic prime window uses the modulus and the left endpoint estimates. -/
private noncomputable def Parameters.primeScale (P : Parameters) (y : ℝ) : ℝ :=
  (99 * (P.q₀ : ℝ) * P.d + 1) * y

/-- The length of the logarithmic prime interval is a polynomial in the log scale. -/
private noncomputable def Parameters.polynomialPrimeWindowWidth (P : Parameters) (y : ℝ) : ℝ :=
  (2 * P.primeScale y ^ 25) ^ 2

private lemma Parameters.q₂_sq_le_exp_primeScale (P : Parameters) {s : ℕ} {y : ℝ}
    (hy : 2 ≤ y) (hs : s ≤ 32 * y) : (P.q₂ s ^ 2 : ℕ) ≤ exp (P.primeScale y) := by
  simpa only [pow_one] using P.q₂_sq_le (n := 1) hy (exp_pos (P.primeScale y)) hs (by
    simp only [log_exp, Nat.cast_one, one_mul, primeScale]
    nlinarith only [hy])

private lemma Parameters.eventually_polynomial_prime_windows (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, ∀ s : ℕ, s ≤ 32 * y →
      ∀ U ∈ Set.Icc (P.polynomialPrimeWindowWidth y) (exp y),
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD P.q₂ s ^ 2] ∧
          log p ∈ Set.Icc U (U + P.polynomialPrimeWindowWidth y) := by
  have h_top : Tendsto P.primeScale atTop atTop :=
    tendsto_id.const_mul_atTop (by positivity)
  have h_four : 4 ∣ P.q₀ * P.d := Dvd.dvd.mul_right (.trans (by norm_num) P.dvd_q₀) P.d
  filter_upwards [h_top.eventually (eventually_exists_prime_modEq_one_log_mem_of_exp _ h_four),
    h_top.eventually_ge_atTop 8, eventually_ge_atTop (2 : ℝ)] with y h_window hℓ hy
  intro s hs U hU
  let ℓ := P.primeScale y
  let X := 2 * ℓ ^ (25 : ℕ)
  have hy_le : y ≤ ℓ := by
    dsimp [ℓ, primeScale]
    exact le_mul_of_one_le_left (by linarith) (le_add_of_nonneg_left (by positivity))
  have hℓX : 16 * ℓ ≤ X := calc
    _ ≤ 2 * ℓ ^ 2 := by nlinarith only [mul_nonneg (show 0 ≤ ℓ by linarith) (sub_nonneg.2 hℓ)]
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (pow_le_pow_right₀ (by linarith) (by norm_num : (2 : ℕ) ≤ 25)) (by norm_num)
  have h_modulus := P.q₂_sq_le_exp_primeScale hy hs
  have hU_le := hU.2.trans (exp_le_exp.2 hy_le)
  have h_total : 3 * U * (P.q₂ s ^ 2 : ℕ) * exp 2 < exp (4⁻¹ * X) := calc
    _ ≤ 3 * exp ℓ * exp ℓ * exp 2 := by grw [hU_le, h_modulus]
    _ = exp (log 3 + ℓ + ℓ + 2) := by simp only [exp_add, exp_log (by norm_num : (0 : ℝ) < 3)]
    _ ≤ exp (3 * ℓ) := exp_le_exp.2 (by linarith [log_le_self (by norm_num : (0 : ℝ) ≤ 3)])
    _ < _ := exp_lt_exp.2 (by linarith only [hℓ, hℓX])
  rw [Parameters.q₂, ← pow_mul] at h_modulus h_total ⊢
  exact h_window X U _ (by omega) le_rfl (mod_cast h_modulus) hU.1 (mod_cast h_total)

/-- The logarithm of the auxiliary cutoff is fixed by the tail estimate. -/
private noncomputable def auxiliaryCutoff (y : ℝ) : ℝ := 2 * (64 * y) ^ 27

/-- A polynomial scale for the logarithmic weight, above the sixth power of the cutoff. -/
noncomputable def polynomialWeightScale (y : ℝ) : ℝ := y ^ 163

private lemma eventually_mul_pow_le_polynomialWeightScale (C : ℝ) {n : ℕ} (hn : n < 163) :
    ∀ᶠ y : ℝ in atTop, C * y ^ n ≤ polynomialWeightScale y := by
  filter_upwards [eventually_ge_atTop (max 1 C)] with y hy
  have hy_one : 1 ≤ y := (le_max_left _ _).trans hy
  calc
    _ ≤ y * y ^ n := mul_le_mul_of_nonneg_right ((le_max_right _ _).trans hy) (by positivity)
    _ = y ^ (n + 1) := (pow_succ' y n).symm
    _ ≤ _ := pow_le_pow_right₀ hy_one hn

private lemma log_polynomialWeightScale_add_one_le {y : ℝ} (hy : 1 ≤ y)
    (hL : 1 ≤ log (5184 * y)) : log (polynomialWeightScale y + 1) ≤ 164 * log (5184 * y) := by
  let B := polynomialWeightScale y
  have hy_pos := one_pos.trans_le hy
  have hB : 1 ≤ B := one_le_pow₀ hy
  have hB_pos : 0 < B := one_pos.trans_le hB
  have h_log : log (B + 1) ≤ log B + 1 := by
    rw [log_le_iff_le_exp (by linarith), exp_add, exp_log hB_pos]
    calc
      _ ≤ B * 2 := by linarith
      _ ≤ _ := mul_le_mul_of_nonneg_left (by linarith [add_one_le_exp 1]) hB_pos.le
  have h_log_B : log B = 163 * log y := by simp [B, polynomialWeightScale, log_pow]
  have h_yL : log y ≤ log (5184 * y) := log_le_log hy_pos
    (le_mul_of_one_le_left hy_pos.le (by norm_num))
  linarith only [h_log, h_log_B, h_yL, hL]

/-- The logarithm of the polynomial weight scale is sublinear. -/
theorem eventually_log_polynomialWeightScale_add_one_le {c : ℝ} (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop, log (polynomialWeightScale y + 1) ≤ c * y := by
  filter_upwards [eventually_ge_atTop (1 : ℝ), tendsto_log_behrend_base.eventually_ge_atTop 1,
    eventually_log_scale_le (c / 164) (by positivity)] with y hy hL h_log
  exact (log_polynomialWeightScale_add_one_le hy hL).trans (by linarith only [h_log])

/-- The log of the polynomial weight is eventually smaller than any positive multiple of the
Behrend scale. -/
theorem eventually_log_polynomialWeightScale_add_one_le_behrend {c : ℝ} (hc : 0 < c) :
    ∀ᶠ y : ℝ in atTop,
      log (polynomialWeightScale y + 1) ≤ c * sqrt (22 * y * log (5184 * y)) := by
  filter_upwards [eventually_ge_atTop (1 : ℝ), tendsto_log_behrend_base.eventually_ge_atTop 1,
    eventually_log_scale_le_behrend (c := c / 164) (by positivity)] with y hy hL h_log
  exact (log_polynomialWeightScale_add_one_le hy hL).trans (by linarith only [h_log])

/-- The polynomial weight and the rounding error fit the earlier subexponential scale. -/
theorem eventually_polynomialWeightScale_add_one_le_subexponentialWeightBound :
    ∀ᶠ y : ℝ in atTop, polynomialWeightScale y + 1 ≤ subexponentialWeightBound y := by
  filter_upwards [eventually_ge_atTop (1 : ℝ),
    eventually_mul_pow_le_subexponentialWeightBound 2 163] with y hy h
  have h_one : 1 ≤ polynomialWeightScale y := one_le_pow₀ hy
  exact (show polynomialWeightScale y + 1 ≤ 2 * polynomialWeightScale y by linarith).trans h

private lemma eventually_exp_y_div_eight_le (C : ℝ) :
    ∀ᶠ y : ℝ in atTop, C ≤ exp (y / 8) := by
  filter_upwards [eventually_ge_atTop (8 * C)] with y hy
  linarith only [add_one_le_exp (y / 8), hy]

private lemma Parameters.eventually_prime_scale_inequalities (P : Parameters) :
    ∀ᶠ y : ℝ in atTop,
      let J := polynomialWeightScale y
      let W := P.polynomialPrimeWindowWidth y
      let V := auxiliaryCutoff y
      1 ≤ W ∧ W ^ 2 ≤ J ∧ (2 * classNumber P.K + 2) * W ≤ J ∧ P.primeScale y + V ≤ J ∧
        7 ≤ J ∧ 24 * (2 * exp (y / 2)) * (J + 1) ≤ exp y := by
  let C : ℝ := 99 * (P.q₀ : ℝ) * P.d + 1
  have hC : 1 ≤ C := le_add_of_nonneg_left (by positivity)
  have hW (y : ℝ) : P.polynomialPrimeWindowWidth y = (4 * C ^ 50) * y ^ (50 : ℕ) := by
    unfold polynomialPrimeWindowWidth primeScale
    rw [mul_pow, ← pow_mul]
    change 2 ^ 2 * (C * y) ^ (50 : ℕ) = _
    rw [mul_pow, ← mul_assoc]
    norm_num
  have hW_sq (y : ℝ) : P.polynomialPrimeWindowWidth y ^ 2 = (4 * C ^ 50) ^ 2 * y ^ (100 : ℕ) := by
    rw [hW, mul_pow, ← pow_mul]
  filter_upwards [
    eventually_mul_pow_le_polynomialWeightScale ((4 * C ^ 50) ^ 2) (n := 100) (by decide),
    eventually_mul_pow_le_polynomialWeightScale
      ((2 * classNumber P.K + 2) * (4 * C ^ 50)) (n := 50) (by decide),
    eventually_mul_pow_le_polynomialWeightScale (C + 2 * 64 ^ 27) (n := 27) (by decide),
    eventually_mul_pow_le_polynomialWeightScale 7 (n := 0) (by decide),
    eventually_log_polynomialWeightScale_add_one_le (c := 1 / 4) (by norm_num),
    eventually_exp_y_div_eight_le 48, eventually_ge_atTop (2 : ℝ)]
    with y hW_J h_class h_cutoff h_seven h_log h_exp hy
  let J := polynomialWeightScale y
  let ℓ := P.primeScale y
  let V := auxiliaryCutoff y
  have hℓ : 1 ≤ ℓ := one_le_mul_of_one_le_of_one_le hC (by linarith)
  have hW_one : 1 ≤ P.polynomialPrimeWindowWidth y :=
    one_le_pow₀ (one_le_mul_of_one_le_of_one_le (by norm_num) (one_le_pow₀ hℓ))
  have hV : ℓ + V ≤ (C + 2 * 64 ^ 27) * y ^ (27 : ℕ) := calc
    _ ≤ C * y ^ (27 : ℕ) + V := add_le_add
      (mul_le_mul_of_nonneg_left (le_self_pow₀ (by linarith) (by decide)) (by linarith)) le_rfl
    _ = _ := by
      dsimp only [V, auxiliaryCutoff]
      rw [mul_pow, ← mul_assoc, ← add_mul]
  have hJ_pos : 0 < J := pow_pos (by linarith) _
  have hJ_add : J + 1 ≤ exp (y / 4) := (log_le_iff_le_exp (by linarith)).1 (by
    linarith only [h_log])
  refine ⟨hW_one, (hW_sq y).le.trans hW_J, ?_, hV.trans h_cutoff,
    by simpa only [pow_zero, mul_one] using h_seven, ?_⟩
  · rwa [hW, ← mul_assoc]
  · calc
      24 * (2 * exp (y / 2)) * (J + 1) ≤ 48 * exp (y / 2) * exp (y / 4) := by
        rw [show 24 * (2 * exp (y / 2)) = 48 * exp (y / 2) by ring]
        exact mul_le_mul_of_nonneg_left hJ_add (by positivity)
      _ = 48 * exp (y / 2 + y / 4) := by rw [exp_add, mul_assoc]
      _ ≤ exp (y / 4) * exp (y / 2 + y / 4) := mul_le_mul_of_nonneg_right
        (h_exp.trans (exp_le_exp.2 (by linarith))) (exp_pos _).le
      _ = _ := by rw [← exp_add]; congr 1; ring

private lemma eventually_cutoff_inequalities :
    ∀ᶠ y : ℝ in atTop,
      let J := polynomialWeightScale y
      let V := auxiliaryCutoff y
      1e6 * y ≤ V - 1 ∧ (64 * y) ^ 27 ≤ V - 1 ∧ V ^ 6 ≤ J ∧ 1e6 * V ≤ J := by
  filter_upwards [eventually_ge_atTop (2 : ℝ),
    eventually_mul_pow_le_polynomialWeightScale (2 ^ 6 * 64 ^ 162) (n := 162) (by decide),
    eventually_mul_pow_le_polynomialWeightScale (1e6 * (2 * 64 ^ 27)) (n := 27) (by decide)]
    with y hy hV_pow hV_J
  let V := auxiliaryCutoff y
  have h_power_one : 1 ≤ (64 * y) ^ (27 : ℕ) := one_le_pow₀ (by linarith)
  have h_poly : 1e6 * y + 1 ≤ (64 * y) ^ (27 : ℕ) := calc
    _ ≤ 64 ^ 4 * y := by linarith
    _ ≤ 64 ^ 4 * y ^ (4 : ℕ) :=
      mul_le_mul_of_nonneg_left (le_self_pow₀ (by linarith) (by norm_num)) (by positivity)
    _ = (64 * y) ^ (4 : ℕ) := (mul_pow _ _ _).symm
    _ ≤ _ := pow_le_pow_right₀ (by linarith) (by norm_num)
  have h_tail : (64 * y) ^ (27 : ℕ) ≤ V - 1 := by
    dsimp [V, auxiliaryCutoff]
    linarith only [h_power_one]
  refine ⟨by linarith only [h_poly, h_tail], h_tail, ?_, ?_⟩
  · calc
      V ^ (6 : ℕ) = (2 ^ 6 * 64 ^ 162) * y ^ (162 : ℕ) := by
        dsimp [V, auxiliaryCutoff]
        rw [mul_pow, ← pow_mul]
        change 2 ^ 6 * (64 * y) ^ (162 : ℕ) = _
        rw [mul_pow, mul_assoc]
      _ ≤ _ := hV_pow
  · simpa only [V, auxiliaryCutoff, mul_pow, mul_assoc] using hV_J

private lemma eventually_data_weight_inequalities (P : Parameters) :
    ∀ᶠ y : ℝ in atTop,
      let J := polynomialWeightScale y
      let U := log ⌊exp (auxiliaryCutoff y)⌋₊
      ∀ B ∈ Set.Icc J (J + 1),
        1e12 * P.constantBound ≤ log B ∧ 100 * log B ≤ y ∧
          1e6 * y ≤ U ∧ 1e6 * U ≤ B ∧ 6 * log U ≤ log B := by
  filter_upwards [eventually_ge_atTop (2 : ℝ), eventually_cutoff_inequalities,
    eventually_log_polynomialWeightScale_add_one_le (c := 1 / 100) (by norm_num),
    eventually_mul_pow_le_polynomialWeightScale (exp (1e12 * P.constantBound)) (n := 0) (by decide)]
    with y hy ⟨hV_lower, _, hV_pow, hV_B⟩ h_log h_const
  dsimp only
  intro B hB
  let J := polynomialWeightScale y
  let V := auxiliaryCutoff y
  let U := log ⌊exp V⌋₊
  have hJ_pos : 0 < J := pow_pos (by linarith) _
  have hB_pos : 0 < B := hJ_pos.trans_le hB.1
  have hV_nonneg : 0 ≤ V := by linarith only [hy, hV_lower]
  have h_floor : U ∈ Set.Icc (V - 1) V := log_floor_exp_mem_Icc hV_nonneg
  have hU_lower : 1e6 * y ≤ U := hV_lower.trans h_floor.1
  have hU_pos : 0 < U := by linarith only [hy, hU_lower]
  have h_lower : 1e12 * P.constantBound ≤ log J := by
    apply (le_log_iff_exp_le hJ_pos).2
    simpa only [pow_zero, mul_one] using h_const
  have h_log_upper : log B ≤ log (J + 1) := log_le_log hB_pos hB.2
  refine ⟨h_lower.trans (log_le_log hJ_pos hB.1),
    by linarith only [h_log, h_log_upper], hU_lower,
    (mul_le_mul_of_nonneg_left h_floor.2 (by norm_num)).trans (hV_B.trans hB.1), ?_⟩
  have hU_pow : U ^ (6 : ℕ) ≤ B :=
    ((pow_le_pow_left₀ hU_pos.le h_floor.2 _).trans hV_pow).trans hB.1
  simpa only [log_pow, Nat.cast_ofNat] using log_le_log (pow_pos hU_pos (6 : ℕ)) hU_pow

private lemma exists_weight_with_cutoff {q : ℕ} {ℓ V Q : ℝ} (hq : 0 < q)
    (hq_le : q ≤ exp ℓ) (hV : 0 ≤ V) (hQ : ℓ + V ≤ Q) :
    ∃ b : ℕ, IsLeast {b : ℕ | q * ⌊exp V⌋₊ ∣ b ∧ exp Q < b} b ∧
      log b ∈ Set.Icc Q (Q + 1) := by
  apply exists_isLeast_dvd_and_exp_lt (mul_pos hq (Nat.floor_pos.2 (one_le_exp hV)))
  calc
    _ ≤ exp ℓ * exp V := by
      rw [Nat.cast_mul]
      exact mul_le_mul hq_le (Nat.floor_le (exp_pos _).le) (by positivity) (by positivity)
    _ = exp (ℓ + V) := (exp_add _ _).symm
    _ ≤ _ := exp_le_exp.2 hQ

/-- Construct admissible data with polynomial logarithmic weight and a separate density bound. -/
theorem eventually_exists_data_with_polynomial_weight (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let y := log (x : ℝ)
      let J := polynomialWeightScale y
      ∃ D : Data P,
        D.x = x ∧ D.natX₁ = ⌊exp (2 * (64 * y) ^ 27)⌋₊ ∧
          sqrt x ≤ D.m ∧ (64 * y) ^ 27 ≤ D.logX₁ ∧ D.logB ∈ Set.Icc J (J + 1) ∧
          towerDeg D.towerExp ≤ #D.bPlaces * subexponentialWeightBound y := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [h_log.eventually P.eventually_exists_isSparse_with_weightBound,
    h_log.eventually P.eventually_polynomial_prime_windows,
    h_log.eventually P.eventually_prime_scale_inequalities,
    h_log.eventually eventually_cutoff_inequalities,
    h_log.eventually (eventually_data_weight_inequalities P),
    h_log.eventually_ge_atTop 200, eventually_ge_atTop 1]
    with x h_sparse_data h_window ⟨hW_one, hW_sq, h_class_le, h_scale_le, hJ_large, h_endpoint⟩
      ⟨hV_x, hV_tail, _, _⟩ h_scales hy hx_one
  let y := log (x : ℝ)
  let W := P.polynomialPrimeWindowWidth y
  let V := auxiliaryCutoff y
  let J := polynomialWeightScale y
  let ℓ := P.primeScale y
  have hV_nonneg : 0 ≤ V := by linarith only [hV_x, hy]
  have hW_pos : 0 < W := one_pos.trans_le hW_one
  have hx_pos : 0 < (x : ℝ) := by exact_mod_cast Nat.zero_lt_one.trans_le hx_one
  obtain ⟨m, r, s, hm, hr, hm_upper, hr_upper, ⟨e, hm_pow, hs_eq⟩, hr_pow, hs⟩ :=
    exists_isLeast_two_pow_three_pow (y := y) (by linarith)
  have h_pow : 2 ^ s = m ^ 22 := by rw [hm_pow, hs_eq, pow_mul]
  have hm_lower : exp (y / 2) ≤ m := hm.1.2
  have hr_lower : exp (5 * y) ≤ r := hr.1.2
  obtain ⟨T, h_class, h_card, h_sparse⟩ := h_sparse_data m r s hm_lower hm_upper hr_upper h_pow hs
  have hq₁d_le : (P.q₁ s * P.d : ℕ) ≤ exp ℓ := by
    grw [Nat.le_of_dvd (NeZero.pos _) (P.q₁_mul_d_dvd_q₂.pow two_ne_zero),
      P.q₂_sq_le_exp_primeScale (by linarith only [hy]) hs]
  have hq₁_le : P.q₁ s ≤ exp ℓ := by
    grw [Nat.le_mul_of_pos_right (P.q₁ s) P.d_prime.pos, hq₁d_le]
  obtain ⟨b, hb, hB⟩ := exists_weight_with_cutoff (NeZero.pos (P.q₁ s)) hq₁_le hV_nonneg h_scale_le
  let B := log (b : ℝ)
  have hb_pos : 0 < (b : ℝ) := (exp_pos J).trans hb.1.2
  have hb_eq : exp B = b := exp_log hb_pos
  have hJ_B : J ≤ B := hB.1
  have hB_upper : B ≤ J + 1 := hB.2
  have hB_pos : 0 < B := by linarith only [hJ_large, hJ_B]
  have h_cutoff : (64 * y) ^ 27 ≤ log ⌊exp V⌋₊ :=
    hV_tail.trans (log_floor_exp_mem_Icc hV_nonneg).1
  have hx_le : x ≤ ⌊exp V⌋₊ :=
    Nat.le_floor ((log_le_iff_le_exp hx_pos).1 (by linarith only [hV_x, hy]))
  have hb_ge : ⌊exp V⌋₊ ≤ b :=
    Nat.le_of_dvd (by exact_mod_cast hb_pos) (dvd_of_mul_left_dvd hb.1.1)
  let κ (τ : P.Φ s) : ℕ := if τ ∈ T then b else x * b / ⌊exp V⌋₊
  have hκ (τ : P.Φ s) : (κ τ : ℝ) ∈ Set.Icc 1 (exp B) := by
    simpa [hb_eq] using ite_mul_div_mem_Icc hx_one hx_le hb_ge (τ ∈ T)
  have h_prime (U : ℝ) (h_lower : B ≤ U) (h_upper : U ≤ 24 * m * B) :
      ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD P.q₂ s ^ 2] ∧ log p ∈ Set.Icc U (U + W) := by
    apply h_window s hs U
    refine ⟨(le_self_pow₀ hW_one (by decide : (2 : ℕ) ≠ 0)).trans
      (hW_sq.trans (hJ_B.trans h_lower)), h_upper.trans ?_⟩
    exact (by gcongr : 24 * (m : ℝ) * B ≤ 24 * (2 * exp (y / 2)) * (J + 1)).trans h_endpoint
  have hm_two : 2 ≤ m := by
    have h : (2 : ℝ) ≤ exp (y / 2) := by linarith only [add_one_le_exp (y / 2), hy]
    exact_mod_cast h.trans hm_lower
  have hm_mul : B ≤ m * B := le_mul_of_one_le_left hB_pos.le (mod_cast (by omega : 1 ≤ m))
  obtain ⟨p₀, p₁, α, h_ne, hp₀, hp₁, h_norm⟩ := P.exists_prime_pair_norm s hW_pos
    (h_class_le.trans hJ_B) fun U hU ↦ h_prime U (by linarith only [hU.1, hB_pos]) (by
      rw [mul_assoc]
      linarith only [hU.2, hm_mul, hB_pos])
  have hg : ∀ i : Fin 2, P.IsPrincipalLevelPrime s B (![p₀, p₁] i) :=
    Fin.forall_fin_two.2 ⟨hp₀, hp₁⟩
  have h_cond : (P.q₁ s * P.d : ℕ) ≤ exp B :=
    hq₁d_le.trans (exp_le_exp.2 (by linarith only [h_scale_le, hJ_B, hV_nonneg]))
  obtain ⟨N, β, hN, hN_mod, hN_log, hβ⟩ := P.exists_prime_log_mem_Icc_mul_star_eq hm_two
    (hJ_large.trans hJ_B) (hW_sq.trans hJ_B) hκ (hp₀.mul_mem_Icc hp₁) h_cond
    fun U hU ↦ h_prime U (hm_mul.trans hU.1) hU.2
  obtain ⟨h_const, h_scaleB, h_scaleX₁, h_scaleB₁, h_scale_pow⟩ := h_scales B hB
  let D : Data P :=
    { natX := x, natX₁ := ⌊exp V⌋₊, natB := b
      logX := y, logX₁ := log ⌊exp V⌋₊, logB := B
      exp_logX := exp_log hx_pos
      exp_logX₁ := exp_log (mod_cast Nat.floor_pos.2 (one_le_exp hV_nonneg))
      exp_logB := hb_eq
      constantBound_le := h_const
      mul_log_logB_le_logX := h_scaleB
      logX_le_logX₁ := h_scaleX₁
      logX₁_le_logB := h_scaleB₁
      log_logX₁_le_log_logB := h_scale_pow
      m, r, towerExp := s
      m_mem := ⟨hm_lower, hm_upper⟩, r_mem := ⟨hr_lower, hr_upper⟩
      exists_m_eq_two_pow := ⟨e, hm_pow, hs_eq⟩, exists_r_eq_three_pow := hr_pow
      towerExp_le := hs, dvd_natB := hb.1.1
      bPlaces := T, placeClass_of_mem_bPlaces := h_class
      bPlaces_nonempty := nonempty_of_towerDeg_le_card_mul h_card
      sparse := h_sparse, weight := κ, weight_eq _ := rfl
      levelPrime := ![p₀, p₁], levelPrime_prime i := (hg i).prime
      levelPrime_modEq_one_q₂_sq i := (hg i).modEq_one
      levelPrime_injective := Matrix.injective_pair_iff_ne.2 h_ne
      levelPrime_mem i := (hg i).mem_Icc
      piMBar := α, piMBar_mul_star := h_norm
      N, N_prime := hN, N_modEq_one_q₂_sq := hN_mod, log_N_mem := hN_log
      piN := β, piN_mul_star := hβ }
  refine ⟨D, exp_log hx_pos, rfl, ?_, h_cutoff, hB, h_card⟩
  simpa only [y, exp_half, exp_log hx_pos] using hm_lower

/-- These data also satisfy the subexponential upper bound on the logarithmic weight. -/
theorem eventually_exists_data_with_weightBound (P : Parameters) :
    ∀ᶠ x : ℕ in atTop, ∃ D : Data P,
      D.x = x ∧ D.natX₁ = ⌊exp (2 * (64 * log (x : ℝ)) ^ 27)⌋₊ ∧
        sqrt x ≤ D.m ∧ (64 * log (x : ℝ)) ^ 27 ≤ D.logX₁ ∧
        D.logB ≤ subexponentialWeightBound (log (x : ℝ)) + 1 := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_exists_data_with_polynomial_weight P,
    h_log.eventually eventually_polynomialWeightScale_add_one_le_subexponentialWeightBound]
    with x ⟨D, hx, hx₁, hm, h_cutoff, hB, _⟩ hJ
  exact ⟨D, hx, hx₁, hm, h_cutoff, hB.2.trans (hJ.trans (le_add_of_nonneg_right zero_le_one))⟩

/-- The weight bound is eventually within the former square of the prime-window scale. -/
theorem Parameters.eventually_weightBound_le_subexponentialWindowWidth_sq (P : Parameters) :
    ∀ᶠ y : ℝ in atTop, subexponentialWeightBound y ≤ P.subexponentialWindowWidth y ^ 2 := by
  filter_upwards [P.eventually_isLargeScale_subexponential_rounded,
    eventually_log_subexponentialWeightBound_le_behrend (ε := 1) one_pos,
    eventually_ge_atTop (2 : ℝ), tendsto_log_behrend_base.eventually_ge_atTop 1]
    with y ⟨⟨h_width, _⟩, _, h_scale, _, _⟩ h_Q hy hL
  let L := log (5184 * y)
  let A : ℝ := 99 * P.q₀ * P.d
  let S := sqrt (22 * y * L)
  have h_yL : 0 ≤ y * L := mul_nonneg (by linarith) (by linarith)
  have h_compare : 2 * S ≤ sqrt (A * y * L) := by
    rw [← sqrt_sq (by norm_num : (0 : ℝ) ≤ 2), ← sqrt_mul (sq_nonneg (2 : ℝ))]
    apply sqrt_le_sqrt
    nlinarith only [mul_le_mul_of_nonneg_right P.window_coefficient_ge h_yL, h_yL]
  have hW : 0 < P.subexponentialWindowWidth y := one_pos.trans_le h_scale.one_le
  have hQ_pos : 0 < subexponentialWeightBound y := exp_pos _
  have hQ_log : log (subexponentialWeightBound y) ≤ 2 * log (P.subexponentialWindowWidth y) :=
    h_Q.trans (by linarith only [h_compare, h_width, sqrt_nonneg (22 * y * L)])
  calc
    _ = exp (log (subexponentialWeightBound y)) := (exp_log hQ_pos).symm
    _ ≤ exp (2 * log (P.subexponentialWindowWidth y)) := exp_le_exp.2 hQ_log
    _ = _ := by rw [two_mul, exp_add, exp_log hW, pow_two]

/-- The admissible data also satisfy the bounds stated in terms of the rounded window. -/
theorem eventually_exists_data_with_subexponential_windows (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let W := P.subexponentialWindowWidth (log x)
      exp (3 * sqrt (log x)) ≤ W ∧ ∃ D : Data P,
        D.x = x ∧ D.natX₁ = ⌊exp (2 * (64 * log (x : ℝ)) ^ 27)⌋₊ ∧
          sqrt x ≤ D.m ∧ (64 * log (x : ℝ)) ^ 27 ≤ D.logX₁ ∧ D.logB ≤ W ^ 2 + 1 := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [eventually_exists_data_with_weightBound P,
    h_log.eventually P.eventually_isLargeScale_subexponential,
    h_log.eventually P.eventually_weightBound_le_subexponentialWindowWidth_sq]
    with x ⟨D, hx, hx₁, hm, h_cutoff, hB⟩ ⟨_, _, _, h_lower⟩ h_Q
  exact ⟨h_lower, D, hx, hx₁, hm, h_cutoff, hB.trans (add_le_add h_Q le_rfl)⟩

end New
