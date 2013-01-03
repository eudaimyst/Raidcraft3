package GameEngine.HUD 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUDElementNoScroll extends Entity 
	{
		
		public function HUDElementNoScroll() 
		{

		}
		
		override public function added():void
		{
			
			layer = -9000; //the higher the number the lower the object
			
			
			
			super.added();
		}
		
		override public function render():void
		{
			
			x = FP.camera.x;
			y = FP.camera.y;
			super.render();
		}
	}

}