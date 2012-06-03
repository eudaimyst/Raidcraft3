package net.php 
{
	import flash.net.*;
	import flash.events.*;
	import net.flashpunk.FP
	import UI.SimpleText;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	 
	public class phpComm
	{
		public var phpVar1:String;
		
		public function phpComm(testVariable:String):void
		{
			trace (testVariable);
			// Assign a variable name for our URLVariables object
			var variables:URLVariables = new URLVariables();
			// Build the varSend variable
			// Be sure you place the proper location reference to your PHP config file here
			var varSend:URLRequest = new URLRequest("http://www.skipgamer.com/raidcraft/flashcomm.php");
			varSend.method = URLRequestMethod.POST;
			varSend.data = variables;
			// Build the varLoader variable
			var varLoader:URLLoader = new URLLoader;
			varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			varLoader.addEventListener(Event.COMPLETE, completeHandler);
			variables.uname = testVariable;
			variables.pword = "password123";
			variables.sendRequest = "parse";	
			// Send the data to the php file
			varLoader.load(varSend);
				
			// When the data comes back from PHP we capture it here		
			function completeHandler(event:Event):void
			{
				phpVar1 = event.target.data.var1;
				var phpVar2 = event.target.data.var2;
				trace("test");
				trace(phpVar1);
				
				FP.world.add (new SimpleText(1, 9, phpVar1));
				
				//trace(phpVar2);
				
				//add (new SimpleText (1, 8, phpVar1));
				//add (new SimpleText (1, 9, phpVar2));
			}
		}
		
	}
}