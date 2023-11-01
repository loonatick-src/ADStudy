// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let settings: [SwiftSetting] = [.unsafeFlags(["-Xfrontend", "-enable-experimental-forward-mode-differentiation"])]

let package = Package(
    name: "SwiftADStudy",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftADStudy",
            targets: ["SwiftADStudy"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftADStudy",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics")
            ],
            swiftSettings: settings),
        .testTarget(
            name: "SwiftADStudyTests",
            dependencies: ["SwiftADStudy"]),
    ]
)
