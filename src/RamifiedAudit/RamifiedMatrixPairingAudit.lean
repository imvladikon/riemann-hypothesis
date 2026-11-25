module

import Lean
import Mathlib.Data.Matrix.Diagonal
import Mathlib.Data.Matrix.Mul
import all RamifiedDiagonalCutoffAudit
import all RamifiedPairSubstitutionAudit
import all RamifiedLinearSubstitutionAudit

open Lean Elab Command Module MvPolynomial
open RamifiedDiagonalCutoffAudit RamifiedPairSubstitutionAudit RamifiedLinearSubstitutionAudit
open scoped BigOperators

namespace RamifiedMatrixPairingAudit

variable {R ρ τ κ : Type} [CommRing R]

def rowChange [DecidableEq κ] (L : Bool → Matrix ρ τ R) (x : Var ρ κ) (y : Var τ κ) : R :=
  if y.1 = x.1 ∧ y.2.2 = x.2.2 then L x.1 x.2.1 y.2.1 else 0

def matrixPairing [DecidableEq κ] (C : Matrix τ τ R) (x y : Var τ κ) : R :=
  if x.1 = false ∧ y.1 = true ∧ y.2.2 = x.2.2 then C x.2.1 y.2.1 else 0

noncomputable def matrixDerivative [Fintype τ] [Fintype κ] [DecidableEq κ] (C : Matrix τ τ R) :
    End R (MvPolynomial (Var τ κ) R) :=
  pairDerivative (matrixPairing C)

theorem rowChange_X [Fintype τ] [Fintype κ] [DecidableEq κ]
    (L : Bool → Matrix ρ τ R) (s : Bool) (i : ρ) (j : κ) :
    linearSubstitution (rowChange L) (X (s, i, j)) =
      ∑ k : τ, C (L s i k) * X (s, k, j) := by
  cases s <;>
    simp [linearSubstitution, rowChange, Fintype.sum_prod_type, apply_ite, ite_mul]

theorem transformed_matrixPairing [Fintype τ] [Fintype κ] [DecidableEq κ]
    (L : Bool → Matrix ρ τ R) (C : Matrix τ τ R) :
    transformedPairing (rowChange (κ := κ) L) (matrixPairing C) =
      matrixPairing (L false * C * (L true).transpose) := by
  funext x y
  rcases x with ⟨s, i, j⟩
  rcases y with ⟨t, k, l⟩
  cases s <;> cases t <;>
    simp [transformedPairing, rowChange, matrixPairing, Fintype.sum_prod_type,
      ite_and, ite_mul, mul_ite, Matrix.mul_apply, Finset.sum_mul]
  by_cases h : l = j
  · simp only [h, ite_true]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
    ac_rfl
  · simp [h]

theorem matrixDerivative_pow_rowChange [Fintype ρ] [Fintype τ] [Fintype κ] [DecidableEq κ]
    (L : Bool → Matrix ρ τ R) (C : Matrix τ τ R) (n : ℕ) (p : MvPolynomial (Var ρ κ) R) :
    (matrixDerivative C ^ n) (linearSubstitution (rowChange L) p) =
      linearSubstitution (rowChange L) ((matrixDerivative (L false * C * (L true).transpose) ^ n) p) := by
  simpa only [matrixDerivative, transformed_matrixPairing] using
    pairDerivative_pow_linearSubstitution (rowChange L) (matrixPairing C) n p

theorem matrixDerivative_diagonal [Fintype ρ] [Fintype κ] [DecidableEq ρ] [DecidableEq κ] (d : ρ → R) :
    matrixDerivative (κ := κ) (Matrix.diagonal d) = diagonalDerivative d := by
  apply LinearMap.ext
  intro p
  simp [matrixDerivative, pairDerivative_apply, diagonalDerivative_apply, matrixPairing,
    Fintype.sum_prod_type, Matrix.diagonal_apply, ite_and, apply_ite, ite_mul]

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``rowChange_X, ``matrixDerivative_pow_rowChange, ``matrixDerivative_diagonal] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedMatrixPairingAudit
