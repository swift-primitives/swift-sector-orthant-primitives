# swift-sector-orthant-primitives

The lossless projections between the `Sector` named views and their `Orthant` carriers — a
per-carrier bridge ([MOD-014]): `Sector.Quadrant ↔ Orthant<2>` and `Sector.Octant ↔
Orthant<3>` (the x/y/z binary-axis decomposition). The bare `Sector` enums carry no `Orthant`
dependency; this package adds `.orthant` and `init(orthant:)`.

```swift
import Sector_Orthant_Primitives

Sector.Quadrant.I.orthant        // Orthant<2>(repeating: .positive)
Sector.Octant.ppp.orthant        // Orthant<3>(repeating: .positive)
```

## License

Apache License 2.0. See [LICENSE](LICENSE.md).
