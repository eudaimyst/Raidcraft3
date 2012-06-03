package Menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.php.phpComm;
	import UI.LineInputComm;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SubmitButton extends Entity 
	{
		protected var buttonText:Text;
		protected var button:Image;
		protected var buttonHover:Image;
		protected var buttonGraphicList:Graphiclist;
		protected var isHover:Boolean;
		protected var selectedWorld:Class;
		protected var attachedInput:LineInputComm
		
		
		public function SubmitButton(xPos:int, yPos:int, text:String, _attachedInput:LineInputComm) 
		{
			//selectedWorld = worldToGo;
			attachedInput = _attachedInput;
			
			Text.size = 18;
			
			//define button text and button graphic
			button = new Image(GC.GFX_LOGIN_BUTTON);
			buttonText = new Text(text);
			buttonHover = new Image(GC.GFX_LOGIN_BUTTON_HOVER);
			
			//draw button text and button graphic
			buttonGraphicList = new Graphiclist(button, buttonText);
			
			//position button text and graphic scale
			
			button.scale = 2;
			buttonHover.scale = 2;
			
			buttonText.color = 0x111111;
			buttonText.x = button.scaledWidth / 2 - buttonText.width / 2;
			buttonText.y = button.scaledHeight /2 - buttonText.height / 2;
			
			// draw graphics and text
			graphic = Graphiclist(buttonGraphicList);
			
			// position this entity
			this.x = FP.width/20 * xPos;
			this.y = FP.width/20 * yPos;
			
			//set hitbox for entity (to the dimensions of the button graphic)
			this.setHitbox(button.scaledWidth, button.scaledHeight);
			
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false) {graphic = new Graphiclist(buttonHover, buttonText); trace("changed to hover true");}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					
					//trace(String(menuOption));
					//this is where the magic happens, check if the menu option text for this entity is equal to the GC variable, then do it.
					//if (menuOption == GC.TEXT_PLAY_BUTTON) FP.world = new SpellSelect; 
					//if (menuOption == GC.TEXT_OPTIONS_BUTTON) FP.world.add (new OptionsMenu())
					//if (menuOption == GC.TEXT_DONE_SPELL_SELECT) FP.world = new TestLevel;
					
					var testvar:String = new String;
					trace("test");
					new phpComm(attachedInput.textGraphic.text);
					trace (testvar);
					//trace (attachedInput.textGraphic.text);
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true) {graphic = new Graphiclist(button, buttonText); trace("changed to hover false");}
				isHover = false;
			}
		}
		
	}

}