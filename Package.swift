// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "18.1.0"
    static let ClientCertificates = "6.0.0"
    static let CommunicatorFramework = "7.1.0"
    static let CoreUtilities = "4.1.0"
    static let FSi = "18.1.0"
    static let JOSESwift = "2.0.6"
    static let MEPi = "18.1.0"
    static let MEPiCommons = "18.1.0"
    static let SecureStorage = "7.0.0"
    static let TalsecCertificatesFramework = "11.0.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "18.1.0"
    static let TalsecAttestation = "3.0.1"
}

private class Checksums {
    static let CMiTP = "66e9c1ffe81310969d1086fc025e33e4883c57dbbc0d024006d17a7f97263a64"
    static let ClientCertificates = "f87f57891c83c9a92150f1a66c637a67261d09dbe3cf77590c3909edff5250fb"
    static let CommunicatorFramework = "926d1725100ac401a03f6d28eaa6bdc7bef82524a5e74da55d3d5f5bc8064b66"
    static let CoreUtilities = "7ca72ff7251255bd613b12207529a024b525a79a728d354e2d70b5ec37c232ba"
    static let FSi = "d19568a277ca0808b1b12795ff86de43ff68a0330e290d545fca8665fb816b10"
    static let JOSESwift = "9a8f1d1b3d63d1c6ad3d67cc9ae34a1bdbadb9004ed244ea0e5eeef9b8e2dcd8"
    static let MEPi = "292265aab38a2773793ec8ed5febf83f949237b22b8423e7df0544e738473a86"
    static let MEPiCommons = "496b81c7d6370d85b281e75ec61cdfd27cf48988c266f415e2e4ee6750e80e08"
    static let SecureStorage = "f75b521d9220b3277d94be9d036f9daa0cb618a99060834142beab372c08ba8d"
    static let TalsecCertificatesFramework = "98d1b1def31a036e47793a7297f6217d066313047c9449e2cbef369ad5ba76e6"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "999961865885e135dd2438c6ef5b5c499d758a4e6bc99620df45454c91ab9802"
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
