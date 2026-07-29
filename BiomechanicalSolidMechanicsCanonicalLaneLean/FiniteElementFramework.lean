import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.ConstitutiveModel

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure FiniteElementFrameworkPackage {C : ConstitutiveModelPackage} where
  meshGeneration : Prop
  elementFormulation : Prop
  assemblyProcedure : Prop
  boundaryConditionApplication : Prop
  solverConvergence : Prop

structure FiniteElementFrameworkEvidence {C : ConstitutiveModelPackage}
    (F : FiniteElementFrameworkPackage C) where
  meshGenerationClosed : F.meshGeneration
  elementFormulationClosed : F.elementFormulation
  assemblyProcedureClosed : F.assemblyProcedure
  boundaryConditionApplicationClosed : F.boundaryConditionApplication
  solverConvergenceClosed : F.solverConvergence

def FiniteElementFrameworkClosed {C : ConstitutiveModelPackage}
    (F : FiniteElementFrameworkPackage C) : Prop :=
  F.meshGeneration ∧ F.elementFormulation ∧ F.assemblyProcedure ∧ F.boundaryConditionApplication ∧ F.solverConvergence

theorem finite_element_framework_closed_from_evidence
    {C : ConstitutiveModelPackage} (F : FiniteElementFrameworkPackage C)
    (E : FiniteElementFrameworkEvidence F) : FiniteElementFrameworkClosed F := by
  exact And.intro E.meshGenerationClosed
    (And.intro E.elementFormulationClosed
      (And.intro E.assemblyProcedureClosed
        (And.intro E.boundaryConditionApplicationClosed E.solverConvergenceClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse