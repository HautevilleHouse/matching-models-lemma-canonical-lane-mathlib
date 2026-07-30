import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.ContractTermsPackage

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure SettlementAlgorithm (C : ContractTermsPackage) where
  nettingMethod : String
  settlementDate : Nat
  paymentInstructionsDefined : Prop
  currencyConversionRate : Rat
  disputeResolutionMechanism : String
  failsafeProcedure : Prop

structure SettlementAlgorithmEvidence {C : ContractTermsPackage} (S : SettlementAlgorithm C) where
  nettingMethodValid : S.nettingMethod ∈ ["bilateral", "centralCounterparty"]
  settlementDatePositive : S.settlementDate > 0
  paymentInstructionsDefinedClosed : S.paymentInstructionsDefined
  currencyConversionRatePositive : S.currencyConversionRate > 0
  disputeResolutionMechanismValid : S.disputeResolutionMechanism ≠ ""
  failsafeProcedureClosed : S.failsafeProcedure

def SettlementAlgorithmClosed {C : ContractTermsPackage} (S : SettlementAlgorithm C) : Prop :=
  S.nettingMethod ∈ ["bilateral", "centralCounterparty"] ∧
  S.settlementDate > 0 ∧ S.paymentInstructionsDefined ∧
  S.currencyConversionRate > 0 ∧ S.disputeResolutionMechanism ≠ "" ∧ S.failsafeProcedure

theorem settlement_algorithm_closed_from_evidence {C : ContractTermsPackage} (S : SettlementAlgorithm C) (E : SettlementAlgorithmEvidence S) :
    SettlementAlgorithmClosed S := by
  exact And.intro E.nettingMethodValid
    (And.intro E.settlementDatePositive
      (And.intro E.paymentInstructionsDefinedClosed
        (And.intro E.currencyConversionRatePositive
          (And.intro E.disputeResolutionMechanismValid E.failsafeProcedureClosed))))

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse