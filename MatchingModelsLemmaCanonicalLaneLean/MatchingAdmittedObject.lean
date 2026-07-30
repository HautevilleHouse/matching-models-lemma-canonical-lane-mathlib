import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure MatchingAdmittedObject where
  agents : Type
  preferences : Type
  matching : Type
  stabilityCondition : Prop
  conclusion : stabilityCondition

def MatchingWitnessClosed (O : MatchingAdmittedObject) : Prop :=
  O.stabilityCondition

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse