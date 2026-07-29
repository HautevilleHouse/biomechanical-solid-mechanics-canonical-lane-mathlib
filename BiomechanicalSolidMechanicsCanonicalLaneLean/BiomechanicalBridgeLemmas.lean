import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.BiomechanicalAdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.constitutiveLaw ∧ A.object.equilibriumSatisfied ∧ A.object.boundaryConditionApplied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse