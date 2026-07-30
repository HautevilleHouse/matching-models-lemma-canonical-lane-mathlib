import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure RuralHospitalData where
  residents : Type
  hospitals : Type
  matchingExists : Prop
  ruralHospitalProperty : Prop
  conclusionFromMatching : ruralHospitalProperty

structure RuralHospitalEvidence (R : RuralHospitalData) where
  matchingExistsClosed : R.matchingExists
  ruralHospitalPropertyClosed : R.ruralHospitalProperty

def RuralHospitalClosed (R : RuralHospitalData) : Prop :=
  R.matchingExists ∧ R.ruralHospitalProperty ∧ R.conclusionFromMatching

theorem rural_hospital_closed_from_evidence (R : RuralHospitalData) (E : RuralHospitalEvidence R) : RuralHospitalClosed R := by
  exact And.intro E.matchingExistsClosed (And.intro E.ruralHospitalPropertyClosed R.conclusionFromMatching)

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse