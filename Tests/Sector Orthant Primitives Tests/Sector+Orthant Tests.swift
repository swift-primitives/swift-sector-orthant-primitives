// Sector+Orthant Tests.swift

import Sector_Orthant_Primitives
import Testing

@Suite
struct `Sector.Quadrant Orthant projection` {
    @Test
    func `quadrant I is all-positive`() {
        #expect(Sector.Quadrant.I.orthant == Orthant<2>(repeating: .positive))
        #expect(Sector.Quadrant.III.orthant == Orthant<2>(repeating: .negative))
    }

    @Test
    func `projection round-trips`() {
        for quadrant in Sector.Quadrant.allCases {
            #expect(Sector.Quadrant(orthant: quadrant.orthant) == quadrant)
        }
    }

    @Test
    func `opposite quadrant is opposite orthant`() {
        for quadrant in Sector.Quadrant.allCases {
            #expect(quadrant.opposite.orthant == quadrant.orthant.opposite)
        }
    }
}

@Suite
struct `Sector.Octant Orthant projection` {
    @Test
    func `octant sign triples are its orthant`() {
        #expect(Sector.Octant.ppp.orthant == Orthant<3>(repeating: .positive))
        #expect(Sector.Octant.nnn.orthant == Orthant<3>(repeating: .negative))
        #expect(Sector.Octant.pnp.orthant.directions[1] == .negative)
    }

    @Test
    func `projection round-trips for all eight`() {
        for octant in Sector.Octant.allCases {
            #expect(Sector.Octant(orthant: octant.orthant) == octant)
        }
    }

    @Test
    func `opposite octant is opposite orthant`() {
        for octant in Sector.Octant.allCases {
            #expect(octant.opposite.orthant == octant.orthant.opposite)
        }
    }
}
