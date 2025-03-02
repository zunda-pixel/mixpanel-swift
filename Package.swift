// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "mixpanel-swift",
  products: [
    .library(
      name: "Mixpanel",
      targets: ["Mixpanel"]),
  ],
  targets: [
    .target(
      name: "Mixpanel"),
    .testTarget(
      name: "MixpanelTests",
      dependencies: ["Mixpanel"]
    ),
  ]
)
