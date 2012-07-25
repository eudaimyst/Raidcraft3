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
	public class SpecChooserButton extends Entity 
	{
		protected var specChooserBG:Image;
		protected var specChooserBGHover:Image;
		protected var specImage:Image;
		protected var graphicList:Graphiclist;
		protected var graphicHover:Graphiclist;
		protected var isHover:Boolean;
		protected var xpos:int;
		protected var ypos:int;
		protected var spellChooserWorld:SpellChooserWorld;
		protected var chosenSpec:int;
		
		public function SpecChooserButton(i:int, _class:Class, _world:SpellChooserWorld)
		{
			spellChooserWorld = _world;
			specChooserBG = new Image(SpecGFX.SpecChooserBG);
			specChooserBGHover = new Image(SpecGFX.SpecChooserBGHover);
			trace(String(i));
			trace(String(_class));
			
			if (_class == Mage.GFX_SELECT)
			{
				if (i == 0)
				{
					specImage = new Image(SpecGFX.SpecChooserElement);
					chosenSpec = 1;
				}
				if (i == 1)
				{
					specImage = new Image(SpecGFX.SpecChooserHoly);
					chosenSpec = 2;
				}
				if (i == 2)
				{
					specImage = new Image(SpecGFX.SpecChooserNecro);
					chosenSpec = 3;
				}
			}
			if (_class == Warrior.GFX_SELECT)
			{
				trace("blah");
				if (i == 0)
				{
					specImage = new Image(SpecGFX.SpecChooserGuard);
					chosenSpec = 4;
				}
				if (i == 1)
				{
					specImage = new Image(SpecGFX.SpecChooserPaladin);
					chosenSpec = 5;
				}
				if (i == 2)
				{
					specImage = new Image(SpecGFX.SpecChooserKnight);
					chosenSpec = 6;
				}
			}
			if (_class == Rogue.GFX_SELECT)
			{
				if (i == 0)
				{
					specImage = new Image(SpecGFX.SpecChooserRogue);
					chosenSpec = 7;
				}
				if (i == 1)
				{
					specImage = new Image(SpecGFX.SpecChooserHunter);
					chosenSpec = 8;
				}
				if (i == 2)
				{
					specImage = new Image(SpecGFX.SpecChooserAssassin);
					chosenSpec = 9;
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
						spellChooserWorld.refreshChoosers(chosenSpec);
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

		
