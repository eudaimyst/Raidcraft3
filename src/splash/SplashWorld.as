package splash 
{
	import flash.ui.MouseCursor;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import splash.Splash;
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SplashWorld extends World 
	{
		public function SplashWorld():void
		{
			super(); //not sure what this does, but it needs to be here.
			
			add (new Splash());
			
			trace ("Splash loaded");
			
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		
	}

}