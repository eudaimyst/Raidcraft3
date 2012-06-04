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
		//protected var text:Text;
		protected var _text:String = "blah";
		public var textGraphic:Text = new Text("");
		
		public function SimpleText(xPos:int, yPos:int, _text:String):void
		{
			textGraphic = new Text(_text);
			textGraphic.size = 24;
			//text = new Text(_text);
			
			
			graphic = new Graphiclist(textGraphic);
			
			// position this entity
			this.x = FP.width/20 * xPos;
			this.y = FP.width/20 * yPos;
		}
		
        public function get text():String
        {
            return _text;
        }
 
        public function set text(value:String):void
        {
            _text = value;
			textGraphic.text = value;
        }
		
	}

}