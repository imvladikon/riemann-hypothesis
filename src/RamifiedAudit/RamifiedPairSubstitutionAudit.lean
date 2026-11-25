module

import Lean
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import all RamifiedLinearSubstitutionAudit

open Lean Elab Command Module MvPolynomial
open RamifiedLinearSubstitutionAudit
open scoped BigOperators

namespace RamifiedPairSubstitutionAudit

variable {R σ τ : Type} [CommRing R] [Fintype σ] [Fintype τ]

noncomputable def pairDerivative (weights : τ → τ → R) : End R (MvPolynomial τ R) :=
  ∑ j : τ, ∑ k : τ, weights j k • ((pderiv j).toLinearMap * (pderiv k).toLinearMap)

theorem pairDerivative_apply (weights : τ → τ → R) (p : MvPolynomial τ R) :
    pairDerivative weights p = ∑ j : τ, ∑ k : τ, C (weights j k) * pderiv j (pderiv k p) := by
  simp [pairDerivative, Algebra.smul_def, MvPolynomial.algebraMap_eq]

omit [Fintype σ] in
private theorem linearSubstitution_C (A : σ → τ → R) (c : R) :
    linearSubstitution A (C c) = C c := by
  simp [linearSubstitution, MvPolynomial.algebraMap_eq]

private theorem pair_pderiv_linearSubstitution (A : σ → τ → R) (p : MvPolynomial σ R) (j k : τ) :
    pderiv j (pderiv k (linearSubstitution A p)) =
      ∑ a : σ, ∑ b : σ, C (A a j) * (C (A b k) * linearSubstitution A (pderiv a (pderiv b p))) := by
  rw [pderiv_linearSubstitution A p k, map_sum]
  simp only [pderiv_C_mul, pderiv_linearSubstitution, Finset.mul_sum]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
  rw [mul_left_comm]

noncomputable def transformedPairing (A : σ → τ → R) (weights : τ → τ → R) (a b : σ) : R :=
  ∑ j : τ, ∑ k : τ, weights j k * A a j * A b k

/-- A linear change of polynomial variables sends the pairing matrix to \(ACA^{\mathsf T}\). -/
theorem pairDerivative_linearSubstitution (A : σ → τ → R) (weights : τ → τ → R) (p : MvPolynomial σ R) :
    pairDerivative weights (linearSubstitution A p) =
      linearSubstitution A (pairDerivative (transformedPairing A weights) p) := by
  let term (jk : τ × τ) (ab : σ × σ) :=
    C (weights jk.1 jk.2) * (C (A ab.1 jk.1) *
      (C (A ab.2 jk.2) * linearSubstitution A (pderiv ab.1 (pderiv ab.2 p))))
  calc
    _ = ∑ jk : τ × τ, ∑ ab : σ × σ, term jk ab := by
      simp [term, pairDerivative_apply, pair_pderiv_linearSubstitution, Fintype.sum_prod_type, Finset.mul_sum]
    _ = ∑ ab : σ × σ, ∑ jk : τ × τ, term jk ab := Finset.sum_comm
    _ = _ := by
      simp only [term, pairDerivative_apply, transformedPairing, map_sum, map_mul, linearSubstitution_C,
        Fintype.sum_prod_type, Finset.sum_mul, mul_assoc]

theorem pairDerivative_pow_linearSubstitution (A : σ → τ → R) (weights : τ → τ → R) (n : ℕ)
    (p : MvPolynomial σ R) :
    (pairDerivative weights ^ n) (linearSubstitution A p) =
      linearSubstitution A ((pairDerivative (transformedPairing A weights) ^ n) p) := by
  induction n with
  | zero => simp
  | succ n ih => simp only [pow_succ', mul_apply_eq_comp, ih, pairDerivative_linearSubstitution]

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``pairDerivative_linearSubstitution, ``pairDerivative_pow_linearSubstitution] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedPairSubstitutionAudit
