import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure StochasticCalculusPackage where
  semimartingaleDecomposition : Type u
  stochasticIntegralDefined : Prop
  quadraticVariationExists : Prop
  itoFormulaHolds : Prop
  integrationByParts : Prop

structure StochasticCalculusEvidence (S : StochasticCalculusPackage) where
  semimartingaleDecompositionClosed : S.semimartingaleDecomposition
  stochasticIntegralDefinedClosed : S.stochasticIntegralDefined
  quadraticVariationExistsClosed : S.quadraticVariationExists
  itoFormulaHoldsClosed : S.itoFormulaHolds
  integrationByPartsClosed : S.integrationByParts

def StochasticCalculusClosed (S : StochasticCalculusPackage) : Prop :=
  S.semimartingaleDecomposition ∧ S.stochasticIntegralDefined ∧
  S.quadraticVariationExists ∧ S.itoFormulaHolds ∧ S.integrationByParts

theorem stochastic_calculus_closed_from_evidence (S : StochasticCalculusPackage) (E : StochasticCalculusEvidence S) :
    StochasticCalculusClosed S := by
  exact And.intro E.semimartingaleDecompositionClosed
    (And.intro E.stochasticIntegralDefinedClosed
      (And.intro E.quadraticVariationExistsClosed
        (And.intro E.itoFormulaHoldsClosed E.integrationByPartsClosed)))

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse
