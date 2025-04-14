// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "22.0.0"
    static let ClientCertificates = "8.0.0"
    static let CommunicatorFramework = "13.0.0"
    static let CoreUtilities = "6.0.0"
    static let FSi = "22.0.0"
    static let JOSESwift = "3.0.0"
    static let MEPi = "22.0.0"
    static let MEPiCommons = "22.0.0"
    static let SecureStorage = "10.0.0"
    static let TalsecCertificatesFramework = "15.0.0"
    static let OpenSSL = "3.3.3001"
    static let CMiWebView = "22.0.0"
    static let TalsecAttestation = "7.0.0"
}

private class Checksums {
    static let CMiTP = "df9d5f727eb21a029c0611756cd9c621aa8b46b03f2e9adec62ee4192b634980"
    static let ClientCertificates = "2f7f68b626bf453abb55d2d08861477fc7f4b58ddcc800b55bb6d6ce36a31b05"
    static let CommunicatorFramework = "5642be4cd178fa3945a9cd3492647016fef1bc3a1ce7d8595c21f8849c33ebc8"
    static let CoreUtilities = "a18fd8596403f290884b86bc8941f13b9eb06f960d67c9ebfd3e50d5d91b4ffc"
    static let FSi = "48e7e69ad127639b318a83115be0befc0186c885ea481da5e8dd165b792c9ad2"
    static let JOSESwift = "f23c30ed15df37820b6674b4b0141312f10cfbcfe48fc123d5adc345d4460902"
    static let MEPi = "4b3292eadee2cc5239ce5eabe70ba4025d1559cb60c5506ed19f561ad4ff044e"
    static let MEPiCommons = "c10e3f598b2f46f51169c5f6db7eb674f00e6a9058bdec5e50c642b62067075d"
    static let SecureStorage = "6a705def6060b412aafc1b11e759a75027a064f104ade855b1d29d0ca5fd56b4"
    static let TalsecCertificatesFramework = "69903f0e31b7a6905b4259238c03c09e5585b722140c7414374f87e4df351826"
    static let OpenSSL = "f7a82e597732021502c3cd7b66f3c1e401952a6660b79b72692469b34a932611"
    static let CMiWebView = "400b9f8b70ae78689b9b86f646343020cbab5d9a8fc24b0f02a78e7f1598dd30"
    static let TalsecAttestation = "b26770536a13b76cded1d125a346cd99fa8eb0786f547c4ad7924965f54488bc"
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
