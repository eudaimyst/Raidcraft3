package net.php 
{
	import flash.net.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Comm 
	{
		public static var returnedVar:String = new String;
		
		// Assign a variable name for our URLVariables object
		protected var variables:URLVariables = new URLVariables();
		// Build the varSend variable
		// Be sure you place the proper location reference to your PHP config file here
		protected var varSend:URLRequest = new URLRequest("http://www.skipgamer.com/raidcraft/flashcomm.php");
		// Build the varLoader variable
		protected var varLoader:URLLoader = new URLLoader;
		
		public function Comm(data:String):String //varName (a string) is passed to this function
		{
			returnedVar = "blah"
			trace("returnedVar=blah");
			
			varSend.method = URLRequestMethod.POST;
			varSend.data = variables;
			
			varLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			//varLoader.addEventListener(Event.Complete, completeHandler);
			
			variables.uname = "blah"; //uname gets sent to php, we set this to equal the string that is passed
			variables.sendRequest = "parse"; //this is for checking in the php file
			
			varLoader.load(varSend); // Send the data to the php file
			
			varLoader.addEventListener(Event.COMPLETE, completeHandler);
		}
		
		
		private function completeHandler(event:Event):void
		{
			returnedVar = event.target.data.var1;
			return returnedVar;
		}		
		
	}

}