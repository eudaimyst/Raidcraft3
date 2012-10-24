package Menu.Spells 
{
	import GameEngine.Spells.BaseSpell;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellHolder extends Entity 
	{
		[Embed(source = "../../../assets/spells/spell_button_empty.png")]
		public static const emptySpellHolderGFX:Class;
		[Embed(source = "../../../assets/spells/spell_button_normal.png")]
		public static const filledSpellHolderGFX:Class;
		
		protected var text:Text;
		protected var buttonBG:Image;
		protected var graphicList:Graphiclist;
		public var actionBarNum:int;
		protected var spellID:int;
		protected var isHover:Boolean;
		
		public var hasSpell:Boolean; //set to true when this spell holder is holding a spell;
		
		protected var keyText:String;
		
		public function SpellHolder(_actionBarNum:int) 
		{
			actionBarNum = _actionBarNum;
			
			trace("added spell button");
			buttonBG = new Image(emptySpellHolderGFX);
			buttonBG.scale = 2;
			graphicList = new Graphiclist(buttonBG);
			
			graphic = Graphiclist(graphicList);
			
			this.x = (buttonBG.scaledWidth + 5) * actionBarNum + 20;
			this.y = FP.screen.height - (buttonBG.scaledHeight + 20);
			setHitbox(buttonBG.scaledWidth, buttonBG.scaledHeight);
			
			type = "spellHolder";
		}
		
		public function SetSpell(_passedSpell:BaseSpell):void
		{
			hasSpell = true;
			trace(_passedSpell.SPELL_NAME, "added to holder #" + actionBarNum);
		}
		
		public function RemoveSpell():void
		{
			hasSpell = false;
			trace("spell removed from holder #" + actionBarNum);
		}
		
	}

}