// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PureSwiftUI",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v13)],
    products: [
        .library(
            name: "PureSwiftUI",
            targets: ["PureSwiftUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CodeSlicing/pure-swift-ui-design.git", .exact("1.0.0-beta-1")),
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
