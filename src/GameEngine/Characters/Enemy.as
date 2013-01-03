package GameEngine.Characters 
{
	import GameEngine.Characters.Enemies.BaseEnemy;
	import GameEngine.Controllers.AIController;
	import GameEngine.GameWorld;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Enemy extends Unit 
	{
		public var aiController:AIController;
		public var gameWorld:GameWorld;
		public var threatIndex:Array;
		
		public function Enemy(_gameWorld:GameWorld, _baseEnemy:BaseEnemy) 
		{
			gameWorld = _gameWorld;
			aiController = new AIController(this);
			aiController.spawnedState();
			
			unitSprite = _baseEnemy.spritemap;
			
			unitName = _baseEnemy.unitName;
			
			maxHealth = _baseEnemy.maxHealth;
			health = maxHealth;
			
			maxPower = _baseEnemy.maxPower
			power = maxPower;
			
			threatIndex = new Array();
			
			SpriteMap();
			
			x = 800;
			y = 200;
			layer = -200;
			setHitboxTo(unitSprite);
			trace("**********");
			trace("EnemyAdded: " + unitName);
			trace("**********");
			type = "enemy";
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
			{
				if (this.collide("mouse collision", x, y))
				{
				//trace("mouse colliding with enemy");
					gameWorld.targetFrame.setTarget(this);
					gameWorld.playerHero.setTarget(this);
				}
			}
			super.update();
		}
		
		override public function DealDamage(_damageAmount:int, _fromid:int):void
		{
			trace(_damageAmount, _fromid);
			gameWorld.networkController.sendDamage(unitID, _damageAmount, _fromid);
		}
		
	}

}