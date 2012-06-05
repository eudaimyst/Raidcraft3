package Menu 
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
	import UI.UITest;
	import user.UserVariables;
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MenuButton extends Entity 
	{
		//public static var isDisabled:Boolean;
		
		protected var buttonText:Text;
		protected var menuButton:Image;
		protected var menuButtonHover:Image;
		protected var buttonGraphicList:Graphiclist;
		protected var isHover:Boolean;
		protected var menuItemNumber2:int;
		protected var menuOption:String;
		protected var timeElapsed:Number;
		protected var selectedWorld:Class;
		
		public function MenuButton(BUTTON_TEXT:String, menuItemNumber:int, worldToGo:Class) 
		{
			selectedWorld = worldToGo;
			
			timeElapsed = 0;
			Text.size = 24;
			
			//define button text and button graphic
			menuButton = new Image(GC.GFX_MENU_BUTTON);
			buttonText = new Text(BUTTON_TEXT);
			menuButtonHover = new Image(GC.GFX_MENU_BUTTON_HOVER);
			menuOption = BUTTON_TEXT;
			
			
			//draw button text and button graphic
			buttonGraphicList = new Graphiclist(menuButton, buttonText);
			
			//position button text and graphic scale
			
			menuButton.scale = 2;
			menuButtonHover.scale = 2;
			
			buttonText.color = 0x111111;
			buttonText.x = menuButton.scaledWidth / 2 - buttonText.width / 2;
			buttonText.y = menuButton.scaledHeight /2 - buttonText.height / 2;
			
			// draw graphics and text
			graphic = Graphiclist(buttonGraphicList);
			
			// position this entity
			this.x = FP.screen.width / 2 - this.menuButton.width;
			this.y = FP.screen.height * .3 + menuItemNumber * 70;
			
			//set hitbox for entity (to the dimensions of the button graphic)
			this.setHitbox(menuButton.scaledWidth, menuButton.scaledHeight);
			//this.layer = -1;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (isDisabled == true)
			{
				
			}
			
			else
			{
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false) {graphic = new Graphiclist(menuButtonHover, buttonText); trace("changed to hover true");}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					trace(String(menuOption));
					//this is where the magic happens, check if the menu option text for this entity is equal to the GC variable, then do it.
					FP.world = new selectedWorld;
					//if (menuOption == GC.TEXT_PLAY_BUTTON) FP.world = new SpellSelect; 
					//if (menuOption == GC.TEXT_OPTIONS_BUTTON) FP.world.add (new OptionsMenu())
					//if (menuOption == GC.TEXT_DONE_SPELL_SELECT) FP.world = new TestLevel;
					//trace (this.world);
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true) {graphic = new Graphiclist(menuButton, buttonText); trace("changed to hover false");}
				isHover = false;
			}
			}
		}
		
	}

}