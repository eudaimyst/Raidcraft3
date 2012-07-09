package Menu.Spells 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpecChooserBG extends Entity 
	{
		public var bgImage:Image;
		
		
		public function SpecChooserBG(i:Number) 
		{
			
			bgImage = Image.createRect(FP.screen.width - FP.screen.width / 5, FP.screen.height / 8, 0xffffff, 1);
			bgImage.alpha = .4;
			
			graphic = new Graphiclist(bgImage);
			
			this.y = FP.screen.height / 6 * i + FP.screen.height/6;
			this.x = FP.screen.width / 20;
			
		}
		
	}

}