package Menu.Character 
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CharacterBox extends Entity 
	{
		protected var boxBg:Image;
		protected var charIcon:Image;
		protected var graphiclist:Graphiclist;
		protected var charName:TextEvent;
		
		public function CharacterBox(_charNum:int) 
		{
			boxBg = Image.createRect(FP.screen.width - FP.screen.width / 2, FP.screen.height / 8 - FP.screen.height / 50, 0x000000, 1);
			boxBg.x = FP.screen.width / 12;
			boxBg.y = FP.screen.height / 8 * (_charNum + 1);
			charIcon = new Image(GC.GFX_SELECT_MAGE);
			charIcon.y = boxBg.y + (boxBg.height - charIcon.height) / 2;
			charIcon.x = boxBg.x;
			
			graphiclist = new Graphiclist(boxBg, charIcon);
			
			graphic = graphiclist
			
		}
		
	}

}