// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "11.0.1"
    static let ClientCertificates = "4.0.3"
    static let CommunicatorFramework = "4.0.2"
    static let CoreUtilities = "3.2.0"
    static let FSi = "11.0.1"
    static let JOSESwift = "2.0.3"
    static let MEPi = "11.0.1"
    static let MEPiCommons = "11.0.1"
    static let SecureStorage = "3.0.3"
    static let TalsecCertificatesFramework = "8.1.2"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "11.0.1"
}

private class Checksums {
    static let CMiTP = "175e17d120bfbdac4ff8da03a5d7521e3db95f2f25ed16efc7cf7ccf9bf3ad94"
    static let ClientCertificates = "4522e68617f9d985311641f82ef0c26702fd1ae45ea87ab2feb10977f75445af"
    static let CommunicatorFramework = "9095ebcc3e0adce7b8a2edcf38e45444ad16421759a5ffd0248e5c7597a65909"
    static let CoreUtilities = "4f50eeb97a0c6b1a644a34785b60894755cc696ab5698bdfa84bff31d948c7fd"
    static let FSi = "5f0e073117417bd4f558ba939d6d4f131d54b54dbf7aa1c4d226dff3855a72f6"
    static let JOSESwift = "0c336d29cc9d5568bc3d6d11fc12ec61779dc5ce4c8d86108a0ddf8951a270f2"
    static let MEPi = "8234093da3200b2a035fa4390105a55d6d98e8aa5180b5ebf4bc709a84a5b06c"
    static let MEPiCommons = "a3ea06a491a72933ca87e1f97ccc33dac4f5f3a8ead750fb621d52e27816c078"
    static let SecureStorage = "1c31114fe2733746f0c1be861f07cc89906529d583ad7193a5e524f14997a5ca"
    static let TalsecCertificatesFramework = "4bb8ea02b24dc58fd0b33ca03186951df4ae3f12bbd14415bb4dcaf143fff2e7"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "f96540a39acd47da78255142e98e15dd3eb44b6b0ed4c19253c73157c4e9ffe7"
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
