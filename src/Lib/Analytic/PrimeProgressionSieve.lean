module

import Mathlib.Algebra.Order.Group.Unbundled.Abs
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Int.CardIntervalMod
public import Mathlib.Data.Nat.ModEq
public import Mathlib.Data.Nat.Totient
public import Mathlib.NumberTheory.PrimeCounting
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import TauCeti.NumberTheory.ArithmeticFunction.DivisorBounds
import TauCeti.NumberTheory.PrimeCounting
import TauCeti.NumberTheory.SelbergSieve.CoprimeDiagonal
import TauCeti.NumberTheory.SelbergSieve.PrimeInterval

/-!
# Selberg's upper bound for one residue class

Counting a class modulo `m` subject to divisibility by `d` uses one class modulo `m d`
when `m` and `d` are coprime. This supplies the floor error in the generic Selberg sieve.
At moduli with `φ(m) = m / 2`, the sieve gives an upper bound of order
`(n / m) / log (n / m)` for primes below `n`.
-/

noncomputable section

open Finset Nat Real
open scoped ArithmeticFunction.omega

namespace ProgressionSieveCount

private theorem abs_count_modEq_sub_div_lt_one (n r a : ℕ) (hr : 0 < r) :
    |(n.count (· ≡ a [MOD r]) : ℝ) - (n : ℝ) / r| < 1 := by
  have hr' : (0 : ℝ) < r := by exact_mod_cast hr
  have hrem : (↑(n % r) : ℝ) < r := by exact_mod_cast Nat.mod_lt n hr
  have hres : (n : ℝ) / r = (↑(n / r) : ℝ) + (↑(n % r) : ℝ) / r := by
    have h := (show (n : ℝ) = (r : ℝ) * ↑(n / r) + ↑(n % r) by
      exact_mod_cast (Nat.div_add_mod n r).symm)
    conv_lhs => rw [h]
    field_simp
  have hnonneg : 0 ≤ (↑(n % r) : ℝ) / r := by positivity
  have hlt : (↑(n % r) : ℝ) / r < 1 := (div_lt_one hr').2 hrem
  rw [Nat.count_modEq_card n hr, hres, Nat.cast_add]
  split_ifs with h
  · have hpos : 0 < (↑(n % r) : ℝ) / r := by
      exact div_pos (by exact_mod_cast ((Nat.zero_le _).trans_lt h)) hr'
    simp only [Nat.cast_one, abs_lt]
    constructor <;> linarith only [hlt, hpos]
  · simp only [Nat.cast_zero, add_zero, abs_lt]
    constructor <;> linarith only [hlt, hnonneg]

/-- The number of indices below `n` in the selected progression that are divisible by
`r` differs from `n / (m * r)` by less than one when `m` and `r` are coprime. -/
private theorem abs_card_filter_modEq_dvd_sub_div_lt_one
    (n m r a : ℕ) (hm : 0 < m) (hr : 0 < r) (hcop : m.Coprime r) :
    |(#{k ∈ range n | k ≡ a [MOD m] ∧ r ∣ k} : ℝ) - (n : ℝ) / ↑(m * r)| < 1 := by
  let b := Nat.chineseRemainder hcop a 0
  have h_modEq (k : ℕ) : (k ≡ a [MOD m] ∧ r ∣ k) ↔ k ≡ (b : ℕ) [MOD m * r] := by
    constructor
    · rintro ⟨ha, hkr⟩
      exact Nat.chineseRemainder_modEq_unique hcop ha (Nat.modEq_zero_iff_dvd.2 hkr)
    · intro hk
      exact ⟨(hk.of_dvd (dvd_mul_right m r)).trans b.prop.1,
        Nat.modEq_zero_iff_dvd.1 ((hk.of_dvd (dvd_mul_left r m)).trans b.prop.2)⟩
  simp_rw [h_modEq, ← Nat.count_eq_card_filter_range]
  exact abs_count_modEq_sub_div_lt_one n (m * r) b (Nat.mul_pos hm hr)

end ProgressionSieveCount

namespace PrimeProgressionSieve

private def sievingPrimes (m : ℕ) (z : ℝ) : Finset ℕ :=
  (primesLE ⌊z⌋₊).filter fun p ↦ ¬ p ∣ m

private theorem sievingProduct_dvd_primorial (m : ℕ) (z : ℝ) :
    (∏ p ∈ sievingPrimes m z, p) ∣ primorial ⌊z⌋₊ := by
  rw [primorial_eq_prod_primesLE]
  exact prod_dvd_prod_of_subset _ _ _ (filter_subset _ _)

private def progressionSieve (n m a : ℕ) (z : ℝ) : BoundingSieve :=
  { BoundingSieve.primeInterval 0 ((n : ℝ) / m) z with
    support := (range n).filter (· ≡ a [MOD m])
    prodPrimes := ∏ p ∈ sievingPrimes m z, p
    prodPrimes_squarefree := (squarefree_primorial _).squarefree_of_dvd
      (sievingProduct_dvd_primorial m z)
    nu_pos_of_prime := fun p hp _ ↦ by
      rw [BoundingSieve.primeInterval_nu_apply]
      exact inv_pos.mpr (Nat.cast_pos.mpr hp.pos)
    nu_lt_one_of_prime := fun p hp _ ↦ by
      rw [BoundingSieve.primeInterval_nu_apply]
      exact inv_lt_one_of_one_lt₀ (by exact_mod_cast hp.one_lt) }

private theorem abs_rem_progressionSieve_lt_one (n m a : ℕ) (z : ℝ) (hm : 0 < m)
    {d : ℕ} (hd : d ∈ (progressionSieve n m a z).prodPrimes.divisors) :
    |(progressionSieve n m a z).rem d| < 1 := by
  have hmP : m.Coprime (progressionSieve n m a z).prodPrimes := by
    change m.Coprime (∏ p ∈ sievingPrimes m z, p)
    apply Nat.Coprime.prod_right
    intro p hp
    obtain ⟨hp, hpm⟩ := mem_filter.mp hp
    exact ((prime_of_mem_primesLE hp).coprime_iff_not_dvd.mpr hpm).symm
  have hmd := hmP.coprime_dvd_right (dvd_of_mem_divisors hd)
  have hcount := ProgressionSieveCount.abs_card_filter_modEq_dvd_sub_div_lt_one n m d a hm
    (pos_of_mem_divisors hd) hmd
  have h_scale : (d : ℝ)⁻¹ * ((n : ℝ) / m) = (n : ℝ) / ↑(m * d) := by
    simp only [Nat.cast_mul, div_eq_mul_inv, mul_inv]
    ring
  simpa only [BoundingSieve.rem, BoundingSieve.multSum, progressionSieve,
    BoundingSieve.primeInterval_nu_apply, BoundingSieve.primeInterval_totalMass,
    BoundingSieve.primeInterval_weights, ← natCast_card_filter, filter_filter, h_scale] using hcount

private theorem card_primes_progression_le (n m a : ℕ) {z : ℝ} (hz : 0 ≤ z) :
    (#{p ∈ range n | p ≡ a [MOD m] ∧ p.Prime} : ℝ) ≤
      (progressionSieve n m a z).siftedSum + z := by
  let s := progressionSieve n m a z
  have h_subset : {p ∈ range n | p ≡ a [MOD m] ∧ p.Prime} ⊆
      s.support.filter (Nat.Coprime s.prodPrimes) ∪ primesLE ⌊z⌋₊ := by
    intro p hp
    obtain ⟨hpn, hpa, hpp⟩ := mem_filter.mp hp
    by_cases hpz : p ≤ ⌊z⌋₊
    · exact mem_union_right _ (mem_primesLE.mpr ⟨hpz, hpp⟩)
    · apply mem_union_left _
      refine mem_filter.mpr ⟨mem_filter.mpr ⟨hpn, hpa⟩, Nat.Coprime.symm ?_⟩
      exact hpp.coprime_iff_not_dvd.mpr fun h ↦
        hpz (hpp.dvd_primorial_iff.mp (h.trans (sievingProduct_dvd_primorial m z)))
  have h_count := (card_le_card h_subset).trans (card_union_le _ _)
  have h_sifted : s.siftedSum = (#{p ∈ s.support | Nat.Coprime s.prodPrimes p} : ℝ) := by
    simp only [BoundingSieve.siftedSum, s, progressionSieve,
      BoundingSieve.primeInterval_weights, ← natCast_card_filter]
  have h_small : ((primesLE ⌊z⌋₊).card : ℝ) ≤ z := by
    rw [primesLE_card_eq_primeCounting]
    exact (show (Nat.primeCounting ⌊z⌋₊ : ℝ) ≤ ⌊z⌋₊ by
      exact_mod_cast Nat.primeCounting_le_self _).trans (floor_le hz)
  calc _ ≤ s.siftedSum + (primesLE ⌊z⌋₊).card := by rw [h_sifted]; exact_mod_cast h_count
    _ ≤ _ := add_le_add le_rfl h_small

/-- The Selberg sieve bounds the number of primes below `n` in one class modulo `m`.
The main term uses the coprime diagonal mass and the error is uniform in the class. -/
public theorem card_primes_progression_le_sieve (n m a : ℕ) (hm : 0 < m) {z : ℝ}
    (hz : 1 < z) :
    (#{p ∈ range n | p ≡ a [MOD m] ∧ p.Prime} : ℝ) ≤
      (n : ℝ) / (m.totient * Real.log z) + z ^ 2 * (1 + 2 * Real.log z) ^ 2 + z := by
  let s := progressionSieve n m a z
  have hz₀ : 0 ≤ z := zero_le_one.trans hz.le
  have hG := s.totient_div_mul_log_le_diagonalMass m hz₀
    (fun p hp hpz hpm ↦ dvd_prod_of_mem id
      (mem_filter.mpr ⟨mem_primesLE.mpr ⟨le_floor hpz.le, hp⟩, hpm⟩))
    (fun p _ _ _ ↦ by rw [show s.nu p = (p : ℝ)⁻¹ from
      BoundingSieve.primeInterval_nu_apply 0 ((n : ℝ) / m) z p])
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  have hφ : (0 : ℝ) < m.totient := by exact_mod_cast totient_pos.mpr hm
  have hlog := Real.log_pos hz
  have hMass : s.totalMass = (n : ℝ) / m := by
    simp only [s, progressionSieve, BoundingSieve.primeInterval_totalMass]
  have h_main : s.totalMass / s.diagonalMass z ≤ (n : ℝ) / (m.totient * Real.log z) := calc
    _ ≤ s.totalMass / (m.totient / (m : ℝ) * Real.log z) :=
      div_le_div_of_nonneg_left (by rw [hMass]; positivity) (by positivity) hG
    _ = _ := by
      rw [hMass]
      field_simp [hm'.ne', hφ.ne', hlog.ne']
  have hz2 : 1 ≤ z ^ 2 := one_le_pow₀ hz.le
  have h_err : ∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ ↦ (d : ℝ) < z ^ 2),
      (3 : ℝ) ^ ω d * |s.rem d| ≤ z ^ 2 * (1 + 2 * Real.log z) ^ 2 := by
    calc
      _ ≤ ∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ ↦ (d : ℝ) < z ^ 2), (3 : ℝ) ^ ω d :=
        sum_le_sum fun d hd ↦ mul_le_of_le_one_right (by positivity)
          (abs_rem_progressionSieve_lt_one n m a z hm (mem_filter.mp hd).1).le
      _ ≤ ∑ d ∈ Ioc 0 ⌊z ^ 2⌋₊, (3 : ℝ) ^ ω d := by
        apply sum_le_sum_of_subset_of_nonneg _ (fun _ _ _ ↦ by positivity)
        intro d hd
        obtain ⟨hdP, hdz⟩ := mem_filter.mp hd
        exact mem_Ioc.mpr ⟨pos_of_mem_divisors hdP, le_floor hdz.le⟩
      _ ≤ z ^ 2 * (1 + Real.log (z ^ 2)) ^ 2 :=
        ArithmeticFunction.sum_Ioc_three_pow_cardDistinctFactors_le_mul_one_add_log_sq hz2
      _ = _ := by rw [Real.log_pow, Nat.cast_ofNat]
  calc
    _ ≤ s.siftedSum + z := card_primes_progression_le n m a hz₀
    _ ≤ _ := add_le_add
      ((s.siftedSum_le_totalMass_div_diagonalMass_add_sum_three_pow hz).trans
        (add_le_add h_main h_err)) le_rfl

/-- An upper bound of order `(n / m) / log (n / m)` for a progression when
`φ(m) = m / 2`, as for the nontrivial powers of two. -/
public theorem card_primes_progression_le_div_log_of_totient_eq_half (n m a : ℕ)
    (hm : 0 < m) (hu : 1 < (n : ℝ) / m) (hφ : (m.totient : ℝ) = (m : ℝ) / 2) :
    (#{p ∈ range n | p ≡ a [MOD m] ∧ p.Prime} : ℝ) ≤
      144 * ((n : ℝ) / m) / Real.log ((n : ℝ) / m) := by
  let u : ℝ := (n : ℝ) / m
  let w := u ^ (1 / 8 : ℝ)
  let z := w ^ (2 : ℕ)
  have hw : 1 < w := Real.one_lt_rpow hu (by norm_num)
  have hz : 1 < z := by dsimp [z]; nlinarith
  have h_pow : w ^ (8 : ℕ) = u := by
    simpa [w, one_div] using Real.rpow_inv_natCast_pow
      (zero_le_one.trans hu.le) (show (8 : ℕ) ≠ 0 by decide)
  have h_log_u : Real.log u = 8 * Real.log w := by
    rw [← h_pow, Real.log_pow, Nat.cast_ofNat]
  have h_log_z : Real.log z = 2 * Real.log w := by
    rw [show z = w ^ (2 : ℕ) from rfl, Real.log_pow, Nat.cast_ofNat]
  have h_log_pos := Real.log_pos hw
  have h_log_le := Real.log_le_self (zero_le_one.trans hw.le)
  have h_sum_le : 1 + 2 * (2 * Real.log w) ≤ 4 * w := by
    linarith only [Real.log_le_sub_one_of_pos (zero_lt_one.trans hw)]
  have h_rem_mul :
      (z ^ 2 * (1 + 2 * Real.log z) ^ 2 + z) * Real.log u ≤ 136 * u := by
    rw [h_log_z, h_log_u, ← h_pow]
    calc
      _ ≤ (z ^ 2 * (4 * w) ^ 2 + z) * (8 * w) := by gcongr
      _ = 128 * w ^ 7 + 8 * w ^ 3 := by dsimp [z]; ring
      _ ≤ 136 * w ^ 8 := by
        have h₃ := pow_le_pow_right₀ hw.le (show (3 : ℕ) ≤ 8 by decide)
        have h₇ := pow_le_pow_right₀ hw.le (show (7 : ℕ) ≤ 8 by decide)
        linarith
  have h_rem := (le_div_iff₀ (Real.log_pos hu)).2 h_rem_mul
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  have h_main : (n : ℝ) / (m.totient * Real.log z) = 8 * u / Real.log u := by
    rw [hφ, h_log_z, h_log_u]
    dsimp [u]
    field_simp [hm'.ne', h_log_pos.ne']
  calc
    _ ≤ (n : ℝ) / (m.totient * Real.log z) +
        (z ^ 2 * (1 + 2 * Real.log z) ^ 2 + z) := by
      simpa only [add_assoc] using card_primes_progression_le_sieve n m a hm hz
    _ ≤ 8 * u / Real.log u + 136 * u / Real.log u := by rw [h_main]; exact add_le_add le_rfl h_rem
    _ = 144 * u / Real.log u := by ring

end PrimeProgressionSieve
