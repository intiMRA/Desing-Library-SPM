// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Design Library",
    platforms: [
        .iOS(.v16)
        ],
    products: [
        .library(
            name: "Design Library",
            targets: ["Design Library"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "Design Library",
            dependencies: [.product(name: "Lottie", package: "lottie-spm")]),
        .testTarget(
            name: "Design LibraryTests",
            dependencies: ["Design Library"]),
    ]
)
