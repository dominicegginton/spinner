// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Spinner",
    products: [
        .library(name: "Spinner", targets: ["Spinner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/dominicegginton/Nanoseconds", from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/IBM-Swift/BlueSignals.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "Spinner", dependencies: ["Nanoseconds","Rainbow", "Signals"]),
        .testTarget(name: "SpinnerTests", dependencies: ["Spinner"]),
    ]
)
