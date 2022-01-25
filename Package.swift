// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "14.1.2"
    static let ClientCertificates = "4.0.5"
    static let CommunicatorFramework = "4.1.0"
    static let CoreUtilities = "3.2.3"
    static let FSi = "14.1.2"
    static let JOSESwift = "2.0.5"
    static let MEPi = "14.1.2"
    static let MEPiCommons = "14.1.2"
    static let SecureStorage = "5.0.1"
    static let TalsecCertificatesFramework = "9.0.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "14.1.2"
}

private class Checksums {
    static let CMiTP = "2dc5d38027f7ccf33d87d17f496c8c983cacb3c47961af737fe1727ace31bd19"
    static let ClientCertificates = "b7bc4ce959be1b496c99daf0c0238b0f224550c9245a04a062dde287343788bc"
    static let CommunicatorFramework = "1d5ef93e2a90e076a64d92b91a419fdc9d9f72970dd35c61d622555d0851d094"
    static let CoreUtilities = "bf41861bb6b26c825e8066dc514a4ff4883c18a2ae7daf8429da4d9c80909ca3"
    static let FSi = "7ead8cf6cc0ea147181e8e48301d9a3e2abf374b59302a882b5158e7d5ed75b1"
    static let JOSESwift = "84d97de8fabc4038c1f2055c07a59da54e7de420a00aba519df08a3f93cd7e58"
    static let MEPi = "082654a611e31d399b795a5a0788c7c45164fcd556492d9b560267e178f18e31"
    static let MEPiCommons = "b1c8d23b9c8e5a9e8712e3f22638aeac2125e5a72607802804e7e78b3fa95ba4"
    static let SecureStorage = "2f192c5d85a33b2914e9e40909ef89d74328d504e9d82c505e0965fa5f424dbf"
    static let TalsecCertificatesFramework = "a6766848b626b46868ccb1170ca5b106e0d79a0152895bcc1bcfcb6d54ad4325"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "210c0da5e73f1afb56e94d7c50a7f6991005b7dafdcbdf3f07299d3f3a3a141c"
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
