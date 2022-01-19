// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "15.1.0"
    static let ClientCertificates = "4.0.5"
    static let CommunicatorFramework = "6.0.0"
    static let CoreUtilities = "3.2.3"
    static let FSi = "15.1.0"
    static let JOSESwift = "2.0.5"
    static let MEPi = "15.1.0"
    static let MEPiCommons = "15.1.0"
    static let SecureStorage = "5.0.1"
    static let TalsecCertificatesFramework = "9.1.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "15.1.0"
    static let TalsecAttestation = "1.1.0"
}

private class Checksums {
    static let CMiTP = "112bc4ed78698a75659c5584b7ae90f7bda93b5af8ba0f4d43b466b92c9d79db"
    static let ClientCertificates = "b7bc4ce959be1b496c99daf0c0238b0f224550c9245a04a062dde287343788bc"
    static let CommunicatorFramework = "c2a6d0ea1ef39531d244e8c41b95b4baa24179c4b283d986a577e9b18f6a1aba"
    static let CoreUtilities = "bf41861bb6b26c825e8066dc514a4ff4883c18a2ae7daf8429da4d9c80909ca3"
    static let FSi = "850d91970d4d8ec79810e28fe47ae7c2c647e735426d279b13c774eb39251498"
    static let JOSESwift = "84d97de8fabc4038c1f2055c07a59da54e7de420a00aba519df08a3f93cd7e58"
    static let MEPi = "c37973a415001642c1ff4bca6e0d957b9a21a16ae4d3b8cb3c4f488e083366e7"
    static let MEPiCommons = "eb23fc5a196f70f7673bd15a2760bf11533b88e5d06287dcf0ae69d262e6e285"
    static let SecureStorage = "2f192c5d85a33b2914e9e40909ef89d74328d504e9d82c505e0965fa5f424dbf"
    static let TalsecCertificatesFramework = "d4fb69ae1a64ef44cc34bc4149f746ba9db154cd18a76fce3dc3b60e58af28ba"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "90bf933e69afa147158f2f6f7594ece33f9686fb21e0fa89d37a8839a9b49089"
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
