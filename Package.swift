// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let hotjar: Self = "CoenttbHotjar"
}

extension Target.Dependency {
    static var hotjar: Self { .target(name: .hotjar) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "CoenttbWeb", package: "coenttb-web") }
    static var codable: Self { .product(name: "MacroCodableKit", package: "macro-codable-kit") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var memberwiseInit: Self { .product(name: "MemberwiseInit", package: "swift-memberwise-init-macro") }
}

let package = Package(
    name: "coenttb-hotjar",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: .hotjar, targets: [.hotjar]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-web", branch: "main"),
        .package(url: "https://github.com/coenttb/macro-codable-kit.git", branch: "main"),
        .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.5.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: .hotjar,
            dependencies: [
                .coenttbWeb,
                .memberwiseInit,
            ]
        ),
        .testTarget(
            name: .hotjar + " Tests",
            dependencies: [
                .hotjar
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
