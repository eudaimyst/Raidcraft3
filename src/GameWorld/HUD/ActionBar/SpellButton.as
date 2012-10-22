package GameWorld.HUD.ActionBar 
{
	import GameWorld.HUD.HUDElement;
	import GameWorld.Spells.BaseSpell;
	import GameWorld.Spells.SpellData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellButton extends HUDElement 
	{
		[Embed(source = '../../../../assets/spells/spell_button_normal.png')]
		public static const spellButtonGFX:Class;
		protected var text:Text;
		protected var spellIcon:Image;
		protected var buttonBG:Image;
		protected var graphicList:Graphiclist;
		protected var actionBarNum:int;
		protected var spellID:int;
		protected var isHover:Boolean;
		protected var spell:BaseSpell;
		
		protected var keyText:String;
		
		public function SpellButton(_passedSpell:BaseSpell, _actionbarNum:int = 0) 
		{
			spell = _passedSpell;
			actionBarNum = _actionbarNum;
			trace("loading spell data");
			spellIcon = new Image(spell.SPELL_ICON);
			spellIcon.scale = 2;
			
			
			trace("added spell button");
			buttonBG = new Image(spellButtonGFX);
			buttonBG.scale = 2;
			graphicList = new Graphiclist(buttonBG, spellIcon);
			
			
			graphic = Graphiclist(graphicList);
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			
			this.x = (buttonBG.scaledWidth + 5) * actionBarNum + 20;
			this.y = FP.screen.height - (buttonBG.scaledHeight + 20);
			
		}
		
	}

}