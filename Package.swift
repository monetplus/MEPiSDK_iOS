// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "13.0.1"
    static let ClientCertificates = "4.0.4"
    static let CommunicatorFramework = "4.0.2"
    static let CoreUtilities = "3.2.2"
    static let FSi = "13.0.1"
    static let JOSESwift = "2.0.3"
    static let MEPi = "13.0.1"
    static let MEPiCommons = "13.0.1"
    static let SecureStorage = "4.0.0"
    static let TalsecCertificatesFramework = "8.1.4"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "13.0.1"
}

private class Checksums {
    static let CMiTP = "42fe1e5aa6bd9eca4a7a3a7732e482c49e0cf55409e4ef28a2823e4a61911cd0"
    static let ClientCertificates = "6fe03571c18015ca605af9b42d968ac966399d7200c0ef8ebd1c03681850b950"
    static let CommunicatorFramework = "9095ebcc3e0adce7b8a2edcf38e45444ad16421759a5ffd0248e5c7597a65909"
    static let CoreUtilities = "fca313a3270edc90125a5df35b77c1e961958322c6ce6785fce9e4983473d432"
    static let FSi = "df7b88a416536b71cf4b452af9168657c825bd6ea4a50ebbc21a1fc97b265cf8"
    static let JOSESwift = "0c336d29cc9d5568bc3d6d11fc12ec61779dc5ce4c8d86108a0ddf8951a270f2"
    static let MEPi = "c0b9d16de51887178388dc687e491f0fce9d7c5c6efe4546e37abccdcbbbf89c"
    static let MEPiCommons = "96ac76e576f9f3db20e5c4fa75a963d6f5527ce88fe8c0a0384a60798bbf647d"
    static let SecureStorage = "020e1f6528689973989fc470bccba2507a26aa7d323c22dd976a9045dd63e6c4"
    static let TalsecCertificatesFramework = "74ebae7aa2ad6b519b3a38dc46ba86b2fc1293a30819a8759552649aa496cda7"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "bcae95b68ecf7351149c50868ecbafc50749e37674dd5be29b8d73439d2fc198"
}

let package = Package(
    name: "MEPiSDK",
    platforms: [
        .iOS(.v11)
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
                "OpenSSL"
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
