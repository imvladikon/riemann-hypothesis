module

import Lean
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import all RamifiedPairSubstitutionAudit

open Lean Elab Command Module MvPolynomial
open RamifiedPairSubstitutionAudit
open scoped BigOperators

namespace RamifiedDiagonalCutoffAudit

abbrev Var (ρ κ : Type) := Bool × ρ × κ

variable {R ρ κ : Type} [CommRing R] [Fintype ρ] [Fintype κ] [DecidableEq ρ]

def rowWeight (side : Bool) (row : ρ) (v : Var ρ κ) : ℕ :=
  if v.1 = side ∧ v.2.1 = row then 1 else 0

noncomputable def rowDegree (m : Var ρ κ →₀ ℕ) (side : Bool) (row : ρ) : ℕ :=
  Finsupp.weight (rowWeight side row) m

noncomputable def rowBudget (m : Var ρ κ →₀ ℕ) : ℕ :=
  ∑ i : ρ, min (rowDegree m false i) (rowDegree m true i)

omit [Fintype κ] in
private theorem rowBudget_add_pair (m : Var ρ κ →₀ ℕ) (i : ρ) (j : κ) :
    rowBudget (m + Finsupp.single (false, i, j) 1 + Finsupp.single (true, i, j) 1) =
      rowBudget m + 1 := by
  classical
  unfold rowBudget
  calc
    _ = ∑ r : ρ, (min (rowDegree m false r) (rowDegree m true r) + (if i = r then 1 else 0)) := by
      refine Finset.sum_congr rfl fun r _ => ?_
      by_cases h : i = r
      · simp [rowDegree, Finsupp.weight_single, rowWeight, h]
      · simp [rowDegree, rowWeight, h, Finsupp.weight_single]
    _ = _ := by simp [Finset.sum_add_distrib]

noncomputable def diagonalDerivative (d : ρ → R) : End R (MvPolynomial (Var ρ κ) R) :=
  ∑ i : ρ, ∑ j : κ, d i • ((pderiv (false, i, j)).toLinearMap * (pderiv (true, i, j)).toLinearMap)

omit [DecidableEq ρ] in
theorem diagonalDerivative_apply (d : ρ → R) (p : MvPolynomial (Var ρ κ) R) :
    diagonalDerivative d p = ∑ i : ρ, ∑ j : κ, C (d i) * pderiv (false, i, j) (pderiv (true, i, j) p) := by
  simp [diagonalDerivative, Algebra.smul_def, MvPolynomial.algebraMap_eq]

private theorem support_diagonalDerivative (d : ρ → R) (p : MvPolynomial (Var ρ κ) R)
    {m : Var ρ κ →₀ ℕ} (hm : m ∈ (diagonalDerivative d p).support) :
    ∃ m' ∈ p.support, rowBudget m' = rowBudget m + 1 := by
  classical
  rw [mem_support_iff, diagonalDerivative_apply] at hm
  simp only [coeff_sum, coeff_C_mul] at hm
  obtain ⟨i, _, hi⟩ := Finset.exists_ne_zero_of_sum_ne_zero hm
  obtain ⟨j, _, hj⟩ := Finset.exists_ne_zero_of_sum_ne_zero hi
  refine ⟨m + Finsupp.single (false, i, j) 1 + Finsupp.single (true, i, j) 1, ?_,
    rowBudget_add_pair m i j⟩
  rw [mem_support_iff]
  intro hz
  apply hj
  rw [coeff_pderiv, coeff_pderiv, hz, zero_mul, zero_mul, mul_zero]

theorem support_diagonalDerivative_pow (d : ρ → R) (p : MvPolynomial (Var ρ κ) R) (n : ℕ)
    {m : Var ρ κ →₀ ℕ} (hm : m ∈ ((diagonalDerivative d ^ n) p).support) :
    ∃ m' ∈ p.support, rowBudget m' = rowBudget m + n := by
  induction n generalizing m with
  | zero => exact ⟨m, by simpa using hm, by simp⟩
  | succ n ih =>
    rw [pow_succ', mul_apply_eq_comp] at hm
    obtain ⟨k, hk, hstep⟩ := support_diagonalDerivative d _ hm
    obtain ⟨m', hm', heq⟩ := ih hk
    exact ⟨m', hm', by omega⟩

theorem diagonal_vanishes_above_row_caps (d : ρ → R) (p : MvPolynomial (Var ρ κ) R)
    (α β : ρ → ℕ) (n : ℕ) (hn : (∑ i : ρ, min (α i) (β i)) < n)
    (hrows : ∀ m ∈ p.support, ∀ i, rowDegree m false i ≤ α i ∧ rowDegree m true i ≤ β i) :
    (diagonalDerivative d ^ n) p = 0 := by
  ext m
  change ((diagonalDerivative d ^ n) p).coeff m = 0
  by_contra hm
  obtain ⟨m', hm', heq⟩ := support_diagonalDerivative_pow d p n (mem_support_iff.mpr hm)
  have hcap : rowBudget m' ≤ ∑ i : ρ, min (α i) (β i) := by
    apply Finset.sum_le_sum
    intro i _
    exact min_le_min (hrows m' hm' i).1 (hrows m' hm' i).2
  omega

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``support_diagonalDerivative_pow, ``diagonal_vanishes_above_row_caps] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedDiagonalCutoffAudit
