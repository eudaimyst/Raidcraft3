package GameWorld.Characters 
{
	import GameWorld.Player;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import GameWorld.Controllers.UnitController;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Hero extends Unit  
	{
		public var controlledBy:UnitController;
		
		[Embed(source = '../../../assets/char/sprite_mage.png')]
		public var MAGESPRITE:Class;
		[Embed(source = '../../../assets/char/sprite_warrior.png')]
		public var WARRIORSPRITE:Class;
		[Embed(source = '../../../assets/char/sprite_rogue.png')]
		public var ROGUESPRITE:Class;
		
		public var direction:String = "down";
		public var isMoving:Boolean = false;
		
		public function Hero(_player:Player) 
		{
			controlledBy = _player.controller;
			
			if (_player.selectedChar == GC.GFX_SELECT_MAGE)
			{
				unitSprite = new Spritemap(MAGESPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
			}
			
			if (_player.selectedChar == GC.GFX_SELECT_WARRIOR)
			{
				unitSprite = new Spritemap(WARRIORSPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WARRIOR, 40, 60);
			}
			
			if (_player.selectedChar == GC.GFX_SELECT_WANDERER)
			{
				unitSprite = new Spritemap(ROGUESPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WANDERER, 40, 60);
			}
			
			SpriteMap();
			
			Input.define("MovePlayer", Key.W, Key.S, Key.A, Key.D)
		}
		
		override public function update():void
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