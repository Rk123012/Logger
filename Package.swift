// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TNLogger",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "TNLogger",
            targets: ["TNLogger"]
        ),
    ],
    targets: [
        .target(
            name: "TNLogger",
            dependencies: [],
            swiftSettings: [
                // No global environment flags here
            ]
        ),
    ]
)
