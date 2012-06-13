package Menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import UI.Button;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SmallButton extends Button
	{
		protected var selectedWorld:Class;
		
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