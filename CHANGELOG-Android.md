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
