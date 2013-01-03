package GameEngine.Characters.Enemies 
{
	import net.flashpunk.graphics.Spritemap;
	import GameEngine.Characters.Heroes.Mage;
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyData 
	{
		[Embed(source = "../../../../assets/enemies/dragontest/sprite1.png")]
		public static const DRAGON_SPRITE:Class;
		
		public function EnemyData() 
		{
			
		}
		
		public function loadData(_enemyID:int):BaseEnemy
		{
			var enemy:BaseEnemy = new BaseEnemy;
			
			if (_enemyID == 0)
			{
				enemy.maxHealth = 2000;
				enemy.maxPower = 1400;
				enemy.unitName = "mageTestEnemy";
				enemy.spritemap = new Spritemap(Mage.GFX_SPRITE, 40, 60);
			}
			
			if (_enemyID == 1)
			{
				enemy.maxHealth = 9000;
				enemy.maxPower = 100;
				enemy.unitName = "dragonTestEnemy";
				enemy.spritemap = new Spritemap(DRAGON_SPRITE, 132, 103);
			}
			
			if (_enemyID == 2)
			{
				enemy.maxHealth = 300;
				enemy.maxPower = 200;
				enemy.unitName = "2ndTest";
				enemy.spritemap = new Spritemap(DRAGON_SPRITE, 132, 103);
			}
			enemy.id = _enemyID;
			return enemy;
		}
	}

}