import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.MatchingModelBase
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.ContractTermsPackage
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.SettlementAlgorithm

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure MatchingLemmaEndgamePackage {C : ContractTermsPackage} {S : SettlementAlgorithm C} (M : MatchingModelBase) where
  matchingSuccessful : Prop
  contractTermsSatisfied : C.participants = M.participantSet
  settlementAlgorithmApplied : SettlementAlgorithm C
  outcomeDisputeFree : Prop
  finalSettlementConfirmed : Prop

structure MatchingLemmaEvidence {C : ContractTermsPackage} {S : SettlementAlgorithm C} {M : MatchingModelBase}
    (P : MatchingLemmaEndgamePackage C S M) where
  matchingSuccessfulClosed : P.matchingSuccessful
  contractTermsSatisfiedClosed : P.contractTermsSatisfied
  settlementAlgorithmAppliedClosed : SettlementAlgorithmClosed P.settlementAlgorithmApplied
  outcomeDisputeFreeClosed : P.outcomeDisputeFree
  finalSettlementConfirmedClosed : P.finalSettlementConfirmed

def MatchingLemmaClosed {C : ContractTermsPackage} {S : SettlementAlgorithm C} {M : MatchingModelBase}
    (P : MatchingLemmaEndgamePackage C S M) : Prop :=
  P.matchingSuccessful ∧ P.contractTermsSatisfied ∧
  SettlementAlgorithmClosed P.settlementAlgorithmApplied ∧
  P.outcomeDisputeFree ∧ P.finalSettlementConfirmed

theorem matching_lemma_closed_from_evidence {C : ContractTermsPackage} {S : SettlementAlgorithm C} {M : MatchingModelBase}
    (P : MatchingLemmaEndgamePackage C S M) (E : MatchingLemmaEvidence P) :
    MatchingLemmaClosed P := by
  exact And.intro E.matchingSuccessfulClosed
    (And.intro E.contractTermsSatisfiedClosed
      (And.intro E.settlementAlgorithmAppliedClosed
        (And.intro E.outcomeDisputeFreeClosed E.finalSettlementConfirmedClosed)))

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse