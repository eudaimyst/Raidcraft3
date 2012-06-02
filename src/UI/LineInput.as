package UI 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Key;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LineInput extends Entity 
	{
		protected var inputOutline:Image;
		protected var inputBox:Image;
		protected var inputHeight:int;
		protected var inputWidth:int;
		protected var graphicList:Graphiclist;
		protected var activeGraphicList:Graphiclist;
		protected var labelText:Text;
		protected var inputActive:Boolean;
		
		protected var activeFlash:Image;
		
		//protected var inputText:Text;
		//protected var inputString:String;
		
        protected var _text:String = "";
        protected var textGraphic:Text;
		
		public function LineInput(xPos:int, yPos:int, label:String) 
		{
			
			labelText = new Text(label + ":");
			labelText.color = 0xffffff;
			labelText.x = 0;
			labelText.y = 0;
			
			inputHeight = 34;
			inputWidth = 250;
			inputOutline = Image.createRect(inputWidth, inputHeight, 0xffffff, 1);
			inputOutline.x = labelText.scaledWidth + 5;
			inputOutline.y = labelText.y - 2;
			inputBox = Image.createRect(inputWidth - 4, inputHeight - 4, 0x000000, 1);
			inputBox.x = inputOutline.x + 2;
			inputBox.y = inputOutline.y + 2;
			

			
			
			textGraphic = new Text("");
			textGraphic.color = 0xffffff;
			textGraphic.x = inputOutline.x + 5;
			textGraphic.y = inputOutline.y + 2;
			
			activeFlash = Image.createRect(2, inputHeight - 6, 0xffffff, 1);
			
			
			//this.text = text;
			
			graphicList = new Graphiclist(labelText, inputOutline, inputBox, textGraphic);
			activeGraphicList = new Graphiclist(labelText, inputOutline, inputBox, textGraphic, activeFlash);
			
			graphic = graphicList;
			
			
			// position this entity
			this.x = FP.width / 20 * xPos;
			this.y = FP.width / 20 * yPos;
			
			
			//set hitbox for entity (to the dimensions of the button graphic)
			
			this.setHitboxTo(inputOutline);
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
		
		override public function update():void 
		{
			super.update();
			if (inputActive == true) 
			{
				//capture text
				text += Input.keyString;
				Input.keyString = "";
				if (Input.pressed(Key.BACKSPACE)) { text = text.substr(0, _text.length - 1); activeFlash.x = labelText.scaledWidth + textGraphic.scaledWidth; }
				
				activeFlash.x = labelText.scaledWidth + 5 + textGraphic.scaledWidth;
				if (graphic == graphicList) { graphic = activeGraphicList; }
			}
			else
			{
				if (graphic == activeGraphicList) graphic = graphicList;
			}
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{	
				//on mouseclick
				if (Input.mousePressed)
				{
					trace ("inputboxpressed");
					inputActive = true;
					Input.keyString = "";
				}
			}
			else //if mouse is not hovering over box
			{
				if (Input.mousePressed)
				{
					//trace ("inputboxpressed");
					inputActive = false;
				}
			}
		}
	}
}