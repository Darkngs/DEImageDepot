// swift-tools-version:5.2

import PackageDescription

let package = Package(
   name: "DEImageDepot",
   products: [
      .library(name: "DEImageDepot", targets: ["DEImageDepot"])
   ],
   targets: [
      .target(name: "DEImageDepot", dependencies: [])
   ],
   swiftLanguageVersions: [.v5]
)
