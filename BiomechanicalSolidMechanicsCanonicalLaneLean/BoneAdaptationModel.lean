import canonicalLaneMathlib.AdmissibleClass
import BiomechanicalSolidMechanicsCanonicalLaneLean.FiniteElementEquilibrium

/-!
# Bone Adaptation Model Package
-/

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure BoneAdaptationModel (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) where
  strainThreshold : Prop
  remodelingRate : Prop
  densityEvolution : Prop
  equilibriumAfterRemodeling : Prop

structure BoneAdaptationModelEvidence (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) (B : BoneAdaptationModel T F) where
  strainThresholdClosed : B.strainThreshold
  remodelingRateClosed : B.remodelingRate
  densityEvolutionClosed : B.densityEvolution
  equilibriumAfterRemodelingClosed : B.equilibriumAfterRemodeling

def BoneAdaptationModelClosed (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) (B : BoneAdaptationModel T F) : Prop :=
  B.strainThreshold ∧ B.remodelingRate ∧ B.densityEvolution ∧ B.equilibriumAfterRemodeling

theorem bone_adaptation_model_closed_from_evidence (T : TissueConstitutiveModel) (F : FiniteElementEquilibrium T) (B : BoneAdaptationModel T F) (E : BoneAdaptationModelEvidence T F B) : BoneAdaptationModelClosed T F B :=
  And.intro E.strainThresholdClosed (And.intro E.remodelingRateClosed (And.intro E.densityEvolutionClosed E.equilibriumAfterRemodelingClosed))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse