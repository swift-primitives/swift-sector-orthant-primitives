// Sector.Quadrant+Orthant.swift
// Lossless projection between Sector.Quadrant and its Orthant<2> carrier.

public import Orthant_Primitives
public import Sector_Primitives

extension Sector.Quadrant {
    /// The 2D orthant this quadrant occupies (axis 0 = X, axis 1 = Y).
    @inlinable
    public var orthant: Orthant<2> {
        switch self {
        case .I: Orthant { _ in .positive }
        case .II: Orthant { $0 == 0 ? .negative : .positive }
        case .III: Orthant { _ in .negative }
        case .IV: Orthant { $0 == 0 ? .positive : .negative }
        }
    }

    /// The plane quadrant corresponding to a 2D orthant.
    @inlinable
    public init(orthant: Orthant<2>) {
        switch (orthant.directions[0], orthant.directions[1]) {
        case (.positive, .positive): self = .I
        case (.negative, .positive): self = .II
        case (.negative, .negative): self = .III
        default: self = .IV  // (.positive, .negative)
        }
    }
}
