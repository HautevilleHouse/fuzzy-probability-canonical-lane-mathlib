import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure FuzzyProbabilityAdmissibleObject where
  probabilitySpace : Type u
  sigmaAlgebra : Set (Set probabilitySpace)
  measure : probabilitySpace → ℝ
  measureNonnegative : ∀ s, 0 ≤ measure s
  measureCountablyAdditive : ∀ (f : ℕ → Set probabilitySpace), (∀ i j, i ≠ j → f i ∩ f j = ∅) →
    measure (⋃ i, f i) = ∑' i, measure (f i)
  totalMeasureOne : measure (Set.univ : Set probabilitySpace) = 1

structure FuzzyProbabilityAdmittedObject where
  object : FuzzyProbabilityAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def FuzzyProbabilityWitnessClosed (O : FuzzyProbabilityAdmittedObject) : Prop :=
  O.endpointSatisfied ∨ O.remainderRecorded

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse