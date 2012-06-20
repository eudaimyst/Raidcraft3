package UI 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	import GameWorld.Level;
	import net.flashpunk.FP;
	 
	public class PlayButton extends Button 
	{
		
		protected var selectedWorld:Level;
		
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_text		text to display on button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_centered	should button be centered on x-axis.
		 * @param	_world		world to go to when button is pressed. level to go to
		 * @param	_small		should the button use a small graphic?
		 */
		public function PlayButton(_text:String = "", _xpos:int = 3, _ypos:int = 1, _centered:Boolean = false, _world:Level = null, _small:Boolean = false) 
		{
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = _centered;
			this.smallButton = _small;
			
			selectedWorld = _world;
		}
		
		override public function onPress():void
		{
			trace("menu button pressed");
			if (selectedWorld != null)
			{
				FP.world = selectedWorld;
			}
		}
		
	}

}