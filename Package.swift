// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "17.0.0"
    static let ClientCertificates = "5.0.0"
    static let CommunicatorFramework = "6.0.2"
    static let CoreUtilities = "3.2.3"
    static let FSi = "17.0.0"
    static let JOSESwift = "2.0.5"
    static let MEPi = "17.0.0"
    static let MEPiCommons = "17.0.0"
    static let SecureStorage = "6.0.0"
    static let TalsecCertificatesFramework = "10.0.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "17.0.0"
    static let TalsecAttestation = "1.1.0"
}

private class Checksums {
    static let CMiTP = "09a1eba9e29b20f3fb47c1ba54809a910ff552e0b247625a0c8282990c6ccf36"
    static let ClientCertificates = "99e96ba464151a7cbf2f641292f69f8628d942840b119ebb97ffaaac1799ca1d"
    static let CommunicatorFramework = "6067862efdcd5bbc429891d2281c3f69ea78723da9d59c05ba5b23b97ea60415"
    static let CoreUtilities = "bf41861bb6b26c825e8066dc514a4ff4883c18a2ae7daf8429da4d9c80909ca3"
    static let FSi = "c588b5c49e6743116c85b63fd5cbe4aa11a1875d1112d38ab50a3c42ccf53f65"
    static let JOSESwift = "84d97de8fabc4038c1f2055c07a59da54e7de420a00aba519df08a3f93cd7e58"
    static let MEPi = "ab6fc2667b3c5d6a30d17a996dc93c2f16a7b3724154f6abb3f604b240c39b64"
    static let MEPiCommons = "59cc3165c820a61fff650e2d0093b368e116b648d2ab15f1f0554d7e702e8f95"
    static let SecureStorage = "db4973de33ec6d177a167d67c81f0ee056ee49ffc0827bc17773f162ae2baf8d"
    static let TalsecCertificatesFramework = "91ca8e725991e9a38739b99dfa4ed4664e0f2ff97fd90edd5755bea54b12e1bd"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "0963bac98d7542c37b982ffb5997e90e6b22d2ec73073822bade935efbc07e7e"
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
