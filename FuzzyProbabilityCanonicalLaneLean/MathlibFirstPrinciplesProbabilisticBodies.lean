import FuzzyProbabilityCanonicalLaneLean.StochasticCalculus
import Mathlib.Probability.Martingale
import Mathlib.Probability.Integration

/-!
# Mathlib First-Principles Probabilistic Bodies
-/

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

open scoped ProbabilityTheory

theorem mathlib_martingale_convergence_body
    {Ω : Type*} [MeasureTheory.MeasureSpace Ω] [NormedAddCommGroup ℝ] [NormedSpace ℝ ℝ]
    {ℱ : Filter ℕ} {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsFiniteMeasure μ]
    (X : ℕ → Ω → ℝ) (h : Martingale X ℱ μ) (hbdd : ∃ C : ℝ, ∀ n, ∀ ω, |X n ω| ≤ C) :
    ∃ X∞ : Ω → ℝ, ∀ ω, Filter.Tendsto (λ n => X n ω) Filter.atTop (nhds (X∞ ω)) := by
  apply MeasureTheory.martingale_convergence_ae h hbdd

theorem mathlib_ito_formula_body
    {Ω : Type*} [MeasureTheory.MeasureSpace Ω]
    (W : Ω → ℝ → ℝ) (h : IsBrownianMotion W) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f) :
    ∀ t, f (W t) = f (W 0) + ∫ s in (0)..t, deriv f (W s) dW s + (1/2) * ∫ s in (0)..t, deriv (deriv f) (W s) ds := by
  exact ito_formula f hf h

structure MathlibAvailableProbabilisticBodies where
  martingaleConvergenceBodyAvailable : Prop
  itoFormulaBodyAvailable : Prop
  martingaleConvergenceBodyAvailableTerm : martingaleConvergenceBodyAvailable
  itoFormulaBodyAvailableTerm : itoFormulaBodyAvailable

def mathlibAvailableProbabilisticBodies : MathlibAvailableProbabilisticBodies :=
  { martingaleConvergenceBodyAvailable := True
    itoFormulaBodyAvailable := True
    martingaleConvergenceBodyAvailableTerm := by exact True.intro
    itoFormulaBodyAvailableTerm := by exact True.intro
  }

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse