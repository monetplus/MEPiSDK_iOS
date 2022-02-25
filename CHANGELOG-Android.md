v11.0.0, v8.0.1
* [mepi] changed callback parameter type in both `BiometricUnlocker.unlock()` methods from `Boolean` to `Either<ErrorOutput, Unit>` (REDISB2-698)

v.10.0.0
* [mepi] added to `appAttestationId: String` parameter to `InitialClientCertificate.requestInitialClientCertificate()` method (IDENTITY-978)

v9.0.0
* [mepi] changed return type of getApplicationKeyManagers() method to optional array (CIMA-940)
* [mepi] added check for non-existing certificate to getApplicationKeyManagers() method (CIMA-940)
* [fsi] renamed `Sms.expiresIn` property to `Sms.expiresInMilliseconds`
* [mepi] updated dependencies on ClientCertificates to v5.0.0 and SecureStorage to v3.0.0 (REGSB-560)

v8.1.0
* [mepi] added dependency on TalsecAttestation library
* [mepi] added `InitialClientCertificateResult` data class representing issued initial client certificate (IDENTITY-978)
* [mepi] added `InitialClientCertificate` containing `requestInitialClientCertificate` method for issuing new initial client certificate (IDENTITY-978)
* [mepi] added new error code `7024` with mapping to `AuthGTWCMErrorResponse` (IDENTITY-662)
* [mepi] removed checks for valid certificates in `deactivate` method in `Deactivation` class
* [commons] added `SslContextChangeable` interface with `setSslContext` method for updating `SSLContext` (IDENTITY-978)
* [mepi] added implementation of `SslContextChangeable` to `Activation` (IDENTITY-978)
* [fsi] added implementation of `SslContextChangeable` to `FSiLogin`, `Scenario`, `LoginFinish`, `Sms`, `UserNameAndPassword` (IDENTITY-978)

v8.0.0
* [all] removed dependency on `com.aheaditec.utils:core`
* [mepi] updated dependencies on `com.aheaditec.talsec:ClientCertificates` to `2.0.0`
* [mepi] updated dependencies on `com.aheaditec.talsec:storage` to `2.0.0`
* [commons] fixed serialization of PkceCodeChallenge

v7.1.1
* [commons] fixed combined parsing of overlapping positive and negative data in server response with http code 200 (IDENTITY-662)

v7.1.0
* [commons] added attempt to process server error response, when http code 200 is received and positive server response parsing fails (IDENTITY-662)

v7.0.0
* [all] updated network lib dependency to 3.0.0 (IDENTITY-976)
    * app can configure minimal TLS version in HttpConfig
* [commons] enhanced performance of IdToken verification by adding call to Jose4j library in LoginInput (IDENTITY-976)

v6.0.0
* [commons] added changes made in v4.0.0 related to IDENTITY-662
* [fsi] added changes made in v4.0.0 related to IDENTITY-662

v5.0.0
* [commons] reverted changes made in v4.0.0 related to IDENTITY-662
* [fsi] reverted changes made in v4.0.0 related to IDENTITY-662

v4.0.3
* [mepi] fixed parameters for biometry prompt in biometry unlock scenario
* [mepi] fixed multiple calls of `callback` method passed to `authenticate()` methods in `BiometricLoginUserAuthentication`

v4.0.2
* [mepi] fixed error propagation in `BiometricLoginUserAuthentication` class

v4.0.1
* [mepi] fixed obfuscation of `BiometryStatus` enum

v4.0.0
* [all] migrated to `Either` implementation from functional lib ("com.aheaditec:functional:0.3.1")
    * warning: ClientCertificates still depends on old `com.aheaditec.core.Either` library
    * Migration Guide to new Either class:
        * order must be changed ->
            * before `Either<Success, Failure>`
            * now `Either<Left, Right>` - `Left` represents `Failure`, `Right` represents `Success`
            * replace all - regex ->  `Either<(\w*), (\w*)>` -> `Either<$2, $1>`
        * import must be changed ->
            * before `import com.aheaditec.core.Either`
            * now `import com.aheaditec.functional.Either`
        * import must be changed ->
            * before `import com.aheaditec.core.mapEither`
            * now  `import com.aheaditec.functional.flatMap`
        * import must be changed ->
            * before `import com.aheaditec.core.map`
            * now `import com.aheaditec.functional.map`
        * creation of `Either.Success` instance must be changed ->
            * before `Either.Success`
            * now `Either.Right`
            * replace all - regex -> `Either.Success\(` -> `Either.Right(`
        * creation of `Either.Failure` instance must be changed ->
            * before `Either.Failure`
            * now `Either.Left`
            * replace all - regex -> `Either.Failure\(` -> `Either.Left(`
        * replace usages of:
            * `mapEither` with `flatMap`
            * `flatMapAsync` with `flatMap`
            * `either` with `fold` and switch blocks (first is failure, then success)
            * `biMapAsync` with `biMap` and switch blocks (first is failure, then success)
            * `mapFailure` with `mapLeft` and modify the body to return Left without Either
            * `withSuccess` with `withRight`
            * `isSuccess` with `isRight`
            * `isFailure` with `isLeft`
* [fsi] removed `resendSms` method from `Sms` class (IDENTITY-662)
* [fsi] added `expiresIn` property to Sms class (IDENTITY-662)
* [fsi] revised server error codes from AuthGtwFl and their mapping to MEPiError (IDENTITY-662)
* [commons] removed MEPiError items: GeneralAuthnError (IDENTITY-662)
* [commons] added MEPiError items: InvalidVerification, InvalidVerificationLastAttempt (IDENTITY-662)
* [mepi] extracted biometric user authentication in biometric login scenario to separate class (IDENTITY-539)
    * removed `BioUnlockKeyWrapper` class
    * added new class `BiometricLoginUserAuthentication` as a replacement for `UnlockKeyWrapper` class
    * replaced return value of `BiometricLogin.getChallenge()` method from `BiometricLoginChallenge` to `BiometricLoginUserAuthentication`
    * removed `getBioUnlockableKey()` method from `BiometricLoginChallenge` class
    * removed parameter `key` from `BiometricLoginChallenge.verify()` method
    * see [README.md](https://github.com/monetplus/MEPiSDK_iOS/blob/master/README.md) for usage example
* [mepi] added BiometryUnlocker for handling lockouts (IDENTITY-539)
    * see [README.md](https://github.com/monetplus/MEPiSDK_iOS/blob/master/README.md) for usage example
* [mepi] changed type of `Status.biometricsAvailableOnDevice` from `boolean` to `BiometryStatus`


**v3.6.0**
* [mepi] added `ActivationForbidden` to `MEPiError` enum as reaction to respective error from BE (IDENTITY-485)

**v3.5.1**
* [all] updated dokka plugin for generating documentation
* [mepi] corrected proguard rules 

**v3.5.0**
* [commons] added support for empty response calls to `MepFsNetwork`
* [mepi] added `ApplicationSessionManager` with `keepAlive` method (IDENTITY-317)
* [mepi] added `BiometryBlockedBySystem` to `MEPiError` enum - returned when biometrics are blocked by system
* [mepi] removed automatic deactivation after blocking biometrics by system (IDENTITY-409)
* [mepi] removed `reaction` parameter from `getBioUnlockableKey()` method from `BiometricLoginChallenge` class
* [mepi] removed `BiometricAuthenticationFailedReaction` class
* [mepi] removed `reason` and `sessionId` parameters from `deactivate()` method from `Deactivation` class
* [mepi] removed `DeactivateReason` class

**v3.4.0**
* [commons] added `DateValidationFailed` to MEPiError enum
* [commons] added `equals` & `hashcode` methods implementation `ErrorOutput` and `IdToken` classes
* [commons] added processing of server time to ID Token expiration validation (IDENTITY-506)
* [fsi] added error mappings for `066968`, `066608` errors to `MEPiError.MethodNotAllowed` (DI4RID-2511)

**v3.3.2**
* [commons] fixed PKCE request generation
* [mepi] fixed issue with unavailable keys after biometry set modification - `MEPiError.certificateNotFound` is returned when bio key is invalidated. (DI4RID-2580)

**v3.3.1**
* added 20 min. clock skew tolerance to ID Token expiration validation (DI4RID-2565)

**v3.3.0**
* added alternative method for unlocking biometric keys to `UnlockKeyWrapper` (DI4RID-2571)

**v3.2.1**
* [commons] added error code to mappings for BE codes without "0" prefix (DI4RID-2297)

**v3.2.0**
* [all] updated kotlin dependencies to:
   * `org.jetbrains.kotlinx:kotlinx-serialization-json:1.0.1`
   * `org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.4.21`

**v3.1.2**
* [mepi] Fixed crashed caused by usage of invalidated key during biometric signature

**v3.1.1**
* [fsi] Fixed mappings of codes to MEPiErrors in `AuthGtwFTAErrorResponse`

**v3.1.0**
* [commons] Added `ScopesVerificationFailed` to MEPiError enum
* [commons] Added mapping from OAuth error for `ScopesVerificationFailed`
* [mepi] Added mapping from server error code to `ScopesVerificationFailed`
* [commons] Added `Http(code)` to MEPiError enum
* [commons] Added processing of http errors from network calls

**v3.0.6**
* [cmi-tp] Fixed enhanced status validation
* [cmi-tp] Added timeout for enhanced status response

**v3.0.5**
* [fsi] - Fixed optionality of `actionUrl` in `GetAvailableScenariosResponse`

**v3.0.4**
* [commons] Added `OtpExpired` to `MEPiError` enum
* [fsi] Added error mapping for expired SMS error 

**v3.0.3**
* [mepi] - BIO deactivation `MEPiError` enum changed from `MethodDeactivated` to `InstanceDeactivated`

**v3.0.2**
* [mepi] - fixed bug in check for available certificates in `Deactivation.deactivate()` method

**v3.0.1**
* [mepi] - dependency version changed - ClientCertificates:1.2.1

**v3.0.0**
* [all] revised error handling in all libraries
* [commons] revised MEPiError enum

**v2.1.2**
* [fsi] - Added `actionUrl` and `wysiwys` attributes to `TransactionScenario`

**v2.1.1**
* [fsi] - fixed support for login access tokens in new Sms' methods

**v2.1.0**
* [fsi] - Added `cancel()` and `resendSms()` methods to Sms class.

**v2.0.1**
* fixed obfuscation 

**v2.0.0**
* [all] - only service path used in SDK. Use as follows:
    * domain + /mep/fs/fl -> federated login
    * domain + /mep/fs/svc/authgtw/authn -> authGTW FL
    * domain + /mep/fs/svc/authgtw/authz -> authGTW FTA
    * domain + /mep/fs/svc/authgtw-cm -> authGTW CM
* [mepi] - `DeactivationReason` added, representing reason of deactivation call, `DeactivationRequest` modified
* [mepi] - `Deactivation.deactivate` has 2 new parameters, mandatory `DeactivationReason` and optional `sessionId`
* [commons] - Claims added to `OpenIdConnectRequest`, utility method for creating Claims added `Claims.createCmiInstanceIdClaims(instanceId)`.

**v1.2.0**
* [fsi] - `operation mode` removed from Transaction select scenario (sms)
* [fsi] - session fixation, login access token added to `ProcessResponse`, login access token used in Authorization header
* [mepi] - new version of library ClientCertificates, supports default (pkcs12) client authentication

**v1.1.1**
* [fsi] - Bug fixed in `SelectScenarioRequest` with SMS

**v1.1.0**
* [core] - reworked as java library
* [commons] - reworked as java library

**v1.0.0**
* [fsi] - `FSiTransaction` class and others added, transaction flow support

**v0.1.8**
* [mepi] - proguard fix, visibility of `BiometricAuthenticationFailedReaction` sealed class members

**v0.1.7**
* [all] - validation of IDToken added, BE error codes added
* [cmi-tp] - `Uri.parseQuery()` method requires 2 new parameters, `NetworkCall` and `LoginInput`
* [mepi] - `BiometricLogin` constructor requires new parameter, `NetworkCall`
* [commons] - `LoginInput` and `LoginOutput` made parcelable
* [all] - `CMiInternalError` class removed, all errors are returned using `ErrorOutput`
* [mepi] - `BiometricAuthenticationFailedReaction` class added representing reaction on blocked biometric
* [mepi] - `BiometricLoginChallenge.getBioUnlockableKey` has new parameter `BiometricAuthenticationFailedReaction`

**v0.1.6**
* [mepi] - error message in case of HttpException added (visible in ErrorOutput)

**v0.1.5**
* [mepi] - `MepiSSLContext` class removed, `getSSLContext` has been replaced by `getApplicationKeyManagers` method in `StatusFactory`
* [mepi] - internal changes in `Deactivation`, `deactivate` method, bio and app certificates are removed simultaneously

**v0.1.4**
* [all] - revised and added new javadoc
* [mepi] - changed return type of `BiometricLoginChallenge.verify` method from `Either<Unit, ErrorOutput>` to `Either<LoginOutput, ErrorOutput>`

**v0.1.3**
* [mepi] - added biometry support to activation process
* [mepi] - added deactivation process
