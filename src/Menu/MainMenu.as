package Menu 
{
	import flash.ui.MouseCursor;
	import Menu.Character.SelectCharacter;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	import net.flashpunk.graphics.Image
	import net.flashpunk.utils.Input
	import Menu.*;
	import Menu.Login.*;
	import PlayerIoTest.HelloWorld;
	import PlayerIoTest.HelloWorldEntity;
	import UI.*
	import playerio.*;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MainMenu extends World 
	{
		public var gameVersion:Text;
		//protected var loginBox:LoginBox;
		
		public var testInput2:LineInputComm;
		public var testSubmitButton2:SubmitButton;
		public var testSimpleText2:SimpleText;
		public static var testHelloWorldEntity:HelloWorldEntity = new HelloWorldEntity;
		
		public function MainMenu():void
		{
			super(); //not sure what this does, but it needs to be here?
			//add (testHelloWorldEntity);
			
			add (new LoginBox(0, 0));
			add (new TitleGraphic());
			
			add (new MenuButton("play", 1, 4, true, SelectCharacter));
			add (new MenuButton("options", 1, 5, true, OptionsMenu));
			add (new MenuButton("UI test", 1, 6, true, UITest));
			add (new MenuButton("exit", 1, 9, true, null, true));
			
			//game version
			gameVersion = new Text("Version 0.52",10,FP.screen.height-40);
			gameVersion.size = 24;
			addGraphic(gameVersion);
			
			trace ("Menu loaded");
			
			add (new MouseCursorEntity());
			
			/*
			testInput2 = (new LineInputComm(11, 7, "textbox"));
			testSimpleText2 = (new SimpleText(11,9,"ummm"));
			testSubmitButton2 = (new SubmitButton(11, 8, "submit", testInput2, testSimpleText2, true));
			add (testInput2);
			add (testSimpleText2);
			add (testSubmitButton2);
			*/
			
		}
		
		
		override public function update():void 
		{
			super.update();
		}
		
		
	}

}