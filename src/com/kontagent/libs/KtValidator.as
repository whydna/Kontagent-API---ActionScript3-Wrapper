package com.kontagent.libs
{
	public class KtValidator
	{
		/*
		* Validates a parameter of a given message type.
		*
		* @param string $messageType The message type that the param belongs to (ex: ins, apa, etc.)
		* @param string $paramName The name of the parameter (ex: s, su, u, etc.)
		* @param mixed $paramValue The value of the parameter
		* @param string $validationErrorMsg If the parameter value is invalid, this will be populated with the error message
		*
		* @returns bool Returns true on success and false on failure.
		
		*/
		public static function validateParameter(messageType:String, paramName:String, paramValue:String):Boolean 
		{
			// generate name of the dynamic method
			var methodName:String = 'validate' + KtValidator.uppercaseFirst(paramName);
			
			return KtValidator[methodName](messageType, paramValue);
		}
		
		private static function uppercaseFirst(str:String):String
		{
			return str.charAt(0).toUpperCase() + str.substr(1);
		}
		
		private static function validateB(messageType:String, paramValue:String):Boolean 
		{	
			if (int(paramValue) < 1900 || int(paramValue) > 2011) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateF(messageType:String, paramValue:String):Boolean
		{
			// friend count param (cpu message)
			if (int(paramValue) < 1) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateG(messageType:String, paramValue:String):Boolean 
		{
			// gender param (cpu message)
			var matches:Array = paramValue.match(/^[mfu]$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateGc1(messageType:String, paramValue:String):Boolean 
		{
			// goal count param (gc1, gc2, gc3, gc4 messages)
			if (int(paramValue) < -16384 || int(paramValue) > 16384) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateGc2(messageType:String, paramValue:String):Boolean 
		{
			return KtValidator.validateGc1(messageType, paramValue);
		}
		
		private static function validateGc3(messageType:String, paramValue:String):Boolean 
		{
			return KtValidator.validateGc1(messageType, paramValue);
		}
		
		private static function validateGc4(messageType:String, paramValue:String):Boolean 
		{
			return KtValidator.validateGc1(messageType, paramValue);
		}
		
		private static function validateI(messageType:String, paramValue:String):Boolean 
		{
			// isAppInstalled param (inr, psr, ner, nei messages)
			var matches:Array = paramValue.match(/^[01]$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateIp(messageType:String, paramValue:String):Boolean 
		{
			// ip param (pgr messages)
			var matches:Array = paramValue.match(/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}(\.\d{1,3})?$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateL(messageType:String, paramValue:String):Boolean 
		{
			// level param (evt messages)
			if (int(paramValue) < 1) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateLc(messageType:String, paramValue:String):Boolean 
		{
			// country param (cpu messages)
			var matches:Array = paramValue.match(/^[A-Z]{2}$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateLp(messageType:String, paramValue:String):Boolean 
		{
			// postal/zip code param (cpu messages)
			// this parameter isn't being used so we just return true for now
			return true;
		}
		
		private static function validateLs(messageType:String, paramValue:String):Boolean 
		{
			// state param (cpu messages)
			// this parameter isn't being used so we just return true for now
			return true;
		}
		
		private static function validateN(messageType:String, paramValue:String):Boolean 
		{
			// event name param (evt messages)
			var matches:Array = paramValue.match(/^[A-Za-z0-9-_]{1,32}$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateR(messageType:String, paramValue:String):Boolean 
		{
			var matches:Array;
			
			// Sending messages include multiple recipients (comma separated) and
			// response messages can only contain 1 recipient UID.
			if (messageType == 'ins' || messageType == 'nes' || messageType == 'nts') {
				// recipients param (ins, nes, nts messages)
				matches = paramValue.match(/^[0-9]+(,[0-9]+)*$/);
				
				if (matches == null || matches.length == 0) {
					return false;
				}
			} else if (messageType == 'inr' || messageType == 'psr' || messageType == 'nei' || messageType == 'ntr') {
				// recipient param (inr, psr, nei, ntr messages)
				matches = paramValue.match(/^[0-9]+$/);
				
				if (matches == null || matches.length == 0) {
					return false;
				}
			}
			
			return true;
		}
		
		private static function validateS(messageType:String, paramValue:String):Boolean
		{
			// userId param
			var matches:Array = paramValue.match(/^[0-9]+$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateSt1(messageType:String, paramValue:String):Boolean 
		{
			// subtype1 param
			var matches:Array = paramValue.match(/^[A-Za-z0-9-_]{1,32}$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateSt2(messageType:String, paramValue:String):Boolean 
		{
			return KtValidator.validateSt1(messageType, paramValue);
		}
		
		private static function validateSt3(messageType:String, paramValue:String):Boolean 
		{
			return KtValidator.validateSt1(messageType, paramValue);
		}
		
		private static function validateSu(messageType:String, paramValue:String):Boolean 
		{
			// short tracking tag param
			var matches:Array = paramValue.match(/^[A-Fa-f0-9]{8}$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateTs(messageType:String, paramValue:String):Boolean 
		{
			// timestamp param (pgr message)
			var matches:Array = paramValue.match(/^[0-9]+$/);
			
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
		
		private static function validateTu(messageType:String, paramValue:String):Boolean 
		{
			var matches:Array;
			
			// type parameter (mtu, pst/psr, ucc messages)
			// acceptable values for this parameter depends on the message type
			if (messageType == 'mtu') {
				matches = paramValue.match(/^(direct|indirect|advertisement|credits|other)$/);
				
				if (matches == null || matches.length == 0) {
					return false;
				}
			} else if (messageType == 'pst' || messageType == 'psr') {
				matches = paramValue.match(/^(feedpub|stream|feedstory|multifeedstory|dashboard_activity|dashboard_globalnews)$/);
				
				if (matches == null || matches.length == 0) {
					return false;
				}
			} else if (messageType == 'ucc') {
				matches = paramValue.match(/^(ad|partner)$/);
				
				if (matches == null || matches.length == 0) {
					return false;
				}
			}
			
			return true;
		}
		
		private static function validateU(messageType:String, paramValue:String):Boolean 
		{
			// unique tracking tag parameter for all messages EXCEPT pgr.
			// for pgr messages, this is the "page address" param
			if (messageType != 'pgr') {
				var matches:Array = paramValue.match(/^[A-Fa-f0-9]{16}$/);
				
				if (matches == null || matches.length == 0) {
					return false;
				}
			}
			
			return true;
		}
		
		private static function validateV(messageType:String, paramValue:String):Boolean 
		{
			var matches:Array = paramValue.match(/^[0-9]+$/);
			
			// value param (mtu, evt messages)
			if (matches == null || matches.length == 0) {
				return false;
			} else {
				return true;
			}
		}
	}
}