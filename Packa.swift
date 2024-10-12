// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "componentsUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "componentsUI",
            targets: ["componentsUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1")
    ],
    targets: [
        .target(
            name: "componentsUI",
            dependencies: ["Swinject"],
            path: "Source/componentsUI"),
        .testTarget(
            name: "componentsUITests",
            dependencies: ["componentsUI"],
            path: "Tests/componentsUITests"),
    ]
)