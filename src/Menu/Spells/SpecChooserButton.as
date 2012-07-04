package Menu.Spells 
{
	import GameWorld.Characters.Heroes.*;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.*;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpecChooserButton extends Entity 
	{
		protected var specChooserBG:Image;
		protected var specImage:Image;
		protected var graphicList:Graphiclist;
		protected var isHover:Boolean;
		protected var xpos:int;
		protected var ypos:int;
		
		public function SpecChooserButton(i:int, _class:Class)
		{
			specChooserBG = new Image(SpecGFX.SpecChooserBG);
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
			graphic = graphicList;
			
			this.x = FP.screen.width - 60;
			this.y = FP.screen.height / 4 * i + 60;
		}
		
	}

}

		
