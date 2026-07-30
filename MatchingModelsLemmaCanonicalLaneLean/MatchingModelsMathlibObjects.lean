import MatchingModelsLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MatchingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MatchingAdmittedObject where
  space : MatchingSpace
  matchingStructure : Prop
  stabilityProperty : Prop
  modelSpace : Type
  modelTopology : TopologicalSpace modelSpace
  matchingToModel : Prop
  conclusion : matchingToModel

structure MatchingEndgameState where
  object : MatchingAdmittedObject

def MatchingWitnessClosed (O : MatchingAdmittedObject) : Prop :=
  O.matchingToModel

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse