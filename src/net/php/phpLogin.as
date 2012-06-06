package net.php 
{
	import flash.net.*;
	import flash.events.*;
	import Menu.*;
	import Menu.Login.LoginButton;
	import net.flashpunk.FP
	import UI.PopupBox;
	import UI.SimpleText;
	import user.UserVariables;
	import user.variables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	 
	public class phpLogin
	{
		public var username:String;
		public var success:String;
		public var errormessage:String;
		public var pressedButton:LoginButton;
        protected var _text:String = "";
		
		public function phpLogin():void
		{
			
		}
		
		public function getphp(_username:String, _password:String, _pressedButton:LoginButton):void
		{
			pressedButton = _pressedButton; //*works!
			
			// Assign a variable name for our URLVariables object
			var variables:URLVariables = new URLVariables();
			// Build the varSend variable
			// Be sure you place the proper location reference to your PHP config file here
			var varSend:URLRequest = new URLRequest("http://www.skipgamer.com/raidcraft/as3comm/phplogin.php");
			varSend.method = URLRequestMethod.POST;
			varSend.data = variables;
			// Build the varLoader variable
			var varLoader:URLLoader = new URLLoader;
			varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			varLoader.addEventListener(Event.COMPLETE, completeHandler);
			variables.username = _username;
			variables.password = _password;
			variables.sendRequest = "parse";	
			// Send the data to the php file
			trace(variables.username, variables.password);
			varLoader.load(varSend);
				
			// When the data comes back from PHP we capture it here		
			function completeHandler(event:Event):void
			{
				username = event.target.data.var1;
				success = event.target.data.var2;
				errormessage = event.target.data.var3;
				trace (username, success, errormessage);
				if (success == "true")
				{
					UserVariables.loggedIn = true;
					UserVariables.userName = username;
					pressedButton.loginBox.LoginMessage("logged in as " + username);
					pressedButton.loginBox.RemoveLogin();
				}
				else
				{
					pressedButton.loginBox.LoginMessage(errormessage);
				}
				//pressedButton.setresult();
				
			}
			
			
		}
		
		
		
		
	}
}