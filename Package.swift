// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "19.1.0"
    static let ClientCertificates = "7.0.0"
    static let CommunicatorFramework = "7.1.1"
    static let CoreUtilities = "4.1.0"
    static let FSi = "19.1.0"
    static let JOSESwift = "2.0.6"
    static let MEPi = "19.1.0"
    static let MEPiCommons = "19.1.0"
    static let SecureStorage = "9.0.0"
    static let TalsecCertificatesFramework = "12.0.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "19.1.0"
    static let TalsecAttestation = "3.0.1"
}

private class Checksums {
    static let CMiTP = "e436193538440338722a9f90b740dc9793a42f7a8d46801b42a486123d17a229"
    static let ClientCertificates = "1bf86d943c4f04113994030236ca588ed170410f3de444718cd4166eaacc6bcf"
    static let CommunicatorFramework = "aefd32f0e5f7068d77d49a8f03ce3b5fb860ce5408fed0f51bbe4fc9778a1aac"
    static let CoreUtilities = "7ca72ff7251255bd613b12207529a024b525a79a728d354e2d70b5ec37c232ba"
    static let FSi = "d9ba3d2a2677d439c6fe9b155e8665ae546bfd04d196c5ed567cb747cc36eaee"
    static let JOSESwift = "9a8f1d1b3d63d1c6ad3d67cc9ae34a1bdbadb9004ed244ea0e5eeef9b8e2dcd8"
    static let MEPi = "54baf718ed004bd03cedadbe5c2571f7955257ac480fe865e2f7e95e1ea0055d"
    static let MEPiCommons = "40a7602569a102edc94adf3b7c5990b5bad869e4f1f9c1170b67e981bf038140"
    static let SecureStorage = "5166fa924fa7fc40f55c0d0df8967c00e063df5f1da9ff18f1c8fb8af37e47fd"
    static let TalsecCertificatesFramework = "833b7f5293ef4a7ee03080de8487f5b4e098a58e5dc0eba9e3ce40a1940f77be"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "f8f136d04f0be5ce75f8907608e8212b37d3d3c7cec0ae7053b088df9ebf1360"
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
