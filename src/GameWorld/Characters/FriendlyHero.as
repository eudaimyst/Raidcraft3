package GameWorld.Characters 
{
	import GameWorld.Characters.Heroes.*;
	import net.flashpunk.graphics.Spritemap;
	import GameWorld.Controllers.NetworkController;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class FriendlyHero extends Unit 
	{
		public var networkController:NetworkController;
		public var userid:int;
		
		public function FriendlyHero(_networkController:NetworkController, _userid:int, _char:int = 0) 
		{
			networkController = _networkController;
			userid = _userid;
			
			if (_char == 0)
			{
				unitSprite = new Spritemap(Mage.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
			}
			if (_char == 1)
			{
				unitSprite = new Spritemap(Mage.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
			}
			
			if (_char == 2)
			{
				unitSprite = new Spritemap(Warrior.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WARRIOR, 40, 60);
			}
			
			if (_char == 3)
			{
				unitSprite = new Spritemap(Rogue.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WANDERER, 40, 60);
			}
			
			
			SpriteMap();
		}
		
	}

}