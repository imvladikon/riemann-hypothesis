module

public import New.Reduction.Data.Subexponential
public import New.Reduction.MainInequality
public import New.Reduction.Zeros.Criterion
public import New.Reduction.Zeros.PrimeNumberTheorem
public import Statements

/-!
# The one-sided bound, and the theorem in half-plane form

For admissible data at an integer `x`, the main inequality and the prime number theorem at a much
larger cut-off `x₁` give the bound `R_{q₀}(x) ≤ (800 φ(q₀) + 30) x ^ (-1/2 + ε)` for large `x`.
The one-sided criterion gives non-vanishing of Dirichlet `L`-functions in `re s > 1/2`.

Notions from other files:
* `Parameters`: a multiple `q₀ = P.q₀` of `18480` and a prime `d = P.d ≡ q₀ / 2 - 1` modulo `q₀`.
* `primeRemainder d q x`: the remainder `R_q(x) = ∑_{n ≤ x} λ(n) (1/n - 1/x) - log x / φ(q) - c_q`.
  Here `λ(n) = Λ(n) (1 - chiK d n)` for `n ≡ 1` modulo `q` and `0` otherwise, with `chiK d` the
  Legendre symbol modulo `d`; for odd `d` prime to `q`, `c_q` is the constant with `R_q(x) → 0`.
* `Data P`: admissible data, among them the scales `x`, `x₁`, `b`, `a = x b`, the number of lifts
  `m` and two finite sets of places of a number field, `Φ_a = D.aPlaces` and `Φ_b = D.bPlaces`.
-/

@[expose] public section

open DirichletCharacter Filter Finset Real ZMod

namespace New

private lemma Data.primeRemainder_le_of_main_bound {P : Parameters} (D : Data P) {loss u : ℝ}
    (h_loss : 0 ≤ loss) (hu : 0 < u) (h_density : towerDeg D.towerExp ≤ #D.bPlaces * u)
    (h_bound : D.m * D.totalRemainder ≤ loss * (D.f * D.a)) :
    primeRemainder P.d P.q₀ D.x ≤ P.q₀.totient * (u * loss) / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + u * |primeRemainder P.d 1 D.x₁| := by
  -- Write `R_{q₀}(x)` through the total remainder, divide the main inequality by `m a #Φ_b`, and
  -- use `f = φ(q₀) #Φ_a` and `#Φ_a ≤ #Φ_b u`, where `Φ_a = D.aPlaces` and `Φ_b = D.bPlaces`.
  have hm : (0 : ℝ) < D.m := Data.HasLogBound.pos D
  have ha : (0 : ℝ) < D.a := Data.HasLogBound.pos D
  have h_aPlaces_pos : (0 : ℝ) < #D.aPlaces := by
    rw [D.card_aPlaces]
    exact Data.HasLogBound.pos D
  have h_card : (#D.aPlaces : ℝ) ≤ #D.bPlaces * u := by rwa [D.card_aPlaces]
  have h_bPlaces_pos : (0 : ℝ) < #D.bPlaces :=
    (mul_pos_iff_of_pos_right hu).1 (h_aPlaces_pos.trans_le h_card)
  have h_ratio : (#D.aPlaces : ℝ) / #D.bPlaces ≤ u := (div_le_iff₀' h_bPlaces_pos).2 h_card
  have h_main : D.totalRemainder ≤ loss * (D.f * D.a) / D.m :=
    (le_div_iff₀' hm).2 h_bound
  calc primeRemainder P.d P.q₀ D.x
      = D.totalRemainder / (D.a * #D.bPlaces) + primeRemainder P.d P.q₀ D.x₁ -
          #D.aPlaces / #D.bPlaces * primeRemainder P.d 1 D.x₁ := by
        rw [D.totalRemainder_eq]
        field
    _ ≤ loss * (D.f * D.a) / D.m / (D.a * #D.bPlaces) +
          |primeRemainder P.d P.q₀ D.x₁| + #D.aPlaces / #D.bPlaces * |primeRemainder P.d 1 D.x₁| := by
        grw [h_main, le_abs_self (primeRemainder P.d P.q₀ D.x₁), sub_eq_add_neg, ← mul_neg,
          neg_le_abs]
    _ = P.q₀.totient * (#D.aPlaces / #D.bPlaces * loss) / D.m +
          |primeRemainder P.d P.q₀ D.x₁| +
          #D.aPlaces / #D.bPlaces * |primeRemainder P.d 1 D.x₁| := by
        rw [D.f_eq_card_aPlaces_mul, Nat.cast_mul]
        field
    _ ≤ P.q₀.totient * (u * loss) / D.m + |primeRemainder P.d P.q₀ D.x₁| +
          u * |primeRemainder P.d 1 D.x₁| := by grw [h_ratio]

/-- The bound at the first cut-off using the fourth power in the main inequality. -/
lemma Data.primeRemainder_le {P : Parameters} (D : Data P) :
    primeRemainder P.d P.q₀ D.x ≤ 128 * P.q₀.totient * D.logB ^ 5 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  have h_bound : D.m * D.totalRemainder ≤ (128 * D.logB ^ 4) * (D.f * D.a) := by
    convert star_inequality D using 1
    ring
  convert D.primeRemainder_le_of_main_bound (by positivity) (Data.HasLogBound.pos D)
    D.towerDeg_le_card_bPlaces_mul h_bound using 1
  ring

/-- Every fixed power of the logarithm is eventually smaller than any fixed positive power of `x`. -/
private lemma eventually_mul_scaled_log_pow_le_rpow (C : ℝ) (n : ℕ) {s : ℝ} (hs : 0 < s) :
    ∀ᶠ x : ℕ in atTop, C * (64 * log (x : ℝ)) ^ n ≤ (x : ℝ) ^ s := by
  have h := ((isLittleO_log_rpow_rpow_atTop (n : ℝ) hs).const_mul_left
    (C * (64 : ℝ) ^ n)).eventuallyLE
  filter_upwards [tendsto_natCast_atTop_atTop.eventually h] with x hx
  simp only [rpow_natCast, Real.norm_eq_abs, abs_of_nonneg (rpow_nonneg (Nat.cast_nonneg x) s)]
    at hx
  simpa only [mul_pow, ← mul_assoc] using
    (le_abs_self ((C * (64 : ℝ) ^ n) * log (x : ℝ) ^ n)).trans hx

private lemma polylog_cutoff_bounds_of_log {x C : ℝ} (hx_log : 1 ≤ log x) (hC : 1 ≤ C)
    {n : ℕ} (hn : 4 ≤ n) :
    2e6 * log x ≤ 2 * (C * (64 * log x) ^ n) ∧
      C * (64 * log x) ^ n ≤ 2 * (C * (64 * log x) ^ n) - 1 := by
  have h_pow : log x ≤ log x ^ (4 : ℕ) := le_self_pow₀ hx_log (by decide)
  have h_base : 1 ≤ 64 * log x := by linarith
  have h_one : 1 ≤ C * (64 * log x) ^ n := one_le_mul_of_one_le_of_one_le hC (one_le_pow₀ h_base)
  refine ⟨?_, by linarith⟩
  calc 2e6 * log x ≤ (2 * (64 : ℝ) ^ (4 : ℕ)) * log x :=
        mul_le_mul_of_nonneg_right (by norm_num) (by linarith)
    _ ≤ (2 * (64 : ℝ) ^ (4 : ℕ)) * log x ^ (4 : ℕ) :=
      mul_le_mul_of_nonneg_left h_pow (by positivity)
    _ = 2 * (64 * log x) ^ (4 : ℕ) := by rw [mul_pow, mul_assoc]
    _ ≤ 2 * (64 * log x) ^ n := mul_le_mul_of_nonneg_left (pow_le_pow_right₀ h_base hn) (by norm_num)
    _ ≤ 2 * (C * (64 * log x) ^ n) :=
      mul_le_mul_of_nonneg_left (le_mul_of_one_le_left (pow_nonneg (zero_le_one.trans h_base) _) hC)
        (by norm_num)

/-- The cutoff `2 (64 log x) ^ 27` fits the prime windows and clears the remainder threshold
after taking the integer part of its exponential. -/
private lemma eventually_polylog_cutoff_bounds {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x : ℕ in atTop, 2e6 * log x ≤ 2 * (64 * log x) ^ (27 : ℕ) ∧
      2 * (64 * log x) ^ (27 : ℕ) ≤ (x : ℝ) ^ (ε / 6) ∧
      (64 * log x) ^ (27 : ℕ) ≤ 2 * (64 * log x) ^ (27 : ℕ) - 1 := by
  filter_upwards [eventually_mul_scaled_log_pow_le_rpow 2 27 (show 0 < ε / 6 by positivity),
    tendsto_natCast_atTop_atTop.eventually (tendsto_log_atTop.eventually_ge_atTop 1)]
    with x hx hx_log
  obtain ⟨h_lower, h_tail⟩ := polylog_cutoff_bounds_of_log hx_log
    (by norm_num : (1 : ℝ) ≤ 1) (by decide : (4 : ℕ) ≤ 27)
  simp only [one_mul] at h_lower h_tail
  exact ⟨h_lower, hx, h_tail⟩

private lemma eventually_abs_primeRemainder_exp_le_of_stretched_cutoff {d q : ℕ} [Fact d.Prime] [NeZero q]
    {a : ℝ} (ha : 0 < a) {n : ℕ} (hn : n ≠ 0)
    (hR : ∀ᶠ v : ℝ in atTop,
      |primeRemainder d q (exp v)| ≤ exp (-((a * v) ^ (1 / (n : ℝ)) / 32))) :
    ∀ᶠ x : ℝ in atTop, ∀ v : ℝ, (64 * Real.log x) ^ n / a ≤ v →
      |primeRemainder d q (exp v)| ≤ x ^ (-2 : ℝ) := by
  obtain ⟨t, ht⟩ := eventually_atTop.1 hR
  have h_log : Tendsto (fun x : ℝ ↦ 64 * Real.log x) atTop atTop :=
    Real.tendsto_log_atTop.const_mul_atTop (by norm_num)
  have h_cutoff : Tendsto (fun x : ℝ ↦ (64 * Real.log x) ^ n / a) atTop atTop :=
    Tendsto.atTop_div_const ha ((tendsto_pow_atTop hn).comp h_log)
  filter_upwards [h_cutoff.eventually_ge_atTop t, eventually_ge_atTop 1] with x hx hx_one v hv
  have hx_pos : 0 < x := one_pos.trans_le hx_one
  have h_log_nonneg : 0 ≤ 64 * Real.log x := mul_nonneg (by norm_num) (Real.log_nonneg hx_one)
  have h_nv : (64 * Real.log x) ^ n ≤ a * v := by
    simpa only [mul_comm v a] using (div_le_iff₀ ha).1 hv
  have h_root : 64 * Real.log x ≤ (a * v) ^ (1 / (n : ℝ)) := calc
    _ = ((64 * Real.log x) ^ n) ^ (1 / (n : ℝ)) := by
      rw [← Real.rpow_natCast_mul h_log_nonneg, one_div, mul_inv_cancel₀ (Nat.cast_ne_zero.mpr hn),
        Real.rpow_one]
    _ ≤ _ := Real.rpow_le_rpow (pow_nonneg h_log_nonneg _) h_nv (by positivity)
  calc |primeRemainder d q (exp v)| ≤ exp (-((a * v) ^ (1 / (n : ℝ)) / 32)) := ht v (hx.trans hv)
    _ ≤ exp (-(2 * Real.log x)) := Real.exp_le_exp.2 (by linarith)
    _ = x ^ (-2 : ℝ) := by rw [Real.rpow_def_of_pos hx_pos]; congr 1; ring

private lemma eventually_abs_primeRemainder_exp_le_of_polylog_cutoff_for_modulus {d q : ℕ} [Fact d.Prime] [NeZero q]
    (hd : d ≠ 2) (h_cop : q.Coprime d) :
    ∀ᶠ x : ℝ in atTop, ∀ v : ℝ, (64 * Real.log x) ^ (27 : ℕ) ≤ v →
      |primeRemainder d q (exp v)| ≤ x ^ (-2 : ℝ) := by
  simpa only [div_one] using eventually_abs_primeRemainder_exp_le_of_stretched_cutoff
    (a := 1) (n := 27) zero_lt_one (by decide)
    (by simpa only [one_mul, Nat.cast_ofNat] using eventually_abs_primeRemainder_exp_le_stretched hd h_cop)

private lemma eventually_abs_primeRemainder_exp_le_of_polylog_cutoff (P : Parameters) :
    ∀ᶠ x : ℕ in atTop, ∀ l : ℝ, (64 * log x) ^ (27 : ℕ) ≤ l →
      |primeRemainder P.d P.q₀ (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) := by
  have hd : P.d ≠ 2 := by linarith [P.sixty_four_lt_d]
  have h_cop : P.q₀.Coprime P.d := (P.coprime_q₁_d 0).coprime_mul_right
  filter_upwards [tendsto_natCast_atTop_atTop.eventually
    (eventually_abs_primeRemainder_exp_le_of_polylog_cutoff_for_modulus hd h_cop),
    tendsto_natCast_atTop_atTop.eventually
      (eventually_abs_primeRemainder_exp_le_of_polylog_cutoff_for_modulus hd P.d.coprime_one_left)]
    with x h_q₀ h_one l hl
  exact ⟨h_q₀ l hl, h_one l hl⟩

private lemma exists_eventually_abs_primeRemainder_exp_le_of_tenth_cutoff (P : Parameters) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ᶠ x : ℕ in atTop, ∀ l : ℝ, C * (64 * log x) ^ (10 : ℕ) ≤ l →
      |primeRemainder P.d P.q₀ (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) := by
  have hd : P.d ≠ 2 := by linarith [P.sixty_four_lt_d]
  have h_cop : P.q₀.Coprime P.d := (P.coprime_q₁_d 0).coprime_mul_right
  obtain ⟨a₀, ha₀, ha₀_one, h₀⟩ := exists_eventually_abs_primeRemainder_exp_le_tenth hd h_cop
  obtain ⟨a₁, ha₁, _, h₁⟩ := exists_eventually_abs_primeRemainder_exp_le_tenth hd P.d.coprime_one_left
  let C := max (1 / a₀) (1 / a₁)
  refine ⟨C, (one_le_one_div ha₀ ha₀_one).trans (le_max_left _ _), ?_⟩
  filter_upwards [tendsto_natCast_atTop_atTop.eventually
    (eventually_abs_primeRemainder_exp_le_of_stretched_cutoff (n := 10) ha₀ (by decide) h₀),
    tendsto_natCast_atTop_atTop.eventually
      (eventually_abs_primeRemainder_exp_le_of_stretched_cutoff (n := 10) ha₁ (by decide) h₁)]
    with x h_q₀ h_one l hl
  let T := (64 * log (x : ℝ)) ^ (10 : ℕ)
  have hT : 0 ≤ T := by dsimp only [T]; positivity
  have h_q₀_le : T / a₀ ≤ l := calc
    _ = (1 / a₀) * T := by ring
    _ ≤ C * T := mul_le_mul_of_nonneg_right (le_max_left _ _) hT
    _ ≤ l := hl
  have h_one_le : T / a₁ ≤ l := calc
    _ = (1 / a₁) * T := by ring
    _ ≤ C * T := mul_le_mul_of_nonneg_right (le_max_right _ _) hT
    _ ≤ l := hl
  exact ⟨h_q₀ l h_q₀_le, h_one l h_one_le⟩

/-- The same data give the scaled logarithms, the density bound and both remainders at `x₁`. -/
lemma eventually_exists_data_with_polylog_cutoff (P : Parameters) {ε γ : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop, ∃ D : Data P,
      D.x = x ∧ D.natX₁ = ⌊exp (2 * (64 * log x) ^ (27 : ℕ))⌋₊ ∧
      D.logB ≤ 2 * (x : ℝ) ^ ε ∧ (x : ℝ) ^ (1 / 2 : ℝ) ≤ D.m ∧
      D.logX₁ ≤ 2 * (64 * log x) ^ (27 : ℕ) ∧
      towerDeg D.towerExp ≤ #D.bPlaces * (x : ℝ) ^ γ ∧
      |primeRemainder P.d P.q₀ D.x₁| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 D.x₁| ≤ (x : ℝ) ^ (-2 : ℝ) := by
  filter_upwards [eventually_exists_data_with_cutoff P hε hε_lt hγ hγε,
    eventually_polylog_cutoff_bounds hε, eventually_abs_primeRemainder_exp_le_of_polylog_cutoff P,
    eventually_ge_atTop 1]
    with x h_data ⟨h_lower, h_upper, h_tail⟩ h_tails hx_one
  obtain ⟨D, hx, hx₁, _, _, _, h_logX₁, ⟨_, hb_le⟩, h_density⟩ :=
    h_data (2 * (64 * log x) ^ (27 : ℕ)) h_lower h_upper
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_eq : D.x = x := by rw [← hx, ← D.exp_logX]
  have h_m : (x : ℝ) ^ (1 / 2 : ℝ) ≤ D.m := by
    rw [← hx_eq, Data.x, ← exp_mul, mul_one_div]
    exact (Set.mem_Icc.1 D.m_mem).1
  obtain ⟨h_q₀, h_one⟩ := h_tails D.logX₁ (h_tail.trans h_logX₁.1)
  exact ⟨D, hx_eq, hx₁, by linarith [one_le_rpow hx_ge hε.le],
    h_m, h_logX₁.2, h_density, h_q₀, h_one⟩

/-- Let `0 < ε < 1/100`. A term `D : Data P` (admissible data) bundles all the choices that the main
inequality needs, among them integer scales `x`, `x₁`, `b` with `x ^ 10⁶ ≤ x₁` and `x₁ ^ 10⁶ ≤ b`
(`D.logX₁ = log x₁`, `D.logB = log b`) and a power of two `m = D.m` in `[√x, 2 √x]`. For every large
integer `x` such data exist with `D.x = x`, `log b ≤ 2 x ^ ε`, `√x ≤ m` and
`x ^ (ε / 12) ≤ log x₁`. -/
lemma eventually_exists_data_scales (P : Parameters) {ε : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop, ∃ D : Data P, D.x = x ∧ D.logB ≤ 2 * (x : ℝ) ^ ε ∧
      (x : ℝ) ^ (1 / 2 : ℝ) ≤ D.m ∧ (x : ℝ) ^ (ε / 12) ≤ D.logX₁ := by
  have h_two : ∀ᶠ x : ℕ in atTop, (2 : ℝ) ≤ (x : ℝ) ^ (ε / 12) :=
    ((tendsto_rpow_atTop (by positivity)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop 2
  filter_upwards [eventually_exists_data P hε hε_lt, h_two, eventually_ge_atTop 1]
    with x ⟨D, hx, _, _, _, _, hx₁_ge, ⟨_, hb_le⟩⟩ hx_two hx_one
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_eq : D.x = x := by rw [← hx, ← D.exp_logX]
  refine ⟨D, hx_eq, by linarith [one_le_rpow hx_ge hε.le], ?_, ?_⟩
  · rw [← hx_eq, Data.x, ← exp_mul, mul_one_div]
    exact (Set.mem_Icc.1 D.m_mem).1
  · have h_sq : (x : ℝ) ^ (ε / 6) = (x : ℝ) ^ (ε / 12) * (x : ℝ) ^ (ε / 12) := by
      rw [← rpow_add (by positivity)]
      ring_nf
    nlinarith

/-- The stretched exponential bound also applies when `log x₁ ≥ x ^ (ε / 12)`. -/
lemma eventually_abs_primeRemainder_exp_le (P : Parameters) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x : ℕ in atTop, ∀ l : ℝ, (x : ℝ) ^ (ε / 12) ≤ l →
      |primeRemainder P.d P.q₀ (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) := by
  filter_upwards [eventually_abs_primeRemainder_exp_le_of_polylog_cutoff P,
    eventually_mul_scaled_log_pow_le_rpow 1 27 (show 0 < ε / 12 by positivity)]
    with x h_tails hx l hl
  exact h_tails l ((by simpa only [one_mul] using hx : (64 * log x) ^ (27 : ℕ) ≤
    (x : ℝ) ^ (ε / 12)).trans hl)

private lemma Data.primeRemainder_le_of_scales {P : Parameters} (D : Data P) {x B u V : ℝ}
    (hx : D.x = x) (hx_one : 1 ≤ x) (hB : 1 ≤ B) (hu : 1 ≤ u) (hV : 1 ≤ V)
    (hb : D.logB ≤ 2 * B) (hm : x ^ (1 / 2 : ℝ) ≤ D.m) (h_cutoff : D.logX₁ ≤ V)
    (h_density : towerDeg D.towerExp ≤ #D.bPlaces * u)
    (h_q₀ : |primeRemainder P.d P.q₀ D.x₁| ≤ x ^ (-2 : ℝ))
    (h_one : |primeRemainder P.d 1 D.x₁| ≤ x ^ (-2 : ℝ)) :
    primeRemainder P.d P.q₀ x ≤
      (5600 * P.q₀.totient + 2) * (x ^ (-1 / 2 : ℝ) * u * B ^ 3 * V ^ 2) := by
  let Z := x ^ (-1 / 2 : ℝ)
  let K := Z * u * B ^ 3 * V ^ 2
  have hx_pos : 0 < x := one_pos.trans_le hx_one
  have hZ : 0 ≤ Z := rpow_nonneg hx_pos.le _
  have hZ_inv : Z = (x ^ (1 / 2 : ℝ))⁻¹ := by
    dsimp [Z]
    rw [show (-1 / 2 : ℝ) = -(1 / 2 : ℝ) by ring, rpow_neg hx_pos.le]
  have hZu : Z * u ≤ K := calc
    _ ≤ Z * u * B ^ 3 := le_mul_of_one_le_right (by positivity) (one_le_pow₀ hB)
    _ ≤ K := le_mul_of_one_le_right (by positivity) (one_le_pow₀ hV)
  have h_small : x ^ (-2 : ℝ) ≤ Z :=
    rpow_le_rpow_of_exponent_le hx_one (by norm_num)
  have h_tail : x ^ (-2 : ℝ) ≤ K :=
    h_small.trans ((le_mul_of_one_le_right hZ hu).trans hZu)
  have h_weighted : u * x ^ (-2 : ℝ) ≤ K := by
    rw [mul_comm u]
    exact (mul_le_mul_of_nonneg_right h_small (by positivity)).trans hZu
  have h_bound : D.m * D.totalRemainder ≤
      (700 * (D.logB ^ 3 * D.logX₁ ^ 2)) * (D.f * D.a) := by
    convert star_inequality_with_separate_log_losses D using 1
    dsimp [Data.errorUnit]
    ring
  have h_logB_pos : 0 < D.logB := Data.HasLogBound.pos D
  have h_logX₁_pos : 0 < D.logX₁ := Data.HasLogBound.pos D
  calc primeRemainder P.d P.q₀ x = primeRemainder P.d P.q₀ D.x := by rw [hx]
    _ ≤ P.q₀.totient * (u * (700 * (D.logB ^ 3 * D.logX₁ ^ 2))) / D.m +
          |primeRemainder P.d P.q₀ D.x₁| + u * |primeRemainder P.d 1 D.x₁| :=
      D.primeRemainder_le_of_main_bound (by positivity) (one_pos.trans_le hu) h_density h_bound
    _ ≤ P.q₀.totient * (u * (700 * ((2 * B) ^ 3 * V ^ 2))) / x ^ (1 / 2 : ℝ) +
          x ^ (-2 : ℝ) + u * x ^ (-2 : ℝ) := by
      grw [h_q₀, h_one, hb, h_cutoff, ← hm]
    _ = 5600 * P.q₀.totient * K + x ^ (-2 : ℝ) + u * x ^ (-2 : ℝ) := by
      dsimp [K]
      rw [hZ_inv]
      ring
    _ ≤ 5600 * P.q₀.totient * K + K + K := add_le_add (add_le_add le_rfl h_tail) h_weighted
    _ = (5600 * P.q₀.totient + 2) * K := by ring

/-- The auxiliary cutoff contributes a power of `log x` of degree `54` to the integer bound. -/
lemma eventually_primeRemainder_natCast_le_with_polylog_cutoff
    (P : Parameters) {ε γ : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100)
    (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (5600 * P.q₀.totient + 2) *
        (x : ℝ) ^ (-1 / 2 + 3 * ε + γ) * (2 * (64 * log x) ^ (27 : ℕ)) ^ 2 := by
  filter_upwards [eventually_exists_data_with_polylog_cutoff P hε hε_lt hγ hγε,
    tendsto_natCast_atTop_atTop.eventually (tendsto_log_atTop.eventually_ge_atTop 1), eventually_ge_atTop 1]
    with x ⟨D, hx, _, hb, hm, h_cutoff, h_density, h_q₀, h_one⟩ hx_log hx_one
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_pos : (0 : ℝ) < x := one_pos.trans_le hx_ge
  have hV : 1 ≤ 2 * (64 * log (x : ℝ)) ^ (27 : ℕ) := by
    linarith [one_le_pow₀ (n := 27) (by linarith : 1 ≤ 64 * log (x : ℝ))]
  have h_power : (x : ℝ) ^ (-1 / 2 : ℝ) * (x : ℝ) ^ γ * ((x : ℝ) ^ ε) ^ 3 =
      (x : ℝ) ^ (-1 / 2 + 3 * ε + γ) := by
    rw [← rpow_mul_natCast hx_pos.le, ← rpow_add hx_pos, ← rpow_add hx_pos]
    congr 1
    push_cast
    ring
  exact (D.primeRemainder_le_of_scales hx hx_ge (one_le_rpow hx_ge hε.le)
    (one_le_rpow hx_ge hγ.le) hV hb hm h_cutoff h_density h_q₀ h_one).trans_eq (by rw [h_power]; ring)

private lemma eventually_primeRemainder_natCast_le_with_subexponential_cutoff
    (P : Parameters) (T : ℕ → ℝ)
    (h_cutoff : ∀ᶠ x : ℕ in atTop, 2e6 * log x ≤ 2 * T x ∧ T x ≤ 2 * T x - 1 ∧
      2 * T x ≤ P.subexponentialWindowWidth (log x))
    (h_tails : ∀ᶠ x : ℕ in atTop, ∀ l : ℝ, T x ≤ l →
      |primeRemainder P.d P.q₀ (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ)) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (5600 * P.q₀.totient + 2) *
        (x : ℝ) ^ (-1 / 2 : ℝ) * (P.subexponentialWindowWidth (log x)) ^ 24 * (2 * T x) ^ 2 := by
  filter_upwards [eventually_exists_data_with_subexponential_windows P, h_cutoff,
    h_tails, eventually_ge_atTop 1] with x ⟨hW, h_data⟩ ⟨hV_min, hV_tail, hVW⟩ h_tails hx_one
  let V := 2 * T x
  let W := P.subexponentialWindowWidth (log x)
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hV : 1 ≤ V := by dsimp only [V]; linarith only [hV_tail]
  obtain ⟨D, hx, _, hm, h_cutoff, hb, h_density⟩ := h_data V hV_min hVW
  obtain ⟨h_q₀, h_one⟩ := h_tails D.logX₁ (hV_tail.trans h_cutoff.1)
  rw [sqrt_eq_rpow] at hm
  have hW_six : 1 ≤ W ^ 6 := one_le_pow₀ hW
  exact (D.primeRemainder_le_of_scales hx hx_ge hW_six hW_six
    hV hb hm h_cutoff.2 h_density h_q₀ h_one).trans_eq (by
      change (5600 * P.q₀.totient + 2) * ((x : ℝ) ^ (-1 / 2 : ℝ) * W ^ 6 * (W ^ 6) ^ 3 * V ^ 2) =
        (5600 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 : ℝ) * W ^ 24 * V ^ 2
      ring)

/-- The subexponential window bound with the degree-`27` auxiliary cutoff. -/
theorem eventually_primeRemainder_natCast_le_with_subexponential_windows (P : Parameters) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (5600 * P.q₀.totient + 2) *
        (x : ℝ) ^ (-1 / 2 : ℝ) * (P.subexponentialWindowWidth (log x)) ^ 24 *
        (2 * (64 * log x) ^ (27 : ℕ)) ^ 2 := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  refine eventually_primeRemainder_natCast_le_with_subexponential_cutoff P
    (fun x ↦ (64 * log (x : ℝ)) ^ (27 : ℕ)) ?_ (eventually_abs_primeRemainder_exp_le_of_polylog_cutoff P)
  filter_upwards [h_log.eventually P.eventually_polylog_cutoff_le_window, h_log.eventually_ge_atTop 1]
    with x hVW hx_log
  obtain ⟨h_lower, h_tail⟩ := polylog_cutoff_bounds_of_log hx_log
    (by norm_num : (1 : ℝ) ≤ 1) (by decide : (4 : ℕ) ≤ 27)
  simp only [one_mul] at h_lower h_tail
  exact ⟨h_lower, h_tail, hVW⟩

/-- The cutoff supplied by the fixed-modulus zero-free region contributes a logarithmic factor
of degree `20` to the subexponential window bound. -/
theorem exists_eventually_primeRemainder_natCast_le_with_tenth_cutoff (P : Parameters) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ᶠ x : ℕ in atTop,
      2 * (C * (64 * log x) ^ (10 : ℕ)) ≤ P.subexponentialWindowWidth (log x) ∧
      primeRemainder P.d P.q₀ x ≤ (5600 * P.q₀.totient + 2) *
        (x : ℝ) ^ (-1 / 2 : ℝ) * (P.subexponentialWindowWidth (log x)) ^ 24 *
        (2 * (C * (64 * log x) ^ (10 : ℕ))) ^ 2 := by
  obtain ⟨C, hC, h_tails⟩ := exists_eventually_abs_primeRemainder_exp_le_of_tenth_cutoff P
  let T (x : ℕ) := C * (64 * log (x : ℝ)) ^ (10 : ℕ)
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  have h_fits : ∀ᶠ x : ℕ in atTop, 2 * T x ≤ P.subexponentialWindowWidth (log x) := by
    simpa only [T, mul_pow, ← mul_assoc] using
      h_log.eventually (P.eventually_mul_pow_le_subexponentialWindowWidth (2 * C * 64 ^ 10) 10)
  have h_cutoff : ∀ᶠ x : ℕ in atTop, 2e6 * log x ≤ 2 * T x ∧ T x ≤ 2 * T x - 1 ∧
      2 * T x ≤ P.subexponentialWindowWidth (log x) := by
    filter_upwards [h_log.eventually_ge_atTop 1, h_fits] with x hx h_fit
    obtain ⟨h_lower, h_tail⟩ := polylog_cutoff_bounds_of_log hx hC (by decide : (4 : ℕ) ≤ 10)
    exact ⟨h_lower, h_tail, h_fit⟩
  exact ⟨C, hC, h_fits.and (eventually_primeRemainder_natCast_le_with_subexponential_cutoff P T h_cutoff h_tails)⟩

private lemma eventually_primeRemainder_natCast_le_of_subexponential_windows
    (P : Parameters) {s : ℝ} (hs : 0 < s) :
    ∀ᶠ x : ℕ in atTop, primeRemainder P.d P.q₀ x ≤ (400 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 + s) := by
  have h_log : Tendsto (fun x : ℕ ↦ log (x : ℝ)) atTop atTop :=
    tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  have h_const : ∀ᶠ x : ℕ in atTop, (14 : ℝ) ≤ (x : ℝ) ^ (s / 2) :=
    ((tendsto_rpow_atTop (by positivity)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop 14
  obtain ⟨C, hC, h_tenth⟩ := exists_eventually_primeRemainder_natCast_le_with_tenth_cutoff P
  have hC_pos : 0 < C := zero_lt_one.trans_le hC
  filter_upwards [h_tenth,
    h_log.eventually (P.eventually_log_subexponentialWindowWidth_le (show 0 < s / 52 by positivity)),
    h_const, eventually_ge_atTop 1] with x ⟨hVW, h_bound⟩ h_logW hx_const hx_one
  let V := 2 * (C * (64 * log (x : ℝ)) ^ (10 : ℕ))
  let W := P.subexponentialWindowWidth (log x)
  change V ≤ W at hVW
  change log W ≤ s / 52 * log (x : ℝ) at h_logW
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_pos : (0 : ℝ) < x := one_pos.trans_le hx_ge
  have h_log_nonneg := log_nonneg hx_ge
  have hV : 0 ≤ V := by dsimp [V]; positivity
  have hW : 0 < W := exp_pos _
  have h_power : W ^ 26 ≤ (x : ℝ) ^ (s / 2) := calc
    _ = exp ((26 : ℕ) * log W) := by rw [exp_natCast_mul, exp_log hW]
    _ ≤ exp (s / 2 * log x) := exp_le_exp.2 (by linarith only [h_logW])
    _ = _ := by rw [rpow_def_of_pos hx_pos]; congr 1; ring
  have h_coeff : (5600 : ℝ) * P.q₀.totient + 2 ≤ (400 * P.q₀.totient + 2) * 14 := by linarith
  have h_scaled : 14 * W ^ 26 ≤ (x : ℝ) ^ s := calc
    _ ≤ (x : ℝ) ^ (s / 2) * (x : ℝ) ^ (s / 2) := by gcongr
    _ = _ := by rw [← rpow_add hx_pos, add_halves]
  calc primeRemainder P.d P.q₀ x
      ≤ (5600 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 : ℝ) * W ^ 24 * V ^ 2 := h_bound
    _ ≤ ((400 * P.q₀.totient + 2) * 14) * (x : ℝ) ^ (-1 / 2 : ℝ) * W ^ 24 * W ^ 2 := by
      gcongr
    _ = (400 * P.q₀.totient + 2) * ((x : ℝ) ^ (-1 / 2 : ℝ) * (14 * W ^ 26)) := by ring
    _ ≤ (400 * P.q₀.totient + 2) * ((x : ℝ) ^ (-1 / 2 : ℝ) * (x : ℝ) ^ s) := by gcongr
    _ = _ := by rw [← rpow_add hx_pos]

private lemma eventually_primeRemainder_natCast_le_of_polylog_slack
    (P : Parameters) {ε γ s C K : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100)
    (hγ : 0 < γ) (hγε : γ ≤ ε) (hC : 0 ≤ C)
    (h_coefficient : 5600 * P.q₀.totient + 2 ≤ C * K) (hs : 3 * ε + γ < s) :
    ∀ᶠ x : ℕ in atTop, primeRemainder P.d P.q₀ x ≤ C * (x : ℝ) ^ (-1 / 2 + s) := by
  let slack := s - (3 * ε + γ)
  filter_upwards [eventually_primeRemainder_natCast_le_with_polylog_cutoff P hε hε_lt hγ hγε,
    eventually_mul_scaled_log_pow_le_rpow (K * 4) 54 (sub_pos.mpr hs), eventually_ge_atTop 1]
    with x h_bound h_large hx_one
  have hx_pos : (0 : ℝ) < x := by exact_mod_cast (zero_lt_one.trans_le hx_one)
  let t : ℝ := -1 / 2 + 3 * ε + γ
  let V : ℝ := 2 * (64 * log (x : ℝ)) ^ (27 : ℕ)
  have hV : V ^ 2 = 4 * (64 * log (x : ℝ)) ^ (54 : ℕ) := by
    dsimp [V]
    rw [mul_pow, ← pow_mul]
    norm_num
  have h_absorb : K * V ^ 2 ≤ (x : ℝ) ^ slack := by
    simpa only [hV, ← mul_assoc] using h_large
  calc primeRemainder P.d P.q₀ x ≤ (5600 * P.q₀.totient + 2) * (x : ℝ) ^ t * V ^ 2 := h_bound
    _ ≤ (C * K) * (x : ℝ) ^ t * V ^ 2 := by gcongr
    _ = C * ((x : ℝ) ^ t * (K * V ^ 2)) := by ring
    _ ≤ C * ((x : ℝ) ^ t * (x : ℝ) ^ slack) := by gcongr
    _ = C * (x : ℝ) ^ (-1 / 2 + s) := by
      rw [← rpow_add hx_pos]
      congr 2
      dsimp [slack, t]
      ring

/-- The previous integer bound, obtained by absorbing the logarithm in `x ^ (2 * δ)`.
The upper restriction on `δ` is retained for compatibility. -/
lemma eventually_primeRemainder_natCast_le_with_cutoff
    (P : Parameters) {ε δ γ : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100)
    (hδ : 0 < δ) (hδε : δ ≤ ε / 6) (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤
        (5600 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 + 3 * ε + 2 * δ + γ) := by
  rw [show -1 / 2 + 3 * ε + 2 * δ + γ = -1 / 2 + (3 * ε + γ + 2 * δ) by ring]
  exact eventually_primeRemainder_natCast_le_of_polylog_slack P hε hε_lt hγ hγε
    (K := 1) (by positivity) (by simp) (by linarith)

/-- The choice `δ = ε / 6` gives the exponent `-1/2 + (10/3) ε + γ`. -/
lemma eventually_primeRemainder_natCast_le_with_separate_log_losses
    (P : Parameters) {ε γ : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤
        (5600 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 + (10 / 3) * ε + γ) := by
  rw [show -1 / 2 + (10 / 3) * ε + γ = -1 / 2 + 3 * ε + 2 * (ε / 6) + γ by ring]
  exact eventually_primeRemainder_natCast_le_with_cutoff P hε hε_lt (δ := ε / 6)
    (by positivity) le_rfl hγ hγε

/-- For the fourth-power exponent, absorb the logarithms and the coefficient in the extra power
of `x`. -/
lemma eventually_primeRemainder_natCast_le_with_density (P : Parameters) {ε γ : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (400 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 + 4 * ε + γ) := by
  rw [show -1 / 2 + 4 * ε + γ = -1 / 2 + (4 * ε + γ) by ring]
  exact eventually_primeRemainder_natCast_le_of_polylog_slack P hε hε_lt hγ hγε
    (K := 14) (by positivity) (by linarith) (by linarith)

/-- The bound at integers with the greedy choice stopped at the basis completion cost. -/
lemma eventually_primeRemainder_natCast_le_with_completion_cost
    (P : Parameters) {ε : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (800 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 5 * ε) := by
  have h := eventually_primeRemainder_natCast_le_with_density P hε hε_lt hε le_rfl
  rw [show -1 / 2 + 4 * ε + ε = -1 / 2 + 5 * ε by ring] at h
  have h_coefficient : (400 : ℝ) * P.q₀.totient + 2 ≤ 800 * P.q₀.totient + 3 := by
    linarith [show 0 ≤ (P.q₀.totient : ℝ) from Nat.cast_nonneg _]
  exact h.mono fun x hx ↦ hx.trans (mul_le_mul_of_nonneg_right h_coefficient (by positivity))

/-- The one-sided bound with the fourth power in the main inequality. For all large integers
`x`, the prime remainder is at most `(4096 φ(q₀) + 3) x ^ (-1/2 + 5 ε)`. -/
lemma eventually_primeRemainder_natCast_le (P : Parameters) {ε : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (4096 * P.q₀.totient + 3) * (x : ℝ) ^ (-1 / 2 + 5 * ε) := by
  have h_coefficient : (800 : ℝ) * P.q₀.totient + 3 ≤ 4096 * P.q₀.totient + 3 := by
    linarith [show 0 ≤ (P.q₀.totient : ℝ) from Nat.cast_nonneg _]
  exact (eventually_primeRemainder_natCast_le_with_completion_cost P hε hε_lt).mono fun x hx ↦
    hx.trans (mul_le_mul_of_nonneg_right h_coefficient (by positivity))

/-- Let `d` be a prime, `q > 0`, and `R_q(y) = primeRemainder d q y = ∑_{n ≤ y} λ(n) (1/n - 1/y) -
log y / φ(q) - c_q`. Then `R_q(y) - R_q(⌊y⌋) ≤ 26 / y` for `y ≥ 2`. -/
lemma primeRemainder_sub_primeRemainder_floor_le {d : ℕ} [Fact d.Prime] {q : ℕ} [NeZero q] {y : ℝ}
    (hy : 2 ≤ y) : primeRemainder d q y - primeRemainder d q ⌊y⌋₊ ≤ 26 / y := by
  have h_le : (⌊y⌋₊ : ℝ) ≤ y := Nat.floor_le (zero_le_two.trans hy)
  have h_lt : y < ⌊y⌋₊ + 1 := Nat.lt_floor_add_one y
  have h_one : (1 : ℝ) ≤ ⌊y⌋₊ := by linarith
  calc primeRemainder d q y - primeRemainder d q ⌊y⌋₊ ≤ 13 * ((y - ⌊y⌋₊) / ⌊y⌋₊) :=
        (le_abs_self _).trans (abs_primeRemainder_sub_le h_one h_le)
    _ ≤ 13 * (1 / (y / 2)) := by gcongr <;> linarith
    _ = 26 / y := by field

/-- For `y ≥ 2` and `-1 ≤ t ≤ 0` we have `⌊y⌋ ^ t ≤ 2 y ^ t`, since `y / 2 ≤ ⌊y⌋`. -/
lemma natFloor_rpow_le_two_mul_rpow {y t : ℝ} (hy : 2 ≤ y) (ht_ge : -1 ≤ t) (ht_le : t ≤ 0) :
    (⌊y⌋₊ : ℝ) ^ t ≤ 2 * y ^ t := by
  have hy_pos : 0 < y := two_pos.trans_le hy
  have h_half : y / 2 ≤ ⌊y⌋₊ := by linarith [Nat.lt_floor_add_one y]
  calc (⌊y⌋₊ : ℝ) ^ t ≤ (y / 2) ^ t := rpow_le_rpow_of_nonpos (half_pos hy_pos) h_half ht_le
    _ = y ^ t / 2 ^ t := div_rpow hy_pos.le zero_le_two t
    _ ≤ y ^ t / 2 ^ (-1 : ℝ) := by
        gcongr
        exact one_le_two
    _ = 2 * y ^ t := by
        rw [rpow_neg_one]
        field

/-- If `q₀ > 0` is even and `d ≡ q₀ / 2 - 1` modulo `q₀`, then `q₀` divides `2 (d + 1)` but not
`d + 1`. This is the form of the congruence in `Parameters`. -/
lemma dvd_two_mul_succ_and_not_dvd_succ {q₀ d : ℕ} (hq₀_pos : 0 < q₀) (hq₀_even : 2 ∣ q₀)
    (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) : q₀ ∣ 2 * (d + 1) ∧ ¬q₀ ∣ d + 1 := by
  obtain ⟨q, rfl⟩ := hq₀_even
  have h_half : 2 * q / 2 - 1 + 1 = q := by omega
  have hd_succ : ((d + 1 : ℕ) : ZMod (2 * q)) = q := by
    rw [natCast_eq_natCast_iff]
    simpa only [h_half] using hd.add_right 1
  constructor
  · rw [← natCast_eq_zero_iff, Nat.cast_mul, hd_succ, ← Nat.cast_mul, natCast_self]
  · rw [← natCast_eq_zero_iff, hd_succ, natCast_eq_zero_iff]
    exact Nat.not_dvd_of_pos_of_lt (by omega) (by omega)

/-- **One-sided bound.** Let `q₀ > 0` be a multiple of `18480`, let `d ≡ q₀ / 2 - 1` modulo `q₀` be
a prime, and let `ε > 0`. Then `R = primeRemainder d q₀` satisfies
`R(y) ≤ (800 φ(q₀) + 30) y ^ (-1/2 + ε)` for all large real `y`. -/
theorem eventually_primeRemainder_le_mul_rpow_with_density
    {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [hd_prime : Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ y ≤ (800 * q₀.totient + 30) * y ^ (-1 / 2 + ε) := by
  let P : Parameters :=
    { q₀ := q₀
      d := d
      dvd_q₀ := hq₀
      d_prime := hd_prime.out
      q₀_dvd_and_not_dvd := dvd_two_mul_succ_and_not_dvd_succ (NeZero.pos q₀) (by omega) hd }
  let s : ℝ := min ε (1 / 4)
  have hs : 0 < s := lt_min hε (by norm_num)
  have hs_le : s ≤ 1 / 4 := min_le_right _ _
  have hsε : s ≤ ε := min_le_left _ _
  set C : ℝ := 400 * q₀.totient + 2
  set t : ℝ := -1 / 2 + s with ht
  have ht_ge : -1 ≤ t := by linarith
  have ht_le : t ≤ 0 := by linarith
  have h_floor : ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ ⌊y⌋₊ ≤ C * (⌊y⌋₊ : ℝ) ^ t :=
    tendsto_nat_floor_atTop.eventually (eventually_primeRemainder_natCast_le_of_subexponential_windows P hs)
  filter_upwards [h_floor, eventually_ge_atTop 2] with y hy_floor hy
  have hy_one : 1 ≤ y := one_le_two.trans hy
  calc primeRemainder d q₀ y
      ≤ primeRemainder d q₀ ⌊y⌋₊ + 26 / y :=
        sub_le_iff_le_add'.1 (primeRemainder_sub_primeRemainder_floor_le hy)
    _ ≤ C * (⌊y⌋₊ : ℝ) ^ t + 26 * y ^ (-1 : ℝ) := by grw [hy_floor, rpow_neg_one, div_eq_mul_inv]
    _ ≤ C * (2 * y ^ t) + 26 * y ^ t := by
        gcongr
        exact natFloor_rpow_le_two_mul_rpow hy ht_ge ht_le
    _ = (800 * q₀.totient + 30) * y ^ t := by dsimp [C]; ring
    _ ≤ (800 * q₀.totient + 30) * y ^ (-1 / 2 + ε) :=
      mul_le_mul_of_nonneg_left (rpow_le_rpow_of_exponent_le hy_one (by linarith [ht])) (by positivity)

/-- The one-sided bound using the coefficient from the completion-cost estimate. -/
theorem eventually_primeRemainder_le_mul_rpow_with_completion_cost
    {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ y ≤ (1600 * q₀.totient + 32) * y ^ (-1 / 2 + ε) := by
  filter_upwards [eventually_primeRemainder_le_mul_rpow_with_density hq₀ hd hε,
    eventually_ge_atTop (0 : ℝ)] with y hy hy_nonneg
  have h_coefficient : (800 : ℝ) * q₀.totient + 30 ≤ 1600 * q₀.totient + 32 := by
    linarith [show 0 ≤ (q₀.totient : ℝ) from Nat.cast_nonneg _]
  exact hy.trans (mul_le_mul_of_nonneg_right h_coefficient (rpow_nonneg hy_nonneg _))

/-- The one-sided bound with the earlier coefficient. -/
theorem eventually_primeRemainder_le_mul_rpow {q₀ : ℕ} [NeZero q₀] (hq₀ : 18480 ∣ q₀) {d : ℕ}
    [Fact d.Prime] (hd : d ≡ q₀ / 2 - 1 [MOD q₀]) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ y ≤ (8192 * q₀.totient + 32) * y ^ (-1 / 2 + ε) := by
  filter_upwards [eventually_primeRemainder_le_mul_rpow_with_completion_cost hq₀ hd hε,
    eventually_ge_atTop (0 : ℝ)] with y hy hy_nonneg
  have h_coefficient : (1600 : ℝ) * q₀.totient + 32 ≤ 8192 * q₀.totient + 32 := by
    gcongr
    norm_num
  exact hy.trans (mul_le_mul_of_nonneg_right h_coefficient (rpow_nonneg hy_nonneg _))

/-- **Main theorem**, in half-plane form: no Dirichlet `L`-function vanishes in `re s > 1/2`
(with `s ≠ 1` for a principal character). -/
theorem grh : DirichletLNonvanishingRightOfHalf := by
  -- Apply the one-sided criterion to the character modulo `q₀ = 18480 q` induced by `χ`, with
  -- `d₀ = q₀ / 2 - 1 = 9240 q - 1` and an exponent `β` between `1 / 2` and `re ρ`.
  intro q _ χ ρ hρ h_pole
  -- The case `ρ = 1` is Dirichlet's theorem.
  obtain rfl | hρ_ne := eq_or_ne ρ 1
  · exact χ.LFunction_ne_zero_of_one_le_re h_pole le_rfl
  obtain ⟨β, hβ, hβρ⟩ : ∃ β : ℝ, 1 / 2 < β ∧ β < ρ.re := exists_between hρ
  have hq_pos : 0 < q := NeZero.pos q
  obtain ⟨d₀, hd₀⟩ : ∃ d₀ : ℕ, d₀ + 1 = 9240 * q := ⟨9240 * q - 1, by omega⟩
  -- `d₀` is odd and `q₀ = 2 (d₀ + 1)`.
  have hd₀_cop : d₀.Coprime (18480 * q) := by
    have h_two : d₀.Coprime 2 := (Nat.odd_iff.2 (by omega)).coprime_two_right
    have h_eq : 18480 * q = 2 * (d₀ + 1) := by omega
    rw [h_eq]
    exact h_two.mul_right (by simp)
  -- The one-sided bound is the hypothesis of the criterion.
  have h_bound (d : Nat.Primes) (hd : (d : ℕ) ≡ d₀ [MOD 18480 * q]) :
      ∃ A : ℝ, ∀ᶠ x : ℝ in atTop, primeRemainder d (18480 * q) x ≤ A * x ^ (β - 1) := by
    refine ⟨800 * (18480 * q).totient + 30, ?_⟩
    have hd₀_eq : d₀ = 18480 * q / 2 - 1 := by omega
    have h_exp : β - 1 = -1 / 2 + (β - 1 / 2) := by ring
    rw [hd₀_eq] at hd
    rw [h_exp]
    exact eventually_primeRemainder_le_mul_rpow_with_density
      (dvd_mul_right 18480 q) hd (sub_pos.2 hβ)
  have h_induced : (χ.changeLevel (dvd_mul_left q 18480)).LFunction ρ ≠ 0 :=
    LFunction_ne_zero_of_primeRemainder_le (by omega) (by omega) hd₀_cop hβ h_bound _ hρ_ne hβρ
  -- Inducing multiplies `L(s, χ)` by finitely many factors `1 - χ(p) p ^ (-s)`.
  rw [LFunction_changeLevel _ χ h_pole] at h_induced
  exact left_ne_zero_of_mul h_induced

end New
