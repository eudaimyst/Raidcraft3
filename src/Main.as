package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import GameWorld.Characters.Heroes.Mage;
	import Menu.MainMenu;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import PlayerIoTest.HelloWorld;
	import splash.SplashWorld;
	/**
	 * ...
	 * @author skipgamer
	 */
	//[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{
		public var gameWorld:World;
		
		public function Main():void 
		{
			trace("engine loaded");
			trace(Mage.mageSpells);
			super(800, 600, 60, false);
			setWorld(new MainMenu);
			//FP.console.enable();
		}
		
		public function setWorld(_world:World):void
		{
			gameWorld = _world;
			FP.world = gameWorld;
		}

		override public function init():void
		{
			super.init();
			trace("main initialisation");
			
		}

	}

}