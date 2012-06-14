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
		var gameVersion:Text;
		//protected var loginBox:LoginBox;
		
		
		public function MainMenu():void
		{
			super(); //not sure what this does, but it needs to be here.
			add (new HelloWorldEntity());
			
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
			
		}
		
		
		override public function update():void 
		{
			super.update();
		}
		
		
	}

}