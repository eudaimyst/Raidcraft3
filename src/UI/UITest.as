package UI 
{
	import flash.ui.MouseCursor;
	import Menu.MainMenu;
	import Menu.MenuButton;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	import net.flashpunk.graphics.Image
	import net.flashpunk.utils.Input
	import net.php.Comm;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class UITest extends World 
	{
		var phpVar:String;
		
		public function UITest()
		{
			super();
			
			add (new MenuButton("save", 5, MainMenu));
			add (new Checkbox(1, 1, "testbox"));
			add (new Checkbox(1, 2, "testbox2"));
			add (new Checkbox(1, 3, "testbox3"));
			add (new LineInput(10, 1, "username"));
			add (new LineInput(10, 2, "password"));
			
			add (new SimpleText(1, 6, "php communication:"));
			add (new LineInput(1, 7, "textbox"));
			
			trace ("Menu loaded");
			
			add (new MouseCursorEntity());
			
			phpVar = Comm.returnedVar;
			trace(phpVar);
			add (new SimpleText(1, 8, phpVar));
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}