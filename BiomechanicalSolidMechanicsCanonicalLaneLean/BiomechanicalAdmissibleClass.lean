import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure BiomechanicalAdmittedObject where
  materialType : Type
  constitutiveLaw : Prop
  equilibriumSatisfied : Prop
  boundaryConditionApplied : Prop
  conclusion : constitutiveLaw ∧ equilibriumSatisfied ∧ boundaryConditionApplied

structure AdmissibleClass where
  object : BiomechanicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.constitutiveLaw ∧ A.object.equilibriumSatisfied ∧ A.object.boundaryConditionApplied) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse