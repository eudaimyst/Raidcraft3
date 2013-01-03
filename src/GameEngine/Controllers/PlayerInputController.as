package GameEngine.Controllers
{
	import GameEngine.Characters.Hero;
	import GameEngine.HUD.CastBar.CastBar;
	import GameEngine.Spells.SpellData;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
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
		
		public var inputDisabled:Boolean;
		
		public function PlayerInputController()
		{
			Input.define("MovePlayer", Key.W, Key.S, Key.A, Key.D)
			Input.define("SpellCast", Key.DIGIT_1, Key.DIGIT_2, Key.DIGIT_3, Key.DIGIT_4, Key.DIGIT_5, Key.DIGIT_6, Key.DIGIT_7, Key.DIGIT_8)
		}
		
		public function DisableInput():void
		{
			inputDisabled = true;
			attachedHero.stopMovement();
		}
		
		public function EnableInput():void
		{
			inputDisabled = false;
		}
		
		public function setHero(_hero:Hero):void
		{
			attachedHero = _hero;
		}
		
		override public function update():void
		{
			if (attachedHero.isMoving)
			{
				attachedHero.gameWorld.updateCamera();
			}
			
			if (Input.mousePressed)
			{
				if (attachedHero.gameWorld.collidePoint("enemy", attachedHero.gameWorld.mouseX, attachedHero.gameWorld.mouseY) == null && attachedHero.gameWorld.collidePoint("spellButton", attachedHero.gameWorld.mouseX, attachedHero.gameWorld.mouseY) == null)
				{
					trace ("no enemy");
					attachedHero.target = null;
					attachedHero.gameWorld.targetFrame.removeTarget();
					attachedHero.gameWorld.CancelCast();
				}
			}
			
			if (inputDisabled == true)
			{
				//do nothing
			}
			else
			{
				if (Input.pressed("SpellCast"))
				{
					trace("SpellCast Input pressed");
					
					if (Input.pressed(Key.DIGIT_1))
					{
						attachedHero.gameWorld.CastSpell(0);
					}
					if (Input.pressed(Key.DIGIT_2))
					{
						attachedHero.gameWorld.CastSpell(1);
					}
					if (Input.pressed(Key.DIGIT_3))
					{
						attachedHero.gameWorld.CastSpell(2);
					}
					if (Input.pressed(Key.DIGIT_4))
					{
						attachedHero.gameWorld.CastSpell(3);
					}
					if (Input.pressed(Key.DIGIT_5))
					{
						attachedHero.gameWorld.CastSpell(4);
					}
					if (Input.pressed(Key.DIGIT_6))
					{
						attachedHero.gameWorld.CastSpell(5);
					}
					if (Input.pressed(Key.DIGIT_7))
					{
						attachedHero.gameWorld.CastSpell(6);
					}
					if (Input.pressed(Key.DIGIT_8))
					{
						attachedHero.gameWorld.CastSpell(7);
					}
				}
				if (Input.pressed("MovePlayer"))
				{
					
					attachedHero.gameWorld.CancelCast();
					
					//trace("wasd pressed");
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
					//trace("wasd released");
					if (Input.released(Key.W))
					{
						attachedHero.RecieveInput("Up", 2);
						attachedHero.networkController.sendStopWalkMessage(1);
					}
					if (Input.released(Key.A))
					{
						attachedHero.RecieveInput("Left", 2);
						attachedHero.networkController.sendStopWalkMessage(2);
					}
					if (Input.released(Key.S))
					{
						attachedHero.RecieveInput("Down", 2);
						attachedHero.networkController.sendStopWalkMessage(3);
					}
					if (Input.released(Key.D))
					{
						attachedHero.RecieveInput("Right", 2);
						attachedHero.networkController.sendStopWalkMessage(4);
					}
				}
			}
		
		}
	
	}

}