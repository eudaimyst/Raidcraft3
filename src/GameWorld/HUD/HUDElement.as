package GameWorld.HUD 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HUDElement extends Entity 
	{
		
		public function HUDElement() 
		{

		}
		
		override public function added():void
		{
			super.added();
			layer = -9000; //the higher the number the lower the object
			
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
	}

}