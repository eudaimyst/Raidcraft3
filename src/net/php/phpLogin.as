package net.php 
{
	import flash.net.*;
	import flash.events.*;
	import Menu.LoginButton;
	import net.flashpunk.FP
	import UI.SimpleText;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	 
	public class phpLogin
	{
		public var phpVar1:String = "boo";
		public var phpVar2:String = "boo";
		public var phpVar3:String = "boo";
		public var pressedButton:LoginButton;
        protected var _text:String = "";
		
		public function phpLogin():void
		{
			
		}
		
		public function getphp(firstVar:String, secondVar:String, _pressedButton:LoginButton):void
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
			variables.username = firstVar;
			variables.password = secondVar;
			variables.sendRequest = "parse";	
			// Send the data to the php file
			trace(variables.username);
			trace(variables.password);
			varLoader.load(varSend);
				
			// When the data comes back from PHP we capture it here		
			function completeHandler(event:Event):void
			{
				phpVar1 = event.target.data.var1;
				phpVar2 = event.target.data.var2;
				phpVar3 = event.target.data.var3;
				trace (phpVar1, phpVar2, phpVar3);
				//pressedButton.setresult();
				
			}
			
			
		}
		
		
		
		
	}
}