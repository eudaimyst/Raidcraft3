package Menu.Spells 
{
	import GameWorld.Characters.Heroes.*;
	import GameWorld.Spells.BaseSpell;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellChooserButton extends Entity 
	{
		[Embed(source = '../../../assets/spells/spell_button_normal.png')]
		public static const spellButtonGFX:Class;
		[Embed(source = '../../../assets/spells/spell_button_pressed.png')]
		public static const spellButtonPressedGFX:Class;
		
		protected var spellChooserBG:Image;
		protected var spellChooserBGPressed:Image;
		protected var spellImage:Image;
		protected var graphicList:Graphiclist;
		protected var graphicPressed:Graphiclist;
		protected var isHover:Boolean;
		protected var isPressed:Boolean;
		private var buttonActive:Boolean = false;
		private var mouseOrigX:Number;
		private var mouseOrigY:Number;
		private var origXpos:Number;
		private var origYpos:Number;
		
		private var spellSelected:Boolean;
		
		public var passedSpell:BaseSpell;
		public var inHolder:Boolean = false; //set this to true when button is in holder, is checked when button is removed
		
		private var allSpellHolders:Array;
		
		public function SpellChooserButton(_passedSpell:BaseSpell)
		{
			origXpos = _passedSpell.xPosition - 1;
			origYpos = _passedSpell.yPosition;
			spellChooserBG = new Image(spellButtonGFX);
			spellChooserBG.scale = 2;
			spellChooserBGPressed = new Image(spellButtonPressedGFX);
			spellChooserBGPressed.scale = 2;
			
			passedSpell = _passedSpell;
			spellImage = new Image(_passedSpell.SPELL_ICON);
			spellImage.scale = 2;
			
			graphicList = new Graphiclist(spellChooserBG, spellImage);
			graphicPressed= new Graphiclist(spellChooserBGPressed, spellImage);
			graphic = graphicList;
			
			this.x = 50 + (FP.screen.width / 13 * (_passedSpell.xPosition - 1));
			this.y = 105 + 100 * (_passedSpell.yPosition - 1);
			
			setHitbox(spellChooserBG.scaledWidth, spellChooserBG.scaledHeight);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (buttonActive)
			{
				this.x = SpellChooserWorld.thisWorld.mousecurser.x - mouseOrigX;
				this.y = SpellChooserWorld.thisWorld.mousecurser.y - mouseOrigY;
				if (Input.mouseReleased)
				{
					if (this.collide("spellHolder", x, y)) //store each colliding spell holder, check distance to each, store closest one
					{
						allSpellHolders = new Array;
						collideInto("spellHolder", x + spellChooserBG.scaledWidth/2, y + spellChooserBG.scaledHeight/2, allSpellHolders);
						
						var i:int = 0;
						var bestSpellHolder:SpellHolder;
						var currentSpellHolderToCheck:SpellHolder; 
						
						while (i < allSpellHolders.length)
						{
							currentSpellHolderToCheck = allSpellHolders[i];
							if (i == 0) bestSpellHolder = currentSpellHolderToCheck
							else {
								var distance:Number;
								distance = distanceFrom(currentSpellHolderToCheck);
								if (distance < distanceFrom(bestSpellHolder)) bestSpellHolder = currentSpellHolderToCheck;
							}
							i++;
						}
						trace ("closest spell holder = ", bestSpellHolder.actionBarNum);
						this.x = bestSpellHolder.x;
						this.y = bestSpellHolder.y;
						spellSelected = true;
					}
					else spellSelected = false;
					
					buttonActive = false;
					graphic = graphicList;
					if (!spellSelected)
					{
						this.x = 50 + (FP.screen.width/13 * origXpos);
						this.y = 105 + 100 * (origYpos - 1);
					}
				}
			}
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false) trace("changed to hover true");
				isHover = true;
				
				if (Input.mousePressed) //on mouseclick
				{
					if (isHover == true)
					{
						buttonActive = true;
						mouseOrigX = SpellChooserWorld.thisWorld.mousecurser.x - this.x;
						mouseOrigY = SpellChooserWorld.thisWorld.mousecurser.y - this.y;
						trace ("button active");
						graphic = graphicPressed;
					}
					//onPress(); //call onpress function which is over-riden by classes which extend this.
				}
				if (Input.mouseReleased)
				{
					
				}
			}
			else //if mouse is not colliding with entity
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true) trace("changed to hover false");//only called when 
				isHover = false;
			}
			
		}
		
	}

}

		
