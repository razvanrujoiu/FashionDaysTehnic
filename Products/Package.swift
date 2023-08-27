// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Products",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Products",
            targets: ["Products"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.3"),
        .package(url: "https://github.com/Swinject/SwinjectAutoregistration", from: "2.8.3"),
        .package(url: "https:/github.com/onevcat/Kingfisher.git", from: "7.9.1"),
        .package(url: "https://github.com/airbnb/lottie-ios", from: "4.2.0"),
        .package(path: "../Common")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Products",
            dependencies: ["Swinject",
                           "SwinjectAutoregistration",
                           "Kingfisher",
                           "Common"],
            resources: [
                .copy("ProductResponse.json")
            ]),
        .testTarget(
            name: "ProductsTests",
            dependencies: ["Products"],
            resources: [
                .copy("ProductResponse.json")
            ])
    ]
)
