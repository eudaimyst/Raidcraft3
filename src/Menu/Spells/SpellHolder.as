package Menu.Spells 
{
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
		protected var actionBarNum:int;
		protected var spellID:int;
		protected var isHover:Boolean;
		
		protected var keyText:String;
		
		public function SpellHolder(actionBarNum:int) 
		{
			trace("added spell button");
			buttonBG = new Image(emptySpellHolderGFX);
			buttonBG.scale = 2;
			graphicList = new Graphiclist(buttonBG);
			
			graphic = Graphiclist(graphicList);
			
			this.x = (buttonBG.scaledWidth + 5) * actionBarNum + 20;
			this.y = FP.screen.height - (buttonBG.scaledHeight + 20);
			
			type = "spellHolder";
		}
		
	}

}