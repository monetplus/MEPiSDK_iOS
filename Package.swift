// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private class Versions {
    static let CMiTP = "15.0.0"
    static let ClientCertificates = "4.0.5"
    static let CommunicatorFramework = "6.0.0"
    static let CoreUtilities = "3.2.3"
    static let FSi = "15.0.0"
    static let JOSESwift = "2.0.5"
    static let MEPi = "15.0.0"
    static let MEPiCommons = "15.0.0"
    static let SecureStorage = "5.0.1"
    static let TalsecCertificatesFramework = "9.1.0"
    static let OpenSSL = "1.1.1200"
    static let CMiWebView = "15.0.0"
}

private class Checksums {
    static let CMiTP = "9c8c0abfde6b5be26c5d7016e6e11143cb01e846c4b8dce09faa85220a1e2eba"
    static let ClientCertificates = "b7bc4ce959be1b496c99daf0c0238b0f224550c9245a04a062dde287343788bc"
    static let CommunicatorFramework = "c2a6d0ea1ef39531d244e8c41b95b4baa24179c4b283d986a577e9b18f6a1aba"
    static let CoreUtilities = "bf41861bb6b26c825e8066dc514a4ff4883c18a2ae7daf8429da4d9c80909ca3"
    static let FSi = "185bb8d09f256ea3dd851d002b9a6a275753cc961833b472eb836a5a5912e844"
    static let JOSESwift = "84d97de8fabc4038c1f2055c07a59da54e7de420a00aba519df08a3f93cd7e58"
    static let MEPi = "ab0a65794bd34df9ce0393812c7031924538390b544b6a2db7ce49bdc983c124"
    static let MEPiCommons = "563b2817a2f5b3eb24dacb12fdbabdae4f8743abbd62f6467431b611a0588e25"
    static let SecureStorage = "2f192c5d85a33b2914e9e40909ef89d74328d504e9d82c505e0965fa5f424dbf"
    static let TalsecCertificatesFramework = "d4fb69ae1a64ef44cc34bc4149f746ba9db154cd18a76fce3dc3b60e58af28ba"
    static let OpenSSL = "c253bcaf1ff5b22f544a5d7642dce422e84258a4f11833293a1d9b0334800108"
    static let CMiWebView = "f378f612e9b08d6315cb6a7fb0661eee2a74ce0f11c30f4383afc53bebdfa64e"
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
