// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PureSwiftUI",
    platforms: [
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "PureSwiftUI",
            targets: ["PureSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CodeSlicing/pure-swift-ui-design.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "PureSwiftUI",
            dependencies: ["PureSwiftUIDesign"]),
        .testTarget(
            name: "PureSwiftUITests",
            dependencies: ["PureSwiftUI"]),
    ]
)
