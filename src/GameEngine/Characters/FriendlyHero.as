package GameEngine.Characters 
{
	import GameEngine.Characters.Heroes.*;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
	import GameEngine.Controllers.NetworkController;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class FriendlyHero extends Unit 
	{
		public var networkController:NetworkController;
		public var userid:int;
		
		public var username:Text;
		
		public function FriendlyHero(_networkController:NetworkController, _userid:int, _char:int = 0, _name:String = "") 
		{
			networkController = _networkController;
			userid = _userid;
			
			username = new Text(_name);
			
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
			
			graphiclist = new Graphiclist(unitSprite, weaponSprite, username);
			graphic = graphiclist;
		}
		
		
		public function MoveToLocation(origX:int, origY:int):void ///called when unit is spawned by level
		{
			this.x = origX;
			this.y = origY;
		}
	}

}