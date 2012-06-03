package UI 
{
	import flash.ui.MouseCursor;
	import Menu.MainMenu;
	import Menu.MenuButton;
	import Menu.SubmitButton;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	import net.flashpunk.graphics.Image
	import net.flashpunk.utils.Input
	import net.php.phpComm;
	
	import flash.net.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class UITest extends World 
	{
		protected var phpVar:String;
		protected var testCommunication:LineInputComm;
		
		public static var returnedVar:String = new String;
		
		public function UITest()
		{
			super();
			
			testCommunication = (new LineInputComm(1, 7, "textbox"));
			
			add (new MenuButton("save", 5, MainMenu));
			add (new Checkbox(1, 1, "testbox"));
			add (new Checkbox(1, 2, "testbox2"));
			add (new Checkbox(1, 3, "testbox3"));
			add (new LineInput(10, 1, "username"));
			add (new LineInput(10, 2, "password"));
			
			add (new SimpleText(1, 6, "php communication:"));
			add (testCommunication);
			add (new SubmitButton(1, 8, "submit", testCommunication));
			
			trace ("Menu loaded");
			
			add (new MouseCursorEntity());
			
			//phpComm();
			
			//trace(phpVar);
			//add (new SimpleText(1, 8, phpVar));
		}
		
		/*
		function phpComm():void

		{
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
			variables.uname = "username2";
			variables.pword = "password123";
			variables.sendRequest = "parse";	
			// Send the data to the php file
			varLoader.load(varSend);

			// When the data comes back from PHP we display it here		
			function completeHandler(event:Event):void
			{
				var phpVar1 = event.target.data.var1;
				var phpVar2 = event.target.data.var2;
				
				//trace(phpVar1);
				//trace(phpVar2);
				
				add (new SimpleText (1, 8, phpVar1));
				add (new SimpleText (1, 9, phpVar2));
			}
		}

		
		private function completeHandler(event:Event):void
		{
			returnedVar = event.target.data.var1;
		}	
		
		*/
		
		override public function update():void 
		{
			super.update();
		}
	}

}