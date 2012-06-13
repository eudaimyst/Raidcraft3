package UI 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	import Menu.MainMenu;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	import UI.PopupBox;
	import UI.UITest;
	import user.UserVariables;
	 
	public class MenuButton extends Button 
	{
		
		protected var selectedWorld:Class;
		
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_text		text to display on button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_centered	should button be centered on x-axis.
		 * @param	_world		world to go to when button is pressed. defaults to main menu
		 */
		public function MenuButton(_text:String = "", _xpos:int = 3, _ypos:int = 1, _centered:Boolean = false, _world:Class = null) 
		{
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = _centered;
			
			selectedWorld = _world;
		}
		
		override public function onPress():void
		{
			trace("menu button pressed");
			FP.world = new selectedWorld;
		}
		
	}

}