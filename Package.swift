// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "13.0.0"
    static let ClientCertificates = "4.0.3"
    static let CommunicatorFramework = "4.0.2"
    static let CoreUtilities = "3.2.0"
    static let FSi = "13.0.0"
    static let JOSESwift = "2.0.3"
    static let MEPi = "13.0.0"
    static let MEPiCommons = "13.0.0"
    static let SecureStorage = "3.0.3"
    static let TalsecCertificatesFramework = "8.1.3"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "13.0.0"
}

private class Checksums {
    static let CMiTP = "9db43973dfdc6af99cd6b47e9443f917648f69ad23eccc1ecd0c96ad126fad5b"
    static let ClientCertificates = "4522e68617f9d985311641f82ef0c26702fd1ae45ea87ab2feb10977f75445af"
    static let CommunicatorFramework = "9095ebcc3e0adce7b8a2edcf38e45444ad16421759a5ffd0248e5c7597a65909"
    static let CoreUtilities = "4f50eeb97a0c6b1a644a34785b60894755cc696ab5698bdfa84bff31d948c7fd"
    static let FSi = "07252d2b2d360a274706201041bdd38175ffe682a8559987de230d6596e1f721"
    static let JOSESwift = "0c336d29cc9d5568bc3d6d11fc12ec61779dc5ce4c8d86108a0ddf8951a270f2"
    static let MEPi = "c4f0e6683268151511aac6c27df1114decb4040c8fc57f1b242b727e17c1da60"
    static let MEPiCommons = "df0debdf7c306ef0fa4309b64d81b95d5f2e20bcacad5b826a6c0284c3c5e291"
    static let SecureStorage = "1c31114fe2733746f0c1be861f07cc89906529d583ad7193a5e524f14997a5ca"
    static let TalsecCertificatesFramework = "4fb1a09d4de1c8c19614770f6d4cfb9e5f45e00aa74b6281a3d7b82a3c293bdd"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "ac43c637519e835b5fd54632012bf09fcd061838d82a809a32893cf0991bce4f"
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
