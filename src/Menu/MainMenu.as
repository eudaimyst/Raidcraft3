package Menu 
{
	import flash.ui.MouseCursor;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	import net.flashpunk.graphics.Image
	import net.flashpunk.utils.Input
	import UI.LineInput;
	import UI.UITest;
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MainMenu extends World 
	{
		protected var gameVersion:Text;
		
		
		public function MainMenu():void
		{
			super(); //not sure what this does, but it needs to be here.
			
			
			
			//add (new MenuButton("play", 1));
			add (new MenuButton("options", 2, OptionsMenu));
			add (new MenuButton("UI test", 3, UITest));
			add (new MenuButton("exit", 5, MainMenu));
			//add (new SmallButton(1, 1, "login", MainMenu));
			add (new LoginBox());
			add (new TitleGraphic());
			
			
			Text.size = 24;
			
			//game version
			gameVersion = new Text("Version 0.50",10,FP.screen.height-40);
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