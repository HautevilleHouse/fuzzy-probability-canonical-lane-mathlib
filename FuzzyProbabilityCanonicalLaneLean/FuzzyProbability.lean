import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure FuzzyProbabilityObject where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set (sampleSpace))
  measure : (Set (sampleSpace)) → ℝ
  probabilityAxioms : measure (Set.univ) = 1 ∧ (∀ s, 0 ≤ measure s) ∧ (∀ f : ℕ → Set (sampleSpace), Pairwise (fun i j => Disjoint (f i) (f j)) → measure (⋃ i, f i) = ∑' i, measure (f i))

def FuzzyWitnessClosed (O : FuzzyProbabilityObject) : Prop :=
  O.probabilityAxioms.1 ∧ O.probabilityAxioms.2.1

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse