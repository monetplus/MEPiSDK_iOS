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
