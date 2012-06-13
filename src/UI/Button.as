package UI 
{
	//import HUD.SpellButton;
	//import Levels.SpellSelect;
	//import Levels.TestLevel;
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
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Button extends Entity 
	{
		protected var buttonText:Text;
		protected var buttonGraphic:Image;
		protected var buttonGraphicHover:Image;
		protected var buttonGraphicList:Graphiclist;
		protected var buttonGraphicListHover:Graphiclist;
		protected var isHover:Boolean;
		protected var text:String;
		protected var xpos:int;
		protected var ypos:int;
		protected var centered:Boolean;
		
		public function Button() 
		{	
			
		}
		
		public function onPress():void //actions to do when button is pressed, this will be over-ridden by classes which extend this class
		{
			trace("button pressed");
		}
		
		override public function added():void
		{
			//define button text and button graphic
			buttonGraphic = new Image(GC.GFX_MENU_BUTTON);
			buttonGraphicHover = new Image(GC.GFX_MENU_BUTTON_HOVER);
			buttonGraphic.scale = 2;
			buttonGraphicHover.scale = 2;
			
			buttonText = new Text(text);
			buttonText.size = 24;
			
			//set graphiclists
			buttonGraphicList = new Graphiclist(buttonGraphic, buttonText);
			buttonGraphicListHover = new Graphiclist(buttonGraphicHover, buttonText);
			
			//center button text and set colour
			buttonText.color = 0x111111;
			buttonText.x = buttonGraphic.scaledWidth / 2 - buttonText.textWidth / 2;
			buttonText.y = buttonGraphic.scaledHeight /2 - buttonText.textHeight / 2;
			
			// draw graphics and text
			graphic = Graphiclist(buttonGraphicList);
			
			// position this entity
			if (centered == true)
			{
				this.x = FP.halfWidth - buttonGraphic.scaledWidth / 2;
			}
			else
			{
				this.x = FP.width / 10 * xpos - buttonGraphic.scaledWidth / 2;
			}
			this.y = FP.height / 10 * ypos - buttonGraphic.scaledHeight / 2;
			
			//set hitbox for entity (to the dimensions of the button graphic)
			this.setHitbox(buttonGraphic.scaledWidth, buttonGraphic.scaledHeight);
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide("popupbox", x, y)) //if this is colliding with popupbox do nothing;
			{
				
			}
			else
			{
				if (this.collide(GC.TYPE_MOUSE, x, y))
				{
					//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
					if (isHover == false) {graphic = Graphiclist(buttonGraphicListHover); trace("changed to hover true");}
					isHover = true;
					
					if (Input.mousePressed) //on mouseclick
					{
						onPress();
						//set world for menu button
						//trace(String(menuOption));
						//FP.world = new selectedWorld;
						
					}
				}
				else 
				{
					//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
					if (isHover == true) {graphic = Graphiclist(buttonGraphicList); trace("changed to hover false");}
					isHover = false;
				}
			}
		}
		
	}

}