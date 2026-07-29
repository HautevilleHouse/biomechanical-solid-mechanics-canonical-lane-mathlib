import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.BiomechanicalGateLemmas

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

def ConstrainedBiomechanicalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biomechanical_endgame (A : AdmissibleClass) : ConstrainedBiomechanicalClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse