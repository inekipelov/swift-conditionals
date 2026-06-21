// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Conditionals",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "Conditionals", targets: ["Conditionals"]),
        .library(name: "ConditionalsSwiftUI", targets: ["ConditionalsSwiftUI"])
    ],
    targets: [
        .target(name: "Conditionals"),
        .target(
            name: "ConditionalsSwiftUI",
            dependencies: ["Conditionals"]
        ),
        .testTarget(
            name: "ConditionalsTests",
            dependencies: ["Conditionals", "ConditionalsSwiftUI"]
        )
    ]
)
