package GameWorld.HUD.ActionBar 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellButton extends Entity 
	{
		[Embed(source = '../../../../assets/spells/spell_button_normal.png')]
		public static const spellButtonGFX:Class;
		protected var text:Text;
		protected var buttonBG:Image;
		protected var graphicList:Graphiclist;
		protected var actionBarNum:int;
		protected var spellID:int;
		protected var isHover:Boolean;
		
		protected var keyText:String;
		
		public function SpellButton(actionBarNum:int, spellID:int = 0) 
		{
			trace("added spell button");
			buttonBG = new Image(spellButtonGFX);
			buttonBG.scale = 2;
			graphicList = new Graphiclist(buttonBG);
			
			graphic = Graphiclist(graphicList);
			
			this.x = (buttonBG.scaledWidth + 5) * actionBarNum + 20;
			this.y = FP.screen.height - (buttonBG.scaledHeight + 20);
			
		}
		
	}

}