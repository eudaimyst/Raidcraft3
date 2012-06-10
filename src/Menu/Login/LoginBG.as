package Menu.Login 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LoginBG extends Entity 
	{
		protected var boxBg:Image;
		
		public function LoginBG() 
		{
			boxBg = Image.createRect(400, 150, 0x111111, .8);
			boxBg.x = 20;
			boxBg.y = 20;
			
			graphic = new Graphiclist(boxBg);
		}
		
	}

}