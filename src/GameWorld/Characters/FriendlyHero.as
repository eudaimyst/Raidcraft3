package GameWorld.Characters 
{
	import GameWorld.Characters.Heroes.*;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class FriendlyHero extends Unit 
	{
		
		public function FriendlyHero() 
		{
			unitSprite = new Spritemap(Mage.GFX_SPRITE, 40, 60);
			weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
			
			SpriteMap();
		}
		
	}

}