import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.MatchingModelsStructure

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure MatchingMappingPackage {P : MatchingModelPackage} where
  mapping : P.leftObject → P.rightObject
  mappingPreservesMatching : ∀ (l : P.leftObject), P.matchingRelation l (mapping l)

structure MatchingMappingEvidence {P : MatchingModelPackage} (M : MatchingMappingPackage P) where
  mappingPreservesMatchingClosed : ∀ (l : P.leftObject), P.matchingRelation l (M.mapping l)

def MatchingMappingClosed {P : MatchingModelPackage} (M : MatchingMappingPackage P) : Prop :=
  ∀ (l : P.leftObject), P.matchingRelation l (M.mapping l)

theorem matching_mapping_closed_from_evidence {P : MatchingModelPackage} (M : MatchingMappingPackage P)
    (E : MatchingMappingEvidence M) : MatchingMappingClosed M := by
  exact E.mappingPreservesMatchingClosed

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse