module

import Lean
import Mathlib.Combinatorics.Young.YoungDiagram
import all RamifiedDiagonalizationAudit
import all RamifiedMatrixPairingAudit

open Lean Elab Command MvPolynomial
open RamifiedDiagonalCutoffAudit RamifiedDiagonalizationAudit
open RamifiedLinearSubstitutionAudit RamifiedMatrixPairingAudit
open scoped BigOperators

namespace RamifiedFlagMinorsAudit

variable {K : Type} [Field K] {n m : ℕ}

noncomputable def flagMinor (s : Bool) (k : ℕ) (hk : k ≤ n) (I : Fin k → Fin m) :
    MvPolynomial (Var (Fin n) (Fin m)) K :=
  (Matrix.of fun i j : Fin k => X (s, Fin.castLE hk i, I j)).det

theorem colLen_le_height {α : YoungDiagram} (h : α.colLen 0 ≤ n) (c : ℕ) : α.colLen c ≤ n :=
  (α.colLen_anti 0 c (Nat.zero_le c)).trans h

noncomputable def flagProduct (s : Bool) (α : YoungDiagram) (h : α.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m) :
    MvPolynomial (Var (Fin n) (Fin m)) K :=
  ∏ c : Fin (α.rowLen 0), flagMinor s (α.colLen c) (colLen_le_height h c) (I c)

private theorem sum_rowWeight (s t : Bool) (k : ℕ) (hk : k ≤ n) (r : Fin n) :
    (∑ i : Fin k, if s = t ∧ Fin.castLE hk i = r then (1 : ℕ) else 0) =
      if s = t ∧ r.val < k then 1 else 0 := by
  by_cases hst : s = t
  · simp only [hst, true_and]
    by_cases hr : r.val < k
    · let j : Fin k := ⟨r.val, hr⟩
      have heq (i : Fin k) : Fin.castLE hk i = r ↔ i = j := by
        simp only [Fin.ext_iff, Fin.val_castLE]
        rfl
      simp [heq, hr]
    · have hne (i : Fin k) : Fin.castLE hk i ≠ r := by
        intro heq
        exact hr (heq ▸ i.isLt)
      simp [hne, hr]
  · simp [hst]

theorem flagMinor_weighted (s t : Bool) (k : ℕ) (hk : k ≤ n) (I : Fin k → Fin m) (r : Fin n) :
    IsWeightedHomogeneous (rowWeight t r) (flagMinor (K := K) s k hk I)
      (if s = t ∧ r.val < k then 1 else 0) := by
  classical
  rw [flagMinor, Matrix.det_apply']
  apply IsWeightedHomogeneous.sum
  intro π _
  have hprod := IsWeightedHomogeneous.prod
    (Finset.univ : Finset (Fin k))
    (fun i => X (s, Fin.castLE hk (π i), I i) : Fin k → MvPolynomial (Var (Fin n) (Fin m)) K)
    (fun i => rowWeight t r (s, Fin.castLE hk (π i), I i))
    (fun i _ => isWeightedHomogeneous_X K (rowWeight t r) _)
  have hdeg : (∑ i : Fin k, rowWeight t r (s, Fin.castLE hk (π i), I i)) =
      if s = t ∧ r.val < k then 1 else 0 := by
    calc
      _ = ∑ j : Fin k, if s = t ∧ Fin.castLE hk j = r then (1 : ℕ) else 0 :=
        Equiv.sum_comp π (fun j => if s = t ∧ Fin.castLE hk j = r then (1 : ℕ) else 0)
      _ = _ := sum_rowWeight s t k hk r
  rw [hdeg] at hprod
  simpa only [Matrix.of_apply, map_intCast] using hprod.C_mul (Equiv.Perm.sign π : ℤ)

private theorem count_row_through_cols (α : YoungDiagram) (r : ℕ) :
    (∑ c : Fin (α.rowLen 0), if r < α.colLen c then (1 : ℕ) else 0) = α.rowLen r := by
  classical
  have hcell (c : Fin (α.rowLen 0)) : r < α.colLen c ↔ c.val < α.rowLen r :=
    YoungDiagram.mem_iff_lt_colLen.symm.trans YoungDiagram.mem_iff_lt_rowLen
  simp only [hcell, Finset.sum_boole]
  let cells := (Finset.univ : Finset (Fin (α.rowLen 0))).filter (fun c => c.val < α.rowLen r)
  have heq : cells.image Fin.val = Finset.range (α.rowLen r) := by
    ext c
    simp only [cells, Finset.mem_image, Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_range]
    constructor
    · rintro ⟨i, hi, rfl⟩
      exact hi
    · intro hc
      exact ⟨⟨c, hc.trans_le (α.rowLen_anti 0 r (Nat.zero_le _))⟩, hc, rfl⟩
  calc
    cells.card = (cells.image Fin.val).card := (Finset.card_image_of_injective _ Fin.val_injective).symm
    _ = α.rowLen r := by rw [heq, Finset.card_range]

theorem flagProduct_weighted (s t : Bool) (α : YoungDiagram) (h : α.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m) (r : Fin n) :
    IsWeightedHomogeneous (rowWeight t r) (flagProduct (K := K) s α h I)
      (if s = t then α.rowLen r else 0) := by
  have hprod := IsWeightedHomogeneous.prod
    (Finset.univ : Finset (Fin (α.rowLen 0)))
    (fun c => flagMinor (K := K) s (α.colLen c) (colLen_le_height h c) (I c))
    (fun c => if s = t ∧ r.val < α.colLen c then (1 : ℕ) else 0)
    (fun c _ => flagMinor_weighted s t (α.colLen c) (colLen_le_height h c) (I c) r)
  change IsWeightedHomogeneous _
    (∏ c : Fin (α.rowLen 0), flagMinor s (α.colLen c) (colLen_le_height h c) (I c)) _
  by_cases hst : s = t
  · simp only [hst, true_and, ite_true] at hprod ⊢
    rwa [count_row_through_cols] at hprod
  · simpa [hst] using hprod

theorem flagMinor_rowChange (L : Bool → Matrix (Fin n) (Fin n) K)
    (s : Bool) (hL : LowerUnit (L s)) (k : ℕ) (hk : k ≤ n) (I : Fin k → Fin m) :
    linearSubstitution (rowChange L) (flagMinor s k hk I) = flagMinor s k hk I := by
  classical
  let A : Matrix (Fin k) (Fin k) (MvPolynomial (Var (Fin n) (Fin m)) K) :=
    Matrix.of fun i j => X (s, Fin.castLE hk i, I j)
  let B := leadingBlock (L s) k hk
  let S := linearSubstitution (rowChange (κ := Fin m) L)
  have hmat : S.toRingHom.mapMatrix A = C.mapMatrix B * A := by
    apply Matrix.ext
    intro i j
    change S (X (s, Fin.castLE hk i, I j)) =
      ∑ a : Fin k, C (L s (Fin.castLE hk i) (Fin.castLE hk a)) * X (s, Fin.castLE hk a, I j)
    rw [show S (X (s, Fin.castLE hk i, I j)) = _ from rowChange_X L s _ _]
    have hrestrict : ∑ a ∈ Finset.univ.image (Fin.castLE hk),
        C (L s (Fin.castLE hk i) a) * X (s, a, I j) =
        ∑ a : Fin n, C (L s (Fin.castLE hk i) a) * X (s, a, I j) := by
      apply Finset.sum_subset (Finset.subset_univ _)
      intro a _ ha
      have hak : k ≤ a.val := by
        by_contra! h
        exact ha (Finset.mem_image.mpr ⟨⟨a.val, h⟩, Finset.mem_univ _, Fin.ext rfl⟩)
      have hia : Fin.castLE hk i < a := by
        change i.val < a.val
        exact lt_of_lt_of_le i.isLt hak
      have hzero : L s (Fin.castLE hk i) a = 0 := hL.1 hia
      simp [hzero]
    rw [← hrestrict, Finset.sum_image (Fin.castLE_injective hk).injOn]
  have htri : B.IsLowerTriangular := by
    intro i j hij
    exact hL.1 (show Fin.castLE hk i < Fin.castLE hk j from hij)
  have hdet : B.det = 1 := by
    rw [Matrix.det_of_isLowerTriangular B htri]
    exact Finset.prod_eq_one (fun i _ => hL.2 (Fin.castLE hk i))
  change S A.det = A.det
  change S.toRingHom A.det = A.det
  rw [RingHom.map_det S.toRingHom, hmat, Matrix.det_mul, ← RingHom.map_det, hdet, map_one, one_mul]

theorem flagProduct_rowChange (L : Bool → Matrix (Fin n) (Fin n) K)
    (s : Bool) (hL : LowerUnit (L s)) (α : YoungDiagram) (h : α.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m) :
    linearSubstitution (rowChange L) (flagProduct s α h I) = flagProduct s α h I := by
  simp only [flagProduct, map_prod, flagMinor_rowChange L s hL]

/-- Pair contractions of the two flag-minor products vanish above their common row budget. -/
theorem flagProducts_vanish_above_intersection (C : Matrix (Fin n) (Fin n) K)
    (hleading : ∀ k (hk : k ≤ n), (leadingBlock C k hk).det ≠ 0)
    (α β : YoungDiagram) (hα : α.colLen 0 ≤ n) (hβ : β.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m)
    (J : ∀ c : Fin (β.rowLen 0), Fin (β.colLen c) → Fin m)
    (j : ℕ) (hj : (∑ i : Fin n, min (α.rowLen i) (β.rowLen i)) < j) :
    (matrixDerivative C ^ j) (flagProduct false α hα I * flagProduct true β hβ J) = 0 := by
  obtain ⟨L, R, d, hL, hR, hdiag⟩ := diagonalize_of_leading_minors C hleading
  let T : Bool → Matrix (Fin n) (Fin n) K := fun s => if s then R else L
  let p := flagProduct (K := K) false α hα I * flagProduct true β hβ J
  let S := linearSubstitution (rowChange (κ := Fin m) T)
  have hfix : S p = p := by
    simp only [S, p, map_mul, flagProduct_rowChange T false hL, flagProduct_rowChange T true hR]
  have hzero : (diagonalDerivative d ^ j) p = 0 := by
    apply diagonal_vanishes_above_row_caps d p (fun i => α.rowLen i) (fun i => β.rowLen i) j hj
    intro q hq i
    have hweighted (t : Bool) :=
      (flagProduct_weighted (K := K) false t α hα I i).mul (flagProduct_weighted (K := K) true t β hβ J i)
    constructor
    · have h := hweighted false (mem_support_iff.mp hq)
      simp [rowDegree, h]
    · have h := hweighted true (mem_support_iff.mp hq)
      simp [rowDegree, h]
  change (matrixDerivative C ^ j) p = 0
  rw [← hfix, matrixDerivative_pow_rowChange, show T false * C * (T true).transpose = Matrix.diagonal d from hdiag,
    matrixDerivative_diagonal, hzero, map_zero]

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``flagProduct_weighted, ``flagProduct_rowChange, ``flagProducts_vanish_above_intersection] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedFlagMinorsAudit
