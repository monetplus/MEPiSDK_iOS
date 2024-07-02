// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "20.3.0"
    static let ClientCertificates = "7.2.0"
    static let CommunicatorFramework = "11.0.5"
    static let CoreUtilities = "4.2.0"
    static let FSi = "20.3.0"
    static let JOSESwift = "2.0.7"
    static let MEPi = "20.3.0"
    static let MEPiCommons = "20.3.0"
    static let SecureStorage = "9.1.1"
    static let TalsecCertificatesFramework = "12.5.1"
    static let OpenSSL = "3.1.5006"
    static let CMiWebView = "20.3.0"
    static let TalsecAttestation = "5.0.1"
}

private class Checksums {
    static let CMiTP = "c98eb8fb22d4e8dc4922ac1d83005137827b1d6e1234bebcdccd754508e77f3a"
    static let ClientCertificates = "ba96b690bc5aef7aa95a599313794afa019910444bdeb0c4410a479024b269b4"
    static let CommunicatorFramework = "1a190b8342af03b4d575d0a2dce5213cb49ed441a762cf51ab169fccb2d9cd0d"
    static let CoreUtilities = "de91c9753a277798b0624046603d0f5a1afcaf4a1aca3a1834c96dc5df6770f5"
    static let FSi = "edfbd90ca039722bf08a7a35456d80f7bae239d601727290c793851bc5652e8e"
    static let JOSESwift = "5a5f822b05db76d37244320a956c74673d363b5a97df72f42ffca3ef57c089ef"
    static let MEPi = "a5ca2dea539636571126ebd045e31c3aff9ba1dafb802ec4e6567e4126ba124e"
    static let MEPiCommons = "e3840a6ee8602576fcaac0c633839301ec9f69ec1830cc285ce267a5c078717a"
    static let SecureStorage = "385c4933b55a58515f735531596a4a0e219c653d30b131ea37414c7f5a2585ee"
    static let TalsecCertificatesFramework = "1357d61f785344c2fe285072ac29133540c03d5e03685a05e38a1ddcb14dc389"
    static let OpenSSL = "ee021d7222978143d79ce3095115c01803dfe3010da47a4f655b1dc2d42b05ea"
    static let CMiWebView = "64e76021389768227719a00da43291fd3c34fb6e7dd92b661309547329527b30"
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
