// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TNLogger",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TNLogger",
            targets: ["TNLogger"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
                    name: "YourPackage",
                    dependencies: [],
                    swiftSettings: [
                        .define("DEV"), // <-- Add your custom build flags here
                        .define("QA"), // <-- Add your custom build flags here
                        .define("PROD") // <-- Add your custom build flags here
                    ]
                ),

    ]
)
