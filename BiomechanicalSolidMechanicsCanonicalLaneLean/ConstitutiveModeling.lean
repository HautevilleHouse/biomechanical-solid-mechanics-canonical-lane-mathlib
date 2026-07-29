import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure HyperelasticMaterialPackage where
  strainEnergyDensityFunction : Prop
  stressStrainRelation : Prop
  materialSymmetry : Prop
  incompressibilityCondition : Prop
  parameterIdentification : Prop

structure HyperelasticMaterialEvidence (P : HyperelasticMaterialPackage) where
  strainEnergyDensityFunctionClosed : P.strainEnergyDensityFunction
  stressStrainRelationClosed : P.stressStrainRelation
  materialSymmetryClosed : P.materialSymmetry
  incompressibilityConditionClosed : P.incompressibilityCondition
  parameterIdentificationClosed : P.parameterIdentification

def HyperelasticMaterialClosed (P : HyperelasticMaterialPackage) : Prop :=
  P.strainEnergyDensityFunction ∧ P.stressStrainRelation ∧
  P.materialSymmetry ∧ P.incompressibilityCondition ∧ P.parameterIdentification

theorem hyperelastic_material_closed_from_evidence (P : HyperelasticMaterialPackage)
    (E : HyperelasticMaterialEvidence P) : HyperelasticMaterialClosed P := by
  exact And.intro E.strainEnergyDensityFunctionClosed
    (And.intro E.stressStrainRelationClosed
      (And.intro E.materialSymmetryClosed
        (And.intro E.incompressibilityConditionClosed E.parameterIdentificationClosed)))

structure ViscoelasticMaterialPackage where
  relaxationFunction : Prop
  creepFunction : Prop
  fadingMemory : Prop
  timeDependentModulus : Prop
  rateDependence : Prop

structure ViscoelasticMaterialEvidence (P : ViscoelasticMaterialPackage) where
  relaxationFunctionClosed : P.relaxationFunction
  creepFunctionClosed : P.creepFunction
  fadingMemoryClosed : P.fadingMemory
  timeDependentModulusClosed : P.timeDependentModulus
  rateDependenceClosed : P.rateDependence

def ViscoelasticMaterialClosed (P : ViscoelasticMaterialPackage) : Prop :=
  P.relaxationFunction ∧ P.creepFunction ∧
  P.fadingMemory ∧ P.timeDependentModulus ∧ P.rateDependence

theorem viscoelastic_material_closed_from_evidence (P : ViscoelasticMaterialPackage)
    (E : ViscoelasticMaterialEvidence P) : ViscoelasticMaterialClosed P := by
  exact And.intro E.relaxationFunctionClosed
    (And.intro E.creepFunctionClosed
      (And.intro E.fadingMemoryClosed
        (And.intro E.timeDependentModulusClosed E.rateDependenceClosed)))

structure GrowthModelPackage where
  volumetricGrowthRate : Prop
  remodelingLaw : Prop
  massTransportEquation : Prop
  mechanobiologicalCoupling : Prop
  homeostaticSetpoint : Prop

structure GrowthModelEvidence (P : GrowthModelPackage) where
  volumetricGrowthRateClosed : P.volumetricGrowthRate
  remodelingLawClosed : P.remodelingLaw
  massTransportEquationClosed : P.massTransportEquation
  mechanobiologicalCouplingClosed : P.mechanobiologicalCoupling
  homeostaticSetpointClosed : P.homeostaticSetpoint

def GrowthModelClosed (P : GrowthModelPackage) : Prop :=
  P.volumetricGrowthRate ∧ P.remodelingLaw ∧
  P.massTransportEquation ∧ P.mechanobiologicalCoupling ∧ P.homeostaticSetpoint

theorem growth_model_closed_from_evidence (P : GrowthModelPackage)
    (E : GrowthModelEvidence P) : GrowthModelClosed P := by
  exact And.intro E.volumetricGrowthRateClosed
    (And.intro E.remodelingLawClosed
      (And.intro E.massTransportEquationClosed
        (And.intro E.mechanobiologicalCouplingClosed E.homeostaticSetpointClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse