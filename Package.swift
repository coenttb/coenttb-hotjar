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
    static var rateLimiter: Self { .product(name: "RateLimiter", package: "coenttb-utils") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var language: Self { .product(name: "Languages", package: "swift-language") }
    static var swiftHtml: Self { .product(name: "HTML", package: "swift-html") }
    static var codable: Self { .product(name: "MacroCodableKit", package: "macro-codable-kit") }
    static var memberwiseInit: Self { .product(name: "MemberwiseInit", package: "swift-memberwise-init-macro") }
    static var coenttbHtml: Self { .product(name: "CoenttbHTML", package: "coenttb-html") }
    static var environmentVariables: Self { .product(name: "EnvironmentVariables", package: "swift-environment-variables") }
    static var tagged: Self { .product(name: "Tagged", package: "swift-tagged") }
    static var urlRouting: Self { .product(name: "URLRouting", package: "swift-url-routing") }
    static var urlFormCoding: Self { .product(name: "UrlFormCoding", package: "swift-web") }
    static var swiftDate: Self { .product(name: "Date", package: "swift-date") }
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
        .package(url: "https://github.com/apple/swift-log", from: "1.5.0"),
        .package(url: "https://github.com/coenttb/coenttb-html", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-utils.git", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-html", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-web", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-date", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-environment-variables.git", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-language.git", branch: "main"),
        .package(url: "https://github.com/coenttb/macro-codable-kit.git", branch: "main"),
        .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.3.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.1.5"),
        .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0"),
        .package(url: "https://github.com/pointfreeco/swift-url-routing", from: "0.6.0"),
    ],
    targets: [
        .target(
            name: .hotjar,
            dependencies: [
                .memberwiseInit,
                .swiftHtml
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
