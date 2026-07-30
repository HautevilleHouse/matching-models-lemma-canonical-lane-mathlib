import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.MatchingAdmittedObject

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure DeferredAcceptanceData where
  algorithmRuns : Prop
  stabilityGuaranteed : Prop
  strategyProof : Prop

structure DeferredAcceptanceEvidence (D : DeferredAcceptanceData) where
  algorithmRunsClosed : D.algorithmRuns
  stabilityGuaranteedClosed : D.stabilityGuaranteed
  strategyProofClosed : D.strategyProof

def DeferredAcceptanceClosed (D : DeferredAcceptanceData) : Prop :=
  D.algorithmRuns ∧ D.stabilityGuaranteed ∧ D.strategyProof

theorem deferred_acceptance_closed_from_evidence (D : DeferredAcceptanceData) (E : DeferredAcceptanceEvidence D) : DeferredAcceptanceClosed D := by
  exact And.intro E.algorithmRunsClosed (And.intro E.stabilityGuaranteedClosed E.strategyProofClosed)

structure DeferredAcceptancePackage where
  data : DeferredAcceptanceData
  evidence : DeferredAcceptanceEvidence data

def DeferredAcceptancePackageClosed (P : DeferredAcceptancePackage) : Prop :=
  DeferredAcceptanceClosed P.data

theorem deferred_acceptance_package_closed (P : DeferredAcceptancePackage) : DeferredAcceptancePackageClosed P := by
  exact deferred_acceptance_closed_from_evidence P.data P.evidence

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse