package GameWorld.Characters 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Unit extends Entity 
	{
		public var graphiclist:Graphiclist;
		public var unitSprite:Spritemap;
		public var weaponSprite:Spritemap;
		
		public var walkUp:Boolean;
		public var walkDown:Boolean;
		public var walkLeft:Boolean;
		public var walkRight:Boolean;
		public var isMoving:Boolean;
		public var direction:String = "down";
		
		public function Unit() 
		{
			
		}
		
		public function SpriteMap():void
		{
			AddSprites(unitSprite);
			AddSprites(weaponSprite);
			
			graphiclist = new Graphiclist(unitSprite, weaponSprite);
			graphic = graphiclist;
		}
		
		public function AddSprites(_spritemap:Spritemap):void
		{
			var i:int;
			i = 0;
			_spritemap.add("walkDown", [i + 0, i + 1, i + 0, i + 2], 4, true);
			i = 3;
			_spritemap.add("walkRight", [i + 0, i + 1, i + 0, i + 2], 4, true);
			i = 6;
			_spritemap.add("walkLeft", [i + 0, i + 1, i + 0, i + 2], 4, true);
			i = 9;
			_spritemap.add("walkUp", [i + 0, i + 1, i + 0, i + 2], 4, true);
			i = 0;
			_spritemap.add("standDown", [i + 0], 1);
			i = 3;
			_spritemap.add("standRight", [i + 0], 1);
			i = 6;
			_spritemap.add("standLeft", [i + 0], 1);
			i = 9;
			_spritemap.add("standUp", [i + 0], 1);
		}
		
		override public function update():void
		{
			if (!isMoving) //if not moving
			{
				PlayAnim(direction, 2); //play stand animation
			}
			else
			{
				if (walkUp && !walkLeft && !walkRight && !walkDown) //up
				{
					this.y -= 1;
				}
				if (walkDown && !walkLeft && !walkRight && !walkUp) //down
				{
					this.y += 1;
				}
				if (walkLeft && !walkUp && !walkDown && !walkRight) //left
				{
					this.x -= 1;
				}
				if (walkRight && !walkUp && !walkDown && !walkLeft) //right
				{
					this.x += 1;
				}
				if (walkUp && walkLeft && !walkRight && !walkDown) //upleft
				{
					this.y -= .7;
					this.x -= .7;
				}
				if (walkUp && walkRight && !walkLeft && !walkDown) //upright
				{
					this.y -= .7;
					this.x += .7;
				}
				if (walkDown && walkLeft && !walkRight && !walkUp) //downleft
				{
					this.y += .7;
					this.x -= .7;
				}
				if (walkDown && walkRight && !walkLeft && !walkUp) //downright
				{
					this.y += .7;
					this.x += .7;
				}
			PlayAnim(direction, 1);
			}
		}
		
		//// actions
		// 1 = walk
		// 2 = stand
		public function PlayAnim(_direction:String = "", _action:int = 0):void
		{
			if (_action == 1)
			{
				unitSprite.play("walk" + _direction);
				weaponSprite.play("walk" + _direction);
			}
			if (_action == 2)
			{
				unitSprite.play("stand" + _direction);
				weaponSprite.play("stand" + _direction);
			}
		}
		
		public function RecieveInput(_direction:String = "", _action:int = 0):void
		{
			trace("input recieved");
			
			if (_action == 1)
			{
				direction = _direction;
				isMoving = true;
				if (_direction == "Down")
				{
					walkDown = true;
				}
				if (_direction == "Right")
				{
					walkRight = true;
				}
				if (_direction == "Left")
				{
					walkLeft = true;
				}
				if (_direction == "Up")
				{
					walkUp = true;
				}
			}
			if (_action == 2)
			{
				if (_direction == "Down")
				{
					walkDown = false;
					if (walkLeft == true) direction = "Left";
					if (walkRight == true) direction = "Right";
				}
				if (_direction == "Right")
				{
					walkRight = false;
					if (walkUp == true) direction = "Up";
					if (walkDown == true) direction = "Down";
				}
				if (_direction == "Left")
				{
					walkLeft = false;
					if (walkUp == true) direction = "Up";
					if (walkDown == true) direction = "Down";
				}
				if (_direction == "Up")
				{
					walkUp = false;
					if (walkLeft == true) direction = "Left";
					if (walkRight == true) direction = "Right";
				}
				if (!walkUp && !walkDown && !walkLeft && !walkRight)
				{
					direction = _direction;
					isMoving = false;
				}
			}
		}
		
		
	}

}