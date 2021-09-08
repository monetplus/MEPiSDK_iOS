// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "11.0.0"
    static let ClientCertificates = "4.0.1"
    static let CommunicatorFramework = "4.0.2"
    static let CoreUtilities = "3.2.0"
    static let FSi = "11.0.0"
    static let JOSESwift = "2.0.3"
    static let MEPi = "11.0.0"
    static let MEPiCommons = "11.0.0"
    static let SecureStorage = "3.0.1"
    static let TalsecCertificatesFramework = "8.1.1"
    static let OpenSSL = "1.1.1100"
    static let CMiWebView = "11.0.0"
}

private class Checksums {
    static let CMiTP = "e72044e6432decfd3827690e78adae34c399b1834a1cb28a0af06df6e8d0e564"
    static let ClientCertificates = "8a0c103cfa28e818111248decb7518619d91796c0864a3936ddbcc2fa71449d4"
    static let CommunicatorFramework = "9095ebcc3e0adce7b8a2edcf38e45444ad16421759a5ffd0248e5c7597a65909"
    static let CoreUtilities = "4f50eeb97a0c6b1a644a34785b60894755cc696ab5698bdfa84bff31d948c7fd"
    static let FSi = "0bf2a299c10191411a92a6f977fc7041b5591a9bdfe265213c2567eff89d0417"
    static let JOSESwift = "0c336d29cc9d5568bc3d6d11fc12ec61779dc5ce4c8d86108a0ddf8951a270f2"
    static let MEPi = "77b4571e2a0f9d2f1ee7f980e0e0a5cb4e1d046c0eb206fa6225232c2ffd11db"
    static let MEPiCommons = "1733e11f724b7e3d62fb75616eaf32f26a6e4b8ab039e2c1d2aa18faaa0f27e7"
    static let SecureStorage = "379cafd7857ee160d6e7679693e0548f9cf0cb07f9b667d6dadb1c13c6ca0ef7"
    static let TalsecCertificatesFramework = "0bdc8c36785f4cb8901b03adce5d875770ad6c3aa5c65c8850da2565abbc4199"
    static let OpenSSL = "9801ebfd70beea9e1dd9ae2d607d84c014eb6dd86f1f993f1e26c2e3a5accc44"
    static let CMiWebView = "f964ecf5342b1e9eb262c81074e15c1211a0c142171dd5c5ff2688a1a536395d"
}

let package = Package(
    name: "MEPiSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "MEPiSDK",
            targets: [
                "CMiTP",
                "ClientCertificates",
                "CommunicatorFramework",
                "CoreUtilities",
                "FSi",
                "JOSESwift",
                "MEPi",
                "MEPiCommons",
                "SecureStorage",
                "TalsecCertificatesFramework",
                "OpenSSL"
            ]
        ),
        .library(
            name: "CMiWebView",
            targets: [
                "CMiWebView",
                "MEPiCommons",
                "CommunicatorFramework",
                "TalsecCertificatesFramework",
                "SecureStorage",
                "JOSESwift",
                "CoreUtilities",
                "Talsec"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "MEPiCommons", url: assembleUrl("mepisdk", "MEPiCommons", Versions.MEPiCommons), checksum: Checksums.MEPiCommons),
        .binaryTarget(name: "FSi", url: assembleUrl("mepisdk", "FSi", Versions.FSi), checksum: Checksums.FSi),
        .binaryTarget(name: "MEPi", url: assembleUrl("mepisdk", "MEPi", Versions.MEPi), checksum: Checksums.MEPi),
        .binaryTarget(name: "CMiTP", url: assembleUrl("mepisdk", "CMiTP", Versions.CMiTP), checksum: Checksums.CMiTP),
        .binaryTarget(name: "CMiWebView", url: assembleUrl("mepisdk", "CMiWebView", Versions.CMiWebView), checksum: Checksums.CMiWebView),
        .binaryTarget(name: "ClientCertificates", url: assembleUrl("talsec", "ClientCertificates", Versions.ClientCertificates), checksum: Checksums.ClientCertificates),
        .binaryTarget(name: "CommunicatorFramework", url: assembleUrl("utils", "CommunicatorFramework", Versions.CommunicatorFramework), checksum: Checksums.CommunicatorFramework),
        .binaryTarget(name: "CoreUtilities", url: assembleUrl("utils", "CoreUtilities", Versions.CoreUtilities), checksum: Checksums.CoreUtilities),
        .binaryTarget(name: "JOSESwift", url: assembleUrl("utils", "JOSESwift", Versions.JOSESwift), checksum: Checksums.JOSESwift),
        .binaryTarget(name: "SecureStorage", url: assembleUrl("talsec", "SecureStorage", Versions.SecureStorage), checksum: Checksums.SecureStorage),
        .binaryTarget(name: "TalsecCertificatesFramework", url: assembleUrl("talsec", "TalsecCertificatesFramework", Versions.TalsecCertificatesFramework), checksum: Checksums.TalsecCertificatesFramework),
        .binaryTarget(name: "OpenSSL", url: assembleUrl("utils", "OpenSSL", Versions.OpenSSL), checksum: Checksums.OpenSSL),
        .binaryTarget(name: "Talsec",
                      url: "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/talsec/Talsec/0.2.0/Talsec.xcframework.zip",
                      checksum: "2ce0f47ea31179723efe33562ae3d0d287d0447309b4de746216914c3e00c13d")
    ]
)

func assembleUrl(_ group: String, _ artifact: String, _ version: String) -> String {
    let url = "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/\(group)/\(artifact)/\(version)/\(artifact).xcframework.zip"
    print(url)
    return url
}
