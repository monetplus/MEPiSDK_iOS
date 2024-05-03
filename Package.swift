// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "20.1.4"
    static let ClientCertificates = "7.1.2"
    static let CommunicatorFramework = "11.0.5"
    static let CoreUtilities = "4.2.0"
    static let FSi = "20.1.4"
    static let JOSESwift = "2.0.6"
    static let MEPi = "20.1.4"
    static let MEPiCommons = "20.1.4"
    static let SecureStorage = "9.1.1"
    static let TalsecCertificatesFramework = "12.5.1"
    static let OpenSSL = "3.1.5004"
    static let CMiWebView = "20.1.4"
    static let TalsecAttestation = "5.0.1"
}

private class Checksums {
    static let CMiTP = "3add7d280519f0fac7317e2878e3d42eff9d8a00fa6fcef649785a69120cc51d"
    static let ClientCertificates = "9309f841c51e0c2ea934d761428cd39774aa999d39064f9adda33fc5dc4f7fce"
    static let CommunicatorFramework = "1a190b8342af03b4d575d0a2dce5213cb49ed441a762cf51ab169fccb2d9cd0d"
    static let CoreUtilities = "de91c9753a277798b0624046603d0f5a1afcaf4a1aca3a1834c96dc5df6770f5"
    static let FSi = "c480e0363f9c8ae2a883adec7efc0c67e7acbaba83e1c3952664a8aa967fbff3"
    static let JOSESwift = "9a8f1d1b3d63d1c6ad3d67cc9ae34a1bdbadb9004ed244ea0e5eeef9b8e2dcd8"
    static let MEPi = "66ba06b9a63a9229a1ba684bb27b32c551aea76600f80969da7f33ae2ab63456"
    static let MEPiCommons = "f1444f6ed927f2e1c40f1149061139901a39dea31e3e6694a6f5862d4434ae6e"
    static let SecureStorage = "385c4933b55a58515f735531596a4a0e219c653d30b131ea37414c7f5a2585ee"
    static let TalsecCertificatesFramework = "1357d61f785344c2fe285072ac29133540c03d5e03685a05e38a1ddcb14dc389"
    static let OpenSSL = "693fdfbbc6a87b40571df1ab35da838c545646ddc94b799940398901f404a2c8"
    static let CMiWebView = "f5a0f502bebe61ec9bee93c662d13897e386c6f2e5b576e3fb32d865f26a82cb"
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
