import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure BiomechanicalAdmittedObject where
  tissueType : String
  constitutiveModel : String
  geometryDescription : String
  boundaryConditions : String
  loadingConditions : String
  conclusion : Prop

structure AdmissibleClass where
  object : BiomechanicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse