package GameEngine.Characters 
{
	import GameEngine.Characters.Enemies.BaseEnemy;
	import GameEngine.GameWorld;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class DummyEnemy extends Unit 
	{
		
		public var gameWorld:GameWorld;
		
		public function DummyEnemy(_gameWorld:GameWorld, _baseEnemy:BaseEnemy) 
		{
			gameWorld = _gameWorld;
			
			unitSprite = _baseEnemy.spritemap;
			
			unitName = _baseEnemy.unitName;
			
			maxHealth = _baseEnemy.maxHealth;
			health = maxHealth;
			
			maxPower = _baseEnemy.maxPower
			power = maxPower;
			
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