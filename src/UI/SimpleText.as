package UI 
{
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SimpleText extends Entity
	{
		protected var text:Text;
		
		public function SimpleText(xPos:int, yPos:int, _text:String) 
		{
			Text.size = 24;
			text = new Text(_text);
			
			graphic = new Graphiclist(text);
			
			// position this entity
			this.x = FP.width/20 * xPos;
			this.y = FP.width/20 * yPos;
		}
		
		public function updateText(_text:String)
		{
			text = new Text(_text)
			graphic = new Graphiclist(text);
		}
		
	}

}