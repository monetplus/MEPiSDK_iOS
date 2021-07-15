// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "9.0.0"
    static let ClientCertificates = "6bf7feb0a979e52ea7446e0a0358c08332c55770"
    static let CommunicatorFramework = "3.1.2"
    static let CoreUtilities = "2.1.2"
    static let FSi = "9.0.0"
    static let JOSESwift = "2.0.1"
    static let MEPi = "9.0.0"
    static let MEPiCommons = "9.0.0"
    static let SecureStorage = "412d9b46cf45387ef345a82aac1312a8901db3d4"
    static let TalsecCertificatesFramework = "7.0.0"
    static let OpenSSL = "1.1.1100"
    static let CMiWebView = "9.0.0"
}

private class Checksums {
    static let CMiTP = "257eb77ecb471369fbff77b7ec501737a1990319069dbee900781b722edb3d2e"
    static let ClientCertificates = "4571181eac51788cf7e399f6da168c601c92eb66e8fb27a351dd8ee8ceaa7b2c"
    static let CommunicatorFramework = "59b94bbd356b56b0e9bb00f636f9758c481f007353fe25edc81157cfb98f4bc9"
    static let CoreUtilities = "07d6d041a85db1488a48e9e576a6627cea16447cf96de3914f149ca799d65f89"
    static let FSi = "496fa3ed5ca858bc66346a94e3c321c25e4ebd88f6c52a1207b9699699e80b31"
    static let JOSESwift = "d77dd3cb00b0d6129d110de22c22043284baa979f9cc5521b4b75537b7893ade"
    static let MEPi = "a7dbeceb0edc20e9a570d4da515c2ba51c5fd2516b9a85146add6e26eb3fa28b"
    static let MEPiCommons = "054c1e4b4a3a7b0d50e56b5a13a16c69458eb8a48a90e3cd1e8b49a674627479"
    static let SecureStorage = "fe549b535e52ad5302baee23b94c94da916f3afc3970010ca1328f83d6db1680"
    static let TalsecCertificatesFramework = "2692782e8ae462bd4c4c06f29cdd5d0196d7d3b1332545dda5acdc3024f1ff05"
    static let OpenSSL = "9801ebfd70beea9e1dd9ae2d607d84c014eb6dd86f1f993f1e26c2e3a5accc44"
    static let CMiWebView = "4b72056d7de430543258e0c82fba712ae4c93618f282a9d7a72d7ebe94f7a9ef"
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
