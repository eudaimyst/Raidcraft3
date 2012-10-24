package PlayerIoTest 
{
	import flash.net.*;
	import flash.events.*;
	import Menu.MainMenu;
	import UI.SubmitButton;
	import net.flashpunk.FP
	import UI.SimpleText;
	import playerio.*;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	 
	public class playerioComm
	{
		public var phpVar1:String = "boo";
		public var pressedButton:SubmitButton;
		
		public function playerioComm():void
		{
			
		}
		
		public function getphp(sentVariable:String, _pressedButton:SubmitButton):void
		{
			trace("3xblah", sentVariable);
			//MainMenu.testHelloWorldEntity.sendTest(this, sentVariable);
			pressedButton = _pressedButton
			pressedButton.setresult();
			
		}
		
		public function valueReturn(returnedVar:String):void
		{
				phpVar1 = returnedVar;
				trace (phpVar1);
				pressedButton.setresult();
		}
		
	}
	
}