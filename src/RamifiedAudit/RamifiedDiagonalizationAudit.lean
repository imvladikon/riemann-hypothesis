module

import Lean
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Matrix.Reindex
import Mathlib.Logic.Equiv.Fin.Basic

open Lean Elab Command Matrix

namespace RamifiedDiagonalizationAudit

variable {K : Type} [Field K]

def leadingBlock {n : ℕ} (A : Matrix (Fin n) (Fin n) K) (k : ℕ) (hk : k ≤ n) :
    Matrix (Fin k) (Fin k) K :=
  A.submatrix (Fin.castLE hk) (Fin.castLE hk)

def LowerUnit {n : ℕ} (L : Matrix (Fin n) (Fin n) K) : Prop :=
  L.IsLowerTriangular ∧ ∀ i, L i i = 1

private theorem border_lowerUnit {n : ℕ} (L : Matrix (Fin n) (Fin n) K)
    (hL : LowerUnit L) (r : Matrix (Fin 1) (Fin n) K) :
    LowerUnit (Matrix.reindex finSumFinEquiv finSumFinEquiv (fromBlocks L 0 r 1)) := by
  let e : Fin n ⊕ Fin 1 ≃ Fin (n + 1) := finSumFinEquiv
  constructor
  · intro i j hij
    change i < j at hij
    obtain ⟨i, rfl⟩ := e.surjective i
    obtain ⟨j, rfl⟩ := e.surjective j
    change (reindex e e (fromBlocks L 0 r 1)) (e i) (e j) = 0
    simp only [reindex_apply, submatrix_apply, Equiv.symm_apply_apply]
    rcases i with i | i <;> rcases j with j | j
    · exact hL.1 (show i < j from hij)
    · rfl
    · exfalso
      change n + i.val < j.val at hij
      omega
    · have he : i = j := Subsingleton.elim _ _
      subst j
      exact (lt_irrefl _ hij).elim
  · intro i
    obtain ⟨i, rfl⟩ := e.surjective i
    change (reindex e e (fromBlocks L 0 r 1)) (e i) (e i) = 1
    simp only [reindex_apply, submatrix_apply, Equiv.symm_apply_apply]
    rcases i with i | i
    · exact hL.2 i
    · simp

private theorem border_diagonal {n : ℕ} (d : Fin n → K) (r : Matrix (Fin 1) (Fin 1) K) :
    fromBlocks (diagonal d) 0 0 r = diagonal (Sum.elim d (fun i => r i i)) := by
  ext (i | i) (j | j)
  · simp [Matrix.diagonal]
  · simp [Matrix.diagonal]
  · simp [Matrix.diagonal]
  · have he : i = j := Subsingleton.elim _ _
    subst j
    simp [Matrix.diagonal]

/-- Nonzero leading principal minors allow diagonalization by lower unitriangular row changes
    on both sides. -/
theorem diagonalize_of_leading_minors {n : ℕ} (A : Matrix (Fin n) (Fin n) K)
    (h : ∀ k (hk : k ≤ n), (leadingBlock A k hk).det ≠ 0) :
    ∃ L R : Matrix (Fin n) (Fin n) K, ∃ d : Fin n → K,
      LowerUnit L ∧ LowerUnit R ∧ L * A * R.transpose = diagonal d := by
  induction n with
  | zero =>
    have hunit : LowerUnit (1 : Matrix (Fin 0) (Fin 0) K) :=
      ⟨fun {i} _ _ => Fin.elim0 i, fun i => Fin.elim0 i⟩
    exact ⟨1, 1, fun i => Fin.elim0 i, hunit, hunit, Subsingleton.elim _ _⟩
  | succ n ih =>
    let e : Fin n ⊕ Fin 1 ≃ Fin (n + 1) := finSumFinEquiv
    let join := Matrix.reindexRingEquiv K e
    let split := join.symm A
    let B := leadingBlock A n (Nat.le_succ n)
    let b := split.toBlocks₁₂
    let c := split.toBlocks₂₁
    let z := split.toBlocks₂₂
    have hsplit : fromBlocks B b c z = split := fromBlocks_toBlocks split
    have hdet : IsUnit B.det := (h n (Nat.le_succ n)).isUnit
    have hB : ∀ k (hk : k ≤ n), (leadingBlock B k hk).det ≠ 0 := by
      intro k hk
      exact h k (hk.trans (Nat.le_succ n))
    obtain ⟨L, R, d, hL, hR, hDiag⟩ := ih B hB
    let l : Matrix (Fin n ⊕ Fin 1) (Fin n ⊕ Fin 1) K := fromBlocks L 0 (-(c * B⁻¹)) 1
    let r : Matrix (Fin n ⊕ Fin 1) (Fin n ⊕ Fin 1) K := fromBlocks R 0 (-(B⁻¹ * b)).transpose 1
    let rem := -(c * B⁻¹) * b + z
    have hleft : l * split = fromBlocks (L * B) (L * b) 0 rem := by
      rw [← hsplit]
      simp [l, rem, fromBlocks_multiply, Matrix.nonsing_inv_mul_cancel_right B c hdet]
    have hright : l * split * r.transpose = fromBlocks (diagonal d) 0 0 rem := by
      rw [hleft]
      have hcancel : -((L * B) * (B⁻¹ * b)) + L * b = 0 := by
        simp [Matrix.mul_assoc, Matrix.mul_nonsing_inv_cancel_left B b hdet]
      simp [r, fromBlocks_transpose, fromBlocks_multiply, hDiag, hcancel]
    have htranspose : (join r).transpose = join r.transpose := rfl
    have hjoin : join split = A := join.apply_symm_apply A
    refine ⟨join l, join r, Sum.elim d (fun i => rem i i) ∘ e.symm,
      border_lowerUnit L hL _, border_lowerUnit R hR _, ?_⟩
    rw [htranspose, ← hjoin, ← map_mul, ← map_mul, hright, border_diagonal]
    exact Matrix.submatrix_diagonal_equiv _ e.symm

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  let axioms ← collectAxioms ``diagonalize_of_leading_minors
  for name in axioms do
    unless allowed.contains name do throwError "diagonalize_of_leading_minors uses disallowed axiom {name}"
  logInfo m!"diagonalize_of_leading_minors uses {axioms}"

end RamifiedDiagonalizationAudit
