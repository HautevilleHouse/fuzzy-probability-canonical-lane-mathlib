import FuzzyProbabilityCanonicalLaneLean.FuzzyProbabilityAdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure RandomProcessesPackage {Ω : Type u} [SigmaAlgebra Ω] (μ : Ω → ℝ) where
  stochasticProcess : ℝ → Ω → ℝ
  measurableProcess : ∀ t, measurable (stochasticProcess t) (sigmaAlgebra Ω)
  finiteDimensionalDistributions : (ℕ → ℝ) → Set (ℝ^ℕ) → ℝ
  kolmogorovExtension : ∀ (finiteDims : ℕ → ℝ → ℝ), ∃ μ_on_path, ∀ n, μ_on_path ∘ (λ f => (f 0, ..., f n)) = finiteDimensionalDistributions

structure RandomProcessesEvidence {Ω : Type u} [SigmaAlgebra Ω] {μ : Ω → ℝ}
    (P : RandomProcessesPackage μ) where
  kolmogorovExtensionClosed : P.kolmogorovExtension

def RandomProcessesClosed {Ω : Type u} [SigmaAlgebra Ω] {μ : Ω → ℝ}
    (P : RandomProcessesPackage μ) : Prop :=
  P.kolmogorovExtension

theorem random_processes_closed_from_evidence {Ω : Type u} [SigmaAlgebra Ω] {μ : Ω → ℝ}
    (P : RandomProcessesPackage μ) (E : RandomProcessesEvidence P) :
    RandomProcessesClosed P := by
  exact E.kolmogorovExtensionClosed

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse