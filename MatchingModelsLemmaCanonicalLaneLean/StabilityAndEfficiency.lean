import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.MatchingAdmittedObject

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure StabilityEfficiencyData where
  stableMatchingExists : Prop
  efficientMatchingExists : Prop
  conflictBetweenStabilityAndEfficiency : Prop
  resolution : conflictBetweenStabilityAndEfficiency → Prop

structure StabilityEfficiencyEvidence (S : StabilityEfficiencyData) where
  stableMatchingExistsClosed : S.stableMatchingExists
  efficientMatchingExistsClosed : S.efficientMatchingExists
  resolutionClosed : S.conflictBetweenStabilityAndEfficiency → S.resolution

def StabilityEfficiencyClosed (S : StabilityEfficiencyData) : Prop :=
  S.stableMatchingExists ∧ S.efficientMatchingExists ∧ (S.conflictBetweenStabilityAndEfficiency → S.resolution)

theorem stability_efficiency_closed_from_evidence (S : StabilityEfficiencyData) (E : StabilityEfficiencyEvidence S) : StabilityEfficiencyClosed S := by
  exact And.intro E.stableMatchingExistsClosed (And.intro E.efficientMatchingExistsClosed E.resolutionClosed)

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse