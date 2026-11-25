module

import Lean
import Mathlib.Algebra.MvPolynomial.PDeriv

open Lean Elab Command MvPolynomial
open scoped BigOperators

namespace RamifiedLinearSubstitutionAudit

variable {R σ τ : Type} [CommRing R] [Fintype σ]

theorem pderiv_substitution (f : σ → MvPolynomial τ R) (p : MvPolynomial σ R) (j : τ) :
    pderiv j (aeval f p) = ∑ i : σ, pderiv j (f i) * aeval f (pderiv i p) := by
  classical
  induction p using MvPolynomial.induction_on with
  | C a => simp [MvPolynomial.algebraMap_eq]
  | add p q hp hq => simp only [map_add, hp, hq, mul_add, Finset.sum_add_distrib]
  | mul_X p k hp =>
    rw [map_mul, aeval_X, pderiv_mul, hp]
    simp only [pderiv_mul, map_add, map_mul, aeval_X, mul_add, ← mul_assoc, Finset.sum_add_distrib, Finset.sum_mul]
    congr 1
    symm
    rw [Finset.sum_eq_single k]
    · simp [mul_comm]
    · intro i _ hi
      simp [pderiv_X_of_ne hi.symm]
    · simp

noncomputable def linearSubstitution [Fintype τ] (A : σ → τ → R) : MvPolynomial σ R →ₐ[R] MvPolynomial τ R :=
  aeval fun i => ∑ k : τ, C (A i k) * X k

theorem pderiv_linearSubstitution [Fintype τ] (A : σ → τ → R) (p : MvPolynomial σ R) (j : τ) :
    pderiv j (linearSubstitution A p) = ∑ i : σ, C (A i j) * linearSubstitution A (pderiv i p) := by
  classical
  unfold linearSubstitution
  rw [pderiv_substitution]
  refine Finset.sum_congr rfl fun i _ => ?_
  simp only [map_sum, pderiv_C_mul]
  rw [Finset.sum_eq_single j]
  · simp
  · intro k _ hk
    simp [pderiv_X_of_ne hk]
  · simp

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``pderiv_substitution, ``pderiv_linearSubstitution] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedLinearSubstitutionAudit
