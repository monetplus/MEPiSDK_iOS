// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "20.4.0"
    static let ClientCertificates = "7.3.0"
    static let CommunicatorFramework = "11.0.5"
    static let CoreUtilities = "5.0.0"
    static let FSi = "20.4.0"
    static let JOSESwift = "2.0.7"
    static let MEPi = "20.4.0"
    static let MEPiCommons = "20.4.0"
    static let SecureStorage = "9.2.0"
    static let TalsecCertificatesFramework = "12.6.0"
    static let OpenSSL = "3.1.5006"
    static let CMiWebView = "20.4.0"
    static let TalsecAttestation = "5.0.1"
}

private class Checksums {
    static let CMiTP = "1d2ab60d77fbba174aefb298e0f862a6b5c6d67c373c9332513c89995251bd7e"
    static let ClientCertificates = "4bef7cf94dd6c16fc1cd67b0d67a506dc8a979d451b42921b6fa29ee48ee0e00"
    static let CommunicatorFramework = "1a190b8342af03b4d575d0a2dce5213cb49ed441a762cf51ab169fccb2d9cd0d"
    static let CoreUtilities = "ee93b17f57b8166037b7485dc91a4cff81b5ed0c0ece8a2dfc1bf62882ae73c8"
    static let FSi = "c1946e7df02d0279333d8ff8e915d9d072db73d456823d2a970155fdbb82cf0f"
    static let JOSESwift = "5a5f822b05db76d37244320a956c74673d363b5a97df72f42ffca3ef57c089ef"
    static let MEPi = "9b5003ed38b437a15c43a95342e4553a184dc04dcc1820ba29094a4646232adb"
    static let MEPiCommons = "c844536473392f6ce86fb11ba89f47a48bf504934c3d46d80b763cd1142c5431"
    static let SecureStorage = "62a42e59a1db4239526cf0bd31cf604d88bd33283281ae1847f75c61ecf56334"
    static let TalsecCertificatesFramework = "21a32f517f7f4ee1173e84d9225dd081f50726cda7e3d73e2b30ee2ffa99cd03"
    static let OpenSSL = "ee021d7222978143d79ce3095115c01803dfe3010da47a4f655b1dc2d42b05ea"
    static let CMiWebView = "c3d775e99bb016bada47a6c48741f9835591a66812963bb5d783d926b2cd7519"
    static let TalsecAttestation = "2164404cd108aac91f21c78930f3534f9a2f380d51f96e5f0a95583b88a0b2e0"
}

let package = Package(
    name: "MEPiSDK",
    platforms: [
        .iOS(.v14)
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
                "OpenSSL",
                "TalsecAttestation"
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
        .binaryTarget(name: "TalsecAttestation", url: assembleUrl("talsec", "TalsecAttestation", Versions.TalsecAttestation), checksum: Checksums.TalsecAttestation),
        .binaryTarget(name: "OpenSSL", url: assembleUrl("utils", "OpenSSL", Versions.OpenSSL), checksum: Checksums.OpenSSL),
        .binaryTarget(name: "Talsec",
                      url: "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/talsec/Talsec/1.1.2/Talsec.xcframework.zip",
                      checksum: "1624f80e6f08c5253a7a4274b23c05eba9f611c9a2c83a79c30a8388c88b8bb1")
    ]
)

func assembleUrl(_ group: String, _ artifact: String, _ version: String) -> String {
    let url = "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/\(group)/\(artifact)/\(version)/\(artifact).xcframework.zip"
    print(url)
    return url
}
