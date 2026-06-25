# Sector Orthant Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Lossless projections between the `Sector` named subdivisions and their `Orthant` direction-vector carriers — `Sector.Quadrant ↔ Orthant<2>` and `Sector.Octant ↔ Orthant<3>`.

---

## Quick Start

A `Sector.Quadrant` names one of the four sign regions of the plane, and a `Sector.Octant` names one of the eight sign regions of space. An `Orthant<N>` carries the same information as an explicit per-axis direction vector. This package adds the bridge: `.orthant` reads the carrier off a named subdivision, and `init(orthant:)` recovers the named subdivision from a carrier. The `Sector` enums themselves carry no `Orthant` dependency — the projection lives here.

```swift
import Sector_Orthant_Primitives

// `Sector.Quadrant` names a 2D sign region; its `Orthant<2>` carrier is the
// per-axis direction vector (axis 0 = X, axis 1 = Y).
let quadrant = Sector.Quadrant.II
let cell = quadrant.orthant                          // Orthant<2>
cell.directions[0] == .negative                      // true  (X is negative in quadrant II)
cell.directions[1] == .positive                      // true  (Y is positive)

// Every named subdivision is exactly one orthant — the projection round-trips.
Sector.Quadrant(orthant: cell) == quadrant           // true

// Octants decompose the same way across three binary axes (X, Y, Z).
let octant = Sector.Octant.pnp                        // X +, Y −, Z +
Sector.Octant(orthant: octant.orthant) == octant      // true
octant.orthant == Orthant<3>(repeating: .positive)    // false — Y is negative
```

Because the carrier is faithful, structure is preserved across the bridge: the orthant of an opposite sector is the opposite of its orthant.

```swift
import Sector_Orthant_Primitives

for quadrant in Sector.Quadrant.allCases {
    quadrant.opposite.orthant == quadrant.orthant.opposite   // true for all four
}
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-sector-orthant-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Sector Orthant Primitives", package: "swift-sector-orthant-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. Depends only on the `Sector` and `Orthant` primitives, and re-exports both so consumers import a single module.

| Product | Target | Purpose |
|---------|--------|---------|
| `Sector Orthant Primitives` | `Sources/Sector Orthant Primitives/` | Adds `.orthant` and `init(orthant:)` to `Sector.Quadrant` (↔ `Orthant<2>`) and `Sector.Octant` (↔ `Orthant<3>`), and re-exports `Sector_Primitives` and `Orthant_Primitives`. |
| `Sector Orthant Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
