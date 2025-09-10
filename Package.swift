// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "22.0.2"
    static let ClientCertificates = "8.0.0"
    static let CommunicatorFramework = "13.0.1"
    static let CoreUtilities = "6.0.0"
    static let FSi = "22.0.2"
    static let JOSESwift = "3.0.0"
    static let MEPi = "22.0.2"
    static let MEPiCommons = "22.0.2"
    static let SecureStorage = "10.0.1"
    static let TalsecCertificatesFramework = "15.0.0"
    static let OpenSSL = "3.3.3001"
    static let CMiWebView = "22.0.2"
    static let TalsecAttestation = "7.0.0"
}

private class Checksums {
    static let CMiTP = "e23781339ce4e0cee0b242c1aadba97b83c811285bed8a87db0bbbb47fde33a2"
    static let ClientCertificates = "2f7f68b626bf453abb55d2d08861477fc7f4b58ddcc800b55bb6d6ce36a31b05"
    static let CommunicatorFramework = "b8376d398c65580de73e4900333eec9406559342a4fbdaec789cd32b72509e0d"
    static let CoreUtilities = "a18fd8596403f290884b86bc8941f13b9eb06f960d67c9ebfd3e50d5d91b4ffc"
    static let FSi = "32737460dcd7043174bf1985f3a301fbe58b73968cdef0fc720c2cec989ae8d9"
    static let JOSESwift = "f23c30ed15df37820b6674b4b0141312f10cfbcfe48fc123d5adc345d4460902"
    static let MEPi = "bbb2898464036da8c5b8d22ecf786bc36d82769e1f987df838b49f18c410207e"
    static let MEPiCommons = "5bc8e18a585724f018d3f4b22f413afe3c52439c2946359524f3d29e15d66c75"
    static let SecureStorage = "14ba9ee1751504fe56cb26cbf466bcc96af57d5c6757a9447a63ce87f1450730"
    static let TalsecCertificatesFramework = "69903f0e31b7a6905b4259238c03c09e5585b722140c7414374f87e4df351826"
    static let OpenSSL = "f7a82e597732021502c3cd7b66f3c1e401952a6660b79b72692469b34a932611"
    static let CMiWebView = "4006a4430a316b445e17a140958303a84e5fad5a95f54d1e3d7cfd4c9ce21dd3"
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
