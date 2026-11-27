module

public import New.Reduction.Data.Existence
import Lib.Analytic.Primes

/-!
# Subexponential windows with a separate auxiliary cutoff

The modulus and the sparse-set construction bound the logarithmic width from below. Choose
its size by balancing both conditions. The auxiliary cutoff is chosen from the tail estimate.
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

private lemma tower_pow_le {P : Parameters} {s n : ℕ} {y W : ℝ}
    (h_scale : P.IsLargeScale n y W) (hs : s ≤ 32 * y) :
    ((2 : ℝ) ^ s) ^ 4 ≤ W ^ n := by
  refine pow_le_of_le_log (one_pos.trans_le h_scale.one_le) ?_
  rw [log_pow, log_pow]
  simp only [Nat.cast_ofNat]
  have h_log : (s : ℝ) * log 2 ≤ s * 2 := mul_le_mul_of_nonneg_left
    (log_le_self (by norm_num)) (Nat.cast_nonneg s)
  calc
    _ ≤ 4 * ((s : ℝ) * 2) := mul_le_mul_of_nonneg_left h_log (by norm_num)
    _ ≤ 256 * y := by linarith only [hs]
    _ ≤ _ := (mul_le_mul_of_nonneg_right P.window_coefficient_ge (by linarith [h_scale.hundred_le])).trans
      h_scale.le_mul_log_W

private lemma count_sq_le {P : Parameters} {s n : ℕ} {y W : ℝ}
    (h_scale : P.IsLargeScale n y W) (hl : (l₀ s : ℝ) ≤ 2592 * y) :
    (3 * (l₀ s : ℝ) * n * 2 ^ n) ^ 2 ≤ W := by
  have hy : 100 ≤ y := h_scale.hundred_le
  have h_large : 256 * y ≤ (n : ℝ) * log W :=
    (mul_le_mul_of_nonneg_right P.window_coefficient_ge (by linarith)).trans h_scale.le_mul_log_W
  have hn : 3 ≤ n := by
    by_contra! hn
    have hn' : (n : ℝ) ≤ 2 := by exact_mod_cast (show n ≤ 2 by omega)
    have h_mul := mul_le_mul_of_nonneg_right hn' (log_nonneg h_scale.one_le)
    linarith only [h_large, h_mul, hy, h_scale.log_W_le]
  have h_two : (n : ℝ) ≤ (2 : ℝ) ^ n := by exact_mod_cast n.lt_two_pow_self.le
  have h_count : 3 * (l₀ s : ℝ) * n * 2 ^ n ≤ 7776 * y * (4 : ℝ) ^ n := calc
    _ ≤ 3 * (2592 * y) * (2 : ℝ) ^ n * 2 ^ n := by gcongr
    _ = (3 * (2592 * y)) * ((2 : ℝ) ^ n * 2 ^ n) := by ring
    _ = _ := by rw [← mul_pow]; ring
  have h_square : 0 ≤ (y - 2) * y ^ 2 := mul_nonneg (by linarith) (sq_nonneg y)
  have h_base : (7776 * y) ^ 2 ≤ (324 * y) ^ n := calc
    _ ≤ (324 * y) ^ 3 := by nlinarith only [h_square, sq_nonneg y]
    _ ≤ _ := pow_le_pow_right₀ (by linarith) hn
  calc
    _ ≤ (7776 * y * (4 : ℝ) ^ n) ^ 2 := pow_le_pow_left₀ (by positivity) h_count _
    _ = (7776 * y) ^ 2 * (16 : ℝ) ^ n := by rw [mul_pow, pow_right_comm (4 : ℝ)]; norm_num
    _ ≤ (324 * y) ^ n * (16 : ℝ) ^ n := mul_le_mul_of_nonneg_right h_base (by positivity)
    _ = (5184 * y) ^ n := by rw [← mul_pow]; congr 1; ring
    _ ≤ W := h_scale.pow_le

private lemma exists_isSparse_at_square_width {P : Parameters} {m r s n : ℕ} {y W : ℝ}
    (h_scale : P.IsLargeScale n y W) (hm : exp (y / 2) ≤ m) (hr : r ≤ 3 * exp (5 * y))
    (h_pow : 2 ^ s = m ^ 22) (hs : s ≤ 32 * y) (hW : W ≤ exp (y / 2)) :
    ∃ T : Finset (P.Φ s),
      (∀ σ ∈ T, P.placeClass (P.q₀.dvd_mul_right (towerDeg s)) σ = -1) ∧
        towerDeg s ≤ #T * W ^ 2 ∧ P.IsSparse s ((r + 1 - m) * (5 * r)) T := by
  have hy : 100 ≤ y := h_scale.hundred_le
  have hm_one : (1 : ℝ) ≤ m := h_scale.one_le.trans (hW.trans hm)
  have h_lower : W ≤ (2 : ℝ) ^ s := calc
    _ ≤ (m : ℝ) ^ 22 := (hW.trans hm).trans (le_self_pow₀ hm_one (by norm_num))
    _ = _ := mod_cast h_pow.symm
  have hs_ne : s ≠ 0 := by
    intro hs0
    simp [hs0] at h_lower
    linarith only [h_lower, hy, h_scale.mul_y_le_W]
  have hl : (l₀ s : ℝ) ≤ 2592 * y := by
    linarith [show (l₀ s : ℝ) ≤ 81 * s from mod_cast l₀_le_mul hs_ne]
  have h_exp : 1e6 * y ≤ exp y :=
    ((show 1e6 * y ≤ 2e6 * y by linarith).trans h_scale.mul_y_le_W).trans
      (hW.trans (exp_le_exp.2 (by linarith)))
  refine P.exists_isSparse_square h_scale.n_pos h_scale.one_le h_lower (tower_pow_le h_scale hs) ?_
    (count_sq_le h_scale hl) (mul_rank_lt_two_pow (by linarith) h_exp hm hr h_pow hl)
  grw [← h_scale.pow_le, hl, ← mul_assoc, show (2 * 2592 : ℝ) = 5184 by norm_num]

/-- The logarithm of the auxiliary cutoff, chosen from the tail estimate. -/
private noncomputable def auxiliaryCutoff (y : ℝ) : ℝ := 2 * (64 * y) ^ 27

private lemma eventually_cutoff_fits (P : Parameters) :
    ∀ᶠ y : ℝ in atTop,
      let W := P.subexponentialWindowWidth y
      let V := auxiliaryCutoff y
      1e6 * y ≤ V - 1 ∧ (64 * y) ^ 27 ≤ V - 1 ∧ V ^ 6 ≤ W ^ 2 ∧
        1e6 * V ≤ W ^ 2 ∧ V ≤ W := by
  filter_upwards [P.eventually_isLargeScale_subexponential_rounded,
    P.eventually_mul_pow_le_subexponentialWindowWidth (2 ^ 6 * 64 ^ 162) 162]
    with y ⟨_, n, h_scale, _, _⟩ h_polynomial
  let W := P.subexponentialWindowWidth y
  let V := auxiliaryCutoff y
  have hy : 100 ≤ y := h_scale.hundred_le
  have hy_one : 1 ≤ y := by linarith
  have h_power_one : 1 ≤ (64 * y) ^ (27 : ℕ) := one_le_pow₀ (by linarith)
  have h_poly : 1e6 * y + 1 ≤ (64 * y) ^ (27 : ℕ) := calc
    _ ≤ 64 ^ 4 * y := by linarith
    _ ≤ 64 ^ 4 * y ^ (4 : ℕ) :=
      mul_le_mul_of_nonneg_left (le_self_pow₀ hy_one (by norm_num)) (by positivity)
    _ = (64 * y) ^ (4 : ℕ) := (mul_pow _ _ _).symm
    _ ≤ _ := pow_le_pow_right₀ (by linarith) (by norm_num)
  have h_tail : (64 * y) ^ (27 : ℕ) ≤ V - 1 := by
    dsimp [V, auxiliaryCutoff]
    linarith only [h_power_one]
  have hV : 1 ≤ V := by linarith only [h_tail, h_power_one]
  have hV_pow : V ^ (6 : ℕ) ≤ W := calc
    _ = (2 ^ 6 * 64 ^ 162) * y ^ (162 : ℕ) := by
      dsimp [V, auxiliaryCutoff]
      rw [mul_pow, ← pow_mul]
      change 2 ^ 6 * (64 * y) ^ (162 : ℕ) = _
      rw [mul_pow, mul_assoc]
    _ ≤ W := h_polynomial
  have hV_le : V ≤ W := (le_self_pow₀ hV (by norm_num : (6 : ℕ) ≠ 0)).trans hV_pow
  have hW_large : (1e6 : ℝ) ≤ W := by linarith [h_scale.mul_y_le_W]
  refine ⟨by linarith only [h_poly, h_tail], h_tail,
    hV_pow.trans (le_self_pow₀ h_scale.one_le (by norm_num)),
    ?_, hV_le⟩
  calc
    _ ≤ W * V := mul_le_mul_of_nonneg_right hW_large (by linarith)
    _ ≤ W * W := mul_le_mul_of_nonneg_left hV_le (by linarith [h_scale.one_le])
    _ = _ := (pow_two _).symm

private lemma exists_weight_at_square_width {q n : ℕ} {W V : ℝ} (hq : 0 < q) (hW : 1 ≤ W)
    (hV₀ : 0 ≤ V) (hV : V ≤ W) (hn : n + 1 ≤ W) (hq_le : q ≤ W ^ n) :
    ∃ b : ℕ, IsLeast {b : ℕ | q * ⌊exp V⌋₊ ∣ b ∧ exp (W ^ 2) < b} b ∧
      log b ∈ Set.Icc (W ^ 2) (W ^ 2 + 1) ∧
      log (log b) ∈ Set.Icc (2 * log W) (2 * log W + 1) := by
  have hW_pos : 0 < W := one_pos.trans_le hW
  have h_step : (q * ⌊exp V⌋₊ : ℕ) ≤ exp (W ^ 2) := calc
    _ ≤ W ^ n * exp V := by
      rw [Nat.cast_mul]
      exact mul_le_mul hq_le (Nat.floor_le (exp_pos _).le) (by positivity) (by positivity)
    _ = exp ((n : ℝ) * log W + V) := by rw [exp_add, exp_natCast_mul, exp_log hW_pos]
    _ ≤ exp (W ^ 2) := exp_le_exp.2 <| calc
      _ ≤ (n : ℝ) * W + W := add_le_add
        (mul_le_mul_of_nonneg_left (log_le_self hW_pos.le) (Nat.cast_nonneg n)) hV
      _ = ((n : ℝ) + 1) * W := by ring
      _ ≤ _ := (mul_le_mul_of_nonneg_right hn hW_pos.le).trans_eq (pow_two _).symm
  obtain ⟨b, hb, h_lower, h_upper⟩ := exists_isLeast_dvd_and_exp_lt
    (mul_pos hq (Nat.floor_pos.2 (one_le_exp hV₀))) h_step
  have h_log_sq : log (W ^ 2) = 2 * log W := by simp
  refine ⟨b, hb, ⟨h_lower, h_upper⟩, h_log_sq.ge.trans (log_le_log (by positivity) h_lower), ?_⟩
  rw [← h_log_sq, log_le_iff_le_exp ((sq_pos_of_pos hW_pos).trans_le h_lower),
    exp_add, exp_log (sq_pos_of_pos hW_pos)]
  nlinarith [add_one_le_exp 1, one_le_pow₀ (n := 2) hW]

private lemma eventually_data_scale_inequalities (P : Parameters) :
    ∀ᶠ y : ℝ in atTop,
      let W := P.subexponentialWindowWidth y
      let U := log ⌊exp (auxiliaryCutoff y)⌋₊
      ∀ B ∈ Set.Icc (W ^ 2) (W ^ 2 + 1),
        1e12 * P.constantBound ≤ log B ∧ 100 * log B ≤ y ∧
          1e6 * y ≤ U ∧ 1e6 * U ≤ B ∧ 6 * log U ≤ log B := by
  filter_upwards [P.eventually_isLargeScale_subexponential_rounded, eventually_cutoff_fits P]
    with y ⟨_, n, h_scale, _, _⟩ ⟨hV_lower, _, hV_pow, hV_B, _⟩
  dsimp only
  intro B hB
  let W := P.subexponentialWindowWidth y
  let V := auxiliaryCutoff y
  let U := log ⌊exp V⌋₊
  have hy : 100 ≤ y := h_scale.hundred_le
  have hW : 1 ≤ W := h_scale.one_le
  have hW_sq : 0 < W ^ (2 : ℕ) := sq_pos_of_pos (by linarith)
  have hB_pos : 0 < B := hW_sq.trans_le hB.1
  have hV_nonneg : 0 ≤ V := by linarith only [hy, hV_lower]
  have h_floor : U ∈ Set.Icc (V - 1) V := log_floor_exp_mem_Icc hV_nonneg
  have hU_lower : 1e6 * y ≤ U := hV_lower.trans h_floor.1
  have hU_pos : 0 < U := by linarith only [hy, hU_lower]
  have h_log_sq : log (W ^ 2) = 2 * log W := by simp
  have h_log_lower : 2 * log W ≤ log B := h_log_sq.ge.trans (log_le_log hW_sq hB.1)
  have h_log_upper : log B ≤ 2 * log W + 1 := by
    rw [← h_log_sq, log_le_iff_le_exp hB_pos, exp_add, exp_log hW_sq]
    calc
      _ ≤ W ^ 2 + 1 := hB.2
      _ ≤ W ^ 2 * 2 := by linarith only [one_le_pow₀ (n := 2) hW]
      _ ≤ _ := mul_le_mul_of_nonneg_left (by linarith [add_one_le_exp 1]) hW_sq.le
  refine ⟨by linarith only [h_scale.const_le, h_log_lower, log_nonneg hW],
    by linarith only [h_scale.log_W_le, h_log_upper, log_nonneg hW], hU_lower,
    (mul_le_mul_of_nonneg_left h_floor.2 (by norm_num)).trans (hV_B.trans hB.1), ?_⟩
  have hU_pow : U ^ (6 : ℕ) ≤ B :=
    ((pow_le_pow_left₀ hU_pos.le h_floor.2 _).trans hV_pow).trans hB.1
  simpa only [log_pow, Nat.cast_ofNat] using log_le_log (pow_pos hU_pos (6 : ℕ)) hU_pow

/-- Construct admissible data at the width for the prime windows, using a separate cutoff. -/
theorem eventually_exists_data_with_subexponential_windows (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let W := P.subexponentialWindowWidth (log x)
      exp (3 * sqrt (log x)) ≤ W ∧ ∃ D : Data P,
        D.x = x ∧ D.natX₁ = ⌊exp (2 * (64 * log (x : ℝ)) ^ 27)⌋₊ ∧
          sqrt x ≤ D.m ∧ (64 * log (x : ℝ)) ^ 27 ≤ D.logX₁ ∧ D.logB ≤ W ^ 2 + 1 := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [h_log.eventually P.eventually_isLargeScale_with_prime_windows,
    h_log.eventually (eventually_cutoff_fits P),
    h_log.eventually (eventually_data_scale_inequalities P),
    eventually_ge_atTop 1]
    with x ⟨n, h_scale, h_lower, h_window⟩ ⟨hV_x, hV_tail, _, _, hV_W⟩ h_scales hx_one
  let y := log (x : ℝ)
  let W := P.subexponentialWindowWidth y
  let V := auxiliaryCutoff y
  have hy : 100 ≤ y := h_scale.hundred_le
  have hV_nonneg : 0 ≤ V := by linarith only [hV_x, hy]
  have hW_one : 1 ≤ W := h_scale.one_le
  have hW_pos : 0 < W := one_pos.trans_le hW_one
  have hW_large : 2e8 ≤ W := by linarith only [h_scale.mul_y_le_W, hy]
  have hx_pos : 0 < (x : ℝ) := by exact_mod_cast Nat.zero_lt_one.trans_le hx_one
  have hW_le : W ≤ exp (y / 2) :=
    (log_le_iff_le_exp hW_pos).1 (by linarith only [log_nonneg hW_one, h_scale.log_W_le])
  obtain ⟨m, r, s, hm, hr, hm_upper, hr_upper, ⟨e, hm_pow, hs_eq⟩, hr_pow, hs⟩ :=
    exists_isLeast_two_pow_three_pow (y := y) (by linarith)
  have h_pow : 2 ^ s = m ^ 22 := by rw [hm_pow, hs_eq, pow_mul]
  have hm_lower : exp (y / 2) ≤ m := hm.1.2
  have hr_lower : exp (5 * y) ≤ r := hr.1.2
  have hm_le : m ≤ W ^ n := (h_scale.two_pow_le hs).trans' <|
    mod_cast (Nat.le_self_pow (by norm_num) m).trans h_pow.ge
  obtain ⟨T, h_class, h_card, h_sparse⟩ :=
    exists_isSparse_at_square_width h_scale hm_lower hr_upper h_pow hs hW_le
  have hq₁_le : P.q₁ s ≤ W ^ n := by
    grw [Nat.le_mul_of_pos_right (P.q₁ s) P.d_prime.pos, h_scale.q₁_mul_d_le hs]
  obtain ⟨b, hb, hB, _⟩ := exists_weight_at_square_width
    (NeZero.pos (P.q₁ s)) hW_one hV_nonneg hV_W h_scale.add_one_le hq₁_le
  let B := log (b : ℝ)
  have hb_pos : 0 < (b : ℝ) := (exp_pos (W ^ 2)).trans hb.1.2
  have hb_eq : exp B = b := exp_log hb_pos
  have hB_two : W ^ 2 ≤ B := hB.1
  have hB_upper : B ≤ W ^ 2 + 1 := hB.2
  have hB_pos : 0 < B := (sq_pos_of_pos hW_pos).trans_le hB_two
  have hB_large : 2e8 * W ≤ B :=
    (mul_le_mul_of_nonneg_right hW_large hW_pos.le).trans (by simpa only [pow_two] using hB_two)
  have h_cutoff : (64 * y) ^ 27 ≤ log ⌊exp V⌋₊ :=
    hV_tail.trans (log_floor_exp_mem_Icc hV_nonneg).1
  have hx_le : x ≤ ⌊exp V⌋₊ :=
    Nat.le_floor ((log_le_iff_le_exp hx_pos).1 (by linarith only [hV_x, hy]))
  have hb_ge : ⌊exp V⌋₊ ≤ b :=
    Nat.le_of_dvd (by exact_mod_cast hb_pos) (dvd_of_mul_left_dvd hb.1.1)
  let κ (τ : P.Φ s) : ℕ := if τ ∈ T then b else x * b / ⌊exp V⌋₊
  have hκ (τ : P.Φ s) : (κ τ : ℝ) ∈ Set.Icc 1 (exp B) := by
    simpa [hb_eq] using ite_mul_div_mem_Icc hx_one hx_le hb_ge (τ ∈ T)
  have htop : 24 * B ≤ W ^ 7 := calc
    _ ≤ 48 * W ^ 2 := by linarith only [hB_upper, one_le_pow₀ (n := 2) hW_one]
    _ ≤ W * W ^ 2 := mul_le_mul_of_nonneg_right (by linarith) (sq_nonneg W)
    _ = W ^ 3 := by ring
    _ ≤ _ := pow_le_pow_right₀ hW_one (by norm_num)
  have h_prime (U : ℝ) (h_lower : B ≤ U) (h_upper : U ≤ 24 * m * B) :
      ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD P.q₂ s ^ 2] ∧ log p ∈ Set.Icc U (U + W) := by
    have h_modulus : (P.q₂ s ^ 2 : ℕ) ≤ W ^ (n + 7) :=
      (h_scale.q₂_sq_le hs).trans (pow_le_pow_right₀ hW_one (n.le_add_right 7))
    rw [Parameters.q₂, ← pow_mul] at h_modulus ⊢
    refine h_window _ (by omega) (mod_cast h_modulus) U ⟨?_, ?_⟩
    · exact (le_self_pow₀ hW_one (by norm_num : (2 : ℕ) ≠ 0)).trans (hB_two.trans h_lower)
    · calc
        U ≤ m * (24 * B) := by linarith
        _ ≤ W ^ (n + 7) := by grw [hm_le, htop, pow_add]
  have h_class_le : (2 * classNumber P.K + 2) * W ≤ B := by
    grw [h_scale.classNumber_le, ← sq, hB_two]
  have hm_one : (1 : ℝ) ≤ m := hW_one.trans (hW_le.trans hm_lower)
  have hm_mul : B ≤ m * B := le_mul_of_one_le_left hB_pos.le hm_one
  obtain ⟨p₀, p₁, α, h_ne, hp₀, hp₁, h_norm⟩ := P.exists_prime_pair_norm s hW_pos h_class_le
    fun U hU ↦ h_prime U (by linarith only [hU.1, hB_pos]) (by
      rw [mul_assoc]
      linarith only [hU.2, hm_mul, hB_pos])
  have hg : ∀ i : Fin 2, P.IsPrincipalLevelPrime s B (![p₀, p₁] i) :=
    Fin.forall_fin_two.2 ⟨hp₀, hp₁⟩
  have hm_two : 2 ≤ m := mod_cast (by linarith : (2 : ℝ) ≤ m)
  have h_cond : (P.q₁ s * P.d : ℕ) ≤ exp B := calc
    _ ≤ W ^ n := h_scale.q₁_mul_d_le hs
    _ = exp ((n : ℝ) * log W) := by rw [exp_natCast_mul, exp_log hW_pos]
    _ ≤ exp B := exp_le_exp.2 <| calc
      _ ≤ (n : ℝ) * W := mul_le_mul_of_nonneg_left (log_le_self hW_pos.le) (Nat.cast_nonneg _)
      _ ≤ W ^ 2 := by
        rw [pow_two]
        exact mul_le_mul_of_nonneg_right (by linarith [h_scale.add_one_le]) hW_pos.le
      _ ≤ B := hB_two
  obtain ⟨N, β, hN, hN_mod, hN_log, hβ⟩ := P.exists_prime_log_mem_Icc_mul_star_eq hm_two
    (by linarith only [hB_large, hW_one]) hB_two hκ (hp₀.mul_mem_Icc hp₁) h_cond
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
      towerDeg_le_card_bPlaces_mul := h_card.trans
        (mul_le_mul_of_nonneg_left hB_two (Nat.cast_nonneg T.card))
      sparse := h_sparse, weight := κ, weight_eq _ := rfl
      levelPrime := ![p₀, p₁], levelPrime_prime i := (hg i).prime
      levelPrime_modEq_one_q₂_sq i := (hg i).modEq_one
      levelPrime_injective := Matrix.injective_pair_iff_ne.2 h_ne
      levelPrime_mem i := (hg i).mem_Icc
      piMBar := α, piMBar_mul_star := h_norm
      N, N_prime := hN, N_modEq_one_q₂_sq := hN_mod, log_N_mem := hN_log
      piN := β, piN_mul_star := hβ }
  refine ⟨h_lower, D, exp_log hx_pos, rfl, ?_, h_cutoff, hB_upper⟩
  simpa only [y, exp_half, exp_log hx_pos] using hm_lower

end New
