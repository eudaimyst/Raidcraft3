package net.php 
{
	import flash.net.*;
	import flash.events.*;
	import Menu.*;
	import net.flashpunk.FP
	import UI.PopupBox;
	import UI.SimpleText;
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	 
	public class phpRegister
	{
		public var success:String;
		public var errormessage:String;
		public var pressedButton:RegisterButton;
        protected var _text:String = "";
		
		public function phpLogin():void
		{
			
		}
		
		public function getphp(_username:String, _password:String, _passwordConfirm:String, _email:String, _pressedButton:RegisterButton):void
		{
			pressedButton = _pressedButton; //*works!
			
			// Assign a variable name for our URLVariables object
			var variables:URLVariables = new URLVariables();
			// Build the varSend variable
			// Be sure you place the proper location reference to your PHP config file here
			var varSend:URLRequest = new URLRequest("http://www.skipgamer.com/raidcraft/as3comm/phpregister.php");
			varSend.method = URLRequestMethod.POST;
			varSend.data = variables;
			// Build the varLoader variable
			var varLoader:URLLoader = new URLLoader;
			varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			varLoader.addEventListener(Event.COMPLETE, completeHandler);
			variables.username = _username;
			variables.password = _password;
			variables.confirm_pass = _passwordConfirm;
			variables.email = _email;
			variables.sendRequest = "parse";	
			// Send the data to the php file
			trace(variables.username, variables.password, variables.confirm_pass, variables.email);
			varLoader.load(varSend);
				
			// When the data comes back from PHP we capture it here		
			function completeHandler(event:Event):void
			{
				success = event.target.data.var1;
				errormessage = event.target.data.var2;
				
				trace("success=" + success + " error=" + errormessage);
				if (success == "true") pressedButton.PopupMessage("Registration Successful");
				if (success == "false") pressedButton.PopupMessage(errormessage);
				
				
				//pressedButton.setresult();
				
			}
			
			
		}
		
		
		
		
	}
}