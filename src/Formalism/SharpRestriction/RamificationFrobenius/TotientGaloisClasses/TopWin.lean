module

public import Formalism.SharpRestriction.RamificationFrobenius.TotientGaloisClasses.TopDefs
public import Formalism.SharpRestriction.RamificationFrobenius.TotientGaloisClasses.Window

@[expose] public section

noncomputable section

open Formalism.BasicNotions Formalism.MainNotions

namespace Formalism.HC

theorem windows_iff {eps : ℝ} (Fm : FamCore eps) (la : ℝ) : Fm.Windows la ↔ HasWindows Fm.Win la := Iff.rfl

/-- Arbitrarily late windows with bounds for every exponent above one half exclude zeros
to the right of one half. -/
theorem level_of_small_window_bounds {Λ : Level} {la : ℝ} (hB : Λ.FormBAt la)
    (h : ∀ δ : ℝ, 0 < δ → HasWindows {x | Λ.Gm x ≤ x ^ ((1 : ℝ) / 2 + δ)} la) :
    Λ.ZeroFreeLevel := by
  intro ψ hψ s hs
  let δ := min (s.re - 1 / 2) (1 / 2) / 2
  have hδ : 0 < δ := half_pos (lt_min (by linarith) (by norm_num))
  have hm₁ := min_le_left (s.re - 1 / 2) (1 / 2)
  have hm₂ := min_le_right (s.re - 1 / 2) (1 / 2)
  exact hB (1 / 2 + δ) (by linarith) (by dsimp [δ]; linarith) (h δ hδ) ψ hψ s
    (by dsimp [δ]; linarith)

section

variable {Fam : ℝ → Type 1} (core : ∀ {eps : ℝ}, Fam eps → FamCore eps)
  (Tied : ∀ {eps : ℝ}, Fam eps → (eD eL K cHH eK CL x : ℝ) → Prop)

def ChebyshevInequalityOnFamilyWindows {eps : ℝ} (Fm : Fam eps) (eD eL : ℝ) : Prop :=
  ∃ K cHH eK CL x0 : ℝ, ∀ x ≥ x0, x ∈ (core Fm).Win → Tied Fm eD eL K cHH eK CL x

def ChebyshevInequalityOnWindows (Λ : Level) : Prop :=
  ∀ (eD eL eps : ℝ), 0 < eps → ∀ Fm : Fam eps, EFamC Λ (core Fm) → ChebyshevInequalityOnFamilyWindows @core @Tied Fm eD eL →
    ∃ x1 : ℝ, ∀ x ≥ x1, x ∈ (core Fm).Win → Λ.Gm x ≤ x ^ ((1 : ℝ) / 2 + (eD + eL + 7) * eps)

def ChebyshevInequalityAtWindowScale (la : ℝ) (Λ : Level) : Prop :=
  ∃ eD eL ε₁ : ℝ, 0 < ε₁ ∧ ∀ eps : ℝ, 0 < eps → eps < ε₁ → ∃ Fm : Fam eps, EFamC Λ (core Fm) ∧
    (core Fm).Windows la ∧ ChebyshevInequalityOnFamilyWindows @core @Tied Fm eD eL

variable {TransportedAlt : Type} (P : ∀ {eps : ℝ}, Fam eps → TransportedAlt → Prop) (HypV : ∀ {eps : ℝ}, FamCore eps → Prop)

variable {core Tied P HypV}

theorem exists_small_eps (C : ℝ) {δ ε₁ : ℝ} (hδ : 0 < δ) (h1 : 0 < ε₁) : ∃ ε : ℝ, 0 < ε ∧ ε < ε₁ ∧ C * ε ≤ δ := by
  have hp : 0 < |C| + 1 := by positivity
  have h0 : 0 < min (ε₁ / 2) (δ / (|C| + 1)) := lt_min (by linarith) (div_pos hδ hp)
  refine ⟨_, h0, lt_of_le_of_lt (min_le_left _ _) (by linarith), ?_⟩
  have a1 := mul_le_mul_of_nonneg_right (le_abs_self C) h0.le
  have a2 : min (ε₁ / 2) (δ / (|C| + 1)) ≤ δ / (|C| + 1) := min_le_right _ _
  rw [le_div_iff₀ hp] at a2
  nlinarith

/-- A family of window bounds with exponents tending to one half gives a zero-free level. -/
theorem level_of_family_window_bounds {Λ : Level} {la C ε₁ : ℝ} (hB : Λ.FormBAt la)
    (hε₁ : 0 < ε₁) (h : ∀ eps : ℝ, 0 < eps → eps < ε₁ → ∃ W : Set ℝ, HasWindows W la ∧
      ∃ x₀ : ℝ, ∀ x ≥ x₀, x ∈ W → Λ.Gm x ≤ x ^ ((1 : ℝ) / 2 + C * eps)) : Λ.ZeroFreeLevel := by
  refine level_of_small_window_bounds hB fun δ hδ => ?_
  obtain ⟨eps, heps, hsmall, hexp⟩ := exists_small_eps C hδ hε₁
  obtain ⟨W, hW, x₀, hx₀⟩ := h eps heps hsmall
  exact hW.mono (x0 := max x₀ 1) fun x hx hw =>
    (hx₀ x (le_of_max_le_left hx) hw).trans
      (Real.rpow_le_rpow_of_exponent_le (le_of_max_le_right hx) (by linarith))

theorem level_of_tiedWin {Λ : Level} {la : ℝ} (h112 : ChebyshevInequalityOnWindows @core @Tied Λ) (hB : Λ.FormBAt la)
    (h : ChebyshevInequalityAtWindowScale @core @Tied la Λ) : Λ.ZeroFreeLevel := by
  obtain ⟨eD, eL, ε₁, hε₁, h⟩ := h
  refine level_of_family_window_bounds hB hε₁ (C := eD + eL + 7) fun eps heps hsmall => ?_
  obtain ⟨Fm, hE, hW, hT⟩ := h eps heps hsmall
  exact ⟨_, (windows_iff _ la).1 hW, h112 eD eL eps heps Fm hE hT⟩

theorem zeroFreeOn_of_tiedWin {Q : PChar → Prop}
    (h : ∀ ψ, Q ψ → ∃ (Λ : Level) (la : ℝ), ψ ∈ Λ.KEPT ∧ 1 < la ∧ ChebyshevInequalityOnWindows @core @Tied Λ ∧ Λ.FormB ∧
      ChebyshevInequalityAtWindowScale @core @Tied la Λ) : ZeroFreeOn Q :=
  zeroFreeOn_of_levels fun ψ hψ => by
    obtain ⟨Λ, la, a, b, c, d, e⟩ := h ψ hψ
    exact ⟨Λ, a, level_of_tiedWin c (d la b) e⟩

theorem zeroFreeOn_of_tiedWin_cyc {Q : PChar → Prop} {la : ℝ} (hla : 1 < la)
    (h112 : ∀ ψ, Q ψ → ChebyshevInequalityOnWindows @core @Tied (Level.cyc ψ)) (hB : ∀ ψ, Q ψ → (Level.cyc ψ).FormB)
    (h : ∀ ψ, Q ψ → ChebyshevInequalityAtWindowScale @core @Tied la (Level.cyc ψ)) : ZeroFreeOn Q :=
  zeroFreeOn_of_tiedWin fun ψ hψ => ⟨_, la, Level.mem_cyc ψ, hla, h112 ψ hψ, hB ψ hψ, h ψ hψ⟩

end

end Formalism.HC

end
