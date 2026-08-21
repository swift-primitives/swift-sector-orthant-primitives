public import Orthant_Primitives
public import Sector_Primitives

extension Sector.Quadrant {

    @inlinable
    public var orthant: Orthant<2> {
        switch self {
        case .I: Orthant { _ in .positive }
        case .II: Orthant { $0 == 0 ? .negative : .positive }
        case .III: Orthant { _ in .negative }
        case .IV: Orthant { $0 == 0 ? .positive : .negative }
        }
    }

    @inlinable
    public init(orthant: Orthant<2>) {
        switch (orthant.directions[0], orthant.directions[1]) {
        case (.positive, .positive): self = .I
        case (.negative, .positive): self = .II
        case (.negative, .negative): self = .III
        default: self = .IV
        }
    }
}
