package GameWorld.Characters 
{
	import GameWorld.Characters.Heroes.*;
	import GameWorld.Controllers.NetworkController;
	import GameWorld.Controllers.PlayerInputController;
	import net.flashpunk.graphics.Spritemap;
	import user.UserCharacter;

	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class Hero extends Unit  
	{
		public var playerInputController:PlayerInputController;
		public var networkController:NetworkController;
		public var char:Class;
		
		public function Hero(_playerInputController:PlayerInputController, _networkController:NetworkController, _char:Class) 
		{
			playerInputController = _playerInputController;
			networkController = _networkController;
			char = _char;
			
			if (UserCharacter.charClass == Mage)
			{
				unitSprite = new Spritemap(Mage.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_MAGE, 40, 60);
				
			}
			
			if (UserCharacter.charClass == Warrior)
			{
				unitSprite = new Spritemap(Warrior.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WARRIOR, 40, 60);
				
			}
			
			if (UserCharacter.charClass == Rogue)
			{
				unitSprite = new Spritemap(Rogue.GFX_SPRITE, 40, 60);
				weaponSprite = new Spritemap(GC.GFX_WEAPON_WANDERER, 40, 60);
				
			}
			
			SpriteMap();
			
			playerInputController.setHero(this);
			networkController.setHero(this);
		}
		public function setClass():void
		{
			if (char == Mage)
			{
				networkController.setClass(1);
			}
			if (char == Warrior)
			{
				networkController.setClass(2);
			}
			if (char == Rogue)
			{
				networkController.setClass(3);
			}
		}
		
	}

}