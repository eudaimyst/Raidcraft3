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
		
		public var upKey:Boolean;
		public var downKey:Boolean;
		public var leftKey:Boolean;
		public var rightKey:Boolean;
		
		
		public function PlayerInputController() 
		{
			Input.define("MovePlayer", Key.W, Key.S, Key.A, Key.D)
		}
		
		public function setHero(_hero:Hero):void
		{
			attachedHero = _hero;
		}
		
		override public function update():void
		{
			if (Input.pressed("MovePlayer"))
			{
				trace("wasd pressed");
				if (Input.pressed(Key.W))
				{
					attachedHero.RecieveInput("Up", 1);
					attachedHero.networkController.sendWalkMessage(1);
				}
				if (Input.pressed(Key.A))
				{
					attachedHero.RecieveInput("Left", 1);
					attachedHero.networkController.sendWalkMessage(2);
				}
				if (Input.pressed(Key.S))
				{
					attachedHero.RecieveInput("Down", 1);
					attachedHero.networkController.sendWalkMessage(3);
				}
				if (Input.pressed(Key.D))
				{
					attachedHero.RecieveInput("Right", 1);
					attachedHero.networkController.sendWalkMessage(4);
				}
			}
			if (Input.released("MovePlayer"))
			{
				trace("wasd released");
				if (Input.released(Key.W))
				{
					attachedHero.RecieveInput("Up", 2);
					attachedHero.networkController.sendStopWalkMessage(1);
				}
				if (Input.released(Key.A))
				{
					attachedHero.RecieveInput("Left", 2);
					attachedHero.networkController.sendStopWalkMessage(1);
				}
				if (Input.released(Key.S))
				{
					attachedHero.RecieveInput("Down", 2);
					attachedHero.networkController.sendStopWalkMessage(1);
				}
				if (Input.released(Key.D))
				{
					attachedHero.RecieveInput("Right", 2);
					attachedHero.networkController.sendStopWalkMessage(1);
				}
			}
			
		}
		
	}

}