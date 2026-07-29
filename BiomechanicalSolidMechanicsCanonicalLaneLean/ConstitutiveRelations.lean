import BiomechanicalSolidMechanicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure ConstitutiveModelPackage where
  materialSymmetry : String
  strainMeasure : String
  stressStrainRelation : Prop
  hyperelasticPotential : Prop
  incompressibilityConstraint : Prop

structure ConstitutiveModelEvidence (C : ConstitutiveModelPackage) where
  stressStrainRelationClosed : C.stressStrainRelation
  hyperelasticPotentialClosed : C.hyperelasticPotential
  incompressibilityConstraintClosed : C.incompressibilityConstraint

def ConstitutiveModelClosed (C : ConstitutiveModelPackage) : Prop :=
  C.stressStrainRelation ∧ C.hyperelasticPotential ∧ C.incompressibilityConstraint

theorem constitutive_model_closed_from_evidence (C : ConstitutiveModelPackage)
    (E : ConstitutiveModelEvidence C) : ConstitutiveModelClosed C := by
  exact And.intro E.stressStrainRelationClosed
    (And.intro E.hyperelasticPotentialClosed E.incompressibilityConstraintClosed)

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse