// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "KubeKit",
    products: [
        .library(
            name: "KubeKit",
            targets: ["KubeKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", from: "3.5.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0-rc.2"),
    ],
    targets: [
        .target(
            name: "KubeKit",
            dependencies: []),
        .testTarget(
            name: "KubeKitTests",
            dependencies: ["KubeKit"]),
    ]
)
