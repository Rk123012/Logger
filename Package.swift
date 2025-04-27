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
            targets: ["TNLogger"] // <-- expects a target named "TNLogger"
        ),
    ],
    targets: [
        .target(
            name: "TNLogger", // <-- now matches!
            dependencies: [],
            swiftSettings: [
                .define("DEV"),
                .define("QA"),
                .define("PROD")
            ]
        ),
    ]
)
