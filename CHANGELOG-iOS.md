**v2.2.1**
* added property `actionURL` to `TransactionScenario` class

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
