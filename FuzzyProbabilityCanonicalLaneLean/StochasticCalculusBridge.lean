import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyProbabilityCanonicalLaneLean.LimitTheoremPackage

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure StochasticCalculusPackage where
  brownianMotion : Prop
  itoIntegral : Prop
  stochasticDifferential : Prop
  itoFormula : Prop

structure StochasticCalculusEvidence (S : StochasticCalculusPackage) where
  brownianMotionClosed : S.brownianMotion
  itoIntegralClosed : S.itoIntegral
  stochasticDifferentialClosed : S.stochasticDifferential
  itoFormulaClosed : S.itoFormula

def StochasticCalculusClosed (S : StochasticCalculusPackage) : Prop :=
  S.brownianMotion ∧ S.itoIntegral ∧
  S.stochasticDifferential ∧ S.itoFormula

theorem stochastic_calculus_closed_from_evidence
    (S : StochasticCalculusPackage) (E : StochasticCalculusEvidence S) :
    StochasticCalculusClosed S := by
  exact And.intro E.brownianMotionClosed
    (And.intro E.itoIntegralClosed
      (And.intro E.stochasticDifferentialClosed E.itoFormulaClosed))

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FuzzyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse