package UI 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Checkbox extends Entity 
	{
		protected var checkboxText:Text;
		protected var checkbox:Image;
		protected var checkboxHover:Image;
		protected var checkboxPressed:Image;
		protected var GraphicList:Graphiclist;
		protected var HoverGraphicList:Graphiclist;
		protected var PressedGraphicList:Graphiclist;
		protected var isHover:Boolean;
		protected var isPressed:Boolean;
		
		public function Checkbox(xPos:int, yPos:int, text:String) 
		{
			//define checkbox graphics
			checkbox = new Image(GC.GFX_CHECKBOX);
			checkboxHover = new Image(GC.GFX_CHECKBOX_HOVER);
			checkboxPressed = new Image(GC.GFX_CHECKBOX_PRESSED);
			checkboxText = new Text(text);
			
			checkboxText.color = 0xffffff;
			checkboxText.x = checkbox.scaledWidth + 20;
			checkboxText.y = checkbox.scaledHeight /2 - 5;
			
			GraphicList = new Graphiclist(checkbox, checkboxText);
			HoverGraphicList = new Graphiclist(checkboxHover, checkboxText);
			PressedGraphicList = new Graphiclist(checkboxPressed, checkboxText);
			
			checkbox.scale = 2;
			checkboxHover.scale = 2;
			checkboxPressed.scale = 2;
			
			graphic = Graphiclist(GraphicList);
			
			// position this entity
			this.x = FP.width/20 * xPos;
			this.y = FP.width/20 * yPos;
			
			//set hitbox for entity (to the dimensions of the button graphic)
			this.setHitbox(checkbox.scaledWidth, checkbox.scaledHeight);
			
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				if (isHover == false) { //if not hovering (ie, mouse just moves over graphic)
					trace("changed to hover true");
					isHover = true; //set to false so this doesnt repeat forever
					graphic = Graphiclist(HoverGraphicList);
				}
				
				//on mouseclick
				if (Input.mousePressed)
				{
					if (isPressed == false) //if checkbox is false
					{
						graphic = Graphiclist(PressedGraphicList); //change graphics to true
						trace("changed to pressed true");
						isPressed = true;
					}
					else
					{
						graphic = Graphiclist(GraphicList); //change graphics to false
						trace("changed to pressed false");
						isPressed = false;
					}
				}
			}
			else //if mouse is not hovering over checkbox
			{
				if (isHover == true) //if the mouse was last hovering over checkbox
				{
					isHover = false;
					if (isPressed == true) //if checkbox is pressed
					{
						graphic = Graphiclist(PressedGraphicList); //keep graphics to true
					}
					else
					{
						graphic = Graphiclist(GraphicList); //change graphics to false
					}
				}
			}
		}
	}
}