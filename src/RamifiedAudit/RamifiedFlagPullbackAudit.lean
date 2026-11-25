module

import Lean
import Mathlib.RingTheory.Localization.FractionRing
import all RamifiedFlagMinorsAudit

open Lean Elab Command Module MvPolynomial
open RamifiedDiagonalCutoffAudit RamifiedDiagonalizationAudit RamifiedFlagMinorsAudit
open RamifiedLinearSubstitutionAudit RamifiedMatrixPairingAudit
open scoped BigOperators

namespace RamifiedFlagPullbackAudit

abbrev XV (n : ℕ) := Bool × ℕ × Fin n
abbrev ZV (n m : ℕ) := Var (Fin n) (Fin m)
abbrev Raw (n m : ℕ) := MvPolynomial (XV n ⊕ ZV n m) ℤ
abbrev Coeff (n : ℕ) := MvPolynomial (XV n) ℤ
variable {n m : ℕ} {K : Type} [Field K]

noncomputable def separate (f : Coeff n →+* K) : Raw n m →+* MvPolynomial (ZV n m) K :=
  (map f).comp
    ((sumAlgEquiv ℤ (ZV n m) (XV n)).toRingHom.comp
      (rename (Equiv.sumComm (XV n) (ZV n m))).toRingHom)

theorem separate_injective (f : Coeff n →+* K) (hf : Function.Injective f) :
    Function.Injective (separate (m := m) f) :=
  (MvPolynomial.map_injective _ hf).comp
    ((sumAlgEquiv ℤ (ZV n m) (XV n)).injective.comp
      (rename_injective _ (Equiv.sumComm (XV n) (ZV n m)).injective))

private theorem separate_X_left (f : Coeff n →+* K) (v : XV n) :
    separate f (X (.inl v) : Raw n m) = C (f (X v)) := by
  simp [separate, sumAlgEquiv_X_inr]

private theorem separate_X_right (f : Coeff n →+* K) (v : ZV n m) :
    separate f (X (.inr v) : Raw n m) = X v := by
  simp [separate, sumAlgEquiv_X_inl]

private theorem separate_pderiv (f : Coeff n →+* K) (v : ZV n m) (p : Raw n m) :
    separate f (pderiv (.inr v) p) = pderiv v (separate f p) := by
  let swap := Equiv.sumComm (XV n) (ZV n m)
  have h : pderiv (.inl v) (rename swap p) = rename swap (pderiv (.inr v) p) :=
    pderiv_rename swap.injective (.inr v) p
  change map f ((sumAlgEquiv ℤ (ZV n m) (XV n)) (rename swap (pderiv (.inr v) p))) =
    pderiv v (map f ((sumAlgEquiv ℤ (ZV n m) (XV n)) (rename swap p)))
  rw [pderiv_map, pderiv_sumAlgEquiv, h]

noncomputable def rawLap (n m : ℕ) : End ℤ (Raw n m) :=
  ∑ i : Fin n, ∑ j : Fin m,
    (pderiv (.inr (false, i, j))).toLinearMap * (pderiv (.inr (true, i, j))).toLinearMap

theorem rawLap_apply (p : Raw n m) :
    rawLap n m p = ∑ i : Fin n, ∑ j : Fin m,
      pderiv (.inr (false, i, j)) (pderiv (.inr (true, i, j)) p) := by simp [rawLap]

private theorem separate_rawLap_pow (f : Coeff n →+* K) (p : Raw n m) (r : ℕ) :
    separate f ((rawLap n m ^ r) p) =
      (matrixDerivative (1 : Matrix (Fin n) (Fin n) K) ^ r) (separate f p) := by
  have hstep (p' : Raw n m) : separate f (rawLap n m p') =
      matrixDerivative (1 : Matrix (Fin n) (Fin n) K) (separate f p') := by
    calc
      _ = diagonalDerivative (fun _ : Fin n => (1 : K)) (separate f p') := by
        rw [diagonalDerivative_apply, rawLap_apply]
        simp only [map_sum, separate_pderiv, map_one, one_mul]
      _ = _ := by rw [← matrixDerivative_diagonal, show Matrix.diagonal (fun _ : Fin n => (1 : K)) = 1
                                    from Matrix.diagonal_one]
  induction r with
  | zero => simp
  | succ r ih => simp only [pow_succ', mul_apply_eq_comp, hstep, ih]

noncomputable def coefficientMatrix (n : ℕ) (s : Bool) : Matrix (Fin n) (Fin n) (Coeff n) :=
  Matrix.of fun i a => X (s, i.val, a)

noncomputable def genericRows (f : Coeff n →+* K) (s : Bool) : Matrix (Fin n) (Fin n) K :=
  (coefficientMatrix n s).map f

theorem genericRows_leading (f : Coeff n →+* K) (hf : Function.Injective f) (k : ℕ) (hk : k ≤ n) :
    (leadingBlock (genericRows f false * (genericRows f true).transpose) k hk).det ≠ 0 := by
  let eval : Coeff n →+* ℤ :=
    eval₂Hom (RingHom.id ℤ) (fun v => if v.2.1 = v.2.2.val then 1 else 0)
  have hId (s : Bool) : (coefficientMatrix n s).map eval = 1 := by
    apply Matrix.ext
    intro i j
    simp [coefficientMatrix, eval, Matrix.one_apply, Fin.ext_iff]
  let B := coefficientMatrix n false * (coefficientMatrix n true).transpose
  have hB : B.map eval = 1 := by
    change (coefficientMatrix n false * (coefficientMatrix n true).transpose).map eval = 1
    rw [Matrix.map_mul, hId]
    change (1 : Matrix (Fin n) (Fin n) ℤ) * ((coefficientMatrix n true).map eval).transpose = 1
    rw [hId, Matrix.transpose_one, Matrix.mul_one]
  have hNat : (leadingBlock B k hk).det ≠ 0 := by
    intro h
    have hEval : eval (leadingBlock B k hk).det = 1 := by
      rw [eval.map_det]
      change (leadingBlock (B.map eval) k hk).det = 1
      rw [hB, leadingBlock, Matrix.submatrix_one _ (Fin.castLE_injective hk), Matrix.det_one]
    rw [h, map_zero] at hEval
    exact zero_ne_one hEval
  change (leadingBlock ((coefficientMatrix n false).map f * ((coefficientMatrix n true).transpose).map f)
    k hk).det ≠ 0
  rw [← Matrix.map_mul]
  change (f.mapMatrix (leadingBlock B k hk)).det ≠ 0
  rw [← f.map_det]
  intro h
  exact hNat (hf (h.trans f.map_zero.symm))

noncomputable def rawMinor (s : Bool) (k : ℕ) (I : Fin k → Fin m) : Raw n m :=
  (Matrix.of fun i j : Fin k =>
    ∑ a : Fin n, X (.inl (s, i.val, a)) * X (.inr (s, a, I j))).det

noncomputable def rawFlag (s : Bool) (α : YoungDiagram)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m) : Raw n m :=
  ∏ c : Fin (α.rowLen 0), rawMinor s (α.colLen c) (I c)

private theorem separate_matrixEntry (f : Coeff n →+* K) (s : Bool) (i : Fin n) (j : Fin m) :
    separate f (∑ a : Fin n, X (.inl (s, i.val, a)) * X (.inr (s, a, j))) =
      linearSubstitution (rowChange (genericRows f)) (X (s, i, j)) := by
  calc
    _ = ∑ a : Fin n, C (genericRows f s i a) * X (s, a, j) := by
      rw [map_sum]
      refine Finset.sum_congr rfl fun a _ => ?_
      exact ((separate f).map_mul _ _).trans
        (congrArg₂ (· * ·) (separate_X_left f (s, i.val, a)) (separate_X_right f (s, a, j)))
    _ = _ := (rowChange_X (genericRows f) s i j).symm

private theorem separate_rawMinor (f : Coeff n →+* K) (s : Bool) (k : ℕ) (hk : k ≤ n) (I : Fin k → Fin m) :
    separate f (rawMinor s k I : Raw n m) =
      linearSubstitution (rowChange (genericRows f)) (flagMinor s k hk I) := by
  let A : Matrix (Fin k) (Fin k) (Raw n m) := Matrix.of fun i j =>
    ∑ a : Fin n, X (.inl (s, i.val, a)) * X (.inr (s, a, I j))
  let B : Matrix (Fin k) (Fin k) (MvPolynomial (ZV n m) K) :=
    Matrix.of fun i j => X (s, Fin.castLE hk i, I j)
  let S := linearSubstitution (rowChange (κ := Fin m) (genericRows f))
  have hmatrix : (separate f).mapMatrix A = S.toRingHom.mapMatrix B :=
    Matrix.ext fun i j => separate_matrixEntry f s (Fin.castLE hk i) (I j)
  calc
    _ = ((separate f).mapMatrix A).det := (separate f).map_det A
    _ = (S.toRingHom.mapMatrix B).det := congrArg Matrix.det hmatrix
    _ = _ := (S.map_det B).symm

private theorem separate_rawFlag (f : Coeff n →+* K) (s : Bool) (α : YoungDiagram) (h : α.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m) :
    separate f (rawFlag s α I : Raw n m) =
      linearSubstitution (rowChange (genericRows f)) (flagProduct s α h I) := by
  simp only [rawFlag, flagProduct, map_prod, separate_rawMinor f s _ (colLen_le_height h _)]

private theorem rawLap_pow_vanishes_after_separating
    (f : Coeff n →+* K) (hf : Function.Injective f)
    (α β : YoungDiagram) (hα : α.colLen 0 ≤ n) (hβ : β.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m)
    (J : ∀ c : Fin (β.rowLen 0), Fin (β.colLen c) → Fin m)
    (r : ℕ) (hr : (∑ i : Fin n, min (α.rowLen i) (β.rowLen i)) < r) :
    (rawLap n m ^ r) (rawFlag false α I * rawFlag true β J) = 0 := by
  apply separate_injective f hf
  rw [separate_rawLap_pow, map_mul, separate_rawFlag f false α hα, separate_rawFlag f true β hβ, ← map_mul,
    matrixDerivative_pow_rowChange, Matrix.mul_one, map_zero]
  rw [flagProducts_vanish_above_intersection _ (genericRows_leading f hf) α β hα hβ I J r hr, map_zero]

/-- The intersection cutoff for the two-sided minors of XZ over the integers. -/
theorem rawLap_pow_vanishes_above_intersection
    (α β : YoungDiagram) (hα : α.colLen 0 ≤ n) (hβ : β.colLen 0 ≤ n)
    (I : ∀ c : Fin (α.rowLen 0), Fin (α.colLen c) → Fin m)
    (J : ∀ c : Fin (β.rowLen 0), Fin (β.colLen c) → Fin m)
    (r : ℕ) (hr : (∑ i : Fin n, min (α.rowLen i) (β.rowLen i)) < r) :
    (rawLap n m ^ r) (rawFlag false α I * rawFlag true β J) = 0 := by
  exact rawLap_pow_vanishes_after_separating (algebraMap (Coeff n) (FractionRing (Coeff n)))
    (IsFractionRing.injective (Coeff n) (FractionRing (Coeff n))) α β hα hβ I J r hr

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``separate_injective, ``genericRows_leading, ``rawLap_pow_vanishes_above_intersection] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"

end RamifiedFlagPullbackAudit
