// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "12.0.0"
    static let ClientCertificates = "4.0.3"
    static let CommunicatorFramework = "4.0.2"
    static let CoreUtilities = "3.2.0"
    static let FSi = "12.0.0"
    static let JOSESwift = "2.0.3"
    static let MEPi = "12.0.0"
    static let MEPiCommons = "12.0.0"
    static let SecureStorage = "3.0.3"
    static let TalsecCertificatesFramework = "8.1.3"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "12.0.0"
}

private class Checksums {
    static let CMiTP = "45ba3f5bf3ba950ff09af1d14b16f5f07e74bca55ff2493170af6e5b50662ee7"
    static let ClientCertificates = "4522e68617f9d985311641f82ef0c26702fd1ae45ea87ab2feb10977f75445af"
    static let CommunicatorFramework = "9095ebcc3e0adce7b8a2edcf38e45444ad16421759a5ffd0248e5c7597a65909"
    static let CoreUtilities = "4f50eeb97a0c6b1a644a34785b60894755cc696ab5698bdfa84bff31d948c7fd"
    static let FSi = "d7465c76948ea58302f4da09ad312ec32c7b3976426960390a8d1ed2f3c26d31"
    static let JOSESwift = "0c336d29cc9d5568bc3d6d11fc12ec61779dc5ce4c8d86108a0ddf8951a270f2"
    static let MEPi = "dc21254e646e597ec69660ce982335ad804bfd55f32b129ff8e9ce5c52a394f2"
    static let MEPiCommons = "efd95a29b644983cb459b439f66da27043eb9d90443494d2afd231695fd99cbd"
    static let SecureStorage = "1c31114fe2733746f0c1be861f07cc89906529d583ad7193a5e524f14997a5ca"
    static let TalsecCertificatesFramework = "4fb1a09d4de1c8c19614770f6d4cfb9e5f45e00aa74b6281a3d7b82a3c293bdd"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "10c4f098e6e1d8ce81cbc591a3f478715cf907e3858eb4bc48d109808b606097"
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
