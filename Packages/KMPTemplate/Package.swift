// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SharedPackage",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "shared", targets: ["shared"])
    ],
    targets: [
        .binaryTarget(
            name: "shared",
            path: "shared.xcframework"
        )
    ]
)
