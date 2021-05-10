// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "8.0.2"
    static let ClientCertificates = "6bf7feb0a979e52ea7446e0a0358c08332c55770"
    static let CommunicatorFramework = "3.1.1"
    static let CoreUtilities = "2.1.1"
    static let FSi = "8.0.2"
    static let JOSESwift = "2.0.0"
    static let MEPi = "8.0.2"
    static let MEPiCommons = "8.0.2"
    static let SecureStorage = "412d9b46cf45387ef345a82aac1312a8901db3d4"
    static let TalsecCertificatesFramework = "7.0.0"
    static let OpenSSL = "1.1.1100"
    static let CMiWebView = "8.0.2"
}

private class Checksums {
    static let CMiTP = "cb6c9e8a525af2f415efbaf0b78757ddd9a2185def8dd7c8d55c01eef748db44"
    static let ClientCertificates = "4571181eac51788cf7e399f6da168c601c92eb66e8fb27a351dd8ee8ceaa7b2c"
    static let CommunicatorFramework = "5c54980f16fbb03755de2fe2740e175490c3953f58aa6fe999600e7c203d9e9b"
    static let CoreUtilities = "ffd566bf9d62bbf52407178341b83d0028d0e83f14f6d78b0b2294c8c5934052"
    static let FSi = "a339880c37a3ca32055214c6ca885fd3b4a47d8decc9f45b75d45e8341307849"
    static let JOSESwift = "4f2f51ad0df5f2d71fe7e1dbfdf9b7b69153752fb2cf6eca26183e076539299b"
    static let MEPi = "1e7bd4cf782923b8c31c4b0e27796917802b368db1460118980e16a8c879bbb4"
    static let MEPiCommons = "b3b6dcebaf85a63a3cd4ed09981b502849544874226cb7d4322c757da312e753"
    static let SecureStorage = "fe549b535e52ad5302baee23b94c94da916f3afc3970010ca1328f83d6db1680"
    static let TalsecCertificatesFramework = "2692782e8ae462bd4c4c06f29cdd5d0196d7d3b1332545dda5acdc3024f1ff05"
    static let OpenSSL = "9801ebfd70beea9e1dd9ae2d607d84c014eb6dd86f1f993f1e26c2e3a5accc44"
    static let CMiWebView = "2ffc59b300cbca3cc9dcb98c98ffc3df92d9ad8d2462255c83e02d96416d3ad0"
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
