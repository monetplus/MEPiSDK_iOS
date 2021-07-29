// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "9.1.0"
    static let ClientCertificates = "6bf7feb0a979e52ea7446e0a0358c08332c55770"
    static let CommunicatorFramework = "3.1.2"
    static let CoreUtilities = "2.1.2"
    static let FSi = "9.1.0"
    static let JOSESwift = "2.0.1"
    static let MEPi = "9.1.0"
    static let MEPiCommons = "9.1.0"
    static let SecureStorage = "412d9b46cf45387ef345a82aac1312a8901db3d4"
    static let TalsecCertificatesFramework = "7.0.0"
    static let OpenSSL = "1.1.1100"
    static let CMiWebView = "9.1.0"
}

private class Checksums {
    static let CMiTP = "1ddfa5449a8d0f8ab7d3d04c98ff1f70852e7f47768d71c975875ef5e6be74dc"
    static let ClientCertificates = "4571181eac51788cf7e399f6da168c601c92eb66e8fb27a351dd8ee8ceaa7b2c"
    static let CommunicatorFramework = "59b94bbd356b56b0e9bb00f636f9758c481f007353fe25edc81157cfb98f4bc9"
    static let CoreUtilities = "07d6d041a85db1488a48e9e576a6627cea16447cf96de3914f149ca799d65f89"
    static let FSi = "5378de89aa67d161d688b614d562ccd2fceae9e6e686b782d6943193814ec444"
    static let JOSESwift = "d77dd3cb00b0d6129d110de22c22043284baa979f9cc5521b4b75537b7893ade"
    static let MEPi = "37b343586a65ce2eeb3fdad9969ca471399fc5a4c655c59c2521fb7706de81f8"
    static let MEPiCommons = "ea0b4434265a2e1edc9e6d47ea3d204fce35a4230bf15875db1448d5de32a329"
    static let SecureStorage = "fe549b535e52ad5302baee23b94c94da916f3afc3970010ca1328f83d6db1680"
    static let TalsecCertificatesFramework = "2692782e8ae462bd4c4c06f29cdd5d0196d7d3b1332545dda5acdc3024f1ff05"
    static let OpenSSL = "9801ebfd70beea9e1dd9ae2d607d84c014eb6dd86f1f993f1e26c2e3a5accc44"
    static let CMiWebView = "5e1fd2eecd9dffc8f2d7954c3c0aaeb5d9e058d160bd5cbab7c70c3038482cb0"
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
