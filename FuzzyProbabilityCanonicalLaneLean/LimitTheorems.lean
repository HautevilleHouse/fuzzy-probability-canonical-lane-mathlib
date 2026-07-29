import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuzzyProbabilityCanonicalLaneLean

structure LimitTheoremsPackage where
  lawOfLargeNumbers : Prop
  centralLimitTheorem : Prop
  largeDeviationsPrinciple : Prop
  fuzzyWeakConvergence : Prop

structure LimitTheoremsEvidence (L : LimitTheoremsPackage) where
  lawOfLargeNumbersClosed : L.lawOfLargeNumbers
  centralLimitTheoremClosed : L.centralLimitTheorem
  largeDeviationsPrincipleClosed : L.largeDeviationsPrinciple
  fuzzyWeakConvergenceClosed : L.fuzzyWeakConvergence

def LimitTheoremsClosed (L : LimitTheoremsPackage) : Prop :=
  L.lawOfLargeNumbers ∧ L.centralLimitTheorem ∧ L.largeDeviationsPrinciple ∧ L.fuzzyWeakConvergence

theorem limit_theorems_closed_from_evidence (L : LimitTheoremsPackage) (E : LimitTheoremsEvidence L) :
    LimitTheoremsClosed L := by
  exact And.intro E.lawOfLargeNumbersClosed
    (And.intro E.centralLimitTheoremClosed
      (And.intro E.largeDeviationsPrincipleClosed E.fuzzyWeakConvergenceClosed))

end FuzzyProbabilityCanonicalLaneLean
end HautevilleHouse
