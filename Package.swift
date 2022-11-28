// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Matrix",
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .executableTarget(name: "Ex00", dependencies: ["Functions"]),
    .executableTarget(name: "Ex01", dependencies: ["Functions"]),
    .executableTarget(name: "Ex02", dependencies: ["Functions"]),
    .executableTarget(name: "Ex03", dependencies: ["Functions"]),
    .executableTarget(name: "Ex04", dependencies: ["Functions"]),
    .testTarget(name: "Ex00Tests", dependencies: ["Functions"]),
    .testTarget(name: "Ex01Tests", dependencies: ["Functions"]),
    .testTarget(name: "Ex02Tests", dependencies: ["Functions"]),
    .testTarget(name: "Ex03Tests", dependencies: ["Functions"]),
    .testTarget(name: "Ex04Tests", dependencies: ["Functions"]),
    .target(name: "Utils"),
    .target(name: "Models"),
    .target(name: "Functions", dependencies: ["Utils", "Models"]),
  ]
)
