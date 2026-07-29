import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.TissueConstitutiveModel

/-!
# Finite Element Equilibrium Package
-/

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure FiniteElementEquilibrium (T : TissueConstitutiveModel) where
  weakFormulation : Prop
  testSpace : Type
  trialSpace : Type
  stiffnessMatrixAssembled : Prop
  externalForceVector : Prop
  solutionConvergence : Prop

structure FiniteElementEquilibriumEvidence (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) where
  weakFormulationClosed : F.weakFormulation
  stiffnessMatrixAssembledClosed : F.stiffnessMatrixAssembled
  externalForceVectorClosed : F.externalForceVector
  solutionConvergenceClosed : F.solutionConvergence

def FiniteElementEquilibriumClosed (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) : Prop :=
  F.weakFormulation ∧ F.stiffnessMatrixAssembled ∧ F.externalForceVector ∧ F.solutionConvergence

theorem finite_element_equilibrium_closed_from_evidence (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) (E : FiniteElementEquilibriumEvidence T F) : FiniteElementEquilibriumClosed T F :=
  And.intro E.weakFormulationClosed (And.intro E.stiffnessMatrixAssembledClosed (And.intro E.externalForceVectorClosed E.solutionConvergenceClosed))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse