package Menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class TitleGraphic extends Entity 
	{
		
		public function TitleGraphic()
		{
			super(x, y);
			
			trace("Title Image Drawn");
			graphic = new Image(GC.GFX_TITLE);
			this.setHitbox(307, 41);
			Image(this.graphic).scaleX = 2;
			Image(this.graphic).scaleY = 2;
			
			
			x = FP.screen.width / 2 - Image(this.graphic).scaledWidth / 2;
			y = FP.screen.height * .15;
		}
		
	}

}