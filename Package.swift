// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftStringObfuscator",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(name: "swift_string_obfuscator", targets: ["swift_string_obfuscator"]),
    ],
    dependencies: [
        ..package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .revision("release/5.5")),
        .package(url: "https://github.com/SwiftDocOrg/SwiftSemantics.git", .upToNextMinor(from: "0.3.0")),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "0.3.2")),
    ],
    targets: [
        .target(
            name: "swift_string_obfuscator",
            dependencies: [
                "SwiftStringObfuscatorCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "SwiftStringObfuscatorCore",
            dependencies: ["SwiftSyntax"]
        ),
        .testTarget(
            name: "SwiftStringObfuscatorTests",
            dependencies: ["SwiftStringObfuscatorCore"]),
    ]
)
