// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "cryptopals",
    products: [
        .executable(name: "cryptopals", targets: ["cryptopals"]),
    ],
    dependencies: [

    ],
    targets: [
        .executableTarget(
            name: "cryptopals",
            dependencies: []),
        .testTarget(
            name: "cryptopalsTests",
            dependencies: ["cryptopals"]),
    ]
)