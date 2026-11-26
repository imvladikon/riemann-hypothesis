import New.Reduction.Data.Existence
import New.Reduction.MainInequality
import New.Reduction.Zeros.Criterion
import New.Reduction.Zeros.PrimeNumberTheorem
import Statements

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

open DirichletCharacter Filter Finset Real ZMod

namespace New

private lemma Data.primeRemainder_le_of_main_bound {P : Parameters} (D : Data P) {c u : ℝ} {k : ℕ}
    (hc : 0 ≤ c) (hu : 0 < u) (h_density : towerDeg D.towerExp ≤ #D.bPlaces * u)
    (h_bound : D.m * D.totalRemainder ≤ c * (D.f * D.a * D.logB ^ k)) :
    primeRemainder P.d P.q₀ D.x ≤ c * P.q₀.totient * (u * D.logB ^ k) / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + u * |primeRemainder P.d 1 D.x₁| := by
  -- Write `R_{q₀}(x)` through the total remainder, divide the main inequality by `m a #Φ_b`, and
  -- use `f = φ(q₀) #Φ_a` and `#Φ_a ≤ #Φ_b u`, where `Φ_a = D.aPlaces` and `Φ_b = D.bPlaces`.
  have hm : (0 : ℝ) < D.m := Data.HasLogBound.pos D
  have ha : (0 : ℝ) < D.a := Data.HasLogBound.pos D
  have h_logB_pow_nonneg : 0 ≤ D.logB ^ k := pow_nonneg (Data.HasLogBound.pos D).le _
  have h_aPlaces_pos : (0 : ℝ) < #D.aPlaces := by
    rw [D.card_aPlaces]
    exact Data.HasLogBound.pos D
  have h_card : (#D.aPlaces : ℝ) ≤ #D.bPlaces * u := by rwa [D.card_aPlaces]
  have h_bPlaces_pos : (0 : ℝ) < #D.bPlaces :=
    (mul_pos_iff_of_pos_right hu).1 (h_aPlaces_pos.trans_le h_card)
  have h_ratio : (#D.aPlaces : ℝ) / #D.bPlaces ≤ u := (div_le_iff₀' h_bPlaces_pos).2 h_card
  have h_main : D.totalRemainder ≤ c * (D.f * D.a * D.logB ^ k) / D.m :=
    (le_div_iff₀' hm).2 h_bound
  calc primeRemainder P.d P.q₀ D.x
      = D.totalRemainder / (D.a * #D.bPlaces) + primeRemainder P.d P.q₀ D.x₁ -
          #D.aPlaces / #D.bPlaces * primeRemainder P.d 1 D.x₁ := by
        rw [D.totalRemainder_eq]
        field
    _ ≤ c * (D.f * D.a * D.logB ^ k) / D.m / (D.a * #D.bPlaces) +
          |primeRemainder P.d P.q₀ D.x₁| + #D.aPlaces / #D.bPlaces * |primeRemainder P.d 1 D.x₁| := by
        grw [h_main, le_abs_self (primeRemainder P.d P.q₀ D.x₁), sub_eq_add_neg, ← mul_neg,
          neg_le_abs]
    _ = c * P.q₀.totient * (#D.aPlaces / #D.bPlaces * D.logB ^ k) / D.m +
          |primeRemainder P.d P.q₀ D.x₁| +
          #D.aPlaces / #D.bPlaces * |primeRemainder P.d 1 D.x₁| := by
        rw [D.f_eq_card_aPlaces_mul, Nat.cast_mul]
        field
    _ ≤ c * P.q₀.totient * (u * D.logB ^ k) / D.m + |primeRemainder P.d P.q₀ D.x₁| +
          u * |primeRemainder P.d 1 D.x₁| := by grw [h_ratio]

/-- The bound at the first cut-off using the fourth power in the main inequality. -/
lemma Data.primeRemainder_le {P : Parameters} (D : Data P) :
    primeRemainder P.d P.q₀ D.x ≤ 128 * P.q₀.totient * D.logB ^ 5 / D.m +
      |primeRemainder P.d P.q₀ D.x₁| + D.logB * |primeRemainder P.d 1 D.x₁| := by
  simpa only [← pow_succ'] using D.primeRemainder_le_of_main_bound (c := 128) (k := 4)
    (by norm_num) (Data.HasLogBound.pos D) D.towerDeg_le_card_bPlaces_mul (star_inequality D)

private lemma eventually_exists_data_scales_with_density (P : Parameters) {ε γ : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop, ∃ D : Data P, D.x = x ∧ D.logB ≤ 2 * (x : ℝ) ^ ε ∧
      (x : ℝ) ^ (1 / 2 : ℝ) ≤ D.m ∧ (x : ℝ) ^ (ε / 12) ≤ D.logX₁ ∧
      towerDeg D.towerExp ≤ #D.bPlaces * (x : ℝ) ^ γ := by
  have h_two : ∀ᶠ x : ℕ in atTop, (2 : ℝ) ≤ (x : ℝ) ^ (ε / 12) :=
    ((tendsto_rpow_atTop (by positivity)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop 2
  filter_upwards [eventually_exists_data_with_density P hε hε_lt hγ hγε, h_two, eventually_ge_atTop 1]
    with x ⟨D, hx, _, _, _, _, hx₁_ge, ⟨_, hb_le⟩, h_density⟩ hx_two hx_one
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_eq : D.x = x := by rw [← hx, ← D.exp_logX]
  refine ⟨D, hx_eq, by linarith [one_le_rpow hx_ge hε.le], ?_, ?_, h_density⟩
  · rw [← hx_eq, Data.x, ← exp_mul, mul_one_div]
    exact (Set.mem_Icc.1 D.m_mem).1
  · have h_sq : (x : ℝ) ^ (ε / 6) = (x : ℝ) ^ (ε / 12) * (x : ℝ) ^ (ε / 12) := by
      rw [← rpow_add (by positivity)]
      ring_nf
    nlinarith

/-- Let `0 < ε < 1/100`. A term `D : Data P` (admissible data) bundles all the choices that the main
inequality needs, among them integer scales `x`, `x₁`, `b` with `x ^ 10⁶ ≤ x₁` and `x₁ ^ 10⁶ ≤ b`
(`D.logX₁ = log x₁`, `D.logB = log b`) and a power of two `m = D.m` in `[√x, 2 √x]`. For every large
integer `x` such data exist with `D.x = x`, `log b ≤ 2 x ^ ε`, `√x ≤ m` and
`x ^ (ε / 12) ≤ log x₁`. -/
lemma eventually_exists_data_scales (P : Parameters) {ε : ℝ} (hε : 0 < ε) (hε_lt : ε < 1 / 100) :
    ∀ᶠ x : ℕ in atTop, ∃ D : Data P, D.x = x ∧ D.logB ≤ 2 * (x : ℝ) ^ ε ∧
      (x : ℝ) ^ (1 / 2 : ℝ) ≤ D.m ∧ (x : ℝ) ^ (ε / 12) ≤ D.logX₁ := by
  filter_upwards [eventually_exists_data_scales_with_density P hε hε_lt hε le_rfl]
    with x ⟨D, hx, hlog, hm, h₁, _⟩
  exact ⟨D, hx, hlog, hm, h₁⟩

/-- Let `q₀ = P.q₀` and `d = P.d` be the modulus and the prime of the parameters `P`, and let
`ε > 0`. Let `R_q(y) = primeRemainder d q y = ∑_{n ≤ y} λ(n) (1/n - 1/y) - log y / φ(q) - c_q`. For
all large integers `x` and all `l ≥ x ^ (ε / 12)`, the values `|R_{q₀}(exp l)|` and `|R₁(exp l)|`
are at most `x ^ (-2)`, by the prime number theorem. -/
lemma eventually_abs_primeRemainder_exp_le (P : Parameters) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x : ℕ in atTop, ∀ l : ℝ, (x : ℝ) ^ (ε / 12) ≤ l →
      |primeRemainder P.d P.q₀ (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) ∧
      |primeRemainder P.d 1 (exp l)| ≤ (x : ℝ) ^ (-2 : ℝ) := by
  obtain ⟨B, hB⟩ : ∃ B : ℕ, 24 / ε ≤ B := exists_nat_ge (24 / ε)
  have hd : P.d ≠ 2 := by linarith [P.sixty_four_lt_d]
  have h_cop : P.q₀.Coprime P.d := (P.coprime_q₁_d 0).coprime_mul_right
  obtain ⟨Y, hY⟩ : ∃ Y : ℝ, ∀ y ≥ Y,
      |primeRemainder P.d P.q₀ y| ≤ 1 / log y ^ B ∧ |primeRemainder P.d 1 y| ≤ 1 / log y ^ B :=
    eventually_atTop.1 ((eventually_abs_primeRemainder_le hd h_cop B).and
      (eventually_abs_primeRemainder_le hd P.d.coprime_one_left B))
  have h_large : ∀ᶠ x : ℕ in atTop, Y ≤ (x : ℝ) ^ (ε / 12) :=
    ((tendsto_rpow_atTop (by positivity)).comp tendsto_natCast_atTop_atTop).eventually_ge_atTop Y
  filter_upwards [h_large, eventually_ge_atTop 1] with x hY_le hx_one l hl
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_pos : (0 : ℝ) < x := one_pos.trans_le hx_ge
  have h_exp : -(ε / 12 * B) ≤ -2 := by linarith [(div_le_iff₀ hε).1 hB]
  have h_small : 1 / log (exp l) ^ B ≤ (x : ℝ) ^ (-2 : ℝ) :=
    calc 1 / log (exp l) ^ B ≤ 1 / ((x : ℝ) ^ (ε / 12)) ^ B := by grw [log_exp, ← hl]
      _ = (x : ℝ) ^ (-(ε / 12 * B)) := by
        rw [← rpow_mul_natCast hx_pos.le, rpow_neg hx_pos.le, one_div]
      _ ≤ (x : ℝ) ^ (-2 : ℝ) := rpow_le_rpow_of_exponent_le hx_ge h_exp
  exact (hY (exp l) (by linarith [add_one_le_exp l])).imp h_small.trans' h_small.trans'

/-- For the data scales controlled by `ε` and sparse density controlled by `γ`, the bound at
integers has exponent `-1/2 + 4 ε + γ`. The density factor multiplies both the covolume error
and the remainder at `x₁` for the trivial modulus. -/
lemma eventually_primeRemainder_natCast_le_with_density (P : Parameters) {ε γ : ℝ} (hε : 0 < ε)
    (hε_lt : ε < 1 / 100) (hγ : 0 < γ) (hγε : γ ≤ ε) :
    ∀ᶠ x : ℕ in atTop,
      primeRemainder P.d P.q₀ x ≤ (400 * P.q₀.totient + 2) * (x : ℝ) ^ (-1 / 2 + 4 * ε + γ) := by
  filter_upwards [eventually_exists_data_scales_with_density P hε hε_lt hγ hγε,
    eventually_abs_primeRemainder_exp_le P hε, eventually_ge_atTop 1]
    with x ⟨D, hx_eq, h_logB, hm, h_logX₁, h_density⟩ h_at_x₁ hx_one
  have hx_ge : (1 : ℝ) ≤ x := mod_cast hx_one
  have hx_pos : (0 : ℝ) < x := one_pos.trans_le hx_ge
  obtain ⟨h_rem_q₀, h_rem_one⟩ := h_at_x₁ D.logX₁ h_logX₁
  have h_logB_pos : 0 < D.logB := Data.HasLogBound.pos D
  let t : ℝ := -1 / 2 + 4 * ε + γ
  have h_inv : (x : ℝ) ^ (-2 : ℝ) ≤ (x : ℝ) ^ t :=
    rpow_le_rpow_of_exponent_le hx_ge (by dsimp [t]; linarith)
  have h_mul : (x : ℝ) ^ γ * (x : ℝ) ^ (-2 : ℝ) ≤ (x : ℝ) ^ t := by
    rw [← rpow_add hx_pos]
    exact rpow_le_rpow_of_exponent_le hx_ge (by dsimp [t]; linarith)
  have h_main : ((x : ℝ) ^ γ * ((x : ℝ) ^ ε) ^ 4) / (x : ℝ) ^ (1 / 2 : ℝ) = (x : ℝ) ^ t := by
    rw [← rpow_mul_natCast hx_pos.le, ← rpow_add hx_pos, ← rpow_sub hx_pos]
    congr 1
    push_cast
    dsimp [t]
    ring
  calc primeRemainder P.d P.q₀ x = primeRemainder P.d P.q₀ D.x := by rw [hx_eq]
    _ ≤ 25 * P.q₀.totient * ((x : ℝ) ^ γ * D.logB ^ 4) / D.m +
        |primeRemainder P.d P.q₀ D.x₁| + (x : ℝ) ^ γ * |primeRemainder P.d 1 D.x₁| :=
      D.primeRemainder_le_of_main_bound (c := 25) (k := 4) (by norm_num)
        (rpow_pos_of_pos hx_pos _) h_density (star_inequality_with_completion_cost D)
    _ ≤ 25 * P.q₀.totient * ((x : ℝ) ^ γ * (2 * (x : ℝ) ^ ε) ^ 4) / (x : ℝ) ^ (1 / 2 : ℝ) +
        (x : ℝ) ^ (-2 : ℝ) + (x : ℝ) ^ γ * (x : ℝ) ^ (-2 : ℝ) := by
      grw [h_rem_q₀, h_rem_one, h_logB, ← hm]
    _ = 400 * P.q₀.totient * (((x : ℝ) ^ γ * ((x : ℝ) ^ ε) ^ 4) / (x : ℝ) ^ (1 / 2 : ℝ)) +
        (x : ℝ) ^ (-2 : ℝ) + (x : ℝ) ^ γ * (x : ℝ) ^ (-2 : ℝ) := by
      rw [mul_pow]
      ring
    _ ≤ 400 * P.q₀.totient * (x : ℝ) ^ t + (x : ℝ) ^ t + (x : ℝ) ^ t := by
      grw [h_main, h_mul, h_inv]
    _ = (400 * P.q₀.totient + 2) * (x : ℝ) ^ t := by ring

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
  -- Use δ for the analytic scales and δ / 2 for the sparse set.
  obtain ⟨δ, hδ, hδ_lt, hδε⟩ : ∃ δ > (0 : ℝ), δ < 1 / 100 ∧ 4 * δ + δ / 2 ≤ ε := by
    refine ⟨min (1 / 200) (2 * ε / 9), by positivity, ?_, ?_⟩
    · linarith [min_le_left (1 / 200) (2 * ε / 9)]
    · linarith [min_le_right (1 / 200) (2 * ε / 9)]
  set C : ℝ := 400 * q₀.totient + 2
  set t : ℝ := -1 / 2 + 4 * δ + δ / 2 with ht
  have ht_ge : -1 ≤ t := by linarith
  have ht_le : t ≤ 0 := by linarith
  have h_floor : ∀ᶠ y : ℝ in atTop, primeRemainder d q₀ ⌊y⌋₊ ≤ C * (⌊y⌋₊ : ℝ) ^ t :=
    tendsto_nat_floor_atTop.eventually
      (eventually_primeRemainder_natCast_le_with_density P hδ hδ_lt (half_pos hδ) (by linarith))
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
