// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Design_Library",
    platforms: [
        .iOS(.v16)
        ],
    products: [
        .library(
            name: "Design_Library",
            targets: ["Design_Library"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "Design_Library",
            dependencies: [.product(name: "Lottie", package: "lottie-spm")],
            resources: [.process("AnimationFiles")]),
        .testTarget(
            name: "Design_LibraryTests",
            dependencies: ["Design_Library"]),
    ]
)
