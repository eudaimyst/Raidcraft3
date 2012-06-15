package UI 
{
	import flash.ui.MouseCursor;
	import Menu.MainMenu;
	import UI.MenuButton;
	import UI.SubmitButton;
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
		public var testInput:LineInputComm;
		public var testSubmitButton:SubmitButton;
		public var testSimpleText:SimpleText;
		public var testInput2:LineInputComm;
		public var testSubmitButton2:SubmitButton;
		public var testSimpleText2:SimpleText;
		
		public static var returnedVar:String = new String;
		
		public function UITest()
		{
			super();
			Text.size = 24; //default text size testing
			
			add (new MenuButton("save", 1, 9, true, MainMenu));
			add (new Checkbox(1, 1, "testbox"));
			add (new Checkbox(1, 2, "testbox2"));
			add (new Checkbox(1, 3, "testbox3"));
			add (new LineInputComm(10, 1, "username"));
			add (new LineInputComm(10, 2, "password"));
			
			add (new SimpleText(1, 6, "php comm:"));
			add (new SimpleText(11, 6, "playerio comm:"));
			
			testInput = (new LineInputComm(1, 7, "textbox"));
			testSimpleText = (new SimpleText(1,9,"hmm"));
			testSubmitButton = (new SubmitButton(1, 8, "submit", testInput, testSimpleText));
			add (testInput);
			add (testSimpleText);
			add (testSubmitButton);
			
			testInput2 = (new LineInputComm(11, 7, "textbox"));
			testSimpleText2 = (new SimpleText(11,9,"ummm"));
			testSubmitButton2 = (new SubmitButton(11, 8, "submit", testInput2, testSimpleText2, true));
			add (testInput2);
			add (testSimpleText2);
			add (testSubmitButton2);
			
			
			
			trace ("Menu loaded");
			
			add (new MouseCursorEntity());
			
		}
		
		

		
		override public function update():void 
		{
			super.update();
		}
	}

}