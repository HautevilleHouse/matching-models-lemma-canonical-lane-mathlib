import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MatchingModelsLemmaCanonicalLaneLean.MatchingModelsStructure

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

def ConstrainedMatchingModelsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_matching_models_endgame (A : AdmissibleClass) :
    ConstrainedMatchingModelsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse