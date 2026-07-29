import BiomechanicalSolidMechanicsCanonicalLaneLean.ConstitutiveModel

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure StressAnalysisPackage {F : ContinuumMechanicsFoundation} {C : ConstitutiveModelPackage F} where
  boundaryValueProblem : Prop
  finiteElementDiscretization : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  stressConcentration : ℝ

structure StressAnalysisEvidence {F : ContinuumMechanicsFoundation} {C : ConstitutiveModelPackage F} (S : StressAnalysisPackage F C) where
  boundaryValueProblemClosed : S.boundaryValueProblem
  finiteElementDiscretizationClosed : S.finiteElementDiscretization
  solutionExistenceClosed : S.solutionExistence
  solutionUniquenessClosed : S.solutionUniqueness

def StressAnalysisClosed {F : ContinuumMechanicsFoundation} {C : ConstitutiveModelPackage F} (S : StressAnalysisPackage F C) : Prop :=
  S.boundaryValueProblem ∧ S.finiteElementDiscretization ∧ S.solutionExistence ∧ S.solutionUniqueness

theorem stress_analysis_closed_from_evidence {F : ContinuumMechanicsFoundation} {C : ConstitutiveModelPackage F} (S : StressAnalysisPackage F C) (E : StressAnalysisEvidence S) : StressAnalysisClosed S :=
by
  exact And.intro E.boundaryValueProblemClosed (And.intro E.finiteElementDiscretizationClosed (And.intro E.solutionExistenceClosed E.solutionUniquenessClosed))

theorem stress_analysis_supplies_stress_concentration {F : ContinuumMechanicsFoundation} {C : ConstitutiveModelPackage F} (S : StressAnalysisPackage F C) : ℝ :=
  S.stressConcentration

end HautevilleHouse.BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse