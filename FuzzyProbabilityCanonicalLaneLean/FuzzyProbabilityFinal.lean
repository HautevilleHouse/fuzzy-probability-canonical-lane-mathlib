import canonicalLaneMathlib.AdmissibleClass
import FuzzyProbabilityCanonicalLaneLean.ProbabilitySpace
import FuzzyProbabilityCanonicalLaneLean.MartingaleConvergence
import FuzzyProbabilityCanonicalLaneLean.StochasticCalculus
import FuzzyProbabilityCanonicalLaneLean.LimitTheorems

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

def ConstrainedFuzzyProbabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem fuzzy_probability_endgame (A : AdmissibleClass) :
    ConstrainedFuzzyProbabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse