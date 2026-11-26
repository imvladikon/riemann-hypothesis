module

public import Lib.Analytic.PrimeNumberTheorem.ZeroFreeRegion
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import TauCeti.Analysis.Complex.BorelCaratheodory
import TauCeti.NumberTheory.ArithmeticFunction.VonMangoldt
import TauCeti.NumberTheory.DirichletCharacter.LFunction.Basic
import TauCeti.NumberTheory.LFunctions.Zeros.ZeroFreeRegion.Dirichlet
import TauCeti.NumberTheory.LSeries.DirichletEulerLog
import TauCeti.NumberTheory.LSeries.RiemannZeta.Bounds

/-!
# Primes congruent to `1` modulo `M ^ k` with logarithm in a prescribed window

Let `4 ∣ M` and let `A` be fixed. For large `W` there is a prime `p ≡ 1` modulo `M ^ k` with `log p`
in `[U, U + W]`, uniformly for `1 < k`, `M ^ k ≤ W ^ A` and `W ≤ U ≤ W ^ A`
(`New.exists_prime_modEq_one_log_mem`).

The characters modulo `M ^ k` with trivial square come from the fixed modulus `M ^ 2`, so the
classical zero-free region gives a disc of radius `a / l` about `1` when `M ^ k ≤ exp l`, uniformly
in `k`. The logarithmic derivative on a smaller disc is bounded by `B * l ^ 2`.
Newman's contour yields a prime for `C * l ^ 2 ≤ W ≤ U` when also `U ≤ exp l`.

Independently, the first section proves `n ≤ φ n * (2 * log n + 1)` (`New.le_totient_mul_log`).

Notions from other files:
* `entireL χ` is `L(s, χ)`, times `s - 1` if `χ` is principal;
* `regularL χ` is `L(s, χ)`, times `(s - 1) / s` if `χ` is principal.

## Relation to the literature

Known result: primes congruent to `1` modulo `M ^ k` with logarithm in a prescribed window. It is a
consequence of the Siegel–Walfisz theorem. Only one prime is found, in a long window, and only for
moduli that are powers of a fixed multiple of `4`. Source: Montgomery and Vaughan, Multiplicative
Number Theory I, 2007, Cor. 11.19.
-/

@[expose] public section

/-! ## A lower bound for Euler's totient -/

section TotientBound

open Finset Real Nat Prime

/-- If every element of a finite set `S` of natural numbers exceeds `a`, then
`∏ p ∈ S, (1 - p⁻¹) ≥ a / (a + #S)`. -/
lemma New.div_add_card_le_prod_one_sub_inv (S : Finset ℕ) (a : ℕ) (ha : ∀ p ∈ S, a < p) :
    (a : ℚ) / (a + #S) ≤ ∏ p ∈ S, (1 - (p : ℚ)⁻¹) := by
  -- Remove the least element `b` of `S`: by induction the product is at least
  -- `(1 - b⁻¹) * b / (b + #S - 1) = (b - 1) / (b + #S - 1)`, and `a ≤ b - 1`.
  induction S using Finset.induction_on_min generalizing a with
  | empty => simp [div_self_le_one]
  | insert b S b_min ih =>
    have hab : (a : ℚ) + 1 ≤ b := mod_cast ha b (mem_insert_self b S)
    have hb : 0 < (b : ℚ) := lt_of_lt_of_le (by positivity) hab
    have hb_notMem : b ∉ S := fun h ↦ (b_min b h).false
    rw [prod_insert hb_notMem, card_insert_of_notMem hb_notMem, Nat.cast_succ]
    calc
      (a : ℚ) / (a + (#S + 1)) ≤ (b - 1) / (b + #S) := by
        rw [div_le_div_iff₀ (by positivity) (by positivity)]
        nlinarith
      _ = (1 - (b : ℚ)⁻¹) * (b / (b + #S)) := by field_simp
      _ ≤ (1 - (b : ℚ)⁻¹) * ∏ p ∈ S, (1 - (p : ℚ)⁻¹) :=
        mul_le_mul_of_nonneg_left (ih b b_min) (sub_nonneg.2 (cast_inv_le_one b))

/-- Every positive integer satisfies `n ≤ φ n * (2 * log n + 1)`. -/
lemma New.le_totient_mul_log {n : ℕ} (hn : 0 < n) : n ≤ φ n * (2 * Real.log n + 1) := by
  -- If `n` has `j` distinct prime factors, then `2 ^ j ≤ n`, so `j ≤ 2 * log n`, and
  -- `φ n / n = ∏ (1 - p⁻¹) ≥ 1 / (1 + j)`.
  set j : ℕ := #n.primeFactors
  have two_pow_le : 2 ^ j ≤ n :=
    (pow_card_le_prod _ _ 2 fun _ hp ↦ (prime_of_mem_primeFactors hp).two_le).trans
      (le_of_dvd hn n.prod_primeFactors_dvd)
  have card_le : j * Real.log 2 ≤ Real.log n := by grw [← two_pow_le]; simp
  have totient_ge : (n : ℝ) ≤ φ n * (1 + j) := by
    have h_prod : ((1 : ℕ) : ℚ) / ((1 : ℕ) + j) ≤ ∏ p ∈ n.primeFactors, (1 - (p : ℚ)⁻¹) :=
      div_add_card_le_prod_one_sub_inv _ 1 fun _ hp ↦ (prime_of_mem_primeFactors hp).one_lt
    suffices h_rat : (n : ℚ) ≤ φ n * (1 + j) from mod_cast h_rat
    rw [totient_eq_mul_prod_factors, mul_assoc]
    exact le_mul_of_one_le_right (by positivity)
      ((div_le_iff₀ (by positivity)).1 (mod_cast h_prod))
  refine totient_ge.trans (mul_le_mul_of_nonneg_left ?_ (by positivity))
  nlinarith [log_two_gt_d9]

end TotientBound

/-!
## Primes congruent to 1 mod M^k in a logarithmic window via Newman's method
-/

section AuxiliaryPrimes

open ArithmeticFunction DirichletCharacter Complex Set Filter MeasureTheory LSeries Finset Real
  Topology vonMangoldt Chebyshev Polynomial ZMod MulChar

/-- If `4 ∣ M` and `2 ≤ k`, a character mod `M ^ k` whose square is trivial factors through modulus
`M ^ 2`, since every unit congruent to `1` mod `M ^ 2` is a square. -/
lemma New.factorsThrough_sq_of_sq_eq_one {M k : ℕ} [NeZero M] (hM : 4 ∣ M) (hk : 2 ≤ k)
    {χ : DirichletCharacter ℂ (M ^ k)} (hχ : χ ^ 2 = 1) :
    χ.FactorsThrough (M ^ 2) := by
  refine (χ.factorsThrough_iff_ker_unitsMap (pow_dvd_pow M hk)).mpr fun u hu ↦ ?_
  obtain ⟨m, hm⟩ := hM
  obtain ⟨t, ht⟩ : (↑(M ^ 2) : ℤ) ∣ 1 - (u : ZMod (M ^ k)).cast :=
    (intCast_eq_intCast_iff_dvd_sub u.val.cast 1 (M ^ 2)).mp
      (by simpa [unitsMap_def] using congrArg Units.val (MonoidHom.mem_ker.1 hu))
  have u_lin : 1 - (u : ZMod (M ^ k)) = M ^ 2 * t := by
    simpa using congrArg (Int.cast : ℤ → ZMod (M ^ k)) ht
  -- Newton's iteration from `0` solves `c ^ 2 + c = -M * m * t`, as the right side is nilpotent;
  -- then `(1 + 2 * c) ^ 2 = 1 - 4 * M * m * t = u`
  obtain ⟨c, hc⟩ : ∃ c : ZMod (M ^ k), M * m * t + c ^ 2 + c = 0 := by
    have h_nil : IsNilpotent ((M : ZMod (M ^ k)) * m * t) :=
      ⟨k, by simp [mul_pow, natCast_pow_eq_zero_of_le]⟩
    obtain ⟨c, ⟨-, hc⟩, -⟩ := existsUnique_nilpotent_sub_and_aeval_eq_zero (x := (0 : ZMod (M ^ k)))
      (P := C ((M : ZMod (M ^ k)) * m * t) + X ^ 2 + X) (by simpa using h_nil) (by simp)
    exact ⟨c, by simpa using hc⟩
  have hM_cast : (M : ZMod (M ^ k)) = 4 * m := by simp [hm]
  have u_eq : u = (1 + 2 * c) ^ 2 := by linear_combination -u_lin - 4 * hc - M * t * hM_cast
  refine Units.ext ?_
  simpa [u_eq, ← pow_apply', hχ] using one_apply_coe u

/-- If `4 ∣ M` and `2 ≤ k`, then for a character `χ` mod `M ^ k` with trivial square there is a
character `χ₀` mod `M ^ 2` with `regularL χ = regularL χ₀`, as the two moduli have the same prime
factors. Here `regularL χ` is `L(s, χ)`, times `(s - 1) / s` if `χ` is principal. -/
lemma New.exists_regularL_eq_of_sq_eq_one {M k : ℕ} [NeZero M] (hM : 4 ∣ M) (hk : 2 ≤ k)
    {χ : DirichletCharacter ℂ (M ^ k)} (hχ : χ ^ 2 = 1) :
    ∃ χ₀ : DirichletCharacter ℂ (M ^ 2), regularL χ = regularL χ₀ := by
  obtain ⟨h_dvd, χ₀, hχ₀⟩ := factorsThrough_sq_of_sq_eq_one hM hk hχ
  have h_one : χ = 1 ↔ χ₀ = 1 := by rw [hχ₀, changeLevel_eq_one_iff]
  have h_primes : (M ^ k).primeFactors = (M ^ 2).primeFactors := by
    simp [Nat.primeFactors_pow M (show k ≠ 0 by lia), Nat.primeFactors_pow M two_ne_zero]
  -- Changing the level multiplies by Euler factors at new primes, and there are none.
  have h_LFunction {z : ℂ} (h : χ₀ ≠ 1 ∨ z ≠ 1) : χ.LFunction z = χ₀.LFunction z := by
    rw [hχ₀, LFunction_changeLevel h_dvd χ₀ h, h_primes, Finset.prod_eq_one, mul_one]
    simp +contextual [ZMod.isUnit_prime_iff_not_dvd]
  have h_entire (z : ℂ) : entireL χ₀ z = entireL χ z := by
    by_cases hχ₀_one : χ₀ = 1
    · subst χ₀
      by_cases hz : z = 1 <;>
        simp [entireL, LFunctionTrivChar₁, LFunctionTrivChar, h_one.2 rfl, hz, h_primes,
          ← h_LFunction]
    · simp [entireL, hχ₀_one, mt h_one.1 hχ₀_one, h_LFunction (.inl hχ₀_one)]
  exact ⟨χ₀, funext fun z ↦ by by_cases h : χ₀ = 1 <;> simp [regularL, ← h_entire, h_one, h]⟩

/-- In a family of powers of a fixed modulus, the classical zero-free region supplies a disc of
radius `a / l` around `1`. Characters with trivial square have a fixed nonvanishing neighborhood
at level `M ^ 2`. -/
lemma New.exists_eventually_entireL_ne_zero_log_disk {M : ℕ} [NeZero M] (hM : 4 ∣ M) :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∀ᶠ l : ℝ in atTop, ∀ (k : ℕ), 1 < k →
      ∀ (χ : DirichletCharacter ℂ (M ^ k)) (s : ℂ),
        (M : ℝ) ^ k ≤ rexp l → ‖s - 1‖ ≤ a / l → entireL χ s ≠ 0 := by
  obtain ⟨c, hc, -, h_region⟩ := TauCeti.LFunctions.dirichletLFunction_zeroFreeRegion
  have h_inv : Tendsto (fun l : ℝ ↦ 1 / l) atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop tendsto_id
  have h_neighborhood : ∀ᶠ L : ℝ in atTop, 1 ≤ L ∧ ∀ χ₀ : DirichletCharacter ℂ (M ^ 2),
      ∀ z : ℂ, ‖z - 1‖ ≤ 1 / L → 1 / L ≤ ‖regularL χ₀ z‖ :=
    (eventually_ge_atTop 1).and <| h_inv.eventually <|
      eventually_all.2 fun χ₀ ↦ eventually_le_norm_regularL χ₀
  obtain ⟨L, hL, h_near⟩ := h_neighborhood.exists
  let a := min 1 (min (c / 2) (1 / L))
  have hL_pos : 0 < L := one_pos.trans_le hL
  have ha : 0 < a := lt_min one_pos (lt_min (half_pos hc) (one_div_pos.2 hL_pos))
  have ha_one : a ≤ 1 := min_le_left _ _
  refine ⟨a, ha, ha_one, ?_⟩
  filter_upwards [eventually_ge_atTop (4 : ℝ)] with l hl k hk χ s hq hs
  have hl_pos : 0 < l := by linarith only [hl]
  have h_radius : a / l ≤ a := div_le_self ha.le (by linarith only [hl])
  by_cases hχ : χ ^ 2 = 1
  · obtain ⟨χ₀, h_eq⟩ := exists_regularL_eq_of_sq_eq_one hM hk hχ
    have ha_L : a ≤ 1 / L := (min_le_right _ _).trans (min_le_right _ _)
    have h_pos : 0 < ‖regularL χ s‖ :=
      (one_div_pos.2 hL_pos).trans_le (by rw [h_eq]; exact h_near χ₀ s (hs.trans (h_radius.trans ha_L)))
    exact fun hz ↦ (norm_pos_iff.1 h_pos) (by simp [regularL, hz])
  have hχ_ne : χ ≠ 1 := fun h ↦ hχ (by simp [h])
  let q := M ^ k
  have hq_one : (1 : ℝ) ≤ (q : ℝ) := Nat.one_le_cast.mpr NeZero.one_le
  have hq_exp : (q : ℝ) ≤ rexp l := by simpa only [q, Nat.cast_pow] using hq
  have h_im : |s.im| ≤ 1 := by
    simpa only [sub_im, one_im, sub_zero] using
      (abs_im_le_norm (s - 1)).trans (hs.trans (h_radius.trans ha_one))
  have h_arg : 1 < (q : ℝ) * (|s.im| + 3) := calc
    _ < 1 * 3 := by norm_num
    _ ≤ _ := mul_le_mul hq_one (by linarith only [abs_nonneg s.im]) (by norm_num) (by positivity)
  have h_log : Real.log ((q : ℝ) * (|s.im| + 3)) ≤ 2 * l := by
    apply (Real.log_le_iff_le_exp (zero_lt_one.trans h_arg)).2
    rw [two_mul, Real.exp_add]
    exact mul_le_mul hq_exp (by linarith only [h_im, hl, add_one_le_exp l])
      (by positivity) (exp_pos l).le
  have ha_c : a ≤ c / 2 := (min_le_right _ _).trans (min_le_left _ _)
  have h_width : a / l ≤ c / Real.log ((q : ℝ) * (|s.im| + 3)) := calc
    _ ≤ (c / 2) / l := div_le_div_of_nonneg_right ha_c hl_pos.le
    _ = c / (2 * l) := by ring
    _ ≤ _ := div_le_div_of_nonneg_left hc.le (Real.log_pos h_arg) h_log
  have h_re_abs : |s.re - 1| ≤ a / l := by
    simpa only [sub_re, one_re] using (abs_re_le_norm (s - 1)).trans hs
  have h_re : 1 - c / Real.log ((q : ℝ) * (|s.im| + 3)) ≤ s.re := by
    linarith only [(abs_le.1 h_re_abs).1, h_width]
  have h_nonzero : χ.LFunction s ≠ 0 := fun h_zero ↦
    hχ ((h_region q χ).1 s h_re
      (χ.meromorphicOrderAt_LFunction_pos_iff.2 ⟨h_zero, .inr hχ_ne⟩)).2.1
  simpa only [entireL, ite_eq_right hχ_ne] using h_nonzero

private lemma eventually_const_mul_pow_le_exp (C : ℝ) (n : ℕ) :
    ∀ᶠ l : ℝ in atTop, C * l ^ n ≤ rexp l := by
  filter_upwards [((isLittleO_pow_exp_pos_mul_atTop n one_pos).const_mul_left C).eventuallyLE]
    with l h
  exact (le_norm_self _).trans (by simpa only [one_mul, Real.norm_eq_abs, abs_of_pos (exp_pos l)] using h)

open New in
private lemma norm_entireL_le_of_disk {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q)
    {s : ℂ} (hs : ‖s - 1‖ ≤ 1 / 2) : ‖entireL χ s‖ ≤ 32 * q := by
  have h_re : 1 / 2 ≤ s.re := by
    have h_abs : |s.re - 1| ≤ 1 / 2 := by
      simpa only [sub_re, one_re] using (abs_re_le_norm (s - 1)).trans hs
    linarith only [(abs_le.1 h_abs).1]
  have h_norm : ‖s‖ ≤ 2 := by
    linarith only [norm_le_norm_sub_add s 1, norm_one (α := ℂ), hs]
  have h_factor : ‖(if χ = 1 then s else 1 : ℂ)‖ ≤ 2 := by
    split_ifs
    · exact h_norm
    · simp
  have h_ne : (if χ = 1 then s else 1 : ℂ) ≠ 0 := by
    split_ifs
    · exact ne_zero_of_re_pos (by linarith only [h_re])
    · exact one_ne_zero
  have h_eq : entireL χ s = regularL χ s * (if χ = 1 then s else 1) := by
    rw [regularL, div_mul_cancel₀ _ h_ne]
  calc
    _ ≤ (8 * q * ‖s‖) * 2 := by
      rw [h_eq, norm_mul]
      exact mul_le_mul (New.norm_regularL_le_linear χ h_re) h_factor (norm_nonneg _) (by positivity)
    _ ≤ (8 * q * 2) * 2 := by gcongr
    _ = _ := by ring

open New in
private lemma mul_exp_neg_re_riemannZeta_le_norm_entireL {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) {r : ℝ} (hr : 0 < r) (hr_one : r ≤ 1) :
    r * rexp (-(riemannZeta ((1 + r : ℝ) : ℂ)).re) ≤ ‖entireL χ ((1 + r : ℝ) : ℂ)‖ := by
  let s : ℂ := (1 + r : ℝ)
  have hs : 1 < s.re := by simpa only [s, ofReal_re] using lt_add_of_pos_right 1 hr
  have h_lower : rexp (-(riemannZeta s).re) ≤ ‖χ.LFunction s‖ := by
    simpa only [s, ofReal_re] using χ.exp_neg_re_riemannZeta_le_norm_LFunction hs
  change r * rexp (-(riemannZeta s).re) ≤ ‖entireL χ s‖
  by_cases hχ : χ = 1
  · have hs_ne : s ≠ 1 := ne_of_apply_ne re hs.ne'
    have h_sub : s - 1 = (r : ℂ) := by simp [s]
    rw [entireL, ite_eq_left hχ, LFunctionTrivChar₁, Function.update_of_ne hs_ne, h_sub, norm_mul]
    simp only [norm_real, Real.norm_eq_abs, abs_of_pos hr]
    exact mul_le_mul_of_nonneg_left (by simpa only [hχ, LFunctionTrivChar] using h_lower) hr.le
  rw [entireL, ite_eq_right hχ]
  exact (mul_le_of_le_one_left (exp_pos _).le hr_one).trans h_lower

private lemma borel_factor_le {r d : ℝ} (hr : 0 < r) (hd : d ≤ 3 * r / 2) :
    4 * (2 * r + d) / (2 * r - d) ^ 2 ≤ 64 / r := by
  have h_gap : r / 2 ≤ 2 * r - d := by linarith only [hd]
  have h_sq : (r / 2) ^ 2 ≤ (2 * r - d) ^ 2 := pow_le_pow_left₀ (by positivity) h_gap 2
  calc
    _ ≤ 16 * r / (2 * r - d) ^ 2 := div_le_div_of_nonneg_right (by linarith only [hd, hr]) (sq_nonneg _)
    _ ≤ 16 * r / (r / 2) ^ 2 := div_le_div_of_nonneg_left (by positivity) (by positivity) h_sq
    _ = _ := by field

/-- A disc of radius `a / l` for the fixed-base family also gives a quadratic logarithmic
derivative bound. The estimate uses Borel–Carathéodory on a disc centered to the right of `1`. -/
lemma New.exists_eventually_norm_logDeriv_entireL_le_log_disk {M : ℕ} [NeZero M] (hM : 4 ∣ M) :
    ∃ a : ℝ, 0 < a ∧ a ≤ 1 ∧ ∃ B : ℝ, 0 < B ∧
      ∀ᶠ l : ℝ in atTop, ∀ (k : ℕ), 1 < k → ∀ (χ : DirichletCharacter ℂ (M ^ k)) (s : ℂ),
        (M : ℝ) ^ k ≤ rexp l → ‖s - 1‖ ≤ a / l →
          entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ B * l ^ 2 := by
  obtain ⟨a, ha, ha_one, h_disk⟩ := exists_eventually_entireL_ne_zero_log_disk hM
  let D : ℝ := 1 + 4 / a
  refine ⟨a / 8, by positivity, by linarith only [ha_one], 256 * (D + 2) / a, by dsimp [D]; positivity, ?_⟩
  filter_upwards [h_disk, eventually_ge_atTop (4 : ℝ), eventually_const_mul_pow_le_exp (128 / a) 1]
    with l h_free hl h_poly k hk χ s hq hs
  have hl_pos : 0 < l := by linarith only [hl]
  let r := a / (4 * l)
  let b : ℂ := (1 + r : ℝ)
  have hr : 0 < r := by dsimp [r]; positivity
  have h_radius : a / l = 4 * r := by dsimp [r]; ring
  have h_half : a / l ≤ 1 / 2 := (div_le_iff₀ hl_pos).2 (by linarith only [ha_one, hl])
  have hr_one : r ≤ 1 := by linarith only [h_radius, h_half]
  have hb : ‖b - 1‖ = r := by
    rw [show b - 1 = (r : ℂ) by simp [b], norm_real, Real.norm_eq_abs, abs_of_pos hr]
  have h_outer (w : ℂ) (hw : w ∈ Metric.ball b (2 * r)) : ‖w - 1‖ ≤ a / l := by
    have h_dist : ‖w - b‖ < 2 * r := by simpa only [Metric.mem_ball, dist_eq_norm] using hw
    have h_sum := norm_add_le (w - b) (b - 1)
    rw [sub_add_sub_cancel, hb] at h_sum
    linarith only [h_sum, h_dist, h_radius, hr]
  rw [show a / 8 / l = r / 2 by dsimp [r]; ring] at hs
  have h_target : ‖s - b‖ ≤ 3 * r / 2 := by
    have h_sum := norm_sub_le (s - 1) (b - 1)
    rw [sub_sub_sub_cancel_right, hb] at h_sum
    linarith only [h_sum, hs]
  have h_rcp : 1 / r = (4 / a) * l := by dsimp [r]; field
  have hd : (riemannZeta b).re ≤ D * l := by
    have h := (TauCeti.riemannZeta_re_lt_one_add_one_div_sub_one
      (σ := 1 + r) (by linarith only [hr]) (by linarith only [hr])).le
    simp only [add_sub_cancel_left, h_rcp] at h
    change (riemannZeta ((1 + r : ℝ) : ℂ)).re ≤ (1 + 4 / a) * l
    rw [add_mul, one_mul]
    linarith only [h, hl]
  have h_lower : r * rexp (-D * l) ≤ ‖entireL χ b‖ :=
    (mul_le_mul_of_nonneg_left
      (Real.exp_le_exp.2 (by linarith only [hd] : -D * l ≤ -(riemannZeta b).re)) hr.le).trans
        (mul_exp_neg_re_riemannZeta_le_norm_entireL χ hr hr_one)
  have h_absorb : 32 ≤ r * rexp l := by
    have h := (div_le_iff₀ hr).1 (show 32 / r ≤ rexp l by
      calc
        _ = 32 * (1 / r) := by ring
        _ = (128 / a) * l ^ 1 := by rw [h_rcp, pow_one]; ring
        _ ≤ _ := h_poly)
    simpa only [mul_comm] using h
  have hq_cast : ((M ^ k : ℕ) : ℝ) ≤ rexp l := by simpa only [Nat.cast_pow] using hq
  have h_relative (w : ℂ) (hw : w ∈ Metric.ball b (2 * r)) :
      ‖entireL χ w‖ ≤ rexp ((D + 2) * l) * ‖entireL χ b‖ := calc
    _ ≤ (32 : ℝ) * ((M ^ k : ℕ) : ℝ) := norm_entireL_le_of_disk χ ((h_outer w hw).trans h_half)
    _ ≤ 32 * rexp l := mul_le_mul_of_nonneg_left hq_cast (by norm_num)
    _ ≤ (r * rexp l) * rexp l := mul_le_mul_of_nonneg_right h_absorb (exp_pos l).le
    _ = rexp ((D + 2) * l) * (r * rexp (-D * l)) := by
      have h_exp : rexp ((D + 2) * l) * rexp (-D * l) = rexp l * rexp l := by
        rw [← Real.exp_add, ← Real.exp_add]
        congr 1
        ring
      rw [mul_left_comm (rexp ((D + 2) * l)) r, h_exp, mul_assoc]
    _ ≤ _ := mul_le_mul_of_nonneg_left h_lower (exp_pos _).le
  have h_borel := Complex.norm_logDeriv_le_of_forall_mem_ball_norm_le_mul
    (fun w _ ↦ (analyticAt_entireL χ w).differentiableAt.differentiableWithinAt)
    (fun w hw ↦ h_free k hk χ w hq (h_outer w hw)) h_relative
    (show ‖s - b‖ < 2 * r by linarith only [h_target, hr])
  rw [Real.log_exp] at h_borel
  refine ⟨h_free k hk χ s hq (hs.trans (by linarith only [h_radius, hr])), h_borel.trans ?_⟩
  calc
    _ ≤ 64 / r * ((D + 2) * l) :=
      mul_le_mul_of_nonneg_right (borel_factor_le hr h_target) (by dsimp [D]; positivity)
    _ = _ := by
      rw [div_eq_mul_inv, ← one_div, h_rcp]
      ring

/-- A disc of radius `1 / X` with `C * l ^ 9 ≤ X` works for all powers of a fixed modulus
bounded by `exp l`. The neighborhood used for the real characters comes from modulus `M ^ 2`. -/
lemma New.exists_eventually_norm_logDeriv_entireL_le_near_one {M : ℕ} [NeZero M] (hM : 4 ∣ M) :
    ∃ C : ℝ, 16 ≤ C ∧ ∀ᶠ l : ℝ in atTop, ∀ (k : ℕ), 1 < k →
      ∀ (χ : DirichletCharacter ℂ (M ^ k)) (s : ℂ) (X : ℝ),
        (M : ℝ) ^ k ≤ rexp l → C * l ^ 9 ≤ X → ‖s - 1‖ ≤ X⁻¹ →
          entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ X := by
  obtain ⟨a, ha, -, B, -, h_disk⟩ := exists_eventually_norm_logDeriv_entireL_le_log_disk hM
  let C := max (16 : ℝ) (max (1 / a) B)
  have hC : 16 ≤ C := le_max_left _ _
  refine ⟨C, hC, ?_⟩
  filter_upwards [h_disk, eventually_ge_atTop (1 : ℝ)] with l h_free hl k hk χ s X hq hX hs
  have hl_pos : 0 < l := one_pos.trans_le hl
  have hC_nonneg : 0 ≤ C := by linarith only [hC]
  have h_bound : l / a ≤ X := calc
    _ = (1 / a) * l := by ring
    _ ≤ C * l := mul_le_mul_of_nonneg_right ((le_max_left _ _).trans (le_max_right _ _)) hl_pos.le
    _ ≤ C * l ^ 9 := mul_le_mul_of_nonneg_left (le_self_pow₀ hl (by decide)) hC_nonneg
    _ ≤ X := hX
  have h_inv : X⁻¹ ≤ a / l := by
    simpa only [inv_div] using inv_anti₀ (by positivity : 0 < l / a) h_bound
  refine (h_free k hk χ s hq (hs.trans h_inv)).imp_right (·.trans ?_)
  calc
    B * l ^ 2 ≤ C * l ^ 2 :=
      mul_le_mul_of_nonneg_right ((le_max_right _ _).trans (le_max_right _ _)) (sq_nonneg _)
    _ ≤ C * l ^ 9 := mul_le_mul_of_nonneg_left (pow_le_pow_right₀ hl (by decide)) hC_nonneg
    _ ≤ X := hX

private lemma eventually_mul_pow_nine_le_two_mul_pow (C : ℝ) :
    ∀ᶠ l : ℝ in atTop, C * l ^ 9 ≤ 2 * l ^ 25 := by
  filter_upwards [eventually_ge_atTop 1, eventually_ge_atTop C] with l hl hC
  calc
    _ ≤ l * l ^ 9 := mul_le_mul_of_nonneg_right hC (by positivity)
    _ = l ^ 10 := by ring
    _ ≤ l ^ 25 := pow_le_pow_right₀ hl (by decide)
    _ ≤ _ := by linarith only [pow_nonneg (zero_le_one.trans hl) 25]

/-- For powers of a fixed modulus, parameterize the disc about `1` by an upper bound on the
logarithm of the modulus. -/
lemma New.eventually_norm_logDeriv_entireL_le_near_one_of_exp {M : ℕ} [NeZero M] (hM : 4 ∣ M) :
    ∀ᶠ l : ℝ in atTop, ∀ (k : ℕ), 1 < k →
      ∀ (χ : DirichletCharacter ℂ (M ^ k)) (s : ℂ) (X : ℝ),
        (M : ℝ) ^ k ≤ rexp l → 2 * l ^ 25 ≤ X → ‖s - 1‖ ≤ X⁻¹ →
        entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ X := by
  obtain ⟨C, -, h_disc⟩ := exists_eventually_norm_logDeriv_entireL_le_near_one hM
  filter_upwards [h_disc, eventually_mul_pow_nine_le_two_mul_pow C] with l h h_le k hk χ s X hq hX hs
  exact h k hk χ s X hq (h_le.trans hX) hs

private lemma eventually_const_mul_log_pow_le (B c : ℝ) (n : ℕ) :
    ∀ᶠ X : ℝ in atTop, B * (c * Real.log X) ^ n ≤ X := by
  filter_upwards [((isLittleO_pow_log_id_atTop (n := n)).const_mul_left (B * c ^ n)).eventuallyLE,
    eventually_ge_atTop (0 : ℝ)] with X h hX
  have h_le : (B * c ^ n) * Real.log X ^ n ≤ X :=
    (le_norm_self _).trans (by simpa only [id, Real.norm_eq_abs, abs_of_nonneg hX] using h)
  simpa only [mul_pow, ← mul_assoc] using h_le

/-- For `4 ∣ M` and `A` fixed, for all large `X` the following holds for every `k > 1`, every
Dirichlet character `χ` mod `M ^ k` with `M ^ k ≤ X ^ A`, and every `s` with `|s - 1| ≤ 1 / X`:
`entireL χ s ≠ 0` and `|logDeriv (entireL χ) s| ≤ X`. Here `entireL χ` is the entire function equal
to `L(s, χ)` for non-principal `χ`, and to the continuation of `(s - 1) L(s, χ)` for principal `χ`.
No exceptional zero can occur, because the real characters come from the fixed modulus `M ^ 2`. -/
lemma New.eventually_norm_logDeriv_entireL_le_near_one (A : ℕ) {M : ℕ} [NeZero M] (hM : 4 ∣ M) :
    ∀ᶠ X : ℝ in atTop, ∀ k : ℕ, 1 < k → ∀ (χ : DirichletCharacter ℂ (M ^ k)) (s : ℂ),
      (M : ℝ) ^ k ≤ X ^ A → ‖s - 1‖ ≤ X⁻¹ → entireL χ s ≠ 0 ∧ ‖logDeriv (entireL χ) s‖ ≤ X := by
  have h_log : Tendsto (fun X : ℝ ↦ (A + 1 : ℕ) * X.log) atTop atTop :=
    tendsto_log_atTop.const_mul_atTop (by positivity)
  filter_upwards [h_log.eventually (eventually_norm_logDeriv_entireL_le_near_one_of_exp hM),
    eventually_const_mul_log_pow_le 2 (A + 1 : ℕ) 25, eventually_ge_atTop (1 : ℝ)]
    with X h_free h_small hX k hk χ s hq hs
  refine h_free k hk χ s X (hq.trans ?_) h_small hs
  rw [Real.exp_natCast_mul, Real.exp_log (one_pos.trans_le hX)]
  exact pow_le_pow_right₀ hX A.le_succ

/-- If `log n * (σ - re z) ≤ E`, then moving the `n`-th term of the Dirichlet series of `a` from
`1 + z` to the real point `1 + σ` costs at most the factor `exp E`. -/
lemma New.norm_term_le_exp_mul (a : ℕ → ℂ) {z : ℂ} (σ E : ℝ) {n : ℕ}
    (h_le : Real.log n * (σ - z.re) ≤ E) :
    ‖term a (1 + z) n‖ ≤ Real.exp E * ‖term a (1 + σ) n‖ := by
  obtain rfl | hn := eq_or_ne n 0
  · simp
  have hn_pos : 0 < (n : ℝ) := Nat.cast_pos.2 (Nat.pos_of_ne_zero hn)
  simp only [norm_term_eq, ite_eq_right hn, add_re, one_re, ofReal_re]
  rw [show 1 + z.re = (1 + σ) - (σ - z.re) by ring,
    Real.rpow_sub hn_pos, div_div_eq_mul_div, mul_comm ‖a n‖, mul_div_assoc]
  grw [Real.rpow_def_of_pos hn_pos (σ - z.re), h_le]

/-- For `0 < re z` the Dirichlet series of `Λ` on the class `1` mod `q` has at `1 + z` the sum
`(1 - z * ∑ χ, L_χ'/L_χ (1 + z)) / φ(q) / z`. Here `L_χ = entireL χ` is `L(s, χ)` with the pole
removed. -/
lemma New.hasSum_residueClass_one (q : ℕ) [NeZero q] {z : ℂ} (hz : 0 < z.re) :
    LSeriesHasSum (fun n : ℕ ↦ residueClass (1 : ZMod q) n) (1 + z)
      ((1 - z * ∑ χ : DirichletCharacter ℂ q, logDeriv (entireL χ) (1 + z)) / q.totient / z) := by
  -- Use orthogonality of characters; the pole term `1 / z` comes from `χ = 1`.
  have h_re : 1 < (1 + z).re := by simpa using hz
  have h_coeff : (fun n : ℕ ↦ (residueClass (1 : ZMod q) n : ℂ)) =
      (q.totient : ℂ)⁻¹ • ∑ χ : DirichletCharacter ℂ q, fun n : ℕ ↦ χ n * vonMangoldt n := by
    ext n
    simp [residueClass_apply]
  have h_value : (1 - z * ∑ χ : DirichletCharacter ℂ q, logDeriv (entireL χ) (1 + z)) / q.totient /
      z = (q.totient : ℂ)⁻¹ * ∑ χ : DirichletCharacter ℂ q,
        ((if χ = 1 then 1 else 0) / (1 + z - 1) - logDeriv (entireL χ) (1 + z)) := by
    simp [ite_div]
    field_simp [ne_zero_of_re_pos hz]
  rw [h_coeff, h_value]
  exact (LSeriesHasSum.sum fun χ _ ↦ LSeriesHasSum_mul_vonMangoldt χ h_re).smul _

private lemma norm_one_sub_mul_sum_div_totient_le_of_bound {q : ℕ} [NeZero q] {z : ℂ}
    {c : DirichletCharacter ℂ q → ℂ} {K : ℝ} (hc : ∀ χ : DirichletCharacter ℂ q, ‖z * c χ‖ ≤ K) :
    ‖(1 - z * ∑ χ : DirichletCharacter ℂ q, c χ) / q.totient‖ ≤ 1 + K := by
  have h_pos : 1 ≤ (q.totient : ℝ) := mod_cast Nat.totient_pos.2 (NeZero.pos q)
  have h_sum : ∑ χ : DirichletCharacter ℂ q, ‖z * c χ‖ ≤ q.totient * K := by
    grw [sum_le_card_nsmul _ _ K fun χ _ ↦ hc χ]
    simp [← card_eq_totient_of_hasEnoughRootsOfUnity ℂ]
  rw [norm_div, Complex.norm_natCast, div_le_iff₀ (by linarith), mul_sum]
  grw [norm_sub_le, norm_sum_le, norm_one]
  linarith only [h_sum, h_pos]

/-- There are `φ(q) ≥ 1` characters mod `q`, so `‖1 - ∑ χ, z * c χ‖ ≤ 2 φ(q)` if each term of the
sum has norm at most `1`. -/
lemma New.norm_one_sub_mul_sum_div_totient_le {q : ℕ} [NeZero q] {z : ℂ}
    {c : DirichletCharacter ℂ q → ℂ} (hc : ∀ χ : DirichletCharacter ℂ q, ‖z * c χ‖ ≤ 1) :
    ‖(1 - z * ∑ χ : DirichletCharacter ℂ q, c χ) / q.totient‖ ≤ 2 := by
  simpa only [one_add_one_eq_two] using norm_one_sub_mul_sum_div_totient_le_of_bound hc

private lemma sq_div_four_mul {X : ℝ} (hX : 0 < X) : X ^ 2 / (4 * X) = 4⁻¹ * X := by field

private lemma ofReal_sq_div_four_mul {X : ℝ} (hX : 0 < X) :
    ((X ^ 2 / (4 * X) : ℝ) : ℂ) = 4⁻¹ * X := by
  rw [sq_div_four_mul hX, ofReal_mul, ofReal_inv, show ((4 : ℝ) : ℂ) = 4 from rfl]

/-- On the circle `‖z‖ = 1 / X`, the quadratic term with coefficient `W / (4 * X)` shifts
the cutoff `U` by `t = W / 2 * (1 + X * re z)`, which lies in `[0, W]`. -/
private lemma exists_shift_le_re_exponent_of_width (U : ℝ) {X W : ℝ} (hX : 0 < X) (hW : 0 ≤ W)
    {z : ℂ} (hz : ‖z‖ = X⁻¹) :
    ∃ t : ℝ, 0 ≤ t ∧ t ≤ W ∧
      2 - (U + t) * z.re ≤ (2 - U * z - ((W / (4 * X) : ℝ) : ℂ) * (1 + X * z) ^ 2).re := by
  refine ⟨W / 2 * (1 + X * z.re), ?_⟩
  obtain ⟨h_lower, h_upper⟩ : -1 ≤ X * z.re ∧ X * z.re ≤ 1 := by
    rw [← abs_le, abs_mul, abs_of_pos hX]
    grw [z.abs_re_le_norm, hz, mul_inv_cancel₀ hX.ne']
  have h_im : X ^ 2 * z.im ^ 2 = 1 - (X * z.re) ^ 2 := by
    rw [← z.sq_norm_sub_sq_re, hz]
    field_simp
  have h_exponent : (2 - U * z - ((W / (4 * X) : ℝ) : ℂ) * (1 + X * z) ^ 2).re =
      2 - U * z.re - W / (4 * X) * ((1 + X * z.re) ^ 2 - X ^ 2 * z.im ^ 2) := by
    have h_two : (2 : ℂ).re = 2 := by norm_num
    simp only [pow_two, sub_re, mul_re, ofReal_re, ofReal_im, add_re, one_re, add_im, mul_im, one_im,
      h_two]
    ring
  refine ⟨mul_nonneg (by positivity) (by linarith only [h_lower]), ?_, le_of_eq ?_⟩
  · calc
      _ ≤ W / 2 * 2 := mul_le_mul_of_nonneg_left (by linarith only [h_upper]) (by positivity)
      _ = W := by ring
  · rw [h_exponent, h_im]
    field

/-- The contour shift when the logarithmic window has length `X ^ 2`. -/
lemma New.exists_shift_le_re_exponent (U : ℝ) {X : ℝ} (hX : 0 < X) {z : ℂ} (hz : ‖z‖ = X⁻¹) :
    ∃ t : ℝ, 0 ≤ t ∧ t ≤ X ^ 2 ∧
      2 - (U + t) * z.re ≤ (2 - U * z - 4⁻¹ * X * (1 + X * z) ^ 2 : ℂ).re := by
  simpa only [ofReal_sq_div_four_mul hX] using exists_shift_le_re_exponent_of_width U hX (sq_nonneg X) hz

section Circle

variable {a : ℕ → ℝ} {b : ℕ → ℂ} {F : ℂ → ℂ} {X U B C : ℝ}

/-- Let `a ≥ 0` have the Dirichlet series `F z / z` at `1 + z` for `0 < re z`, with `‖F‖ ≤ B` on
`‖z‖ ≤ 1 / X`, and let the series of `b` at `3 / 4` have absolute sum `C ≤ X`, where `0 < X ≤ U`.
If on a set of `n` the terms of the series of `a` at `1 + z` are at most `e ^ E` times
the sum of those of `a` at `1 + 1 / U` and those of `b` at `3 / 4`, then this part of the series is
at most `(B + 1) U e ^ E`. -/
private lemma norm_le_of_term_le_majorant_of_le (ha : ∀ n : ℕ, 0 ≤ a n)
    (h_series : ∀ z : ℂ, 0 < z.re → LSeriesHasSum (fun n : ℕ ↦ (a n : ℂ)) (1 + z) (F z / z))
    (hF : ∀ z : ℂ, ‖z‖ ≤ X⁻¹ → ‖F z‖ ≤ B) (hC : HasSum (fun n : ℕ ↦ ‖term b (1 + -4⁻¹) n‖) C)
    (hCX : C ≤ X) (hX : 0 < X) (hXU : X ≤ U) {z S : ℂ} {E : ℝ} {s : Set ℕ}
    (hS : HasSum (fun n : s ↦ term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n) S)
    (h_le : ∀ n ∈ s, ‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n‖ ≤
      rexp E * (‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + (U⁻¹ : ℝ)) n‖ + ‖term b (1 + -4⁻¹) n‖)) :
    ‖S‖ ≤ rexp E * ((B + 1) * U) := by
  -- The whole series of `a` at `1 + 1 / U` is `U F (1 / U) ≤ B U`.
  have hU_pos : 0 < U := hX.trans_le hXU
  have h_norm : HasSum (fun n : ℕ ↦ (‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + (U⁻¹ : ℝ)) n‖ : ℂ))
      (F (U⁻¹ : ℝ) / (U⁻¹ : ℝ)) := by
    refine (h_series _ (by simpa using hU_pos)).congr_fun fun n ↦ ?_
    -- The order on `ℂ` is not in scope, so the two facts `0 ≤ _` in `ℂ` are left to `mod_cast`.
    exact norm_of_nonneg' (mod_cast term_nonneg (mod_cast ha n) (1 + U⁻¹))
  have h_total : (F (U⁻¹ : ℝ) / (U⁻¹ : ℝ)).re ≤ B * U := by
    have h_abs : ‖((U⁻¹ : ℝ) : ℂ)‖ = U⁻¹ := by simp [hU_pos.le]
    grw [re_le_norm, norm_div, hF _ (h_abs.trans_le (inv_anti₀ hX hXU)), h_abs, div_inv_eq_mul]
  have h_part : HasSum (s.indicator (term (fun n : ℕ ↦ (a n : ℂ)) (1 + z))) S :=
    hasSum_subtype_iff_indicator.1 hS
  have h_bound (n : ℕ) : ‖s.indicator (term (fun n : ℕ ↦ (a n : ℂ)) (1 + z)) n‖ ≤
      rexp E * (‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + (U⁻¹ : ℝ)) n‖ + ‖term b (1 + -4⁻¹) n‖) := by
    rw [norm_indicator_eq_indicator_norm]
    exact indicator_le' h_le (fun _ _ ↦ by positivity) n
  calc
    ‖S‖ ≤ rexp E * ((F (U⁻¹ : ℝ) / (U⁻¹ : ℝ)).re + C) :=
      h_part.norm_le_of_bounded (((hasSum_re h_norm).add hC).mul_left _) h_bound
    _ ≤ rexp E * ((B + 1) * U) := by
      gcongr
      linarith

/-- The majorant estimate for a square window. -/
lemma New.norm_le_of_term_le_majorant (ha : ∀ n : ℕ, 0 ≤ a n)
    (h_series : ∀ z : ℂ, 0 < z.re → LSeriesHasSum (fun n : ℕ ↦ (a n : ℂ)) (1 + z) (F z / z))
    (hF : ∀ z : ℂ, ‖z‖ ≤ X⁻¹ → ‖F z‖ ≤ 2) (hC : HasSum (fun n : ℕ ↦ ‖term b (1 + -4⁻¹) n‖) C)
    (hCX : C ≤ X) (hX : 200 ≤ X) (hU : X ^ 2 ≤ U) {z S : ℂ} {E : ℝ} {s : Set ℕ}
    (hS : HasSum (fun n : s ↦ term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n) S)
    (h_le : ∀ n ∈ s, ‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n‖ ≤
      rexp E * (‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + (U⁻¹ : ℝ)) n‖ + ‖term b (1 + -4⁻¹) n‖)) :
    ‖S‖ ≤ rexp E * (3 * U) := by
  simpa only [show (2 : ℝ) + 1 = 3 by norm_num] using
    norm_le_of_term_le_majorant_of_le ha h_series hF hC hCX (by linarith only [hX])
      ((le_self_pow₀ (by linarith only [hX]) (by decide : (2 : ℕ) ≠ 0)).trans hU) hS h_le

/-- The bound on the circle in Newman's method. Let `a ≥ 0` have the Dirichlet series `F z / z` at
`1 + z` for `0 < re z` (here `term a s n` is the summand `a n / n ^ s`), with `‖F‖ ≤ B` on
`‖z‖ ≤ 1 / X`. Let the series of `b` at `3 / 4` have absolute sum `C ≤ X`, let `200 ≤ X ≤ U`,
`0 ≤ W ≤ U`, and let `|a n| ≤ |b n|` whenever `log n` lies in `[U, U + W]`. Then on `‖z‖ = 1 / X` we
have `‖F z - z P z‖ ≤ (B + 1) U e ^ E`, where `P z` is the part with `n < e ^ U` of the series of `a`
and `E` is the real part of `2 - U z - (W / (4 * X)) (1 + X z)²`. -/
private lemma norm_sub_mul_sum_term_le_of_width {W : ℝ} (ha : ∀ n : ℕ, 0 ≤ a n)
    (h_series : ∀ z : ℂ, 0 < z.re → LSeriesHasSum (fun n : ℕ ↦ (a n : ℂ)) (1 + z) (F z / z))
    (hF : ∀ z : ℂ, ‖z‖ ≤ X⁻¹ → ‖F z‖ ≤ B) (hC : HasSum (fun n : ℕ ↦ ‖term b (1 + -4⁻¹) n‖) C)
    (hCX : C ≤ X) (hX : 200 ≤ X) (hXU : X ≤ U) (hW : W ∈ Set.Icc 0 U)
    (h_window : ∀ n : ℕ, Real.log n ∈ Set.Icc U (U + W) → ‖(a n : ℂ)‖ ≤ ‖b n‖) {z : ℂ}
    (hz : ‖z‖ = X⁻¹) :
    ‖F z - z * ∑ n ∈ .range ⌈rexp U⌉₊, term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n‖ ≤
      rexp (2 - U * z - ((W / (4 * X) : ℝ) : ℂ) * (1 + X * z) ^ 2).re * ((B + 1) * U) := by
  have hX_pos : 0 < X := by linarith
  have hU_pos : 0 < U := hX_pos.trans_le hXU
  have hz_small : ‖z‖ ≤ 200⁻¹ := hz.trans_le (inv_anti₀ (by simp) hX)
  have hB : 0 ≤ B := (norm_nonneg _).trans (hF z hz.le)
  set E : ℝ := (2 - U * z - ((W / (4 * X) : ℝ) : ℂ) * (1 + X * z) ^ 2).re
  set P : ℂ := ∑ n ∈ .range ⌈rexp U⌉₊, term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n
  -- On the circle the quadratic term shifts the cutoff to `U + t` in the window.
  obtain ⟨t, ht_nonneg, ht_le, hE⟩ : ∃ t : ℝ, 0 ≤ t ∧ t ≤ W ∧ 2 - (U + t) * z.re ≤ E :=
    exists_shift_le_re_exponent_of_width U hX_pos hW.1 hz
  have h_unit : U * U⁻¹ = 1 := mul_inv_cancel₀ hU_pos.ne'
  have h_shift : t * U⁻¹ ≤ 1 := (div_le_one hU_pos).2 (ht_le.trans hW.2)
  have h_term_le_sum {n : ℕ} (h : Real.log n * (U⁻¹ - z.re) ≤ E) :
      ‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n‖ ≤ rexp E *
        (‖term (fun n : ℕ ↦ (a n : ℂ)) (1 + (U⁻¹ : ℝ)) n‖ + ‖term b (1 + -4⁻¹) n‖) :=
    (New.norm_term_le_exp_mul _ U⁻¹ E h).trans (by gcongr; simp)
  rcases le_total z.re U⁻¹ with h_left | h_right
  · -- If `re z ≤ 1 / U`, then `E ≥ 0`, and we bound `F` and the finite sum `P` separately.
    have hU_re : U * z.re ≤ 1 := (mul_le_mul_of_nonneg_left h_left hU_pos.le).trans_eq h_unit
    have ht_re : t * z.re ≤ 1 := (mul_le_mul_of_nonneg_left h_left ht_nonneg).trans h_shift
    have hE_nonneg : 0 ≤ E := by linarith
    have hP : ‖P‖ ≤ rexp E * ((B + 1) * U) := by
      refine norm_le_of_term_le_majorant_of_le ha h_series hF hC hCX hX_pos hXU (Finset.hasSum ..) fun n hn ↦
        h_term_le_sum ?_
      have hn_lt : n < rexp U := Nat.lt_ceil.1 (mem_range.1 hn)
      have h_log : Real.log n ≤ U := by
        obtain rfl | hn_pos := n.eq_zero_or_pos
        · simpa using hU_pos.le
        · exact ((log_lt_iff_lt_exp (mod_cast hn_pos)).2 hn_lt).le
      have h_exponent : Real.log n * (U⁻¹ - z.re) ≤ U * (U⁻¹ - z.re) :=
        mul_le_mul_of_nonneg_right h_log (sub_nonneg.2 h_left)
      linarith
    calc
      ‖F z - z * P‖ ≤ ‖F z‖ + ‖z‖ * ‖P‖ := by grw [norm_sub_le, norm_mul]
      _ ≤ B + 200⁻¹ * (rexp E * ((B + 1) * U)) := by grw [hF z hz.le, hz_small, hP]
      _ ≤ rexp E * ((B + 1) * U) := by
        have h_large : (B + 1) * U ≤ rexp E * ((B + 1) * U) :=
          le_mul_of_one_le_left (by positivity) (E.one_le_exp hE_nonneg)
        have h_two : 2 * B ≤ (B + 1) * U := calc
          _ ≤ (B + 1) * 2 := by linarith
          _ ≤ _ := mul_le_mul_of_nonneg_left (by linarith only [hX, hXU]) (by positivity)
        linarith only [hB, h_large, h_two]
  · -- If `re z ≥ 1 / U`, then `F z - z P` is `z` times the tail `n ≥ e ^ U` of the series.
    have h_pos : 0 < z.re := (inv_pos.2 hU_pos).trans_le h_right
    have h_tail : ‖F z / z - P‖ ≤ rexp E * ((B + 1) * U) := by
      refine norm_le_of_term_le_majorant_of_le ha h_series hF hC hCX hX_pos hXU
        (s := {n | n ∉ Finset.range ⌈rexp U⌉₊})
        ((Finset.hasSum_iff_compl _).1 (h_series z h_pos)) fun n hn ↦ ?_
      have hn_ge : rexp U ≤ n := Nat.ceil_le.1 (not_lt.1 (mt Finset.mem_range.2 hn))
      have h_log : U ≤ Real.log n := (le_log_iff_exp_le (U.exp_pos.trans_le hn_ge)).2 hn_ge
      rcases le_total (Real.log n) (U + W) with h_in | h_out
      · -- In the window compare with the series of `b`.
        have ht_re : t * z.re ≤ U * 200⁻¹ :=
          mul_le_mul (ht_le.trans hW.2) (z.re_le_norm.trans hz_small) h_pos.le hU_pos.le
        have h_exponent_le : Real.log n * (-4⁻¹ - z.re) ≤ E := by
          have h_move : Real.log n * (-4⁻¹ - z.re) ≤ U * (-4⁻¹ - z.re) :=
            mul_le_mul_of_nonpos_right h_log (by linarith)
          linarith
        grw [← norm_term_le (f := fun n : ℕ ↦ (a n : ℂ)) (g := b) _ (h_window n ⟨h_log, h_in⟩),
          New.norm_term_le_exp_mul _ _ E h_exponent_le]
        simp [exp_pos]
      · -- Beyond the window we have `log n ≥ U + W ≥ U + t`.
        refine h_term_le_sum ?_
        have h_move : Real.log n * (U⁻¹ - z.re) ≤ (U + t) * (U⁻¹ - z.re) :=
          mul_le_mul_of_nonpos_right (by linarith) (sub_nonpos.2 h_right)
        linarith
    calc
      ‖F z - z * P‖ = ‖z * (F z / z - P)‖ := by
        rw [mul_sub, mul_div_cancel₀ _ (ne_zero_of_re_pos h_pos)]
      _ ≤ rexp E * ((B + 1) * U) := by
        rw [norm_mul]
        exact (mul_le_mul_of_nonneg_left h_tail (norm_nonneg _)).trans
          (mul_le_of_le_one_left (by positivity) (by linarith only [hz_small]))

/-- The bound on the circle for a window of length `X ^ 2`. -/
lemma New.norm_sub_mul_sum_term_le (ha : ∀ n : ℕ, 0 ≤ a n)
    (h_series : ∀ z : ℂ, 0 < z.re → LSeriesHasSum (fun n : ℕ ↦ (a n : ℂ)) (1 + z) (F z / z))
    (hF : ∀ z : ℂ, ‖z‖ ≤ X⁻¹ → ‖F z‖ ≤ 2) (hC : HasSum (fun n : ℕ ↦ ‖term b (1 + -4⁻¹) n‖) C)
    (hCX : C ≤ X) (hX : 200 ≤ X) (hU : X ^ 2 ≤ U)
    (h_window : ∀ n : ℕ, Real.log n ∈ Set.Icc U (U + X ^ 2) → ‖(a n : ℂ)‖ ≤ ‖b n‖) {z : ℂ}
    (hz : ‖z‖ = X⁻¹) :
    ‖F z - z * ∑ n ∈ .range ⌈rexp U⌉₊, term (fun n : ℕ ↦ (a n : ℂ)) (1 + z) n‖ ≤
      rexp (2 - U * z - 4⁻¹ * X * (1 + X * z) ^ 2 : ℂ).re * (3 * U) := by
  have hXU : X ≤ U := (le_self_pow₀ (by linarith only [hX]) (by decide : (2 : ℕ) ≠ 0)).trans hU
  simpa only [ofReal_sq_div_four_mul (by linarith only [hX] : 0 < X), show (2 : ℝ) + 1 = 3 by norm_num] using
    norm_sub_mul_sum_term_le_of_width ha h_series hF hC hCX hX hXU ⟨sq_nonneg X, hU⟩ h_window hz

end Circle

/-- The function `F z - z P z` of Newman's method is analytic on a disc on which no
`entireL χ (1 + z)` vanishes: here `F z = (1 - z * ∑ χ, L_χ'/L_χ (1 + z)) / φ(q)`, with
`L_χ = entireL χ`, and `P z` is the part with `n < N` of the Dirichlet series at `1 + z` of `Λ` on
the class `1` mod `q` (`residueClass`). -/
lemma New.analyticOnNhd_sub_mul_sum_term (q : ℕ) [NeZero q] (N : ℕ) {r : ℝ}
    (h_ne : ∀ z : ℂ, ‖z‖ ≤ r → ∀ χ : DirichletCharacter ℂ q, entireL χ (1 + z) ≠ 0) :
    AnalyticOnNhd ℂ (fun z : ℂ ↦
      (1 - z * ∑ χ : DirichletCharacter ℂ q, logDeriv (entireL χ) (1 + z)) / q.totient -
        z * ∑ n ∈ .range N, term (fun n : ℕ ↦ (residueClass (1 : ZMod q) n : ℂ)) (1 + z) n)
      (Metric.closedBall 0 r) := by
  intro z hz
  have h_term (i : ℕ) : AnalyticAt ℂ
      (fun s : ℂ ↦ term (fun n : ℕ ↦ (residueClass (1 : ZMod q) n : ℂ)) s i) (1 + z) :=
    Differentiable.analyticAt (fun s ↦ (hasDerivAt_term _ i s).differentiableAt) _
  fun_prop (disch := simp_all) [logDeriv]

open New in
private theorem eventually_exists_prime_modEq_one_log_mem_of_contour (M : ℕ) [NeZero M] :
    ∀ᶠ l : ℝ in atTop, ∀ (X U W K : ℝ) (k : ℕ), l ≤ X →
      (M : ℝ) ^ k ≤ rexp l → X ≤ U → W ∈ Set.Icc 0 U →
      (∀ (z : ℂ), ‖z‖ ≤ X⁻¹ → ∀ χ : DirichletCharacter ℂ (M ^ k),
        entireL χ (1 + z) ≠ 0 ∧ ‖z * logDeriv (entireL χ) (1 + z)‖ ≤ K) →
      (1 + K + 1) * U * rexp l * rexp 2 < rexp (W / (4 * X)) →
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + W) := by
  let b (n : ℕ) : ℂ := ↑(if n.Prime then 0 else vonMangoldt n : ℝ)
  have h_sum : Summable fun n ↦ ‖term b (1 + -4⁻¹) n‖ := by
    refine (vonMangoldt.summable_nonprime_div_rpow (σ := (1 + -(4 : ℂ)⁻¹).re)
      (by norm_num [Complex.inv_re, Complex.normSq_apply])).congr fun n ↦ ?_
    rw [norm_term_eq]
    by_cases hn : n = 0
    · simp [hn]
    simp [b, hn, apply_ite, abs_of_nonneg vonMangoldt_nonneg]
  obtain ⟨B, hB⟩ := h_sum
  filter_upwards [eventually_ge_atTop 200, eventually_ge_atTop B]
    with l hl hB_le X U W K k hlX hq hXU hW h_disc h_exp
  have hX : 0 < X := by linarith only [hl, hlX]
  have hU_pos : 0 < U := hX.trans_le hXU
  set q : ℕ := M ^ k
  have hq_cast : (q : ℝ) ≤ rexp l := by simpa [q] using hq
  let a (n : ℕ) : ℂ := residueClass (1 : ZMod q) n
  let F (z : ℂ) : ℂ :=
    (1 - z * ∑ χ : DirichletCharacter ℂ q, logDeriv (entireL χ) (1 + z)) / q.totient
  have h_series (z : ℂ) (hz : 0 < z.re) : LSeriesHasSum a (1 + z) (F z / z) :=
    hasSum_residueClass_one q hz
  have hK : 0 ≤ K := (norm_nonneg _).trans (h_disc 0 (by simp [hX.le]) 1).2
  have hF (z : ℂ) (hz : ‖z‖ ≤ X⁻¹) : ‖F z‖ ≤ 1 + K :=
    norm_one_sub_mul_sum_div_totient_le_of_bound fun χ ↦ (h_disc z hz χ).2
  by_contra h_none
  let P (z : ℂ) : ℂ := ∑ n ∈ .range ⌈U.exp⌉₊, term a (1 + z) n
  let H : ℝ := W / (4 * X)
  let G (z : ℂ) : ℂ := (F z - z * P z) / (2 - U * z - (H : ℂ) * (1 + X * z) ^ 2).exp
  suffices h_circle : ∀ z : ℂ, ‖z‖ = X⁻¹ → ‖G z‖ ≤ (1 + K + 1) * U by
    have hG : AnalyticOnNhd ℂ G (Metric.closedBall 0 X⁻¹) := fun s hs ↦
      (analyticOnNhd_sub_mul_sum_term q ⌈U.exp⌉₊ (fun z hz χ ↦ (h_disc z hz χ).1) s hs).div
        (by fun_prop) (Complex.exp_ne_zero _)
    have h_zero : ‖G 0‖ ≤ (1 + K + 1) * U := by
      simpa using norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le 0 (inv_pos.2 hX)
        (hG.differentiableOn.diffContOnCl_ball le_rfl) (by simpa using h_circle)
    have h_value : ‖G 0‖ = rexp H / rexp 2 / q.totient := by
      simp [G, F, norm_exp, Real.exp_sub, field]
    have h_large : (1 + K + 1) * U < rexp H / rexp 2 / q.totient := by
      rw [lt_div_iff₀ (mod_cast Nat.totient_pos.2 (NeZero.pos q)), lt_div_iff₀ (exp_pos 2)]
      exact lt_of_le_of_lt (by grw [Nat.totient_le, hq_cast]) h_exp
    linarith
  intro z hz
  rw [norm_div, norm_exp, div_le_iff₀' (by bound)]
  refine norm_sub_mul_sum_term_le_of_width (residueClass_nonneg _) h_series hF hB (hB_le.trans hlX)
    (hl.trans hlX) hXU hW (fun n hn ↦ ?_) hz
  by_cases h_prime : n.Prime
  · have h_class : (n : ZMod q) ≠ 1 := fun h ↦
      h_none ⟨n, h_prime, (ZMod.natCast_eq_natCast_iff n 1 q).1
        (by simpa only [Nat.cast_one] using h), hn⟩
    simp [residueClass, h_class]
  · simpa [b, h_prime, abs_of_nonneg, residueClass_nonneg] using residueClass_le (1 : ZMod q) n

private lemma contour_bound_of_exp_le {l U : ℝ} (hl : 8 ≤ l) (hU : U ≤ rexp l) :
    3 * U * rexp l * rexp 2 < rexp (3 * l) := calc
  _ ≤ 3 * rexp l * rexp l * rexp 2 := by grw [hU]
  _ = rexp (Real.log 3 + l + l + 2) := by
    simp only [Real.exp_add, exp_log (by norm_num : (0 : ℝ) < 3)]
  _ < _ := exp_lt_exp.2 (by linarith only [hl, log_le_self (by norm_num : (0 : ℝ) ≤ 3)])

/-- For powers of a fixed multiple of `4`, the contour produces a prime in a logarithmic window
of width `C * l ^ 2 ≤ W ≤ U` when both the modulus and the left endpoint `U` are at most `exp l`. -/
theorem New.exists_eventually_prime_modEq_one_log_mem_of_quadratic_width
    (M : ℕ) [NeZero M] (hM : 4 ∣ M) :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ l : ℝ in atTop, ∀ (W U : ℝ) (k : ℕ), 1 < k → C * l ^ 2 ≤ W →
      (M : ℝ) ^ k ≤ rexp l → W ≤ U → U ≤ rexp l →
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + W) := by
  obtain ⟨a, ha, -, B, hB, h_disk⟩ := exists_eventually_norm_logDeriv_entireL_le_log_disk hM
  let C := max (200 : ℝ) (1 / a)
  have hC : 200 ≤ C := le_max_left _ _
  have hC_pos : 0 < C := by linarith only [hC]
  refine ⟨12 * C, by positivity, ?_⟩
  filter_upwards [eventually_exists_prime_modEq_one_log_mem_of_contour M, h_disk,
    eventually_ge_atTop (1 : ℝ), eventually_const_mul_pow_le_exp (2 * ((B + 2) * rexp 2)) 1]
    with l h h_free hl h_poly W U k hk hW hq hWU hU
  let X := C * l
  have hl_pos : 0 < l := one_pos.trans_le hl
  have hX : 0 < X := mul_pos hC_pos hl_pos
  have hlX : l ≤ X := le_mul_of_one_le_left hl_pos.le (by linarith only [hC])
  have h_rad : X⁻¹ ≤ a / l := by
    have h_l_div : l / a ≤ X := calc
      _ = (1 / a) * l := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_right (le_max_right _ _) hl_pos.le
    simpa only [inv_div] using inv_anti₀ (by positivity : 0 < l / a) h_l_div
  have h_disc (z : ℂ) (hz : ‖z‖ ≤ X⁻¹) (χ : DirichletCharacter ℂ (M ^ k)) :
      entireL χ (1 + z) ≠ 0 ∧ ‖z * logDeriv (entireL χ) (1 + z)‖ ≤ B * l := by
    obtain ⟨hne, hlog⟩ := h_free k hk χ (1 + z) hq (by simpa using hz.trans h_rad)
    refine ⟨hne, ?_⟩
    calc
      _ ≤ l⁻¹ * (B * l ^ 2) := by
        rw [norm_mul]
        exact mul_le_mul (hz.trans (inv_anti₀ hl_pos hlX)) hlog (norm_nonneg _) (by positivity)
      _ = _ := by field
  have h_width : 12 * l * X ≤ W := calc
    _ = (12 * C) * l ^ 2 := by dsimp only [X]; ring
    _ ≤ W := hW
  have hXW : X ≤ W := (le_mul_of_one_le_left hX.le (by linarith only [hl])).trans h_width
  have h_exp : 3 * l ≤ W / (4 * X) := (le_div_iff₀ (by positivity)).2 <| by
    rw [show (3 * l) * (4 * X) = 12 * l * X by ring]
    exact h_width
  have h_dominates : (1 + B * l + 1) * rexp 2 < rexp l := by
    have h_poly' : 2 * (((B + 2) * l) * rexp 2) ≤ rexp l := calc
      _ = (2 * ((B + 2) * rexp 2)) * l ^ 1 := by ring
      _ ≤ _ := h_poly
    calc
      _ ≤ ((B + 2) * l) * rexp 2 :=
        mul_le_mul_of_nonneg_right (by linarith only [hl]) (exp_pos _).le
      _ < _ := by linarith only [h_poly', exp_pos l]
  refine h X U W (B * l) k hlX hq (hXW.trans hWU) ⟨hX.le.trans hXW, hWU⟩ h_disc ?_
  calc
    _ ≤ (1 + B * l + 1) * rexp l * rexp l * rexp 2 := by gcongr
    _ = ((1 + B * l + 1) * rexp 2) * (rexp l * rexp l) := by ring
    _ < rexp l * (rexp l * rexp l) := mul_lt_mul_of_pos_right h_dominates (by positivity)
    _ = rexp (3 * l) := by rw [← Real.exp_add, ← Real.exp_add]; congr 1; ring
    _ ≤ rexp (W / (4 * X)) := exp_le_exp.2 h_exp

/-- The prescribed-width estimate with a degree-ten lower bound. -/
theorem New.exists_eventually_prime_modEq_one_log_mem_of_width
    (M : ℕ) [NeZero M] (hM : 4 ∣ M) :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ l : ℝ in atTop, ∀ (W U : ℝ) (k : ℕ), 1 < k → C * l ^ 10 ≤ W →
      (M : ℝ) ^ k ≤ rexp l → W ≤ U → U ≤ rexp l →
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + W) := by
  obtain ⟨C, hC, h_window⟩ := exists_eventually_prime_modEq_one_log_mem_of_quadratic_width M hM
  refine ⟨C, hC, ?_⟩
  filter_upwards [h_window, eventually_ge_atTop (1 : ℝ)] with l h hl W U k hk hW hq hWU hU
  have h_pow : l ^ 2 ≤ l ^ 10 := pow_le_pow_right₀ hl (by decide)
  exact h W U k hk ((mul_le_mul_of_nonneg_left h_pow hC.le).trans hW) hq hWU hU

private theorem exists_eventually_prime_modEq_one_log_mem_of_square_contour
    (M : ℕ) [NeZero M] (hM : 4 ∣ M) :
    ∃ C : ℝ, 16 ≤ C ∧ ∀ᶠ l : ℝ in atTop, ∀ (X U : ℝ) (k : ℕ), 1 < k → C * l ^ 9 ≤ X →
      (M : ℝ) ^ k ≤ rexp l → X ^ 2 ≤ U → 3 * U * rexp l * rexp 2 < rexp (4⁻¹ * X) →
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + X ^ 2) := by
  obtain ⟨C, hC, h_disc⟩ := New.exists_eventually_norm_logDeriv_entireL_le_near_one hM
  refine ⟨C, hC, ?_⟩
  filter_upwards [eventually_exists_prime_modEq_one_log_mem_of_contour M, h_disc, eventually_ge_atTop (1 : ℝ)]
    with l h h_free hl X U k hk hX hq hU h_exp
  have hlX : l ≤ X := calc
    _ ≤ l ^ 9 := le_self_pow₀ hl (by decide)
    _ ≤ C * l ^ 9 := le_mul_of_one_le_left (by positivity) (by linarith only [hC])
    _ ≤ X := hX
  have h_one : 1 ≤ X := hl.trans hlX
  have hXU : X ≤ U := (le_self_pow₀ h_one (by decide : (2 : ℕ) ≠ 0)).trans hU
  refine h X U (X ^ 2) 1 k hlX hq hXU ⟨sq_nonneg X, hU⟩ ?_ ?_
  · intro z hz χ
    obtain ⟨hne, hlog⟩ := h_free k hk χ (1 + z) X hq hX (by simpa)
    exact ⟨hne, by grw [norm_mul, hz, hlog, inv_mul_cancel₀ (one_pos.trans_le h_one).ne']⟩
  · simpa only [sq_div_four_mul (one_pos.trans_le h_one), show (1 : ℝ) + 1 + 1 = 3 by norm_num]
      using h_exp

/-- If both the modulus and the left endpoint are at most `exp l`, the contour bound follows
from `C * l ^ 9 ≤ X` and the logarithmic window has length `X ^ 2`. -/
theorem New.exists_eventually_prime_modEq_one_log_mem_of_shared_exp_bound
    (M : ℕ) [NeZero M] (hM : 4 ∣ M) :
    ∃ C : ℝ, 16 ≤ C ∧ ∀ᶠ l : ℝ in atTop, ∀ (X U : ℝ) (k : ℕ), 1 < k → C * l ^ 9 ≤ X →
      (M : ℝ) ^ k ≤ rexp l → X ^ 2 ≤ U → U ≤ rexp l →
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + X ^ 2) := by
  obtain ⟨C, hC, h_window⟩ := exists_eventually_prime_modEq_one_log_mem_of_square_contour M hM
  refine ⟨C, hC, ?_⟩
  filter_upwards [h_window, eventually_ge_atTop 8] with l h hl X U k hk hX hq hU hU_exp
  have h_lX : 16 * l ≤ X := calc
    _ ≤ 16 * l ^ 9 := mul_le_mul_of_nonneg_left
      (le_self_pow₀ (by linarith only [hl]) (by decide)) (by norm_num)
    _ ≤ C * l ^ 9 := mul_le_mul_of_nonneg_right hC (by positivity)
    _ ≤ X := hX
  exact h X U k hk hX hq hU
    ((contour_bound_of_exp_le hl hU_exp).trans_le (exp_le_exp.2 (by linarith only [hl, h_lX])))

/-- Use explicit bounds on the modulus and the left endpoint in the prime window argument. -/
theorem New.eventually_exists_prime_modEq_one_log_mem_of_exp (M : ℕ) [NeZero M] (hM : 4 ∣ M) :
    ∀ᶠ l : ℝ in atTop, ∀ (X U : ℝ) (k : ℕ), 1 < k → 2 * l ^ 25 ≤ X →
      (M : ℝ) ^ k ≤ rexp l → X ^ 2 ≤ U → 3 * U * rexp l * rexp 2 < rexp (4⁻¹ * X) →
        ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + X ^ 2) := by
  obtain ⟨C, -, h_window⟩ := exists_eventually_prime_modEq_one_log_mem_of_square_contour M hM
  filter_upwards [h_window, eventually_mul_pow_nine_le_two_mul_pow C] with l h h_le X U k hk hX
  exact h X U k hk (h_le.trans hX)

/-- Let `4 ∣ M` and let `A` be fixed. For all large `W` there is a prime `p ≡ 1` mod `M ^ k` with
`U ≤ log p ≤ U + W`, whenever `1 < k`, `M ^ k ≤ W ^ A` and `W ≤ U ≤ W ^ A`. This is a consequence
of the Siegel–Walfisz theorem, proved here directly by Newman's contour method. -/
theorem New.exists_prime_modEq_one_log_mem (M A : ℕ) [NeZero M] (hM : 4 ∣ M) :
    ∀ᶠ W : ℝ in atTop, ∀ k : ℕ, 1 < k → (M : ℝ) ^ k ≤ W ^ A → ∀ U : ℝ, U ∈ Set.Icc W (W ^ A) →
      ∃ p : ℕ, p.Prime ∧ p ≡ 1 [MOD M ^ k] ∧ Real.log p ∈ Set.Icc U (U + W) := by
  obtain ⟨C, -, h_window⟩ := exists_eventually_prime_modEq_one_log_mem_of_quadratic_width M hM
  have h_log : Tendsto (fun W : ℝ ↦ (A + 1 : ℕ) * W.log) atTop atTop :=
    tendsto_log_atTop.const_mul_atTop (by positivity)
  filter_upwards [h_log.eventually h_window, eventually_const_mul_log_pow_le C (A + 1 : ℕ) 2,
    eventually_ge_atTop (1 : ℝ)] with W h h_small hW k hk hq U hU
  have h_exp : W ^ A ≤ rexp ((A + 1 : ℕ) * W.log) := by
    rw [Real.exp_natCast_mul, Real.exp_log (one_pos.trans_le hW)]
    exact pow_le_pow_right₀ hW A.le_succ
  exact h W U k hk h_small (hq.trans h_exp) hU.1 (hU.2.trans h_exp)

end AuxiliaryPrimes
