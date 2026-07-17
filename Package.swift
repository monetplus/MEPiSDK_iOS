// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "26.1.0"
    static let ClientCertificates = "9.0.0"
    static let CommunicatorFramework = "14.1.2"
    static let CoreUtilities = "6.0.0"
    static let FSi = "26.1.0"
    static let JOSESwift = "3.0.0"
    static let MEPi = "26.1.0"
    static let MEPiCommons = "26.1.0"
    static let SecureStorage = "11.0.3"
    static let DynamicCertificatePinningFramework = "18.1.2"
    static let OpenSSL = "3.3.3001"
    static let CMiWebView = "26.1.0"
    static let ApplicationAttestationFramework = "8.0.1"
}

private class Checksums {
    static let CMiTP = "88676fe1754df3d535ce28839b79dd0297c1a77b0dbc317b98dcaa0b2360e1c0"
    static let ClientCertificates = "4ca65ac9ab980c7fcd3500c00b3edc4fe0cc9d5a51d59d150fe0ffdeb9f9809b"
    static let CommunicatorFramework = "d02a01a3aeb50b64819aa131512c0b775794d045a47edfb99ccde4d7bf8daeaf"
    static let CoreUtilities = "a18fd8596403f290884b86bc8941f13b9eb06f960d67c9ebfd3e50d5d91b4ffc"
    static let FSi = "65c0691ef4144cf59a098b2f0a97f44795d685a0a6d0f5213c7054eda8d8cde0"
    static let JOSESwift = "f23c30ed15df37820b6674b4b0141312f10cfbcfe48fc123d5adc345d4460902"
    static let MEPi = "a703106eb408be4afadc03a6e6ea517008e5c9538a7fa43b04fcfecf5bbe8e97"
    static let MEPiCommons = "1dc00c935d267a29620e3fdf81188d99486da03110726f28800a0d3fe7211ef6"
    static let SecureStorage = "512be5b9290f98596709c0bb7debc4fb8214b7fa75b531009914bb00640a5d8e"
    static let DynamicCertificatePinningFramework = "3719d3eab910b646c34d31356625cdf03a854902ba01fe4325855cc30bd42537"
    static let OpenSSL = "f7a82e597732021502c3cd7b66f3c1e401952a6660b79b72692469b34a932611"
    static let CMiWebView = "54f778f0f4194817dbc81115c938415e616fe23b48e0f7ab03736a8c13a16999"
    static let ApplicationAttestationFramework = "40839800bb291b4a8a866c2931ab84418f163185ee8762c6f16eaf8ca14bbb76"
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
                "DynamicCertificatePinningFramework",
                "OpenSSL",
                "ApplicationAttestationFramework"
            ]
        ),
        .library(
            name: "CMiWebView",
            targets: [
                "CMiWebView",
                "MEPiCommons",
                "CommunicatorFramework",
                "DynamicCertificatePinningFramework",
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
        .binaryTarget(name: "DynamicCertificatePinningFramework", url: assembleUrl("DynamicCertificatePinningFramework", "DynamicCertificatePinningFramework", Versions.DynamicCertificatePinningFramework), checksum: Checksums.DynamicCertificatePinningFramework),
        .binaryTarget(name: "ApplicationAttestationFramework", url: assembleUrl("security", "ApplicationAttestationFramework", Versions.ApplicationAttestationFramework), checksum: Checksums.ApplicationAttestationFramework),
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
