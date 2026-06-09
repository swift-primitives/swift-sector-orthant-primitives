// Sector.Octant+Orthant.swift
// Lossless projection between Sector.Octant and its Orthant<3> carrier — the x/y/z
// binary-axis decomposition.

public import Sector_Primitives
public import Orthant_Primitives

extension Sector.Octant {
    /// The 3D orthant this octant occupies (axis 0 = X, 1 = Y, 2 = Z); the sign triple of
    /// the case is exactly the per-axis direction.
    @inlinable
    public var orthant: Orthant<3> {
        let signs: (Direction, Direction, Direction) =
            switch self {
            case .ppp: (.positive, .positive, .positive)
            case .ppn: (.positive, .positive, .negative)
            case .pnp: (.positive, .negative, .positive)
            case .pnn: (.positive, .negative, .negative)
            case .npp: (.negative, .positive, .positive)
            case .npn: (.negative, .positive, .negative)
            case .nnp: (.negative, .negative, .positive)
            case .nnn: (.negative, .negative, .negative)
            }
        return Orthant { index in index == 0 ? signs.0 : (index == 1 ? signs.1 : signs.2) }
    }

    /// The space octant corresponding to a 3D orthant.
    @inlinable
    public init(orthant: Orthant<3>) {
        let x = orthant.directions[0] == .positive
        let y = orthant.directions[1] == .positive
        let z = orthant.directions[2] == .positive
        switch (x, y, z) {
        case (true, true, true): self = .ppp
        case (true, true, false): self = .ppn
        case (true, false, true): self = .pnp
        case (true, false, false): self = .pnn
        case (false, true, true): self = .npp
        case (false, true, false): self = .npn
        case (false, false, true): self = .nnp
        default: self = .nnn  // (false, false, false)
        }
    }
}
