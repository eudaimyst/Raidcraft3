package GameWorld.Characters 
{
	import GameWorld.Characters.Heroes.*;
	import GameWorld.Controllers.PlayerInputController;
	import net.flashpunk.graphics.Spritemap;

	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Hero extends Unit  
	{
		public var playerInputController:PlayerInputController;
		
		
		public var direction:String = "down";
		public var isMoving:Boolean = false;
		
	public function Hero(_playerInputController:PlayerInputController, _char:Class) 
		{
			playerInputController = _playerInputController;
			
			if (_char == Mage)
			{
				unitSprite = new Spritemap(Mage.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
			}
			
			if (_char == Warrior)
			{
				unitSprite = new Spritemap(Warrior.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WARRIOR, 40, 60);
			}
			
			if (_char == Rogue)
			{
				unitSprite = new Spritemap(Rogue.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WANDERER, 40, 60);
			}
			
			SpriteMap();
			
			playerInputController.setHero(this);
		}
		
		override public function update():void
		{
			
		}
		
		
	}

}