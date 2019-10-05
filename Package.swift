// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "KubeKit",
    platforms: [.macOS(.v10_12),
                .iOS(.v10),
                .tvOS(.v10),
                .watchOS(.v3)],
    products: [
        .library(
            name: "KubeKit",
            targets: ["KubeKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", from: "3.5.0"),
    ],
    targets: [
        .target(
            name: "KubeKit",
            dependencies: ["ObjectMapper",]
        ),
        .testTarget(
            name: "KubeKitTests",
            dependencies: ["KubeKit"]),
    ]
)
