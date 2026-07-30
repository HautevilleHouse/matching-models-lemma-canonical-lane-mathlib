import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : MatchingModelAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MatchingModelWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse