import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure MatchingModelPackage where
  leftObject : Type u
  rightObject : Type v
  matchingData : Type w
  matchingRelation : leftObject → rightObject → Prop
  matchingAxiom : ∀ (l : leftObject), ∃ (r : rightObject), matchingRelation l r

structure MatchingModelEvidence (P : MatchingModelPackage) where
  matchingRelationClosed : ∀ (l : P.leftObject), P.matchingRelation l (Classical.choose (P.matchingAxiom l))

def MatchingModelClosed (P : MatchingModelPackage) : Prop :=
  ∀ (l : P.leftObject), P.matchingRelation l (Classical.choose (P.matchingAxiom l))

theorem matching_model_closed_from_evidence (P : MatchingModelPackage) (E : MatchingModelEvidence P) :
    MatchingModelClosed P := by
  exact E.matchingRelationClosed

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse