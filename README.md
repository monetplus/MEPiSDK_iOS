# MEPi SDK
MEP is a system for client authentication and transaction authorization. MEPi SDK is a set of components that allow multiple mobile applications (provided by group companies and 3rd parties - partners) to use federated identification, authentication and authorization features of MEP. Various components of MEPi SDK provide a way to integrate to various components of MEP's backend components. Integrating application will use MEPi SDK to authenticate its users and authorize their operations inside the application.

## Purpose of this documentation
This documentation describes the MEPi SDK provided by Monet+ and Ahead iTec to developers of applications that use the services of MEP. This documentation will be subject to further changes as the MEP evolve. This documentation does not describe any business and organizational aspects of the “Integrating application onboarding process”.

## Content of this document
1. Components
2. Integration
3. Supported scenarios
4. Error handling

### Components
- MEPi
- FSi
- CMi
- MEPi Commons

### Integration to project
Component of MEPi SDK are published to online repositories. Integrating application can either use dependencies directly from repository or download binaries and use them as local dependencies.

### Supported scenarios

#### Status
MEPi component provides API for getting information required to decide which scenario should be presented to user by integrating application. This API provides information such as availability of CASE mobile, presence of client certificate, availability of biometrics etc. Based on these data, integrating application will decide if:
- login using CASE mobile can be used
- activation is required during upcoming login
- biometrics should be activated and/or used 
 
##### Components & classes supporting status scenario:
- `MEPi.StatusFactory`
- `MEPi.Status`
 
#### Login using CASE mobile
It is very common that applications require some form of logging in before a user can use the main functionality. Applications integrating MEPi SDK can rely on CASE identity of the user. Instead of forcing him to enter his credentials, an application can redirect him to CASE mobile application to confirm his new login operation. User is used to CASE mobile environment, so confirming login operation should not be a problem for him.

CASE mobile will handle the whole login process. If the user approves login operation, CASE mobile will get access token (or authentication code) from MEP and pass it back to calling application. User can also reject login operation. It that case, CASE mobile will return error code to calling application.

CMi's inter-app communication is based on app links and universal links. These links are a feature of recent versions of Android and iOS. They are enhancing for UX flows, where the user is required to switch context from one application to another.

For detailed description and information about setup, refer to the official documentation:
- [Android tutorial](https://developer.android.com/training/app-links/index.html)
- [iOS docs]( https://developer.apple.com/library/content/documentation/General/Conceptual/AppSearch/UniversalLinks.html)

Essentially, these links are simple URLs. They have slightly different behavior on iOS and Android. On iOS, a request made by opening URL (that applications are listening to) causes OS to pass control to an application by calling a method in AppDelegate. Android can declare in the manifest which application component should be invoked by opening a particular URL.

This login scenario consists of 4 stages:
1. create login request
2. send request to CASE mobile
3. receive response from CASE mobile
4. process response to obtain access token

`CMiTP` provides API for creating login requests and processing responses. It does not validate any part of URL except query parameters that are used to serialize data. Opening and receiving URL is the responsibility of an integrating application. `CMiTP` does not restrict nor force (Android) application to use a particular component to receive URL requests from OS.

CASE mobile has its own links that will be used by integrating application and `CMiTP` to send requests to CASE mobile. Integrating application must also setup its links to receive responses from CASE mobile. Before using this login scenario, value of application’s links has to be registered in MEP system.

##### Methods supporting CM login scenario:
- `CMiTP`'s extensions on `Swift.URL` and `Uri` with method `appendingQuery()`, `appendQuery()` or `parseQuery()`
- `MEPiCommons.LoginInput`
- `MEPiCommons.LoginOutput`

##### Login using username password and sms
If CASE mobile is not available on the device, the integrating application can present the user with a series of forms to enable login by username, password, and SMS code.

This login scenario consists of 3 stages:
1. start login session
2. request and process all required user credentials
3. finish login session and obtain access token 

`FSi` provides API for processing data from such forms and for passing integrating application information required to show the next form in the scenario.

##### Components & classes supporting login with credentials scenario:
- `FSi.FSiLogin`

#### Activation
Activation is enrolling process of MEPi SDK. During activation data required for some MEPi SDK features are generated. It has 4 stages:
1. get status of application (`MEPi.StatusFactory`)
    - check value `applicationActivated` property of `Status` instance. If it is `false` activation is required. Otherwise, activation is not needed and login is sufficient.
2. generate instance id (`MEPi.Activation`)
    - get new instance id for application instance that is going to be activated
3. authenticate user (`FSi or CMiTP`)
    - get access token by execution of either login using CASE mobile of login using username, password and sms.
    - token has to have assigned scopes that will enable issuing of certificates
    - token has to be associated with instance id. It is done by using instance id as OpenIdConnect nonce in login request.
4. issue certificate (`MEPi.Activation`)
    - use access token as proof of identity to issue certificates for application instance
    - keys and certificates are generated and managed by MEPi SDK

##### Components & classes supporting activation scenario: 
- `MEPi.StatusFactory`
- `MEPi.Status`
- `MEPi.Activation`

### Error handling
If any operation should fail in MEPi SDK, details about the error are returned to the integrating application. An application can use those data to inform the user about failure and/or write them to logs.

Every error returned from MEPi SDK is encapsulated in same simple data structure containing related info.
 
##### Components & classes supporting error handling: 
- `MEPiCommons.ErrorOutput`
- `MEPiCommons.MEPiError`
