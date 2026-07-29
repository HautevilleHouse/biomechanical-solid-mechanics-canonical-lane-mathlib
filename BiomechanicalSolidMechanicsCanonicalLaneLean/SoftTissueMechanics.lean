import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.ConstitutiveModel

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure SoftTissueMechanicsPackage {C : ConstitutiveModelPackage} where
  hyperelasticModel : Prop
  viscoelasticRelaxation : Prop
  fiberReinforcement : Prop
  growthRemodeling : Prop
  failureCriterion : Prop

structure SoftTissueMechanicsEvidence {C : ConstitutiveModelPackage}
    (S : SoftTissueMechanicsPackage C) where
  hyperelasticModelClosed : S.hyperelasticModel
  viscoelasticRelaxationClosed : S.viscoelasticRelaxation
  fiberReinforcementClosed : S.fiberReinforcement
  growthRemodelingClosed : S.growthRemodeling
  failureCriterionClosed : S.failureCriterion

def SoftTissueMechanicsClosed {C : ConstitutiveModelPackage}
    (S : SoftTissueMechanicsPackage C) : Prop :=
  S.hyperelasticModel ∧ S.viscoelasticRelaxation ∧ S.fiberReinforcement ∧ S.growthRemodeling ∧ S.failureCriterion

theorem soft_tissue_mechanics_closed_from_evidence
    {C : ConstitutiveModelPackage} (S : SoftTissueMechanicsPackage C)
    (E : SoftTissueMechanicsEvidence S) : SoftTissueMechanicsClosed S := by
  exact And.intro E.hyperelasticModelClosed
    (And.intro E.viscoelasticRelaxationClosed
      (And.intro E.fiberReinforcementClosed
        (And.intro E.growthRemodelingClosed E.failureCriterionClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse