// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignLibrary",
    platforms: [
        .iOS(.v16)
        ],
    products: [
        .library(
            name: "DesignLibrary",
            targets: ["DesignLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMinor(from: "4.5.2")),
    ],
    targets: [
        .target(
            name: "DesignLibrary",
            dependencies: [
                .product(name: "Lottie", package: "lottie-spm")
            ],
            resources: [
                .process("Assets")
            ]),
        .testTarget(
            name: "DesignLibraryTests",
            dependencies: ["DesignLibrary"]),
    ]
)
