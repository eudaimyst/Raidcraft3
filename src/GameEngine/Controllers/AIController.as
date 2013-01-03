package GameEngine.Controllers 
{
	import GameEngine.Characters.Enemy;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class AIController extends Entity 
	{
		
		public function AIController(_controlledEnemy:Enemy) 
		{
			
		}
		
		public function spawnedState():void
		{
			trace("enemy is in spawned state");
		}
		
	}

}