package GameWorld.Controllers 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	public class UnitController 
	{
		
		public function UnitController() 
		{
			
		}
		
		public function onUpdate()
		{
			if (Input.check("MovePlayer"))
			{
				if (Input.check(Key.W))
				{
					direction = "up";
					Walk(direction);
				}
				
				if (Input.check(Key.S))
				{
					direction = "down";
					Walk(direction);
				}
				
				if (Input.check(Key.A))
				{
					direction = "left";
					Walk(direction);
				}
				
				if (Input.check(Key.D))
				{
					direction = "right";
					Walk(direction);
				}
				isMoving = true;
			}
			else
			{
				if (isMoving == true)
				{
					isMoving = false;
					Stand(direction);
				}
				
			}
		}
		
	}

}