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
		
		public function Walk(_direction:String = ""):void
		{
			if (_direction == "down")
			{
				unitSprite.play("walkDown");
				weaponSprite.play("walkDown");
				this.y += 1;
			}
			
			if (_direction == "right")
			{
				unitSprite.play("walkRight");
				weaponSprite.play("walkRight");
				this.x += 1;
			}
			if (_direction == "left")
			{
				unitSprite.play("walkLeft");
				weaponSprite.play("walkLeft");
				this.x -= 1;
			}
			if (_direction == "up")
			{
				unitSprite.play("walkUp");
				weaponSprite.play("walkUp");
				this.y -= 1;
			}
			
			if (_direction == "upright")
			{
				unitSprite.play("walkRight");
				weaponSprite.play("walkRight");
				this.y -= .66;
				this.x += .66;
			}
			
			if (_direction == "upleft")
			{
				unitSprite.play("walkLeft");
				weaponSprite.play("walkLeft");
				this.y -= .66;
				this.x -= .66;
			}
			if (_direction == "downright")
			{
				unitSprite.play("walkRight");
				weaponSprite.play("walkRight");
				this.y += .66;
				this.x += .66;
			}
			if (_direction == "downleft")
			{
				unitSprite.play("walkLeft");
				weaponSprite.play("walkLeft");
				this.y += .66;
				this.x -= .66;
			}
			
		}
		
		public function Stand(_direction:String = ""):void
		{
			if (_direction == "down")
			{
				unitSprite.play("standDown");
				weaponSprite.play("standDown");
			}
			if (_direction == "right")
			{
				unitSprite.play("standRight");
				weaponSprite.play("standRight");
			}
			if (_direction == "left")
			{
				unitSprite.play("standLeft");
				weaponSprite.play("standLeft");
			}
			if (_direction == "up")
			{
				unitSprite.play("standUp");
				weaponSprite.play("standUp");
			}
			
		}
		
		
	}

}