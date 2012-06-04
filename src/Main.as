package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Menu.MainMenu;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import splash.SplashWorld;
	/**
	 * ...
	 * @author skipgamer
	 */
	//[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{

		public function Main():void 
		{
			trace("engine loaded");
			super(800, 600, 60, false);
			FP.world = new MainMenu;
			FP.console.enable();
		}

		override public function init():void
		{
			super.init();
			trace("main initialisation");
			
		}

	}

}