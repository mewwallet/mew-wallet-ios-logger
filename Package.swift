// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "mew-wallet-ios-logger",
  platforms: [
    .iOS(.v14),
    .macOS(.v13)
  ],
  products: [
    .library(
      name: "mew-wallet-ios-logger",
      targets: ["mew-wallet-ios-logger"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    .package(url: "https://github.com/ianpartridge/swift-log-syslog.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "mew-wallet-ios-logger",
      dependencies: [
        .product(name: "Logging", package: "swift-log"),
        .product(name: "LoggingSyslog", package: "swift-log-syslog", condition: .when(platforms: [.android, .linux, .wasi]))
      ],
      resources: [
        .copy("Privacy/PrivacyInfo.xcprivacy")
      ],
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency=complete")
      ]
    ),
    .testTarget(
      name: "mew-wallet-ios-logger-test",
      dependencies: [
        "mew-wallet-ios-logger"
      ],
      swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency=complete")
      ]
    )
  ]
)
