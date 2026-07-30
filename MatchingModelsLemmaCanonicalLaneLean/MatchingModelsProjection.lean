import MatchingModelsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def matchingProjection : Projection MatchingEndgameState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem matching_projection_idempotent (x : MatchingEndgameState) :
    matchingProjection.toFun (matchingProjection.toFun x) = matchingProjection.toFun x := by
  exact matchingProjection.idempotent x

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse