For our official documentation go here: http://www.kontagent.com/docs/api-libraries/php-wrapper/

Overview
-----------------

This is a ActionScript3 wrapper around Kontagent's API. It provides methods to make the API calls for all the different message types supported by Kontagent.

Getting Started
-----------------

To get started with the Kontagent library, you will need to check-out the files and include it in your project. You will also need to instantiate and configure an instance of the Kontagent API object.

    // import the library
    import com.kontagent.KontagentApi;

    // instantiate the library
    var ktApi:KontagentApi = new KontagentApi(ktApiKey, {});

Using The Library
-----------------

Once you've got your Kontagent object instantiated and configured you can start using the library. Essentially, there are two types of methods provided in the library: tracking methods and helper methods.

**Tracking Methods**

The tracking methods should get called by your application whenever you need to report an event to Kontagent. There is a tracking method available for every message type in the Kontagent API. A few examples are:

    ktApi.trackApplicationAdded(userId);

    ktApi.trackPageRequest(userId);

    ktApi.trackEvent(userId, eventName, {value: 5});

    ktApi.trackRevenue(userId, value, {type: 'credit'});

Everytime events happen within your application, you should make the appropriate call to Kontagent - we will then crunch and analyze this data in our systems and present them to you in your dashboard.

For a full list of the available tracking methods see the "Full Class Reference" section below.

**Helper Methods**

The library provides a few helper methods for common tasks. Currently the only ones available are:

    ktApi.genUniqueTrackingTag();

    ktApi.genShortUniqueTrackingTag();

Which will help you generate the tracking tag parameters required to link certain messages together (for example: invite sent -> invite response -> application added).

Full Class Reference
-----------------

    /*
    * Kontagent class constructor
    *
    * @constructor
    *
    * @param {String} apiKey The app's Kontagent API key
    * @param {Object} [optionalParams] An object containing paramName => value
    * @param {bool} [optionalParams.useTestServer] Whether to send messages to the Kontagent Test Server
    * @param {bool} [optionalParams.validateParams] Whether to validate the parameters passed into the tracking method
    */
    public function KontagentApi(apiKey:String, optionalParams:Object = null):void


    /*
    * Generates a unique tracking tag
    *
    * @return {String} A unique tracking tag
    */
    public function genUniqueTrackingTag():String 

    
    /*
    * Generates a short unique tracking tag
    *
    * @return {String} A short unique tracking tag
    */
    public function genShortUniqueTrackingTag():String

    
    /*
    * Sends an Invite Sent message to Kontagent.
    *
    * @param {int} userId The UID of the sending user
    * @param {String} recipientUserIds A comma-separated list of the recipient UIDs
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	InviteSent->InviteResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackInviteSent(userId:int, recipientUserIds:String, uniqueTrackingTag:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Invite Response message to Kontagent.
    *
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	InviteSent->InviteResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.recipientUserId] The UID of the responding user
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackInviteResponse(uniqueTrackingTag:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Notification Sent message to Kontagent.
    *
    * @param {int} userId The UID of the sending user
    * @param {String} recipientUserIds A comma-separated list of the recipient UIDs
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	NotificationSent->NotificationResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackNotificationSent(userId:int, recipientUserIds:String, uniqueTrackingTag:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Notification Response message to Kontagent.
    *
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	NotificationSent->NotificationResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.recipientUserId] The UID of the responding user
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackNotificationResponse(uniqueTrackingTag:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Notification Email Sent message to Kontagent.
    *
    * @param int userId The UID of the sending user
    * @param {String} recipientUserIds A comma-separated list of the recipient UIDs
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	NotificationEmailSent->NotificationEmailResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackNotificationEmailSent(userId:int, recipientUserIds:String, uniqueTrackingTag:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Notification Email Response message to Kontagent.
    *
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	NotificationEmailSent->NotificationEmailResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.recipientUserId] The UID of the responding user
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackNotificationEmailResponse(uniqueTrackingTag:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Stream Post message to Kontagent.
    *
    * @param {int} userId The UID of the sending user
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	NotificationEmailSent->NotificationEmailResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {String} type The Facebook channel type
    *	(feedpub, stream, feedstory, multifeedstory, dashboard_activity, or dashboard_globalnews).
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackStreamPost(userId:int, uniqueTrackingTag:String, type:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Stream Post Response message to Kontagent.
    *
    * @param {String} uniqueTrackingTag 32-digit hex string used to match 
    *	NotificationEmailSent->NotificationEmailResponse->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {String} type The Facebook channel type
    *	(feedpub, stream, feedstory, multifeedstory, dashboard_activity, or dashboard_globalnews).
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.recipientUserId] The UID of the responding user
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackStreamPostResponse(uniqueTrackingTag:String, type:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Custom Event message to Kontagent.
    *
    * @param {int} userId The UID of the user
    * @param {String} eventName The name of the event
    * @param {Object} [optionalParam] An associative array containing paramName => value
    * @param {int} [optionalParams.value] A value associated with the event
    * @param {int} [optionalParams.level] A level associated with the event (must be positive)
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackEvent(userId:int, eventName:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Application Added message to Kontagent.
    *
    * @param {int} userId The UID of the installing user
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.uniqueTrackingTag] 16-digit hex string used to match 
    *	Invite/StreamPost/NotificationSent/NotificationEmailSent->ApplicationAdded messages. 
    *	See the genUniqueTrackingTag() helper method.
    * @param {String} [optionalParams.shortUniqueTrackingTag] 8-digit hex string used to match 
    *	ThirdPartyCommClicks->ApplicationAdded messages. 
    *	See the genShortUniqueTrackingTag() helper method.
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackApplicationAdded(userId:int, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void

    
    /*
    * Sends an Application Removed message to Kontagent.
    *
    * @param {int} userId The UID of the removing user
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackApplicationRemoved(userId:int, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Third Party Communication Click message to Kontagent.
    *
    * @param {String} type The third party comm click type (ad, partner).
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.shortUniqueTrackingTag] 8-digit hex string used to match 
    *	ThirdPartyCommClicks->ApplicationAdded messages. 
    * @param {String} [optionalParams.userId] The UID of the user
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackThirdPartyCommClick(type:String, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Page Request message to Kontagent.
    *
    * @param {int} userId The UID of the user
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {int} [optionalParams.ipAddress] The current users IP address
    * @param {String} [optionalParams.pageAddress] The current page address (ex: index.html)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackPageRequest(userId:int, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an User Information message to Kontagent.
    *
    * @param {int} userId The UID of the user
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {int} [optionalParams.birthYear] The birth year of the user
    * @param {String} [optionalParams.gender] The gender of the user (m,f,u)
    * @param {String} [optionalParams.country] The 2-character country code of the user
    * @param {int} [optionalParams.friendCount] The friend count of the user
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackUserInformation(userId:int, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Goal Count message to Kontagent.
    * @param {int} userId The UID of the user
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {int} [optionalParams.goalCount1] The amount to increment goal count 1 by
    * @param {int} [optionalParams.goalCount2] The amount to increment goal count 2 by
    * @param {int} [optionalParams.goalCount3] The amount to increment goal count 3 by
    * @param {int} [optionalParams.goalCount4] The amount to increment goal count 4 by
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackGoalCount(userId:int, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

    
    /*
    * Sends an Revenue message to Kontagent.
    *
    * @param {int} userId The UID of the user
    * @param {int} value The amount of revenue in cents
    * @param {Object} [optionalParams] An associative array containing paramName => value
    * @param {String} [optionalParams.type] The transaction type (direct, indirect, advertisement, credits, other)
    * @param {String} [optionalParams.subtype1] Subtype1 value (max 32 chars)
    * @param {String} [optionalParams.subtype2] Subtype2 value (max 32 chars)
    * @param {String} [optionalParams.subtype3] Subtype3 value (max 32 chars)
    * @param {Function} [successCallback] The callback function to execute once message has been sent successfully
    * @param {Function(error:String)} [validationErrorCallback] The callback function to execute on validation failure 
    */
    public function trackRevenue(userId:int, value:int, optionalParams:Object = null, successCallback:Function = null, validationErrorCallback:Function = null):void 

