import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure FuzzyProbabilitySpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  fuzzyMeasure : (Set carrier) → ℝ
  measureZeroEmpty : fuzzyMeasure ∅ = 0
  measureNonNegative : ∀ s, fuzzyMeasure s ≥ 0
  measureOneFull : fuzzyMeasure carrier = 1
  monotonicity : ∀ s t, s ⊆ t → fuzzyMeasure s ≤ fuzzyMeasure t

structure FuzzyProbabilityAdmittedObject where
  space : FuzzyProbabilitySpace
  filtration : ℕ → Set (Set (space.carrier))
  adaptedFuzzyMeasure : ℕ → (Set (space.carrier)) → ℝ
  martingaleProperty : ∀ n, ∀ s ∈ filtration n, adaptedFuzzyMeasure n s = adaptedFuzzyMeasure (n+1) s
  conclusion : MartingaleConvergence holds

def FuzzyWitnessClosed (O : FuzzyProbabilityAdmittedObject) : Prop :=
  O.conclusion

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse