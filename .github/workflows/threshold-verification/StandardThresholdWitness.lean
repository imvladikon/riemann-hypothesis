module

import Lean
import all Development.AutomorphicArithmetic.CharacterBoxes.ObjCTrue

open Lean Meta Elab Command
open Formalism.MainNotions Formalism.MainNotions.Inhab GlobalTheory.EX

namespace StandardThresholdWitness

noncomputable def previousWitness (K K0 : TransportedAlt) (CT2 C8 : ℝ) : FC :=
  let p := max 1000 (max K.pre K0.pre)
  let out := (stdConst CT2 C8 p 0 0).cOut
  let m := max 1 (max (K.mid out) (K0.mid out))
  let Cmid := stdConst CT2 C8 p m 0
  let input := Cmid.cOut ++ Cmid.cMid m
  let l := max 1 (max (K.last input) (K0.last input))
  stdConst CT2 C8 p m l

run_cmd do
  liftTermElabM do
    let chooserName := ``GlobalTheory.EX.exists_std_large
    let some chooser := ((← getEnv).setExporting false).find? chooserName
      | throwError "missing {chooserName}"
    let some proof := chooser.value? true
      | throwError "no proof available for {chooserName}"
    let arity ← forallTelescope chooser.type fun args _ => pure args.size
    let witnessName := ``previousWitness
    forallTelescope (← getConstInfo witnessName).type fun args _ => do
      let chooserArgs ← match arity with
        | 5 => pure args
        | 4 => pure #[mkApp2 (mkConst ``TransportedAlt.sup) args[0]! args[1]!, args[2]!, args[3]!]
        | _ => throwError "unexpected arity {arity} for {chooserName}"
      let choice := mkAppN (mkConst chooserName) chooserArgs
      let type ← whnf (← inferType choice)
      unless type.isForall do throwError "missing the bound on C8"
      withLocalDeclD `h8 type.bindingDomain! fun h8 => do
        let result ← whnf (mkAppN proof (chooserArgs.push h8))
        unless result.getAppFn.isConstOf ``Exists.intro do
          throwError "expected an explicit witness for {chooserName}"
        let actual := result.getAppArgs[2]!
        let expected := mkAppN (mkConst witnessName) args
        let target ← mkEq actual expected
        Lean.addDecl (.thmDecl {
          name := `StandardThresholdWitness.actual_eq_previous
          levelParams := []
          type := ← mkForallFVars (args.push h8) target
          value := ← mkLambdaFVars (args.push h8) (← mkEqRefl actual)
        })
        logInfo m!"Checked the explicit standard witness for the chooser of arity {arity}"

end StandardThresholdWitness
