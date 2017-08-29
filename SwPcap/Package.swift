// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "SwPcap",
     dependencies: [
        .Package(url: "../Cpcap", "1.0.0")
    ]

)
