import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure RuralHospitalsTheoremPackage where
  matchingType : Type u
  preferenceOrder : matchingType → matchingType → Prop
  ruralHospitalProperty : Prop
  stableOutcomeExists : Prop

structure RuralHospitalsTheoremEvidence (P : RuralHospitalsTheoremPackage) where
  ruralHospitalPropertyClosed : P.ruralHospitalProperty
  stableOutcomeExistsClosed : P.stableOutcomeExists

def RuralHospitalsTheoremClosed (P : RuralHospitalsTheoremPackage) : Prop :=
  P.ruralHospitalProperty ∧ P.stableOutcomeExists

theorem rural_hospitals_theorem_closed_from_evidence
    (P : RuralHospitalsTheoremPackage) (E : RuralHospitalsTheoremEvidence P) :
    RuralHospitalsTheoremClosed P := by
  exact And.intro E.ruralHospitalPropertyClosed E.stableOutcomeExistsClosed

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse