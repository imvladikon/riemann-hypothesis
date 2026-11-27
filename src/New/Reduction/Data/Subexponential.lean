module

public import New.Reduction.Data.Existence
import Lib.Analytic.Primes

/-!
# One width for sparse places, prime windows, and the auxiliary cutoff

The modulus and the sparse-set construction bound the logarithmic width from below. Choose
its size by balancing both conditions, then use the admissible-data constructor with that width.
-/

@[expose] public section

open Asymptotics Filter NumberField Real

namespace New

/-- The window width obtained by balancing the modulus and sparse-set requirements,
rounding the resulting number of digits up to a natural number. -/
noncomputable def Parameters.subexponentialWindowWidth (P : Parameters) (y : ℝ) : ℝ :=
  let L := log (5184 * y)
  let S := sqrt (99 * (P.q₀ : ℝ) * P.d * y * L)
  let n : ℕ := ⌈S / L⌉₊
  exp ((n : ℝ) * L)

private lemma Parameters.one_le_window_coefficient (P : Parameters) : 1 ≤ 99 * (P.q₀ : ℝ) * P.d := by
  have hq : (1 : ℝ) ≤ P.q₀ := by exact_mod_cast Nat.one_le_iff_ne_zero.mpr (NeZero.ne P.q₀)
  have hd : (1 : ℝ) ≤ P.d := by exact_mod_cast P.d_prime.one_lt.le
  calc
    1 = 1 * (1 : ℝ) * 1 := by norm_num
    _ ≤ 99 * (P.q₀ : ℝ) * P.d := by
      gcongr
      norm_num

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

/-- The original constructor supplies the ranks, weights and auxiliary cutoff at the common
subexponential width. -/
theorem eventually_exists_data_with_subexponential_windows (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      let W := P.subexponentialWindowWidth (log x)
      exp (3 * sqrt (log x)) ≤ W ∧ ∃ D : Data P,
        D.x = x ∧ D.natX₁ = ⌊exp W⌋₊ ∧ sqrt x ≤ D.m ∧ W - 1 ≤ D.logX₁ ∧ D.logB ≤ W ^ 6 + 1 := by
  filter_upwards [(tendsto_log_atTop.comp tendsto_natCast_atTop_atTop).eventually
    P.eventually_isLargeScale_with_prime_windows] with x ⟨n, h_scale, h_lower, h_window⟩
  obtain ⟨m, r, s, b, T, g, α, N, β, h_adm⟩ := h_scale.exists_isAdmissibleData h_window
  obtain ⟨D, h_fields, h_cutoff, h_logB⟩ := h_adm.exists_hasFields h_scale
  refine ⟨h_lower, D, ?_, h_fields.natX₁_eq, ?_, h_cutoff, h_logB.2⟩
  · rw [← h_fields.natX_eq, ← D.exp_logX]
  · simpa only [h_fields.m_eq] using h_adm.isLeast_m.1.2

end New
