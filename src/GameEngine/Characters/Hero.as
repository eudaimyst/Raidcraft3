package GameEngine.Characters 
{
	import GameEngine.Characters.Heroes.*;
	import GameEngine.Controllers.NetworkController;
	import GameEngine.Controllers.PlayerInputController;
	import GameEngine.GameWorld;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import user.UserCharacter;
	import user.UserVariables;

	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Hero extends Unit  
	{
		public var playerInputController:PlayerInputController;
		public var networkController:NetworkController;
		public var gameWorld:GameWorld;
		public var char:Class;
		public var heroID:int;
		
		public var target:Unit;
		
		public function Hero(_playerInputController:PlayerInputController, _networkController:NetworkController, _char:Class, _gameWorld:GameWorld, _spawnLocationX:Array, _spawnlocationY:Array) 
		{
			playerInputController = _playerInputController;
			networkController = _networkController;
			char = _char;
			gameWorld = _gameWorld;
			
			isHero = true;
			
			// TODO: blah
			
			if (UserCharacter.charClass == Mage)
			{
				unitSprite = new Spritemap(Mage.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
				health = 400;
				maxHealth = 400;
				power = 1200;
				maxPower = 1200;
			}
			
			if (UserCharacter.charClass == Warrior)
			{
				unitSprite = new Spritemap(Warrior.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WARRIOR, 40, 60);
				health = 1200;
				maxHealth = 1200;
				power = 400;
				maxPower = 400;
			}
			
			if (UserCharacter.charClass == Rogue)
			{
				unitSprite = new Spritemap(Rogue.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WANDERER, 40, 60);
				health = 600;
				maxHealth = 600;
				power = 600;
				maxPower = 600;
				
			}
			
			SpriteMap();
			
			playerInputController.setHero(this);
			networkController.setHero(this);
			x = _spawnLocationX[1];
			y = _spawnlocationY[1];
			
			setHitboxTo(unitSprite);
		}
		
		public function setTarget(_passedUnit:Unit):void
		{
			trace("target set to", _passedUnit.unitName);
			target = _passedUnit;
		}
		
		public function setClass():void
		{
			networkController.setName();
			if (char == Mage)
			{
				networkController.setClass(1);
			}
			if (char == Warrior)
			{
				networkController.setClass(2);
			}
			if (char == Rogue)
			{
				networkController.setClass(3);
			}
			
		}
		
		public function stopMovement():void
		{
			RecieveStopWalk();
			networkController.sendStopWalkMessage(5);
		}
		
		public function updateUserID(_userid:uint):void
		{
			heroID = _userid;
			x = gameWorld.loadedLevel.playerSpawnLocationsX[networkController.userID];
			y = gameWorld.loadedLevel.playerSpawnLocationsY[networkController.userID];
			gameWorld.updateCamera();
			if (_userid == 1)
			{
				gameWorld.isHost = true;
			}
			gameWorld.userInitialized();
		}
		
		override public function UnitNotMoving():void
		{
			networkController.sendLocationUpdate(x, y);
		}
		
	}

}