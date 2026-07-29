import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.probabilityAxioms.1

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse