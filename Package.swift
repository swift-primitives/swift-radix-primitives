// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-radix-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "Radix Primitive",
            targets: ["Radix Primitive"]
        ),
        .library(
            name: "Radix Primitives",
            targets: ["Radix Primitives"]
        ),
        .library(
            name: "Radix Primitives Test Support",
            targets: ["Radix Primitives Test Support"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Radix Primitive",
            dependencies: []
        ),
        .target(
            name: "Radix Primitives",
            dependencies: [
                "Radix Primitive",
            ]
        ),
        .target(
            name: "Radix Primitives Test Support",
            dependencies: [
                "Radix Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Radix Primitives Tests",
            dependencies: [
                "Radix Primitives",
                "Radix Primitives Test Support",
            ]
        ),
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
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
