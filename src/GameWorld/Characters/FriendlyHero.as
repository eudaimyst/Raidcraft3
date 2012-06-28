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
		
		public function FriendlyHero(_networkController:NetworkController, _char:Class) 
		{
			networkController = _networkController;
			
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
		}
		
	}

}