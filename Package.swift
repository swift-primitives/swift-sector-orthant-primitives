// swift-tools-version: 6.3.3
import PackageDescription

let package = Package(
    name: "swift-sector-orthant-primitives",
    platforms: [.macOS("27"), .iOS("27"), .tvOS("27"), .watchOS("27"), .visionOS("27")],
    products: [
        .library(name: "Sector Orthant Primitives", targets: ["Sector Orthant Primitives"]),
        .library(name: "Sector Orthant Primitives Test Support", targets: ["Sector Orthant Primitives Test Support"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-sector-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-orthant-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Sector Orthant Primitives",
            dependencies: [
                .product(name: "Sector Primitives", package: "swift-sector-primitives"),
                .product(name: "Orthant Primitives", package: "swift-orthant-primitives"),
            ]
        ),
        .target(name: "Sector Orthant Primitives Test Support", dependencies: ["Sector Orthant Primitives"], path: "Tests/Support"),
        .testTarget(name: "Sector Orthant Primitives Tests", dependencies: ["Sector Orthant Primitives", "Sector Orthant Primitives Test Support"]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]
    let package: [SwiftSetting] = []
    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
