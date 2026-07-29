import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure MartingaleConvergencePackage where
  adaptedFiltration : Type u
  martingaleProcess : Type v
  integrabilityCondition : Prop
  convergenceInProbability : Prop
  almostSureConvergence : Prop
  limitIdentified : Prop

structure MartingaleConvergenceEvidence (M : MartingaleConvergencePackage) where
  integrabilityConditionClosed : M.integrabilityCondition
  convergenceInProbabilityClosed : M.convergenceInProbability
  almostSureConvergenceClosed : M.almostSureConvergence
  limitIdentifiedClosed : M.limitIdentified

def MartingaleConvergenceClosed (M : MartingaleConvergencePackage) : Prop :=
  M.integrabilityCondition ∧ M.convergenceInProbability ∧ M.almostSureConvergence ∧ M.limitIdentified

theorem martingale_convergence_closed_from_evidence (M : MartingaleConvergencePackage) (E : MartingaleConvergenceEvidence M) :
    MartingaleConvergenceClosed M := by
  exact And.intro E.integrabilityConditionClosed
    (And.intro E.convergenceInProbabilityClosed
      (And.intro E.almostSureConvergenceClosed E.limitIdentifiedClosed))

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse
