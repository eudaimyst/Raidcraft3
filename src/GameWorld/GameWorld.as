package GameWorld 
{
	import GameWorld.Characters.FriendlyHero;
	import GameWorld.Characters.Hero;
	import GameWorld.Characters.Unit;
	import GameWorld.Controllers.NetworkController;
	import GameWorld.Controllers.PlayerInputController;
	import GameWorld.HUD.ActionBar.ActionBar;
	import GameWorld.HUD.ActionBar.SpellButton;
	import GameWorld.HUD.UnitFrame.PlayerFrame;
	import GameWorld.Spells.SpellData;
	import GameWorld.Levels.Level;
	import net.flashpunk.World;
	import user.UserCharacter;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class GameWorld extends World 
	{	
		public var playerInputController:PlayerInputController = new PlayerInputController;
		public var networkController:NetworkController;
		public var friendlyPlayerArray:Array = new Array; //stores an array of friendly players, with player.io player.id 's as indexes.
		public var spellButtons:Array = new Array;
		public var playerHero:Hero;
		
		public var loadedLevel:Level = new Level(GC.TILEMAP_TEST_LEVEL_2);//choose what tilemap to use for the level
		
		public function GameWorld(_char:Class, _networkController:NetworkController, _roomName:String) 
		{
			networkController = _networkController;
			networkController.joinRaid(_roomName);
			networkController.setGameWorld(this);
			
			add (new MouseCursorEntity());
			
			//spawn spell buttons
			var i:Number = 0; 
			while (i <= 7)
			{
				var spellID:Number = i;
				var getSpellData:SpellData = new SpellData;
				
				spellButtons[i] = new SpellButton(getSpellData.loadData(i), i);
				add (spellButtons[i]);
				i++; 
			}
			
			add (loadedLevel);
			
			SpawnPlayer(UserCharacter.charClass);
			
		}
		
		public function SpawnPlayer(_char:Class):void
		{
			add (playerInputController);
			playerHero = new Hero(playerInputController, networkController, UserCharacter.charClass, this, loadedLevel.playerSpawnLocationsX, loadedLevel.playerSpawnLocationsY)
			add (playerHero);
			add (new PlayerFrame(playerHero));
		}
		
		public function SpawnFriendlyPlayer(_userid:int, _char:int = 0, _origX:int = 0, _origY:int = 0):void //called by network controller
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
		
		public function updateCamera():void
		{
			if (playerHero.x < FP.halfWidth || playerHero.x > (loadedLevel.levelWidth - FP.halfWidth)) {}
			else {FP.camera.x = playerHero.x - FP.halfWidth;}
			if (playerHero.y < FP.halfHeight || playerHero.y > (loadedLevel.levelHeight - FP.halfHeight)) { }
			else {FP.camera.y = playerHero.y - FP.halfHeight;}
		}
		
		
	}

}