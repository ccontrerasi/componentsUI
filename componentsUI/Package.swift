// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComponentsUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ComponentsUI",
            targets: ["componentsUI"]),
    ],
    targets: [
        .target(
            name: "componentsUI",
            path: "Sources"),
        .testTarget(
            name: "componentsUITests",
            dependencies: ["componentsUI"]
        ),
    ]
)
