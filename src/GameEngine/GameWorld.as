package GameEngine 
{
	import GameEngine.*;
	import GameEngine.Characters.DummyEnemy;
	import GameEngine.Characters.Enemies.EnemyData;
	import GameEngine.Characters.Enemy;
	import GameEngine.Characters.FriendlyHero;
	import GameEngine.Characters.Hero;
	import GameEngine.Characters.Heroes.Mage;
	import GameEngine.Characters.Heroes.Rogue;
	import GameEngine.Characters.Heroes.Warrior;
	import GameEngine.Controllers.NetworkController;
	import GameEngine.Controllers.PlayerInputController;
	import GameEngine.HUD.ActionBar.SpellButton;
	import GameEngine.HUD.AwaitingPlayers;
	import GameEngine.HUD.CastBar.CastBar;
	import GameEngine.HUD.LatencyDisplay;
	import GameEngine.HUD.Logs.ChatFrame;
	import GameEngine.HUD.UnitFrame.PlayerFrame;
	import GameEngine.HUD.UnitFrame.TargetFrame;
	import GameEngine.Levels.Level;
	import GameEngine.Spells.BaseSpell;
	import GameEngine.Spells.SpellData;
	import net.flashpunk.utils.Input;
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
		public var enemyArray:Array = new Array; //stores an array of spawned enemies, this creates id for index when spawned in SpawnEnemy.
		public var enemyCount:int = 0; //counts enemies for enemyArray index
		
		public var playerHero:Hero;
		
		public var castBar:CastBar;
		
		public var chatFrame:ChatFrame;
		public var targetFrame:TargetFrame;
		
		public var loadedLevel:Level = new Level(GC.TILEMAP_TEST_LEVEL_2);//choose what tilemap to use for the level
		
		public var isHost:Boolean = false; //if true, this game world is the host
		
		public var worldStatus:int = 0; //0 = waiting for players, 1 = game world started, 2 = game world finished
		
		
		
		private var awaitingPlayersDialog:AwaitingPlayers;
		
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
			targetFrame = new TargetFrame();
			add (targetFrame);
			
			//spawn level
			add (loadedLevel);
			//spawn hero
			SpawnPlayer(UserCharacter.charClass);
			
			
			//spawn latency display
			add (new LatencyDisplay(networkController));
			
			awaitingPlayersDialog = new AwaitingPlayers(this);
			add (awaitingPlayersDialog);
			
			
		}
		
		public function StartLevel():void //this is called by awaiting players
		{
			if (worldStatus == 0)
			{
				networkController.SendStartLevel();
			}
			else
			{
				remove (awaitingPlayersDialog);
				//spawn enemy (testing)
				if (isHost)
				{
					
					SpawnEnemy(1);
				}
			}
			
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
								if (playerHero.target == null)
								{
									//do nothing
									trace("player has no target");
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
		}
		
		public function CastSpellFinished(_passedSpell:BaseSpell):void
		{
			if (playerHero.target == null)
			{
				//do nothing
				trace("player has no target");
			}
			else
			{
			trace (_passedSpell.SPELL_NAME, "hits for", _passedSpell.spellDamage, "on", playerHero.target.unitName, "with id", playerHero.target.unitID);
			playerHero.target.DealDamage(_passedSpell.spellDamage, playerHero.heroID);
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
		
		public function SpawnEnemy(_enemyID:int):void
		{
			var enemyData:EnemyData = new EnemyData
			
			var enemyToSpawn:Enemy = new Enemy(this, enemyData.loadData(_enemyID))
			enemyArray[enemyCount] = enemyToSpawn;
			enemyToSpawn.unitID = enemyCount;
			add (enemyToSpawn);
			
			networkController.sendEnemySpawn(_enemyID);
			enemyCount++;
		}
		
		public function DealDamageToEnemy(_unitID:int, _damage:int, _fromID:int):void
		{
			if (isHost)
			{
				var enemyToDealDamage:Enemy = enemyArray[_unitID];
				enemyToDealDamage.health -= _damage;
				trace (_damage, "damage dealt to", enemyToDealDamage.unitName, "with id", _unitID);
				enemyToDealDamage.threatIndex[_fromID] += _damage;
				trace ("threat increased by", _damage, "for player", _fromID);
			}
			else
			{
				var dummyEnemyToDealDamage:DummyEnemy = enemyArray[_unitID];
				dummyEnemyToDealDamage.health -= _damage;
				trace (_damage, "damage dealt to DUMMY-", dummyEnemyToDealDamage.unitName, "with id", _unitID);
			}
			
			if (playerHero.target == null)
			{
				//do nothing
			}
			else
			{
				if (playerHero.target.unitID == _unitID)
				{
					targetFrame.setTarget(playerHero.target);
				}
			}
		}
		
		public function SpawnDummyEnemy(_enemyID:int):void
		{
			if (isHost)
			{
				//do nothing
			}
			else
			{
				var enemyData:EnemyData = new EnemyData
				var enemyToSpawn:DummyEnemy = new DummyEnemy(this, enemyData.loadData(_enemyID));
				
				enemyArray[enemyCount] = enemyToSpawn;
				enemyToSpawn.unitID = enemyCount;
				add (enemyToSpawn);
				
			}
		}
		
		public function updateCamera():void
		{
			if (playerHero.x < FP.halfWidth || playerHero.x > (loadedLevel.levelWidth - FP.halfWidth)) {}
			else {FP.camera.x = playerHero.x + playerHero.halfWidth - FP.halfWidth;}
			if (playerHero.y < FP.halfHeight || playerHero.y > (loadedLevel.levelHeight - FP.halfHeight)) { }
			else {FP.camera.y = playerHero.y - FP.halfHeight;}
		}
		
		public function userInitialized():void //once the player id and everything has been set (ready for network communications)
		{
			
		}
	}

}