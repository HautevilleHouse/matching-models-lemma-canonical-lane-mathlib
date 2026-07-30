import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure StrategyProofnessPackage where
  agentType : Type u
  preferenceDomain : agentType → agentType → Prop
  matchingMechanism : Type v
  strategyProofProperty : Prop
  incentiveCompatible : Prop

structure StrategyProofnessEvidence (P : StrategyProofnessPackage) where
  strategyProofPropertyClosed : P.strategyProofProperty
  incentiveCompatibleClosed : P.incentiveCompatible

def StrategyProofnessClosed (P : StrategyProofnessPackage) : Prop :=
  P.strategyProofProperty ∧ P.incentiveCompatible

theorem strategy_proofness_closed_from_evidence
    (P : StrategyProofnessPackage) (E : StrategyProofnessEvidence P) :
    StrategyProofnessClosed P := by
  exact And.intro E.strategyProofPropertyClosed E.incentiveCompatibleClosed

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse