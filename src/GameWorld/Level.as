package GameWorld 
{
	import GameWorld.Characters.Hero;
	import GameWorld.Characters.Unit;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Level extends World 
	{
		public var playerClass:Player;
		
		public function Level(_player:Player) 
		{
			add (new MouseCursorEntity());
			
			playerClass = _player;
			playerClass.currentWorld = this;
			SpawnPlayer();
		}
		
		public function SpawnPlayer():void
		{
			add (new Hero(playerClass));
		}
		
		
		
	}

}