import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure HyperelasticPackage where
  strainEnergyFunction : Type u
  stressTensorDerivation : Prop
  tangentModuliComputed : Prop
  frameIndifferenceSatisfied : Prop
  polyconvexityCondition : Prop

structure HyperelasticEvidence (H : HyperelasticPackage) where
  strainEnergyFunctionClosed : H.strainEnergyFunction
  stressTensorDerivationClosed : H.stressTensorDerivation
  tangentModuliComputedClosed : H.tangentModuliComputed
  frameIndifferenceSatisfiedClosed : H.frameIndifferenceSatisfied
  polyconvexityConditionClosed : H.polyconvexityCondition

def HyperelasticClosed (H : HyperelasticPackage) : Prop :=
  H.strainEnergyFunction ∧ H.stressTensorDerivation ∧
  H.tangentModuliComputed ∧ H.frameIndifferenceSatisfied ∧
  H.polyconvexityCondition

theorem hyperelastic_closed_from_evidence (H : HyperelasticPackage) 
    (E : HyperelasticEvidence H) : HyperelasticClosed H := by
  exact And.intro E.strainEnergyFunctionClosed
    (And.intro E.stressTensorDerivationClosed
      (And.intro E.tangentModuliComputedClosed
        (And.intro E.frameIndifferenceSatisfiedClosed E.polyconvexityConditionClosed)))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse