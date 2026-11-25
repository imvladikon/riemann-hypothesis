module

import Lean
import Main

open Lean Elab Command

run_cmd do
  let allowed := #[``propext, ``Classical.choice, ``Quot.sound]
  for decl in #[``riemannHypothesis, ``riemannZeta_eq_zero_re,
      ``LFunction_ne_zero_of_half_lt_re, ``LFunction_eq_zero_re,
      ``LFunction_eq_zero_re_of_isPrimitive] do
    let axioms ← collectAxioms decl
    for name in axioms do
      unless allowed.contains name do
        throwError "{decl} uses disallowed axiom {name}"
    logInfo m!"{decl} uses {axioms}"
