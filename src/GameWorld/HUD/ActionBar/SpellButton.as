package GameWorld.HUD.ActionBar 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
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
			graphicList = new Graphiclist(buttonBG);
			
			graphic = Graphiclist(graphicList);
			
			this.x = (buttonBG.width + 4) * actionBarNum;
			this.y = 200;
		}
		
	}

}