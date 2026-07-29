import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.BiomechanicalAdmissibleClass

/-!
# Tissue Constitutive Model Package
-/

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure TissueConstitutiveModel where
  materialClass : Type
  stressStrainRelation : Prop
  hyperelasticPotential : Prop
  incompressibility : Prop
  anisotropy : Prop

structure TissueConstitutiveModelEvidence (T : TissueConstitutiveModel) where
  stressStrainRelationClosed : T.stressStrainRelation
  hyperelasticPotentialClosed : T.hyperelasticPotential
  incompressibilityClosed : T.incompressibility
  anisotropyClosed : T.anisotropy

def TissueConstitutiveModelClosed (T : TissueConstitutiveModel) : Prop :=
  T.stressStrainRelation ∧ T.hyperelasticPotential ∧ T.incompressibility ∧ T.anisotropy

theorem tissue_constitutive_model_closed_from_evidence (T : TissueConstitutiveModel) (E : TissueConstitutiveModelEvidence T) : TissueConstitutiveModelClosed T :=
  And.intro E.stressStrainRelationClosed (And.intro E.hyperelasticPotentialClosed (And.intro E.incompressibilityClosed E.anisotropyClosed))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse