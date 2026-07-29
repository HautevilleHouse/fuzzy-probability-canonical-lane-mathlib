import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : carrier → ℝ -- Pointwise density
  totalMassOne : probabilityMeasure = 1.0
  sigmaAdditive : Prop

structure ProbabilitySpaceEvidence (P : ProbabilitySpace) where
  totalMassOneClosed : P.totalMassOne
  sigmaAdditiveClosed : P.sigmaAdditive

def ProbabilitySpaceClosed (P : ProbabilitySpace) : Prop :=
  P.totalMassOne ∧ P.sigmaAdditive

theorem probability_space_closed_from_evidence (P : ProbabilitySpace) (E : ProbabilitySpaceEvidence P) :
    ProbabilitySpaceClosed P := by
  exact And.intro E.totalMassOneClosed E.sigmaAdditiveClosed

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse