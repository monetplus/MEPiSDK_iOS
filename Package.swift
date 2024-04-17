// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "20.1.1"
    static let ClientCertificates = "7.1.0"
    static let CommunicatorFramework = "11.0.2"
    static let CoreUtilities = "4.2.0"
    static let FSi = "20.1.1"
    static let JOSESwift = "2.0.6"
    static let MEPi = "20.1.1"
    static let MEPiCommons = "20.1.1"
    static let SecureStorage = "9.1.0"
    static let TalsecCertificatesFramework = "12.5.0"
    static let OpenSSL = "3.1.5000"
    static let CMiWebView = "20.1.1"
    static let TalsecAttestation = "5.0.1"
}

private class Checksums {
    static let CMiTP = "bf14af082b20ace3c4ddd81d04da08d90e18a6cb1caa9b79b47b0c8b5ae89de6"
    static let ClientCertificates = "2fe288d6dd7c13a2bdc506acb4fa79872a9812aa3d612dc8f1c069cd6875641b"
    static let CommunicatorFramework = "804dd18d219845b116a2a80ce67039a3cbf44f3d3ce1e7cdd2c575c697f33c9a"
    static let CoreUtilities = "de91c9753a277798b0624046603d0f5a1afcaf4a1aca3a1834c96dc5df6770f5"
    static let FSi = "285b8528317ca1fc82c9c07d7ae4bbe792bd3754511a2afe47bffa6f853916dc"
    static let JOSESwift = "9a8f1d1b3d63d1c6ad3d67cc9ae34a1bdbadb9004ed244ea0e5eeef9b8e2dcd8"
    static let MEPi = "9b27c00c824aab64328eedfbfe02e72e443aedeac592c955b51c39032218aa05"
    static let MEPiCommons = "ef2bd09628156d486be8f58af80029ded986b75071433cdcd2bbb9392b4044ba"
    static let SecureStorage = "24667265ec916bed7c7157c4251746c815cde682011afacbd3b6876825c2c5d2"
    static let TalsecCertificatesFramework = "e0580c88adf7c0708bd0fb6447c20bb49c9fcc27e38de37c63cca074bad0c14c"
    static let OpenSSL = "edcbc8c9ff70a01d1d25e0ffe1d5f8af15ab6a5c57c5e579c0d518703d8eb09d"
    static let CMiWebView = "1ff655cb0c1877aee21035646dc9487533dd2d77633442a5f5a3c3d361d3733a"
    static let TalsecAttestation = "2164404cd108aac91f21c78930f3534f9a2f380d51f96e5f0a95583b88a0b2e0"
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
                      url: "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/talsec/Talsec/1.1.1/Talsec.xcframework.zip",
                      checksum: "f94cba307567e0af84d00cbd27379585cfd3bccdec27446a1a62fbf85f4068c4")
    ]
)

func assembleUrl(_ group: String, _ artifact: String, _ version: String) -> String {
    let url = "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/\(group)/\(artifact)/\(version)/\(artifact).xcframework.zip"
    print(url)
    return url
}
