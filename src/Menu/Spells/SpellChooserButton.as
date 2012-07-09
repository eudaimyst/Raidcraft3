package Menu.Spells 
{
	import GameWorld.Characters.Heroes.*;
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
		protected var spellChooserBG:Image;
		protected var spellChooserBGPressed:Image;
		protected var spellImage:Image;
		protected var graphicList:Graphiclist;
		protected var graphicPressed:Graphiclist;
		protected var isHover:Boolean;
		protected var isPressed:Boolean;
		protected var xpos:int;
		protected var ypos:int;
		
		public function SpellChooserButton(i:int, _class:Class)
		{
			specChooserBG = new Image(SpecGFX.SpecChooserBG);
			specChooserBGPressed = new Image(SpecGFX.SpecChooserBGHover);
			trace(String(i));
			trace(String(_class));
			
			if (_class == Mage.GFX_SELECT)
			{
				if (i == 0)
				{
					specImage = new Image(SpecGFX.SpecChooserElement);
				}
				if (i == 1)
				{
					specImage = new Image(SpecGFX.SpecChooserHoly);
				}
				if (i == 2)
				{
					specImage = new Image(SpecGFX.SpecChooserNecro);
				}
			}
			if (_class == Warrior.GFX_SELECT)
			{
				trace("blah");
				if (i == 0)
				{
					specImage = new Image(SpecGFX.SpecChooserGuard);
					trace("blah");
				}
				if (i == 1)
				{
					specImage = new Image(SpecGFX.SpecChooserPaladin);
				}
				if (i == 2)
				{
					specImage = new Image(SpecGFX.SpecChooserKnight);
				}
			}
			if (_class == Rogue.GFX_SELECT)
			{
				if (i == 0)
				{
					specImage = new Image(SpecGFX.SpecChooserRogue);
				}
				if (i == 1)
				{
					specImage = new Image(SpecGFX.SpecChooserHunter);
				}
				if (i == 2)
				{
					specImage = new Image(SpecGFX.SpecChooserAssassin);
				}
			}
			
			if (specImage == null)
			{
				specImage = new Image(SpecGFX.SpecChooserElement);
			}
			
			graphicList = new Graphiclist(specChooserBG, specImage);
			graphicHover= new Graphiclist(specChooserBGHover, specImage);
			graphic = graphicList;
			
			this.x = FP.screen.width - 60;
			this.y = FP.screen.height / 4 * i + 60;
			setHitboxTo(specImage);
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
					if (isHover == false) {graphic = graphicHover; trace("changed to hover true");}
					isHover = true;
					
					if (Input.mousePressed) //on mouseclick
					{
						//onPress(); //call onpress function which is over-riden by classes which extend this.
					}
				}
				else 
				{
					//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
					if (isHover == true) {graphic = graphicList; trace("changed to hover false");}
					isHover = false;
				}
			}
		}
		
	}

}

		
