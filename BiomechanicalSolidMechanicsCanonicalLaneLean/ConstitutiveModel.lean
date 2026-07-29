import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure ConstitutiveModelPackage where
  stressStrainRelation : Prop
  elasticityTensor : Prop
  plasticityModel : Prop
  viscoelasticity : Prop
  damageModel : Prop

structure ConstitutiveModelEvidence (C : ConstitutiveModelPackage) where
  stressStrainRelationClosed : C.stressStrainRelation
  elasticityTensorClosed : C.elasticityTensor
  plasticityModelClosed : C.plasticityModel
  viscoelasticityClosed : C.viscoelasticity
  damageModelClosed : C.damageModel

def ConstitutiveModelClosed (C : ConstitutiveModelPackage) : Prop :=
  C.stressStrainRelation ∧ C.elasticityTensor ∧ C.plasticityModel ∧ C.viscoelasticity ∧ C.damageModel

theorem constitutive_model_closed_from_evidence
    (C : ConstitutiveModelPackage) (E : ConstitutiveModelEvidence C) :
    ConstitutiveModelClosed C := by
  exact And.intro E.stressStrainRelationClosed
    (And.intro E.elasticityTensorClosed
      (And.intro E.plasticityModelClosed
        (And.intro E.viscoelasticityClosed E.damageModelClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse