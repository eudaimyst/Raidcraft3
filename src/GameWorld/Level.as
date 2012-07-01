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
		public var friendlyPlayerArray:Array = new Array; //stores an array of friendly players, with player.io player.id 's as indexes.
		
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
			add (new Hero(playerInputController, networkController, _char));
		}
		
		public function SpawnFriendlyPlayer(_userid:int, _char:int = 0, _origX:int = 0, _origY:int = 0):void
		{
			if (friendlyPlayerArray[_userid] == null) //if there is no friendly player already for this userid
			{
				friendlyPlayerArray[_userid] = new FriendlyHero(networkController, _userid, _char);
				add (friendlyPlayerArray[_userid]);
				var friendlyPlayer:FriendlyHero = friendlyPlayerArray[_userid];
				friendlyPlayer.MoveToLocation(_origX, _origY);
			}
			else
			{
				trace("friendlyPlayer for this userid is already spawned");
			}
		}
		
		public function Test():void
		{
			trace("test function in level");
		}
		
	}

}