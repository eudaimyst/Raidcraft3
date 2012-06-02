package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;

	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MouseFlash extends Entity 
	{
		protected var mouseFlash:Image;
		private var i:int = 0;
		
		public function MouseFlash() 
		{
			trace ("mouse press function called");
			mouseFlash = new Image(GC.GFX_MOUSE_FLASH);

			graphic = mouseFlash;
			mouseFlash.scale = 2;
			this.x = Input.mouseX - mouseFlash.scaledWidth / 2;
			this.y = Input.mouseY - mouseFlash.scaledHeight / 2;
			graphic.scrollX = 0; //locks this entities graphic to camera
			graphic.scrollY = 0;
			this.layer = -3;
			
			
		}
		
		override public function update():void 
		{
			super.update();
			i++;
			//on each fame remove 10% alpha
			mouseFlash.alpha -= .1
			
			//after 10 frames (the alpha runs out) remove this entity
			if (i > 10)
			{
				this.world.remove(this);
			}
		}
		
	}

}