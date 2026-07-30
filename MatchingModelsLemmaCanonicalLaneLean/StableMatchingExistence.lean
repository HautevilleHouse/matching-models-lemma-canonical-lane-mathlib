import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure StableMatchingExistencePackage where
  setA : Type u
  setB : Type v
  preferenceA : setA → setB → ℕ
  preferenceB : setB → setA → ℕ
  stableMatchingExists : Prop
  paretoOptimal : Prop

structure StableMatchingExistenceEvidence (P : StableMatchingExistencePackage) where
  stableMatchingExistsClosed : P.stableMatchingExists
  paretoOptimalClosed : P.paretoOptimal

def StableMatchingExistenceClosed (P : StableMatchingExistencePackage) : Prop :=
  P.stableMatchingExists ∧ P.paretoOptimal

theorem stable_matching_existence_closed_from_evidence
    (P : StableMatchingExistencePackage) (E : StableMatchingExistenceEvidence P) :
    StableMatchingExistenceClosed P := by
  exact And.intro E.stableMatchingExistsClosed E.paretoOptimalClosed

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse