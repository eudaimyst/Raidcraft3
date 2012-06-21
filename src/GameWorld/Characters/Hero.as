package GameWorld.Characters 
{
	import GameWorld.Controllers.PlayerInputController;
	import net.flashpunk.graphics.Spritemap;

	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Hero extends Unit  
	{
		public var playerInputController:PlayerInputController;
		
		[Embed(source = '../../../assets/char/sprite_mage.png')]
		public var MAGESPRITE:Class;
		[Embed(source = '../../../assets/char/sprite_warrior.png')]
		public var WARRIORSPRITE:Class;
		[Embed(source = '../../../assets/char/sprite_rogue.png')]
		public var ROGUESPRITE:Class;
		
		public var direction:String = "down";
		public var isMoving:Boolean = false;
		
	public function Hero(_playerInputController:PlayerInputController, _char:Class) 
		{
			playerInputController = _playerInputController;
			
			if (_char == GC.GFX_SELECT_MAGE)
			{
				unitSprite = new Spritemap(MAGESPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
			}
			
			if (_char == GC.GFX_SELECT_WARRIOR)
			{
				unitSprite = new Spritemap(WARRIORSPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WARRIOR, 40, 60);
			}
			
			if (_char == GC.GFX_SELECT_WANDERER)
			{
				unitSprite = new Spritemap(ROGUESPRITE, 40, 60);
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