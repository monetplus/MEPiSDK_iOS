# MEPi SDK
MEP is a system for client authentication and transaction authorization. MEPi SDK is a set of components that allow multiple mobile applications (provided by group companies and 3rd parties - partners) to use federated identification, authentication and authorization features of MEP. Various components of MEPi SDK provide a way to integrate to various components of MEP's backend components. Integrating application will use MEPi SDK to authenticate its users and authorize their operations inside the application.

## Purpose of this documentation
This documentation describes the MEPi SDK provided by Monet+ and AHEAD iTec to developers of applications that use the services of MEP. This documentation will be subject to further changes as the MEP evolve. This documentation does not describe any business and organizational aspects of the “Integrating application onboarding process”.

## Brief history behind MEPi SDK
MEPi SDK and CMi SDK builds upon concept of federated identity. Identity of a user, that was paired with instance of CASE mobile application. The identity could be used by another application on device - hence federated identity.

Integrating application can outsource features like identification, authentication and authorization to the CASE mobile application.

This approach has multiple business benefits:
- Customers activate (enroll) just CASE mobile - all other apps can be just downloaded and used directly without any activation
- CASE mobile can be built as the “trust element”, “the key to the bank” and is the only place (application) that requests customers to enter the PIN
- Bank Federated Identity can be used in 3rd party partner applications, which (independently from the size, brand power or trustworthiness of the partner) technically have to be treated as untrusted elements in the business process.

With CASE mobile handling all communication with the FS ecosystem, other integrating applications do not need to bother with implementation details of the MEP FS backend, do not need to handle enrollment, activation and other processes related to the lifecycle of the activated mobile app, and - most importantly - do not need to synchronize their lifecycle with releases the security infrastructure. 

Applications could use this identity by integrating so called CASE mobile integration SDK (CMi SDK). The CMi SDK was designed as the single point of contact between integrating application and the MEP FS ecosystem.

MEPi SDK adds another set of features to the set. In cases, where integrating application does not want to enforce usage of CASE mobile identity. Integrating application can take more responsibilities and (via MEPi SDK) communicate directly with MEP FS backend. See further description about [supported scenarios](#supported-scenarios) for details.

### MEPi SDK vs CMi SDK v5
To some extend, MEPi SDK could be considered as next generation of CMi SDK. A slight problem with that is that MEPi SDK also provides different features than CMi SDK did and those new features do not relate to CASE mobile in any way. More correct way would be to say that MEPi SDK _contains_ CMi SDK.

Nevertheless, in general, non-technical discussions those two terms can be used as synonyms.

## Content of this document
1. [Components](#components)
2. [Integration](#integration-to-project)
3. [Supported scenarios](#supported-scenarios)
4. [Error handling](#error-handling)

### Components
- MEPi - provides status, activation, deactivation, biometric login scenarios
- FSi - provides authentication and authorization from integrating native mobile application
- CMi - provides authentication and authorization using CASE mobile application
- MEPi Commons - provides common logic used in other components

### Integration to project
Component of MEPi SDK are published to online repositories. Integrating application can either use dependencies directly from repository or download binaries and use them as local dependencies.

#### Android binaries:
[Monet's public Nexus repository (credentials required)](https://nexus3-public.monetplus.cz/#browse/browse) 
Setup Nexus maven repository in your project.
Add to module's gradle file:
```
repositories {
    maven {
        credentials {
            username "<your username>"
            password "<your password>"
        }
        url "https://nexus3-public.monetplus.cz/repository/ahead-android-csob-release/"
    }
}
```
Add the following to your app/build.gradle inside the dependencies section:
```
    implementation("com.aheaditec.mepisdk:cmi-tp:$latest_version")
    implementation("com.aheaditec.mepisdk:commons:$latest_version")
    implementation("com.aheaditec.mepisdk:fsi:$latest_version")
    implementation("com.aheaditec.mepisdk:mepi:$latest_version")
    implementation("com.aheaditec.utils:core:$latest_version")
    implementation 'com.aheaditec.utils:network:$latest_version'
    implementation 'com.aheaditec.talsec:storage:$latest_version'
    implementation 'com.aheaditec.talsec:ClientCertificates:$latest_version'
    
    // PKCS stuff
    implementation 'com.madgag.spongycastle:pkix:1.51.0.0'
    implementation 'com.madgag.spongycastle:core:1.51.0.0'
    // JWS stuff
    implementation "org.bitbucket.b_c:jose4j:0.6.5"
```

#### iOS binaries:
[Monet's Github repository](https://github.com/monetplus)
Add following line to Cartfile:
```
binary "https://raw.githubusercontent.com/monetplus/MEPiSDK_iOS/master/mepisdk_carthage/Mepi.json" ~> 0.1.0
```

### Supported scenarios

#### Status
MEPi component provides API for getting information required to decide which scenario should be presented to user by integrating application. This API provides information such as availability of CASE mobile, presence of TLS client certificate, availability of biometrics etc. Based on these data, integrating application will decide if:
- login using CASE mobile can be used
- activation is required during upcoming login
- biometrics should be activated and/or used 
 
##### Components & classes supporting status scenario:
- `MEPi.StatusFactory`
    - Android
        ```kotlin
        val retriever = CaseMobileStatusRetriever(application, "cz.csob.smartklic")
        val statusFactory = StatusFactory(retriever, application)
        ```
    - iOS
    ```swift
    let cmBundleId = "cz.csob.smartklic"
    let statusFactory = StatusFactory(urlChecker: UIApplication.shared, caseMobileBundleId: cmBundleId)
    ```
- `MEPi.Status`
    - Android
      ```kotlin
        val status = statusFactory.getStatus()
      ```
      ```swift
      let statusResult = statusFactory.getStatus()
      let status = statusResult.get()
      ```
 
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

CASE mobile has its own links that will be used by integrating application and `CMiTP` to send requests to CASE mobile. Integrating application must also setup its links to receive responses from CASE mobile (see links to official documentation above). Values of application's links are completely arbitrary, as long as they will not collide with values of CASE mobile and are registered in MEP system before using this login scenario. After registration, those links can be passed as redirect URIs.

##### Methods supporting CM login scenario:
- `CMiTP`'s extensions on `Swift.URL`(iOS) and `Uri`(Android) with method `appendingQuery()`, `appendQuery()` or `parseQuery()`
- `MEPiCommons.LoginInput`
    - Android
      ```kotlin
            val networkCall = NetworkCall("serverUrl")
            val activation = Activation(networkCall).getInstanceId()
            val oAuthRequest = OAuthRequest(
                "state",
                "redirectUri",
                "clientId",
                "scopeParam",
                "responseType" // "code id_token", "token id_token" or "code"
            )
            activation.either({ instanceId ->
                val loginInput = LoginInput(oAuthRequest, OpenIdConnectRequest(instanceId)
                ...
            }, { error ->
                // solve error
            }
      ```
     - iOS
     ```swift
     let responseType = ... // "code id_token", "token id_token" or "code"
     let instanceId = ... // instanceId from activation,
     let scopes = ... // requested scopes
     let state = ... // custom value from application
     let redirectUri = ... // uri to receive response    
     let clientId = ... // client id of application
     let oAuthRequest = OAuthRequest(state: state, redirectUri: redirectUri, clientId: clientid, scope: scopes, responseType: responseType)
     let claims = Claims(idTokenClaims: ["cmiInstanceId": ClaimContent(values: [instanceId])], userInfoClaims: nil)
     let openIdConnectRequest = OpenIDConnectRequest(claims: claims)
     let loginInput = LoginInput(oAuthRequest: oAuthRequest, openIDRequest: openIdConnectRequest)
     ```
- `MEPiCommons.LoginOutput`

#### Login using username password and sms
If CASE mobile is not available on the device, or integrating application does not want to enforce usage of CASE mobile identity, integrating application can present the user with a series of traditional forms to enable login by username, password, and SMS code. MEPI SDK will directly process credentials entered by user.

This login scenario consists of 3 stages:
1. start login session
2. request and process all required user credentials
3. finish login session and obtain access token 

`FSi` provides API for processing data from such forms and for passing integrating application information required to show the next form in the scenario.

##### Components & classes supporting login with credentials scenario:
- `FSi.FSiLogin`
    - Android
      ```kotlin
        val flCommunicator = NetworkCall("${serverUrl}/mep/fs/fl/")
        val authCommunicator = NetworkCall("${serverUrl}/mep/fs/svc/authgtw/authn/")
        val activation = Activation(NetworkCall("serverUrl"))
        var instanceId: Either<String, ErrorOutput>? = null
        if (status.applicationActivated.not()) {
            instanceId = activation.getInstanceId()
        }
        val oAuthRequest = OAuthRequest(
            "state",
            "redirectUri",
            "clientId",
            "scopeParam",
            "responseType" // "code id_token", "token id_token" or "code"
        )
        val connectRequest = if (instanceId is Either.Success) {
            OpenIdConnectRequest(instanceId.s)
        } else {
            null
        }
        val loginInput = LoginInput(oAuthRequest, connectRequest)

        FSiLogin(flCommunicator, authCommunicator).start(
            loginInput,
            "language"
        ).mapEither { scenario ->
            scenario.selectScenario("s_mobile_authn_un_pwd_sms")
        }.mapEither { userNameAndPassword ->
            userNameAndPassword.submit("userName", "password")
        }.mapEither { sms ->
            sms.submit("000-000-000")
        }.mapEither { loginFinish ->
            loginFinish.get()
        }.biMap({ loginOutput ->
            // go to authorization
        }, { error ->
            // solve error
        }
      ```
     - iOS 
     ```swift
     guard let federatedLoginCommunicator = CommunicatorFactory.createForFederatedLogin() else { return }
     guard let authGTWFLCommunicator = CommunicatorFactory.createForAuthGtwFl() else { return }
     let fsiLogin = FSiLogin.init(federatedLoginCommunicator: federatedLoginCommunicator,
                                  authGatewayFederatedLoginCommunicator: authGTWFLCommunicator)
     let scenarioResult = fsiLogin.startLogin(loginInput: loginInput, language: "cs")
     let scenario = try scenarioResult.get()
     
     let requiredScenario = "s_mobile_authn_un_pwd_sms"
     guard scenario.scenariosId.contains(requiredScenario) else { return }

     let userNamePasswordResult = scenario.select(scenarioId: requiredScenario)
     let userNameAndPassword = try userNamePasswordResult.get()
     let smsResult = userNameAndPassword.submit(userName: userName, password: password)
     let sms = try smsResult.get()
     
     let loginFinishResult = sms.submit(sms: smsCode)
     let loginFinish = try loginFinishResult.get()
     let loginOutputResult = loginFinish.get()
     let loginOutput = try loginOutputResult.get()
     ```

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
    - Android
    ```kotlin
    ```
    - iOS
    ```swift
    guard let communicator = CommunicatorFactory.createForAuthGtwCmWithStaticClientCert() else { return }
    let activation = Activation.init(authGatewayCaseMobileCommunicator: communicator)
    let instanceIdResult = activation.getInstanceId()
    let instanceId = instanceIdResult.get()
    let clientId = ... // client id of application
    let accessToken = ... // token from login
    let result = activation.issueCertificates(accessToken: accessToken,
                                              clientId: clientId,
                                              instanceId: instanceId,
                                              biometricPrompt: "Gimme your biometrics!")
    ```

#### Transaction
Preconditions for this scenario:
   1. User is logged in and has access token
   2. User is activated
   3. User has active transaction identified by mepId

Authorization of transaction has 3 stages:
1. Initialize transaction in MEP. It responsibility of integrating application or its backend.
2. Get list of supported autorization method for transaction and select one
3. Based on selected method:
    a. For SMS authorization, get SMS OTP from user and send it to MEP
    b. For Confirmation authorization send confirmation to MEP

##### Components & classes supporting transaction scenario: 
- `FSi.FSiTransaction`
    - Android
    ```kotlin
    ```
    - iOS
    ```swift
    let accessToken = ... // token from login
    let mepId = ... // mep id from transaction registration
    guard let communicator = CommunicatorFactory.createForAuthGtwFta() else { return }

    do {
    let trx = FSiTransaction(
                authGatewayFederatedTransactionAuthorizationCommunicator: communicator, 
                accessToken: accessToken
              )
    
    let lang = "cs" // BE must support trx templates for selected language
    let trxResult = trx.startTransaction(mepId: mepId, language: lang) 
    
    ```
- `FSi.TransactionScenario`
    - Android
    ```kotlin
    ```
    - iOS
    ```swift
    let scenario = try trxResult.get() // or switch on Result.success/Result.failure
    let requiredScenario = "..."
    guard scenario.scenariosId.contains(requiredScenario) else {
        failed(message: "Does not support '...' scenario.")
        return
    }
    ```
- `FSi.TransactionSMS`
    - Android
    ```kotlin
    ```
    - iOS
    ```swift
    let requiredScenario = "s_mobile_authz_sms"
    let smsResult = scenario.selectSMS(scenario: requiredScenario)
    let sms = try confirmationResult.get()
    let smsCode = ... // show UI with SMS input field & wait user input
    let result = sms.submit(sms: smsCode)
    try result.get()
    ```
- `FSi.TransactionConfirmation`
    - Android
    ```kotlin
    ```
    - iOS
    ```swift
    let requiredScenario = "s_mobile_authz_none"
    let confirmationResult = scenario.selectConfirmation(scenario: requiredScenario)
    let confirmation = try confirmationResult.get()
    let result = confirmation.confirm()
    try result.get()
    ```

### Error handling
If any operation should fail in MEPi SDK, details about the error are returned to the integrating application. An application can use those data to inform the user about failure and/or write them to logs.

Every error returned from MEPi SDK is encapsulated in same simple data structure containing related info.
 
##### Components & classes supporting error handling: 
- `MEPiCommons.ErrorOutput`
- `MEPiCommons.MEPiError`
