import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure DeferredAcceptanceAlgorithmPackage where
  participants : Type u
  proposalOrder : participants → participants → Prop
  algorithmConverges : Prop
  matchingStability : Prop

structure DeferredAcceptanceAlgorithmEvidence (P : DeferredAcceptanceAlgorithmPackage) where
  algorithmConvergesClosed : P.algorithmConverges
  matchingStabilityClosed : P.matchingStability

def DeferredAcceptanceAlgorithmClosed (P : DeferredAcceptanceAlgorithmPackage) : Prop :=
  P.algorithmConverges ∧ P.matchingStability

theorem deferred_acceptance_algorithm_closed_from_evidence
    (P : DeferredAcceptanceAlgorithmPackage) (E : DeferredAcceptanceAlgorithmEvidence P) :
    DeferredAcceptanceAlgorithmClosed P := by
  exact And.intro E.algorithmConvergesClosed E.matchingStabilityClosed

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse