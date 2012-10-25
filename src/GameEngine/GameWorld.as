package GameEngine 
{
	import GameEngine.*;
	import GameEngine.Characters.FriendlyHero;
	import GameEngine.Characters.Hero;
	import GameEngine.Characters.Heroes.Mage;
	import GameEngine.Characters.Heroes.Rogue;
	import GameEngine.Characters.Heroes.Warrior;
	import GameEngine.Controllers.NetworkController;
	import GameEngine.Controllers.PlayerInputController;
	import GameEngine.HUD.ActionBar.SpellButton;
	import GameEngine.HUD.CastBar.CastBar;
	import GameEngine.HUD.LatencyDisplay;
	import GameEngine.HUD.Logs.ChatFrame;
	import GameEngine.HUD.UnitFrame.PlayerFrame;
	import GameEngine.Levels.Level;
	import GameEngine.Spells.BaseSpell;
	import GameEngine.Spells.SpellData;
	import net.flashpunk.World;
	import user.UserCharacter;
	import net.flashpunk.FP;
	
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
		
		public var castBar:CastBar;
		
		public var chatFrame:ChatFrame;
		
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
				if (_char == Mage) spellButtons[i] = new SpellButton(getSpellData.loadData(0 + i), i, this);
				if (_char == Rogue) spellButtons[i] = new SpellButton(getSpellData.loadData(120 + i), i, this);
				if (_char == Warrior) spellButtons[i] = new SpellButton(getSpellData.loadData(60 + i), i, this);
				add (spellButtons[i]);
				i++; 
			}
			
			//spawn chatlog
			chatFrame = new ChatFrame(this);
			add (chatFrame);
			//spawn latency display
			add (new LatencyDisplay(networkController));
			//spawn level
			add (loadedLevel);
			//spawn hero
			SpawnPlayer(UserCharacter.charClass);
			
		}
		
		public function CancelCast():void
		{
			if (playerHero.isCasting)
			{
				playerHero.isCasting = false;
				castBar.CancelCast();
			}
		}
		
		public function CastSpell(_spellButtonID:int):void
		{
			var spellButton:SpellButton = spellButtons[_spellButtonID]; //
			var loadedSpell:BaseSpell = spellButton.spell;
			if (loadedSpell.spellCastTime > 0)
			{
				if (playerHero.isMoving == true)
				{
					//do nothing
					trace("player is moving");
				}
				else
				{
					if (spellButton.onCooldown)
					{
						//do nothing
						trace("spell is on cooldown");
					}
					else
					{
						if (spellButton.onGCD)
						{
							//do nothing
							trace("GCD");
						}
						else
						{
							if (playerHero.isCasting)
							{
								//do nothing
								trace("already casting");
							}
							else
							{
								playerHero.isCasting = true;
								spellButton.onPress();
								castBar = new CastBar(loadedSpell, spellButton);
								add (castBar);
							}
						}
					}
				}
			}
		}
		
		public function StartGCD():void
		{
			var i:Number = 0; 
			while (i <= 7)
			{
				var tempSpellButton:SpellButton = spellButtons[i];//used for setting all spell buttons on cooldown
				tempSpellButton.playGCD();
				i++; 
			}
		}
		
		public function SpawnPlayer(_char:Class):void
		{
			add (playerInputController);
			playerHero = new Hero(playerInputController, networkController, UserCharacter.charClass, this, loadedLevel.playerSpawnLocationsX, loadedLevel.playerSpawnLocationsY)
			add (playerHero);
			add (new PlayerFrame(playerHero));
		}
		
		public function SpawnFriendlyPlayer(_userid:int, _char:int = 0, _origX:int = 0, _origY:int = 0, _name:String = ""):void //called by network controller
		{
			if (friendlyPlayerArray[_userid] == null) //if there is no friendly player already for this userid
			{
				friendlyPlayerArray[_userid] = new FriendlyHero(networkController, _userid, _char, _name);
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
			else {FP.camera.x = playerHero.x + playerHero.halfWidth - FP.halfWidth;}
			if (playerHero.y < FP.halfHeight || playerHero.y > (loadedLevel.levelHeight - FP.halfHeight)) { }
			else {FP.camera.y = playerHero.y - FP.halfHeight;}
		}
		
		
	}

}