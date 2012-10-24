package GameEngine.HUD.CastBar 
{
	import GameEngine.HUD.ActionBar.SpellButton;
	import GameEngine.HUD.HUDElement;
	import GameEngine.Spells.BaseSpell;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author ...
	 */
	public class CastBar extends HUDElement
	{
		protected var passedSpell:BaseSpell;
		protected var spellButton:SpellButton;
		
		protected var currentCastBar:Image;
		protected var maxCastBar:Image;
		protected var spellName:Text;
		protected var castTime:Text;
		
		protected var graphiclist:Graphiclist;
		
		protected var elapsedTime:Number = 0;
		
		public function CastBar(_passedSpell:BaseSpell, _passedSpellButton:SpellButton) 
		{
			passedSpell = _passedSpell;
			spellButton = _passedSpellButton;
			
			trace("castBar loaded")
			maxCastBar = Image.createRect(300, 40, 0x111111, 1);
			currentCastBar = Image.createRect(300, 40, 0xbbbbbb, 1);
			spellName = new Text(String(_passedSpell.SPELL_NAME), 20, 10);
			castTime = new Text(String(_passedSpell.spellCastTime), 150, 10);
			
			graphiclist = new Graphiclist(maxCastBar, currentCastBar, spellName, castTime);
			
			graphic = graphiclist;
			
			x = FP.halfWidth - 150;
			y = FP.height / 3 * 2;
			//trace("castbarX", x, "castbarY", y);
			
		}
		
		override public function update():void
		{
			super.update();
			
			elapsedTime += FP.elapsed;
			currentCastBar.scaleX = elapsedTime / passedSpell.spellCastTime;
			graphic.update();
			
			if (elapsedTime >= passedSpell.spellCastTime)
			{
				spellButton.gameWorld.playerHero.isCasting = false;
				spellButton.playCooldown();
				FP.world.remove(this);
			}
		}
		
		public function CancelCast():void
		{
			FP.world.remove(this);
		}
		
	}

}