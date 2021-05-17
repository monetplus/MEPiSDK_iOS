**v8.0.3**
* [commons] fixed PKCE request generation

**v8.0.2**
* [commons] fixed id_token expiration verification

**v8.0.1**
* added 20 min. clock skew tolerance to ID Token expiration validation (DI4RID-2565)

**v8.0.0**
* [webview] enabled build for distribution
* [mepi] revised reaction to error in deactivation. Lib will try to remove both certificates now.
* [commons] removed `federatedLoginCommunicator` parameter from `LoginOutput.exchangeCodeForToken()` method

**v7.0.1**
* [mepi] fixed issue with unavailable keys after biometry set modification (DI4RID-2522)
 
**v7.0.0**
* [webview] added revised CMiWebView framework to package

**v6.0.0**
* [all] fixed slow evaluation of server certificates during pinning (DI4RID-2483)
* [all] updated TalsecCertificatesFramework dependency to 7.0.0

**v5.0.4**
* [all] updated CommunicatorFramework dependency to 3.1.1

**v5.0.3**
* [all] same as 5.0.2, just released automatically

**v5.0.2**
* [commons] added error code to mappings for BE codes without "0" prefix (DI4RID-2297)

**v5.0.1**
* [cm] added error code for CASE mobile

**v5.0.0**
* [all] migrated to Swift Package (binary targets from xcframeworks)
* [all] renamed `Communicator` to `CommunicatorFramework`
* [all] renamed `TalsecCertificates` to `TalsecCertificatesFramework`

**v4.2.0**
* [commons] Added ScopesVerificationFailed to MEPiError enum
* [commons] Added mapping from OAuth error for ScopesVerificationFailed
* [mepi] Added mapping from server error code to ScopesVerificationFailed
* [commons] Added Http(code) to MEPiError enum
* [commons] Added processing of http errors from network calls

**v4.1.2**
* [mepi] Fixed value returned from biometric login when prompt dialog is dismissed (DI4R-1819 a DI4R-1806)

**v4.1.1**
* [mepi] Fixed value returned from biometric login when prompt dialog is dismissed (DI4R-1819 a DI4R-1806)

**v4.1.0**
* [all] built with Xcode12
* [all] updated TalsecCertificates dependency with slightly modified API
```
if let definitionData = Data(base64Encoded: Environment.definition) {
    
    let definition = try Definition(data: definitionData)
    let talsec = TalsecCertificates(definition: definition,
                                    logger: Logger.logger,
                                    tag: Environment.storageSuiteName,
                                    groupName: nil,
                                    supportSimulator: true
    )
}
```
* [commons] fixed parsing of optional OAuth error parameter

**v4.0.1**
* [commons] Added `OtpExpired` to `MEPiError` enum
* [fsi] Added error mapping for expired SMS error 

**v4.0.0**
* added support for encrypting communication with CM
    * added `ProtectionMode` enum (encrypted mode requires value of CM bundle id)
    * added static property `URL.cmiProtectionMode: ProtectionMode` to enable/disable protection of url parameters in URLs used for communication with CM.
* changed return type of `URL.appendingQuery()` from `URL` to `Result<URL, ErrorOutput>`
* added return type of `URL.appendQuery()` of `ErrorOutput`

**v3.0.0**
* revised error handling in all libraries
* revised MEPiError enum

**v2.2.1**
* added property `actionURL` to `TransactionScenario` class
* built with Xcode 11.5

**v2.2.0**
* added `cancel` and `resend` methods to FSi login process (class `SMS`)

**v2.0.0**
* fixed issue with storing client certificate after succesful activation (previously activated instances will stop working)
* built with Xcode 11.4

**v1.3.2**
* removed `Talsec.framework` from published package

**v1.3.1**
* used `value` field in serialized `claims` JSON, when array with one item is used to create ClaimContent instance

**v1.3.0**
* added support for requested claims from open id connect (DI4R-3390)
    * see classes `Claims`, `ClaimContent`
    * should be used for sending instance id 
* updated build setting of frameworks to support module stability and usage of App-Extension-Safe APIs
* removed dependency on `Talsec.framework`
* added dependency on `CoreUtils.framework`

**v1.2.1**
* fixed dependency on client certificates

**v1.2.0**
* added support for static certificates (DI4R-3159)
* added support for deactivation reason (DI4R-1978)

**v1.1.0**
* added support for session fixation by using login access tokens (DI4R-2669)

**v1.0.3**
* changed deployment target of CMi TP from 13.2 to 11.0 to 

**v1.0.2**
* added validation of certificate validity period to StatusFactory

**v1.0.1**
* fixed dependency on storage framework build with older swift

**v1.0.0**
* added transaction authorization scenario support

**v0.1.4**
 * added support for biometrics to activation
 * added biometric login scenario support
 * added deactivation scenario support
 
**v0.1.3**
 * added processing of server error codes
 * added id token validation 
 * migrated to xcode 11.3
 
**v0.1.0**
 * added smart key login scenario support 
 * added username, password & sms login scenario support
 * added activation without biometrics scenario support
