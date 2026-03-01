// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureModule",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FeatureModule", targets: ["FeatureModule"]
        ),
    ],
    dependencies: [
        .package(name: "ClientModule", path: "../ClientModule"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture/", from: "1.17.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FeatureModule",
            dependencies: [
                "ClientModule",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "FeatureModuleTests",
            dependencies: ["FeatureModule"]
        ),
    ]
)
