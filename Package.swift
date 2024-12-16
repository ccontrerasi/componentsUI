// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComponentsUI",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ComponentsUI",
            targets: ["ComponentsUI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ComponentsUI",
            dependencies: ["Swinject"],
            swiftSettings: [
                .define("macOS_10_15", .when(platforms: [.macOS], configuration: .release)),
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "ComponentsUITests",
            dependencies: ["ComponentsUI"]
        ),
    ]
)
