// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "6.0.0"
    static let ClientCertificates = "241ee1e578c558a3a82b7a37f1b9cb6b5576f7da"
    static let CommunicatorFramework = "3.1.1"
    static let CoreUtilities = "2.0.0"
    static let FSi = "6.0.0"
    static let JOSESwift = "2.0.0"
    static let MEPi = "6.0.0"
    static let MEPiCommons = "6.0.0"
    static let SecureStorage = "8ca51f220b2194c5e5aa5c02f48c35c4a5a4637f"
    static let TalsecCertificatesFramework = "7.0.0"
    static let OpenSSL = "1.1.180"
}

private class Checksums {
    static let CMiTP = "8ce6519f8ce0fdb13299dee084024123682f65c96d4cd04600742b219cc09333"
    static let ClientCertificates = "ddf896437346014d7d8e54df3fecb5c0917cc494f0e704cef0fa4ef8d90aee45"
    static let CommunicatorFramework = "5c54980f16fbb03755de2fe2740e175490c3953f58aa6fe999600e7c203d9e9b"
    static let CoreUtilities = "3d993713476d9ff11c6955842617b624ef29772170f58d71e1863cdd38b6dcef"
    static let FSi = "f5d61409c8f3a13258b478aa822aafb9da49840cd6a30f30d8161edb7dcc3a4e"
    static let JOSESwift = "4f2f51ad0df5f2d71fe7e1dbfdf9b7b69153752fb2cf6eca26183e076539299b"
    static let MEPi = "5ff890c5c10b3aa8e11c1444f456f55dac2afe04c44e5e0d341d497f38b289f8"
    static let MEPiCommons = "6903cf7222497c20cf7810058a66679d052430db66f66e56b70e2f0032f8a4aa"
    static let SecureStorage = "1c6f9868fc57a45035b3d040a57cc10213483bbb69607f678bf2b593b644fa1f"
    static let TalsecCertificatesFramework = "2692782e8ae462bd4c4c06f29cdd5d0196d7d3b1332545dda5acdc3024f1ff05"
    static let OpenSSL = "dbb3824e1f5bd08bac4f40d6dcd311c67459b26b5b595abe2855d34409121262"
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
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(name: "MEPiCommons", url: assembleUrl("mepisdk", "MEPiCommons", Versions.MEPiCommons), checksum: Checksums.MEPiCommons),
        .binaryTarget(name: "FSi", url: assembleUrl("mepisdk", "FSi", Versions.FSi), checksum: Checksums.FSi),
        .binaryTarget(name: "MEPi", url: assembleUrl("mepisdk", "MEPi", Versions.MEPi), checksum: Checksums.MEPi),
        .binaryTarget(name: "CMiTP", url: assembleUrl("mepisdk", "CMiTP", Versions.CMiTP), checksum: Checksums.CMiTP),
        .binaryTarget(name: "ClientCertificates", url: assembleUrl("talsec", "ClientCertificates", Versions.ClientCertificates), checksum: Checksums.ClientCertificates),
        .binaryTarget(name: "CommunicatorFramework", url: assembleUrl("utils", "CommunicatorFramework", Versions.CommunicatorFramework), checksum: Checksums.CommunicatorFramework),
        .binaryTarget(name: "CoreUtilities", url: assembleUrl("utils", "CoreUtilities", Versions.CoreUtilities), checksum: Checksums.CoreUtilities),
        .binaryTarget(name: "JOSESwift", url: assembleUrl("utils", "JOSESwift", Versions.JOSESwift), checksum: Checksums.JOSESwift),
        .binaryTarget(name: "SecureStorage", url: assembleUrl("talsec", "SecureStorage", Versions.SecureStorage), checksum: Checksums.SecureStorage),
        .binaryTarget(name: "TalsecCertificatesFramework", url: assembleUrl("talsec", "TalsecCertificatesFramework", Versions.TalsecCertificatesFramework), checksum: Checksums.TalsecCertificatesFramework),
        .binaryTarget(name: "OpenSSL", url: assembleUrl("utils", "OpenSSL", Versions.OpenSSL), checksum: Checksums.OpenSSL)
    ]
)

func assembleUrl(_ group: String, _ artifact: String, _ version: String) -> String {
    let url = "https://nexus3-public.monetplus.cz/repository/ahead-ios-release/com/aheaditec/\(group)/\(artifact)/\(version)/\(artifact).xcframework.zip"
    print(url)
    return url
}
