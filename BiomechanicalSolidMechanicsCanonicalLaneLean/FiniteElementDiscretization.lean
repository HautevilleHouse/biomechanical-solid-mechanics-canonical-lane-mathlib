import BiomechanicalSolidMechanicsCanonicalLaneLean.ConstitutiveRelations

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure FiniteElementPackage {C : ConstitutiveModelPackage} where
  elementType : String
  quadratureRule : Prop
  meshConvergence : Prop
  solverStability : Prop
  boundaryConditionDiscretization : Prop

structure FiniteElementEvidence {C : ConstitutiveModelPackage}
    (F : FiniteElementPackage C) where
  quadratureRuleClosed : F.quadratureRule
  meshConvergenceClosed : F.meshConvergence
  solverStabilityClosed : F.solverStability
  boundaryConditionDiscretizationClosed : F.boundaryConditionDiscretization

def FiniteElementClosed {C : ConstitutiveModelPackage}
    (F : FiniteElementPackage C) : Prop :=
  F.quadratureRule ∧ F.meshConvergence ∧ F.solverStability ∧ F.boundaryConditionDiscretization

theorem finite_element_closed_from_evidence {C : ConstitutiveModelPackage}
    (F : FiniteElementPackage C) (E : FiniteElementEvidence F) :
    FiniteElementClosed F := by
  exact And.intro E.quadratureRuleClosed
    (And.intro E.meshConvergenceClosed
      (And.intro E.solverStabilityClosed E.boundaryConditionDiscretizationClosed))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse