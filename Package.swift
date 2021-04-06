// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "7.0.0"
    static let ClientCertificates = "241ee1e578c558a3a82b7a37f1b9cb6b5576f7da"
    static let CommunicatorFramework = "3.1.1"
    static let CoreUtilities = "2.0.0"
    static let FSi = "7.0.0"
    static let JOSESwift = "2.0.0"
    static let MEPi = "7.0.0"
    static let MEPiCommons = "7.0.0"
    static let SecureStorage = "8ca51f220b2194c5e5aa5c02f48c35c4a5a4637f"
    static let TalsecCertificatesFramework = "7.0.0"
    static let OpenSSL = "1.1.1100"
    static let CMiWebView = "7.0.0"
}

private class Checksums {
    static let CMiTP = "63b1cdbfbfa5d52b999d4a40e6701c5b6f3481c7812c3c69253fbd5625d1db56"
    static let ClientCertificates = "ddf896437346014d7d8e54df3fecb5c0917cc494f0e704cef0fa4ef8d90aee45"
    static let CommunicatorFramework = "5c54980f16fbb03755de2fe2740e175490c3953f58aa6fe999600e7c203d9e9b"
    static let CoreUtilities = "3d993713476d9ff11c6955842617b624ef29772170f58d71e1863cdd38b6dcef"
    static let FSi = "74136d2cbdae280c26b637112a557288d89d2bb6a0331d39002717709126201b"
    static let JOSESwift = "4f2f51ad0df5f2d71fe7e1dbfdf9b7b69153752fb2cf6eca26183e076539299b"
    static let MEPi = "101bafe2a0808db423d345183ce8b10efea8845fe44b3b73c92ba28b87dc165b"
    static let MEPiCommons = "ec2039623930e63a80d5c68280167d475d92fbfd7e5d61ed097ae5859c109d34"
    static let SecureStorage = "1c6f9868fc57a45035b3d040a57cc10213483bbb69607f678bf2b593b644fa1f"
    static let TalsecCertificatesFramework = "2692782e8ae462bd4c4c06f29cdd5d0196d7d3b1332545dda5acdc3024f1ff05"
    static let OpenSSL = "9801ebfd70beea9e1dd9ae2d607d84c014eb6dd86f1f993f1e26c2e3a5accc44"
    static let CMiWebView = "c07781250f888ae8228351cbe82c0cb9eb7859c515a3859de7af9db1b43fb4e4"
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
