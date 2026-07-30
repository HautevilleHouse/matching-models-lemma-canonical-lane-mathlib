import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

def ConstrainedMatchingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_matching_endgame (A : AdmissibleClass) :
    ConstrainedMatchingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse