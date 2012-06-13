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
	import UI.*
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MainMenu extends World 
	{
		protected var gameVersion:Text;
		//protected var loginBox:LoginBox;
		
		
		public function MainMenu():void
		{
			super(); //not sure what this does, but it needs to be here.
			
			
			
/*			add (new MenuButton("play", 1, SelectCharacter));
			add (new MenuButton("options", 2, OptionsMenu));
			add (new MenuButton("UI test", 3, UITest));
			add (new MenuButton("exit", 5, MainMenu));*/
			//add (new SmallButton(1, 1, "login", MainMenu));
			add (new LoginBox(0, 0));
			add (new TitleGraphic());
			
			
			add (new MenuButton("play", 1, 4, true, SelectCharacter));
			add (new MenuButton("options", 1, 5, true, OptionsMenu));
			add (new MenuButton("UI test", 1, 6, true, UITest));
			
			
			
			
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