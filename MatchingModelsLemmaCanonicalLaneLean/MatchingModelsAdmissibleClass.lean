import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure MatchingModelSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MatchingModelAdmittedObject where
  space : MatchingModelSpace
  matchingCondition : Prop
  dataConsistency : Prop
  conclusion : matchingCondition ∧ dataConsistency

structure MatchingModelEndgameState where
  object : MatchingModelAdmittedObject

def MatchingModelWitnessClosed (O : MatchingModelAdmittedObject) : Prop :=
  O.matchingCondition ∧ O.dataConsistency

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse