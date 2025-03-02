// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "mixpanel-swift",
  platforms: [
    .macOS(.v15),
    .iOS(.v18),
  ],
  products: [
    .library(
      name: "Mixpanel",
      targets: ["Mixpanel"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types", from: "1.3.0"),
    .package(url: "https://github.com/zunda-pixel/http-client", from: "0.3.0"),
  ],
  targets: [
    .target(
      name: "Mixpanel",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types"),
        .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
        .product(name: "HTTPClient", package: "http-client"),
      ]
    ),
    .testTarget(
      name: "MixpanelTests",
      dependencies: [
        .target(name: "Mixpanel"),
      ]
    ),
  ]
)
