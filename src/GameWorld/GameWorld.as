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
		public var walkUp:Boolean;
		public var walkDown:Boolean;
		public var walkLeft:Boolean;
		public var walkRight:Boolean;
		
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
			playerHero = new Hero(playerInputController, networkController, UserCharacter.charClass, this)
			add (playerHero);
			add (new PlayerFrame(playerHero));
			FP.camera.x -= FP.halfWidth;
			FP.camera.y -= FP.halfHeight;
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
		
		public function RecieveInput(_direction:String = "", _action:int = 0):void
		{
			trace("input recieved");
			
			if (_action == 1)
			{
				if (_direction == "Down")
				{
					walkDown = true;
				}
				if (_direction == "Right")
				{
					walkRight = true;
				}
				if (_direction == "Left")
				{
					walkLeft = true;
				}
				if (_direction == "Up")
				{
					walkUp = true;
				}
			}
			if (_action == 2)
			{
				if (_direction == "Down")
				{
					walkDown = false;
				}
				if (_direction == "Right")
				{
					walkRight = false;
				}
				if (_direction == "Left")
				{
					walkLeft = false;
				}
				if (_direction == "Up")
				{
					walkUp = false;
				}
			}
		}
		
		override public function update():void
		{
			if (walkUp && !walkLeft && !walkRight && !walkDown) //up
			{
				FP.camera.y -= 1;
			}
			if (walkDown && !walkLeft && !walkRight && !walkUp) //down
			{
				FP.camera.y += 1;
			}
			if (walkLeft && !walkUp && !walkDown && !walkRight) //left
			{
				FP.camera.x -= 1;
			}
			if (walkRight && !walkUp && !walkDown && !walkLeft) //right
			{
				FP.camera.x += 1;
			}
			if (walkUp && walkLeft && !walkRight && !walkDown) //upleft
			{
				FP.camera.y -= .7;
				FP.camera.x -= .7;
			}
			if (walkUp && walkRight && !walkLeft && !walkDown) //upright
			{
				FP.camera.y -= .7;
				FP.camera.x += .7;
			}
			if (walkDown && walkLeft && !walkRight && !walkUp) //downleft
			{
				FP.camera.y += .7;
				FP.camera.x -= .7;
			}
			if (walkDown && walkRight && !walkLeft && !walkUp) //downright
			{
				FP.camera.y += .7;
				FP.camera.x += .7;
			}
			super.update()
		}
		
		
	}

}