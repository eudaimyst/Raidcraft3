package Menu.Character 
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
	public class CharacterButton extends Entity 
	{
		protected var buttonText:Text;
		protected var menuButton:Image;
		protected var menuButtonHover:Image;
		protected var buttonGraphicList:Graphiclist;
		protected var isHover:Boolean;
		protected var menuItemNumber2:int;
		protected var menuOption:String;
		protected var timeElapsed:Number;
		protected var passedWorld:CreateCharacter;
		
		protected var tempClass:Class;
		
		public function CharacterButton(BUTTON_TEXT:String, menuItemNumber:int, _passedWorld:CreateCharacter, _xPos:int = 3) 
		{
			passedWorld = _passedWorld;
			
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
			this.x = FP.screen.width / 6 * _xPos - this.menuButton.width;
			this.y = FP.screen.height * .3 + menuItemNumber * 70;
			
			//set hitbox for entity (to the dimensions of the button graphic)
			this.setHitbox(menuButton.scaledWidth, menuButton.scaledHeight);
			//this.layer = -1;
			
			
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
					
					
					if (isHover == false) //first frame when hovering
					{
						tempClass = passedWorld.selectedChar;
						trace(String(tempClass));
						graphic = new Graphiclist(menuButtonHover, buttonText);
						trace("changed to hover true");
					}
					isHover = true;
					//on mouseclick
					if (Input.mousePressed)
					{
						passedWorld.SelectButtonPressed(tempClass);
						trace("sends to selectbuttonpressed");
					}
				}
				else 
				{
					//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
					if (isHover == true)
					{
						graphic = new Graphiclist(menuButton, buttonText);
						trace("changed to hover false");
					}
				isHover = false;
				}
			}
		}
		
	}

}