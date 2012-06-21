package GameWorld.Controllers 
{
	import GameWorld.Characters.Hero;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class PlayerInputController extends Entity 
	{
		public var attachedHero:Hero;
		
		
		public function PlayerInputController() 
		{
			Input.define("MovePlayer", Key.W, Key.S, Key.A, Key.D)
		}
		
		public function setHero(_hero:Hero):void
		{
			attachedHero = _hero;
		}
		
		public function movement(_direction:String):void
		{
			attachedHero.Walk(_direction)
			if (attachedHero.direction != _direction) attachedHero.direction = _direction;
		}
		
		override public function update():void
		{
			if (Input.check("MovePlayer"))
			{
				attachedHero.isMoving = true;
				if (Input.check(Key.W))
				{
					if (Input.check(Key.A))
					{
						movement("upleft");
					}
					else if (Input.check(Key.D))
					{
						movement("upright");
					}
					else if (Input.check(Key.S))
					{
						//do nothing if up+down pressed
					}
					else
					{
						movement("up");
					}
				}
				if (Input.check(Key.A))
				{
					if (Input.check(Key.W))
					{
						//upleft movement handled by up key check
					}
					else if (Input.check(Key.D))
					{
						//do nothing if left+right pressed
					}
					else if (Input.check(Key.S))
					{
						//downleft movement handled by down key check
					}
					else
					{
					movement("left");
					}
				}
				if (Input.check(Key.S))
				{
					if (Input.check(Key.W))
					{
						//do nothing if up+down pressed
					}
					else if (Input.check(Key.A))
					{
						movement("downleft");
					}
					else if (Input.check(Key.D))
					{
						movement("downright");
					}
					else
					{
					movement("down");
					}
				}
				if (Input.check(Key.D))
				{
					if (Input.check(Key.W))
					{
						//upright movement handled by up key check
					}
					else if (Input.check(Key.A))
					{
						//do nothing if left+right pressed
					}
					else if (Input.check(Key.S))
					{
						//downright movement handled by down key check
					}
					else
					{
					movement("right");
					}
				}
			}
			else
			{
				if (attachedHero.isMoving == true)
				{
					attachedHero.isMoving = false;
					attachedHero.Stand(attachedHero.direction);
				}
			}
			
		}
		
	}

}