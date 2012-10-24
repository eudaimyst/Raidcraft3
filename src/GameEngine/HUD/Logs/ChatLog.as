package GameEngine.HUD.Logs 
{
	import GameEngine.HUD.HUDElement;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ChatLog extends HUDElement 
	{
		protected var background:Image;
		protected var inputBackground:Image;
		
		protected var graphicList:Graphiclist;
		
		public function ChatLog() 
		{
			background = Image.createRect(320, 140, 0x000000, .3)
			background.x = 20;
			background.y = FP.height - 230;
			
			inputBackground = Image.createRect(310, 25, 0x000000, .4)
			inputBackground.x = 25;
			inputBackground.y = FP.height - 120;
			
			graphicList = new Graphiclist(background, inputBackground);
			
			graphic = graphicList;
			
		}
		
	}

}