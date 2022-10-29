// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "mew-wallet-ios-logger",
  platforms: [
    .iOS(.v14),
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "mew-wallet-ios-logger",
      targets: ["mew-wallet-ios-logger"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "mew-wallet-ios-logger",
      dependencies: [])
  ]
)
