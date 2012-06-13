package Menu 
{
	import flash.ui.MouseCursor;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	import net.flashpunk.graphics.Image
	import net.flashpunk.utils.Input
	import UI.*
	import Menu.*;
	import Menu.Options.*;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class OptionsMenu extends World 
	{
		
		public function OptionsMenu() 
		{	
			super();
			
			add (new MenuButton("save", 1, 9, true, MainMenu));
			add (new SimpleText(1, 2, "Options"));
			add (new SmallButton(2, 1, "Graphics", GraphicsMenu));
			add (new SmallButton(4, 1, "Controls", ControlsMenu));
			add (new SmallButton(6, 1, "Sound", SoundMenu));
			add (new SmallButton(8, 1, "Gameplay", GameplayMenu));
			//add (new Checkbox(1, 1, "testbox"));
			//add (new Checkbox(1, 2, "testbox2"));
			//add (new Checkbox(1, 3, "testbox3"));
			//add (new LineInput(10, 1, "username"));
			//add (new LineInput(10, 2, "password"));
			
			
			trace ("Menu loaded");
			
			add (new MouseCursorEntity());
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}