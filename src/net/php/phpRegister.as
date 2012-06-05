package net.php 
{
	import flash.net.*;
	import flash.events.*;
	import Menu.LoginBox;
	import Menu.LoginButton;
	import Menu.MainMenu;
	import Menu.MenuButton;
	import net.flashpunk.FP
	import UI.PopupBox;
	import UI.SimpleText;
	import user.UserVariables;
	import user.variables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	 
	public class phpRegister
	{
		public var success:String;
		public var errormessage:String;
        protected var _text:String = "";
		
		public function phpLogin():void
		{
			
		}
		
		public function getphp(_username:String, _password:String, _passwordConfirm:String, _email:String):void
		{
			
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
			trace(variables.username, variables.password);
			varLoader.load(varSend);
				
			// When the data comes back from PHP we capture it here		
			function completeHandler(event:Event):void
			{
				success = event.target.data.var1;
				errormessage = event.target.data.var2;
				
				if (success == "true")
				{
					trace ("success = " + success);
					
				}
				else
				{
					//pressedButton.loginBox.LoginMessage(errormessage);
					trace ("success = " + success);
					trace ("error = " + errormessage);
				}
				//pressedButton.setresult();
				
			}
			
			
		}
		
		
		
		
	}
}