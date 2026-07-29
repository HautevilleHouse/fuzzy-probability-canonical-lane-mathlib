import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure AdmissibleClass where
  object : FuzzyProbabilityObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse