import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure KinematicsPackage where
  deformationGradient : Prop
  strainMeasures : Prop
  compatibilityConditions : Prop
  polarDecomposition : Prop
  velocityGradient : Prop

structure KinematicsEvidence (K : KinematicsPackage) where
  deformationGradientClosed : K.deformationGradient
  strainMeasuresClosed : K.strainMeasures
  compatibilityConditionsClosed : K.compatibilityConditions
  polarDecompositionClosed : K.polarDecomposition
  velocityGradientClosed : K.velocityGradient

def KinematicsClosed (K : KinematicsPackage) : Prop :=
  K.deformationGradient ∧ K.strainMeasures ∧
  K.compatibilityConditions ∧ K.polarDecomposition ∧ K.velocityGradient

theorem kinematics_closed_from_evidence (K : KinematicsPackage)
    (E : KinematicsEvidence K) : KinematicsClosed K := by
  exact And.intro E.deformationGradientClosed
    (And.intro E.strainMeasuresClosed
      (And.intro E.compatibilityConditionsClosed
        (And.intro E.polarDecompositionClosed E.velocityGradientClosed)))

structure BalanceLawsPackage where
  linearMomentumBalance : Prop
  angularMomentumBalance : Prop
  energyBalance : Prop
  entropyInequality : Prop
  boundaryConditions : Prop

structure BalanceLawsEvidence (B : BalanceLawsPackage) where
  linearMomentumBalanceClosed : B.linearMomentumBalance
  angularMomentumBalanceClosed : B.angularMomentumBalance
  energyBalanceClosed : B.energyBalance
  entropyInequalityClosed : B.entropyInequality
  boundaryConditionsClosed : B.boundaryConditions

def BalanceLawsClosed (B : BalanceLawsPackage) : Prop :=
  B.linearMomentumBalance ∧ B.angularMomentumBalance ∧
  B.energyBalance ∧ B.entropyInequality ∧ B.boundaryConditions

theorem balance_laws_closed_from_evidence (B : BalanceLawsPackage)
    (E : BalanceLawsEvidence B) : BalanceLawsClosed B := by
  exact And.intro E.linearMomentumBalanceClosed
    (And.intro E.angularMomentumBalanceClosed
      (And.intro E.energyBalanceClosed
        (And.intro E.entropyInequalityClosed E.boundaryConditionsClosed)))

structure NumericalMethodPackage where
  spatialDiscretization : Prop
  temporalDiscretization : Prop
  solverStability : Prop
  convergenceRate : Prop
  errorEstimation : Prop

structure NumericalMethodEvidence (N : NumericalMethodPackage) where
  spatialDiscretizationClosed : N.spatialDiscretization
  temporalDiscretizationClosed : N.temporalDiscretization
  solverStabilityClosed : N.solverStability
  convergenceRateClosed : N.convergenceRate
  errorEstimationClosed : N.errorEstimation

def NumericalMethodClosed (N : NumericalMethodPackage) : Prop :=
  N.spatialDiscretization ∧ N.temporalDiscretization ∧
  N.solverStability ∧ N.convergenceRate ∧ N.errorEstimation

theorem numerical_method_closed_from_evidence (N : NumericalMethodPackage)
    (E : NumericalMethodEvidence N) : NumericalMethodClosed N := by
  exact And.intro E.spatialDiscretizationClosed
    (And.intro E.temporalDiscretizationClosed
      (And.intro E.solverStabilityClosed
        (And.intro E.convergenceRateClosed E.errorEstimationClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse