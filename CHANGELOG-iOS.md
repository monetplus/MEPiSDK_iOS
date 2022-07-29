**18.0.1**
* updated talsec attestation dependency to 3.0.1

**18.0.0**
* [all] Updated to xcode 13.4
* [all] updated all dependencies

**17.2.0**
* [all] updated dependencies on (TalsecCertificatesFramework, ClientCertificates, SecureStorage)

**17.1.0**
* [mepi] removed redundant biometric prompt in `Reactivation`
* [mepi] updated dependency on `TalsecCertificates`
* [mepi] updated dependency on `ClientCertificates`
* [mepi] updated dependency on `SecureStorage`

**17.0.0**
* [mepi] added `Reactivation` class with `reactivate()` method to support new scenario (IDENTITY-1402)
    * Due to weird behavior of iOS keychain, when quering SecIdentity protected by biometry, BiometricLogin will not work on iOS 14.
* [mepi] added `activationExpiration: Date?` property to `Status` class (IDENTITY-1402)
* [mepi] updated dependency on `ClientCertificates`
* [mepi] updated dependency on `SecureStorage`

**16.0.0**
* [mepi] added `appAttestationId` parameter to `requestInitialClientCertificate` method (IDENTITY-978)

**15.1.1**
* [fsi] fixed parsing of network response (with missing `resendTimeout` property) during login scenario (REDISB2-675)
* [fsi] renamed `SMS.expiresIn` property to `SMS.expiresInMilliseconds`

**v14.1.2**
* [fsi] fixed parsing of network response (with missing `resendTimeout` property) during login scenario (REDISB2-675)
* [fsi] renamed `SMS.expiresIn` property to `SMS.expiresInMilliseconds`

**15.1.0**
* [mepi] added missing dependency on `TalsecAttestation` to SPM package

**15.0.0**
* [mepi] added `InitialClientCertificateResult` data class representing issued initial client certificate (IDENTITY-978)
* [mepi] added `InitialClientCertificate` containing `requestInitialClientCertificate` method for issuing new initial client certificate (IDENTITY-978)
* [mepi] added new error code `7024` with mapping to `AuthGatewayCaseMobileErrorResponse` (IDENTITY-662)
* [commons] added `ContainsSessionDelegateChangeable` interface with `changeSessionDelegate` method for updating `URLSessionDelegate` (IDENTITY-978)
* [mepi] added implementation of `ContainsSessionDelegateChangeable` to `Activation` (IDENTITY-978)
* [fsi] added implementation of `ContainsSessionDelegateChangeable` to `FSiLogin`, `Scenario`, `LoginFinish`, `SMS`, `UserNameAndPassword` (IDENTITY-978)

**v14.1.1**
* [commons] fixed combined parsing of overlapping positive and negative data in server response with http code 200 (IDENTITY-662)

**v14.1.0**
* [commons] added attempt to process server error response, when http code 200 is received and positive server response parsing fails (IDENTITY-662)

**v14.0.0**
* [all] updated network lib dependency (IDENTITY-976)

**v13.0.0**
* [commons] added changes made in v11.0.0 related to IDENTITY-662
* [fsi] added changes made in v11.0.0 related to IDENTITY-662

**v12.0.0**
* [commons] reverted changes made in v11.0.0 related to IDENTITY-662
* [fsi] reverted changes made in v11.0.0 related to IDENTITY-662

**v9.3.0**
* [webview] added `clientIdentity` parameter to initializers of `CMiWebViewLoginFactory` and `CMiWebViewTransactionFactory`

**v11.0.2**
* [mepi] added public initializer to `BiometryUnlocker`

**v11.0.1**
* [webview] added new initializers with two URLs to `CMiWebViewLoginFactory` and `CMiWebViewTransactionFactory`
* [webview] deprecated old initializers in `CMiWebViewLoginFactory` and `CMiWebViewTransactionFactory`

**v9.2.0**
* [webview] added new initializers with two URLs to `CMiWebViewLoginFactory` and `CMiWebViewTransactionFactory`
* [webview] deprecated old initializers in `CMiWebViewLoginFactory` and `CMiWebViewTransactionFactory`

**v11.0.0**
* [fsi] removed `resend` method from `SMS` class (IDENTITY-662)
* [fsi] added `expiresIn` property to `SMS` class (IDENTITY-662)
* [fsi] revised server error codes from Auth Gtw FL and their mapping to `MEPiError` (IDENTITY-662)
* [commons] removed `MEPiError` items: `generalAuthnError` (IDENTITY-662)
* [commons] added `MEPiError` items: `invalidVerification`, `invalidVerificationLastAttempt` (IDENTITY-662)
* [mepi] added `BiometryUnlocker` for handling lockouts (IDENTITY-539)
* [mepi] added `BiometryStatus` enum (IDENTITY-539)
* [mepi] renamed `Status` property `biometricsAvailableOnDevice` to `biometricsAvailabilityOnDevice` (type changed from `Bool` to `BiometryStatus`)
* [mepi] added new errors returned from `Activation.issueCertificates()`: `biometryCanceled`, `biometryLocked`

**v10.0.0**
* [all] migrated all dependencies to version with Swift.Result

**v9.0.1**
* [all] no changes in libraries, released with dSYM files

**v9.1.1**
* [all] no changes in libraries, released with dSYM files

**v9.1.0**
* [mepi] added `ActivationForbidden` to `MEPiError` enum as reaction to respective error from BE (IDENTITY-485)

**v9.0.0**
* [mepi] added `ApplicationSessionManager` class with `keepAlive()` method (IDENTTITY-317)
* [mepi] removed automatic deactivation after biometric lockout (IDENTITY-409)
* [mepi] removed `reaction` parameter from `BiometricLoginChallenge.verify()` (IDENTITY-409)
* [mepi] removed `deactivateReason` parameter from `Deactivation.deactivate()` (IDENTITY-409)

**v8.1.1**
* [commons] added new errors mappings (DI4RID-2511)
* [fsi] added error mappings for `066968`, `066608` errors to `MEPiError.methodNotAllowed` (DI4RID-2511)

**v8.1.0**
* [commons] added `dateValidationFailed` to `MEPiError` enum
* [commons] added processing of server time to ID Token expiration validation (IDENTITY-506)

**v8.0.3**
* [commons] fixed generation of PKCE request

**v8.0.2**
* [commons] fixed base value for `Date` parsing in IDToken payload from apple's 2000 to UNIX's 1970

**v8.0.1**
* [commons] added 20 min. clock skew tolerance to ID Token expiration validation (DI4RID-2565)

**v8.0.0**
* [webview] enabled build for distribution
* [commons] removed `federatedLoginCommunicator` parameter from `LoginOutput.exchangeCodeForToken()` method
* [mepi] revised reaction to error in deactivation. Lib will try to remove both certificates now.

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
