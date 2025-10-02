// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "23.0.0"
    static let ClientCertificates = "9.0.0"
    static let CommunicatorFramework = "13.0.1"
    static let CoreUtilities = "6.0.0"
    static let FSi = "23.0.0"
    static let JOSESwift = "3.0.0"
    static let MEPi = "23.0.0"
    static let MEPiCommons = "23.0.0"
    static let SecureStorage = "11.0.3"
    static let TalsecCertificatesFramework = "16.0.0"
    static let OpenSSL = "3.3.3001"
    static let CMiWebView = "23.0.0"
    static let TalsecAttestation = "7.0.0"
}

private class Checksums {
    static let CMiTP = "46672919a6bbe2231c50b7e17f9513e6bde604bc42b4d5532dc917201f56f2a0"
    static let ClientCertificates = "4ca65ac9ab980c7fcd3500c00b3edc4fe0cc9d5a51d59d150fe0ffdeb9f9809b"
    static let CommunicatorFramework = "b8376d398c65580de73e4900333eec9406559342a4fbdaec789cd32b72509e0d"
    static let CoreUtilities = "a18fd8596403f290884b86bc8941f13b9eb06f960d67c9ebfd3e50d5d91b4ffc"
    static let FSi = "40c8110b5a6d053620eb112ee404f6577f0c279e6ad845945ca8fc963766b425"
    static let JOSESwift = "f23c30ed15df37820b6674b4b0141312f10cfbcfe48fc123d5adc345d4460902"
    static let MEPi = "8d12e019217a97fb76e1005c9c921cb3af9debeb8006d33091b1553dc3d9a1a3"
    static let MEPiCommons = "d3cf3cd56a275249ee91de46a66f6f8a001fb2aee9599d3ae061419873176efd"
    static let SecureStorage = "512be5b9290f98596709c0bb7debc4fb8214b7fa75b531009914bb00640a5d8e"
    static let TalsecCertificatesFramework = "f1b36fc2280f1800fc076cb0894ff1bf48c074a79524bf22bdcdaf6adba614b6"
    static let OpenSSL = "f7a82e597732021502c3cd7b66f3c1e401952a6660b79b72692469b34a932611"
    static let CMiWebView = "ba2a5028e8d3b1044d1b427166349194fba00eeb50f1e5e934a30184ef5624ea"
    static let TalsecAttestation = "b26770536a13b76cded1d125a346cd99fa8eb0786f547c4ad7924965f54488bc"
}

let package = Package(
    name: "MEPiSDK",
    platforms: [
        .iOS(.v15)
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
