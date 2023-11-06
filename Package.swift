// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Spinner",
    products: [
        .library(name: "Spinner", targets: ["Spinner"])
    ],
    dependencies: [
        .package(url: "https://github.com/dominicegginton/Nanoseconds", from: "1.1.2"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.0"),
        .package(url: "https://github.com/IBM-Swift/BlueSignals.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "Spinner", dependencies: ["Nanoseconds", "Rainbow", .product(name: "Signals", package: "BlueSignals")]),
    ]
)
