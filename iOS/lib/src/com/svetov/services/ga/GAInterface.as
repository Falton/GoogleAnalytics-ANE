package com.svetov.services.ga
{
	import flash.external.ExtensionContext;
	
	/**
	 * ...
	 * @author Dima
	 */
	public class GAInterface
	{
		private var context:ExtensionContext;
		private var _trackingId:String;
		private static var _instance:GAInterface;
		private static var _allowed:Boolean = false;
		public function GAInterface():void 
		{
			if (!context) context = ExtensionContext.createExtensionContext("com.svetov.services.ga", null);
		}
		
		public static function getInstance():GAInterface {
			if (!_instance) {
				_allowed = true;
				_instance = new GAInterface();
				_allowed = false;
			}
			return _instance;
		}
		
		public function trackView(view:String):void {
			if (this._trackingId != null && this._trackingId != "") {
				context.call("trackView",this._trackingId, view);
			}
		}
		
		public function trackEvent(category:String, action:String, label:String = "", value:Number = 0):void {
			if (this._trackingId != null && this._trackingId != "") {
				context.call("trackEvent",this._trackingId, category,action,label,value.toString());
			}
		}
		
		public function set trackingId(val:String):void { this._trackingId = val; }
		
		
	}
	
}