package UI 
{
	import net.flashpunk.FP;
	import UI.Button;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SmallButton extends Button
	{
		protected var selectedWorld:Class;
		
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_text		text to display on button.
		 * @param	_world		world to go to when button is pressed. defaults to main menu
		 * @param	_centered	should button be centered on x-axis.
		 */
		public function SmallButton(_xpos:int = 3, _ypos:int = 1, _text:String = "", _world:Class = null, _centered:Boolean = false) 
		{
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = _centered;
			this.smallButton = true;
			
			selectedWorld = _world;
			
		}
		
		override public function onPress():void
		{
			trace("menu button pressed");
			if (selectedWorld != null)
			{
				FP.world = new selectedWorld;
			}
		}
		
	}

}