package GameWorld 
{
	import GameWorld.Characters.Hero;
	import GameWorld.Characters.Unit;
	import GameWorld.Controllers.PlayerInputController;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Level extends World 
	{
		public var playerInputController:PlayerInputController = new PlayerInputController;
		
		public function Level(_char:Class) 
		{
			add (new MouseCursorEntity());
			
			SpawnPlayer(_char);
		}
		
		public function SpawnPlayer(_char:Class):void
		{
			add (playerInputController);
			add (new Hero(playerInputController, _char));
		}
		
		
		
	}

}