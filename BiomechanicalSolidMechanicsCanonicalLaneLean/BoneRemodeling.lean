import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure BoneRemodelingPackage where
  mechanicalStimulus : Type u
  adaptationRateEquation : Prop
  equilibriumState : Prop
  densityEvolution : Prop
  corticalTrabecularDistinction : Prop

structure BoneRemodelingEvidence (B : BoneRemodelingPackage) where
  mechanicalStimulusClosed : B.mechanicalStimulus
  adaptationRateEquationClosed : B.adaptationRateEquation
  equilibriumStateClosed : B.equilibriumState
  densityEvolutionClosed : B.densityEvolution
  corticalTrabecularDistinctionClosed : B.corticalTrabecularDistinction

def BoneRemodelingClosed (B : BoneRemodelingPackage) : Prop :=
  B.mechanicalStimulus ∧ B.adaptationRateEquation ∧
  B.equilibriumState ∧ B.densityEvolution ∧
  B.corticalTrabecularDistinction

theorem bone_remodeling_closed_from_evidence (B : BoneRemodelingPackage) 
    (E : BoneRemodelingEvidence B) : BoneRemodelingClosed B := by
  exact And.intro E.mechanicalStimulusClosed
    (And.intro E.adaptationRateEquationClosed
      (And.intro E.equilibriumStateClosed
        (And.intro E.densityEvolutionClosed E.corticalTrabecularDistinctionClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse