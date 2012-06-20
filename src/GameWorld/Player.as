package GameWorld 
{
	import GameWorld.Characters.Hero;
	import GameWorld.Controllers.UnitController;
	import net.flashpunk.FP
	import net.flashpunk.World;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Player 
	{
		public var selectedChar:Class;
		public var controller:UnitController;
		public var playerHero:Hero;
		public var currentWorld:World
		
		public function Player(_hero:Class, _currentWorld:World = null) 
		{
			selectedChar = _hero;
			playerHero = new Hero(this);
			controller = new UnitController;
		}
		
		public function SpawnPlayer():void
		{
			
		}
		
	}

}