import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure ContractTermsPackage where
  participants : List String
  obligationDate : Nat
  strikePrice : Rat
  notionalAmount : Rat
  counterparty : String
  settlementCurrency : String
  legalJurisdiction : String
  creditSupportAnnex : Bool
  marginCallFrequency : String
  thresholdAmount : Rat

structure ContractTermsEvidence (C : ContractTermsPackage) where
  participantsVerified : C.participants ≠ []
  obligationDatePositive : C.obligationDate > 0
  strikePricePositive : C.strikePrice > 0
  notionalAmountPositive : C.notionalAmount > 0
  counterpartyNonEmpty : C.counterparty ≠ ""
  settlementCurrencyISO : C.settlementCurrency.length = 3
  legalJurisdictionValid : C.legalJurisdiction ≠ ""
  creditSupportAnnexDefined : C.creditSupportAnnex = true ∨ C.creditSupportAnnex = false
  marginCallFrequencyValid : C.marginCallFrequency ∈ ["daily", "weekly", "monthly"]
  thresholdAmountNonNegative : C.thresholdAmount ≥ 0

def ContractTermsClosed (C : ContractTermsPackage) : Prop :=
  C.participants ≠ [] ∧ C.obligationDate > 0 ∧ C.strikePrice > 0 ∧
  C.notionalAmount > 0 ∧ C.counterparty ≠ "" ∧ C.settlementCurrency.length = 3 ∧
  C.legalJurisdiction ≠ "" ∧ (C.creditSupportAnnex = true ∨ C.creditSupportAnnex = false) ∧
  C.marginCallFrequency ∈ ["daily", "weekly", "monthly"] ∧ C.thresholdAmount ≥ 0

theorem contract_terms_closed_from_evidence (C : ContractTermsPackage) (E : ContractTermsEvidence C) :
    ContractTermsClosed C := by
  exact And.intro E.participantsVerified
    (And.intro E.obligationDatePositive
      (And.intro E.strikePricePositive
        (And.intro E.notionalAmountPositive
          (And.intro E.counterpartyNonEmpty
            (And.intro E.settlementCurrencyISO
              (And.intro E.legalJurisdictionValid
                (And.intro E.creditSupportAnnexDefined
                  (And.intro E.marginCallFrequencyValid E.thresholdAmountNonNegative))))))))

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse