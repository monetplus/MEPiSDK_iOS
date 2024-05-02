// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "20.1.3"
    static let ClientCertificates = "7.1.0"
    static let CommunicatorFramework = "11.0.5"
    static let CoreUtilities = "4.2.0"
    static let FSi = "20.1.3"
    static let JOSESwift = "2.0.6"
    static let MEPi = "20.1.3"
    static let MEPiCommons = "20.1.3"
    static let SecureStorage = "9.1.1"
    static let TalsecCertificatesFramework = "12.5.1"
    static let OpenSSL = "3.1.5000"
    static let CMiWebView = "20.1.3"
    static let TalsecAttestation = "5.0.1"
}

private class Checksums {
    static let CMiTP = "feb36e7af76bc65c1aa3b56df124d3ca2d760aeaf3bd60669b4e6c31b713fef7"
    static let ClientCertificates = "2fe288d6dd7c13a2bdc506acb4fa79872a9812aa3d612dc8f1c069cd6875641b"
    static let CommunicatorFramework = "1a190b8342af03b4d575d0a2dce5213cb49ed441a762cf51ab169fccb2d9cd0d"
    static let CoreUtilities = "de91c9753a277798b0624046603d0f5a1afcaf4a1aca3a1834c96dc5df6770f5"
    static let FSi = "40ea6feb09af47c45778a15f9f37b24865f34f2312ed551b4257f99beb9994cb"
    static let JOSESwift = "9a8f1d1b3d63d1c6ad3d67cc9ae34a1bdbadb9004ed244ea0e5eeef9b8e2dcd8"
    static let MEPi = "d65371511d24bf311ea51b68affd126fcde22e4ede082fbe928144404197c7dd"
    static let MEPiCommons = "4707cb1dc3bd61e4775234fa4bd4416628487c71cbe4d10e9a972eac1ccbc1d7"
    static let SecureStorage = "385c4933b55a58515f735531596a4a0e219c653d30b131ea37414c7f5a2585ee"
    static let TalsecCertificatesFramework = "1357d61f785344c2fe285072ac29133540c03d5e03685a05e38a1ddcb14dc389"
    static let OpenSSL = "edcbc8c9ff70a01d1d25e0ffe1d5f8af15ab6a5c57c5e579c0d518703d8eb09d"
    static let CMiWebView = "2dbc77dc371633694b0b0fe0df52eefb0fb7be9b990941d302924b20f2d7d609"
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
