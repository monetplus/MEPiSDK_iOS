// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "18.1.2"
    static let ClientCertificates = "6.0.0"
    static let CommunicatorFramework = "7.1.0"
    static let CoreUtilities = "4.1.0"
    static let FSi = "18.1.2"
    static let JOSESwift = "2.0.6"
    static let MEPi = "18.1.2"
    static let MEPiCommons = "18.1.2"
    static let SecureStorage = "7.1.0"
    static let TalsecCertificatesFramework = "11.0.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "18.1.2"
    static let TalsecAttestation = "3.0.1"
}

private class Checksums {
    static let CMiTP = "dc2b44dd7adb6d61bae7de6c5c640e255c4894acfad6c5c012d9eb1d730b13cd"
    static let ClientCertificates = "f87f57891c83c9a92150f1a66c637a67261d09dbe3cf77590c3909edff5250fb"
    static let CommunicatorFramework = "926d1725100ac401a03f6d28eaa6bdc7bef82524a5e74da55d3d5f5bc8064b66"
    static let CoreUtilities = "7ca72ff7251255bd613b12207529a024b525a79a728d354e2d70b5ec37c232ba"
    static let FSi = "e24c6091aa5170a2c03b6c6e719e47097e6c09720ce710a01987af7ba8220efb"
    static let JOSESwift = "9a8f1d1b3d63d1c6ad3d67cc9ae34a1bdbadb9004ed244ea0e5eeef9b8e2dcd8"
    static let MEPi = "a1018b1ea3c022c20e5e849848b4c6a9e5fd577ff0726d22d584f4c8d440296b"
    static let MEPiCommons = "261b271160cd842022c343c05456eb9e6a0f07b5937267ad8636a7a0a674ba2a"
    static let SecureStorage = "158c888ea49dbe06222299d6b5d6102601e03262adbaa9d0bfad8ef3ba78d404"
    static let TalsecCertificatesFramework = "98d1b1def31a036e47793a7297f6217d066313047c9449e2cbef369ad5ba76e6"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "b550607022f45505d9904a0d8107c00c4adb96ff987e1df11ce6a280e5a785a8"
    static let TalsecAttestation = "35f2c1615122ee60a7649c8a6f8f22838ad58c83a1677ab1d66337e8d6f8fdd7"
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
