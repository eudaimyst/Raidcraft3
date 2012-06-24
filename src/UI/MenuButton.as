package UI 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	import net.flashpunk.FP;
	 
	public class MenuButton extends Button 
	{
		
		protected var selectedWorld:Class;
		protected var classtoPass:Class;
		
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_text		text to display on button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_centered	should button be centered on x-axis.
		 * @param	_world		world to go to when button is pressed. defaults to main menu
		 * @param	_small		should the button use a small graphic?
		 * @param	_classtoPassclass to pass to the selected world
		 */
		public function MenuButton(_text:String = "", _xpos:int = 3, _ypos:int = 1, _centered:Boolean = false, _world:Class = null, _small:Boolean = false, _classtoPass:Class = null) 
		{
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = _centered;
			this.smallButton = _small;
			
			selectedWorld = _world;
			classtoPass = _classtoPass;
		}
		
		override public function onPress():void
		{
			trace("menu button pressed");
			if (selectedWorld != null)
			{
				if (classtoPass != null)
				{
					FP.world = new selectedWorld(classtoPass);
				}
				else FP.world = new selectedWorld;
			}
		}
		
	}

}