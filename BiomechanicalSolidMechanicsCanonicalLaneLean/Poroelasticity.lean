import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomechanicalSolidMechanicsCanonicalLaneLean

structure PoroelasticPackage where
  solidSkeletonModel : Type u
  fluidPhaseModel : Type v
  porosityDefined : Prop
  effectiveStressPrinciple : Prop
  permeabilityLaw : Prop
  fluidMassConservation : Prop
  couplingConditions : Prop

structure PoroelasticEvidence (P : PoroelasticPackage) where
  solidSkeletonModelClosed : P.solidSkeletonModel
  fluidPhaseModelClosed : P.fluidPhaseModel
  porosityDefinedClosed : P.porosityDefined
  effectiveStressPrincipleClosed : P.effectiveStressPrinciple
  permeabilityLawClosed : P.permeabilityLaw
  fluidMassConservationClosed : P.fluidMassConservation
  couplingConditionsClosed : P.couplingConditions

def PoroelasticClosed (P : PoroelasticPackage) : Prop :=
  P.solidSkeletonModel ∧ P.fluidPhaseModel ∧
  P.porosityDefined ∧ P.effectiveStressPrinciple ∧
  P.permeabilityLaw ∧ P.fluidMassConservation ∧
  P.couplingConditions

theorem poroelastic_closed_from_evidence (P : PoroelasticPackage) 
    (E : PoroelasticEvidence P) : PoroelasticClosed P := by
  exact And.intro E.solidSkeletonModelClosed
    (And.intro E.fluidPhaseModelClosed
      (And.intro E.porosityDefinedClosed
        (And.intro E.effectiveStressPrincipleClosed
          (And.intro E.permeabilityLawClosed
            (And.intro E.fluidMassConservationClosed E.couplingConditionsClosed)))))

end BiomechanicalSolidMechanicsCanonicalLaneLean
end HautevilleHouse