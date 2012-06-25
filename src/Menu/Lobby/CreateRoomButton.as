package Menu.Lobby 
{
	import GameWorld.Controllers.NetworkController;
	import UI.Button;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CreateRoomButton extends Button 
	{
		protected var controller:NetworkController;
		protected var roomCounter:int = 0;
		
		public var functionToRun:Function;
		
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_text		text to display on button.
		 * @param	_centered	should button be centered on x-axis.
		 */
		public function CreateRoomButton(_xpos:int = 3, _ypos:int = 1, _text:String = "", _centered:Boolean = false, _controller:NetworkController = null, _functionToRun:Function = null) 
		{
			functionToRun = _functionToRun;
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = _centered;
			this.smallButton = true;
			
			controller = _controller;
		}
		
		override public function onPress():void
		{
			functionToRun();
		}
		
	}

}