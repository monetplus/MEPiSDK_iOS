// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "17.1.0"
    static let ClientCertificates = "5.1.0"
    static let CommunicatorFramework = "6.0.2"
    static let CoreUtilities = "3.2.3"
    static let FSi = "17.1.0"
    static let JOSESwift = "2.0.5"
    static let MEPi = "17.1.0"
    static let MEPiCommons = "17.1.0"
    static let SecureStorage = "6.1.0"
    static let TalsecCertificatesFramework = "10.1.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "17.1.0"
    static let TalsecAttestation = "1.1.0"
}

private class Checksums {
    static let CMiTP = "c2f8ce705e4572f62c0116e63a8844b3652542e81cee15813f3a3fabc90777e7"
    static let ClientCertificates = "6f732422cedb846298a8a83da4625c12c701a7fb09754f58f910104f292dc42e"
    static let CommunicatorFramework = "6067862efdcd5bbc429891d2281c3f69ea78723da9d59c05ba5b23b97ea60415"
    static let CoreUtilities = "bf41861bb6b26c825e8066dc514a4ff4883c18a2ae7daf8429da4d9c80909ca3"
    static let FSi = "2c7ce6f47c7633484c60886ffd8c43a90921ea1efbe2180d55d9064116c9a7f3"
    static let JOSESwift = "84d97de8fabc4038c1f2055c07a59da54e7de420a00aba519df08a3f93cd7e58"
    static let MEPi = "bc02de7e423ed6fbf6bd69fd69495dce0cf319a773a2962b46dac9dd276cccea"
    static let MEPiCommons = "123f8acbd531e8a091edb70cb61cea5feaa4ac79af4d040489c267a49d11be88"
    static let SecureStorage = "7cd1eef59600c511b0af7d1ea0eef739987690644b0581ba7caf5c1b0d163707"
    static let TalsecCertificatesFramework = "26f410b5d2ccdc2c4e8f902313b3d82aa995c84aea7317185ae35bde46d4b5b1"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "7ba0c826bf3f0f51c5d232e11f1df99fd1123cf167383b7a051a82702e676bce"
    static let TalsecAttestation = "568cc12114a90bf7694fbb14f0381c3dacc030fe59c6fa3277064f22dc7a106c"
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
                      url: "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/talsec/Talsec/0.2.0/Talsec.xcframework.zip",
                      checksum: "2ce0f47ea31179723efe33562ae3d0d287d0447309b4de746216914c3e00c13d")
    ]
)

func assembleUrl(_ group: String, _ artifact: String, _ version: String) -> String {
    let url = "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/\(group)/\(artifact)/\(version)/\(artifact).xcframework.zip"
    print(url)
    return url
}
