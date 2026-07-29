import BiomechanicalSolidMechanicsCanonicalLaneLean.FiniteElementDiscretization

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure TissueMechanicsPackage {C : ConstitutiveModelPackage}
    {F : FiniteElementPackage C} where
  experimentalValidation : Prop
  parameterIdentification : Prop
  physiologicalRelevance : Prop
  clinicalApplicability : Prop

structure TissueMechanicsEvidence {C : ConstitutiveModelPackage}
    {F : FiniteElementPackage C} (T : TissueMechanicsPackage C F) where
  experimentalValidationClosed : T.experimentalValidation
  parameterIdentificationClosed : T.parameterIdentification
  physiologicalRelevanceClosed : T.physiologicalRelevance
  clinicalApplicabilityClosed : T.clinicalApplicability

def TissueMechanicsClosed {C : ConstitutiveModelPackage}
    {F : FiniteElementPackage C} (T : TissueMechanicsPackage C F) : Prop :=
  T.experimentalValidation ∧ T.parameterIdentification ∧
  T.physiologicalRelevance ∧ T.clinicalApplicability

theorem tissue_mechanics_closed_from_evidence {C : ConstitutiveModelPackage}
    {F : FiniteElementPackage C} (T : TissueMechanicsPackage C F)
    (E : TissueMechanicsEvidence T) : TissueMechanicsClosed T := by
  exact And.intro E.experimentalValidationClosed
    (And.intro E.parameterIdentificationClosed
      (And.intro E.physiologicalRelevanceClosed E.clinicalApplicabilityClosed))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse