import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MatchingModelsLemmaCanonicalLaneLean

structure MatchingModelBase where
  instruction : Type
  hash: Type
  commitment: Type
  publicKey: Type
  signature: Type
  encryptedPayload: Type
  verified : instruction → commitment → Prop
  commitmentBinding: commitment → Prop
  participantSet: List String
  settlementTerms: String

def MatchingModelBaseEvidence (M : MatchingModelBase) : Prop :=
  (∀ i c, M.verified i c → M.commitmentBinding c) ∧
  M.participantSet ≠ [] ∧ M.settlementTerms ≠ ""

theorem matching_model_base_consistent (M : MatchingModelBase) (h : MatchingModelBaseEvidence M) :
  M.participantSet ≠ [] ∧ M.settlementTerms ≠ "" := by
  exact And.intro (by rcases h with ⟨_, hps, _⟩; exact hps) (by rcases h with ⟨_, _, hst⟩; exact hst)

end MatchingModelsLemmaCanonicalLaneLean
end HautevilleHouse