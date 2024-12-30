// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let hotjar: Self = "Hotjar"
}

extension Target.Dependency {
    static var hotjar: Self { .target(name: .hotjar) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
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
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: .hotjar,
            dependencies: [
                .coenttbWeb,
                .dependenciesMacros,
            ]
        ),
        .testTarget(
            name: .hotjar + " Tests",
            dependencies: [
                .hotjar,
                .dependenciesTestSupport,
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
