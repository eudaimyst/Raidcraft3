package GameWorld 
{
	import GameWorld.Characters.FriendlyHero;
	import GameWorld.Characters.Hero;
	import GameWorld.Characters.Unit;
	import GameWorld.Controllers.NetworkController;
	import GameWorld.Controllers.PlayerInputController;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Level extends World 
	{
		public var playerInputController:PlayerInputController = new PlayerInputController;
		public var networkController:NetworkController;
		
		public function Level(_char:Class, _networkController:NetworkController, _roomName:String) 
		{
			networkController = _networkController;
			networkController.joinRaid(_roomName);
			networkController.setLevel(this);
			
			add (new MouseCursorEntity());
			
			SpawnPlayer(_char);
		}
		
		public function SpawnPlayer(_char:Class):void
		{
			add (playerInputController);
			add (new Hero(playerInputController, _char));
		}
		
		public function SpawnFriendlyPlayer(_char:Class = null):void
		{
			add (new FriendlyHero());
		}
		
		
		
	}

}