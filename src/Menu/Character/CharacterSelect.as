package Menu.Character 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CharacterSelect extends Entity 
	{
		protected var passedClass:Class;
		protected var gfx:Image;
		protected var graphicList:Graphiclist;
		protected var passedWorld:CreateCharacter;
		protected var isHover:Boolean = false;
		protected var isSelected:Boolean = false;
		
		public function CharacterSelect(_gfx:Class, _num:int, _world:CreateCharacter) 
		{
			passedWorld = _world;
			passedClass = _gfx;
			
			trace("character" + String(_gfx) + "drawn");
			gfx = new Image(_gfx);
			gfx.scale = 3;
			gfx.color = 0x000000;
			gfx.tinting = .5;
			
			graphicList = new Graphiclist(gfx);
			
			graphic = Graphiclist(graphicList);
			
			this.x = FP.stage.width / (passedWorld.numberOfChars + 1) * _num - gfx.scaledWidth / 2;
			this.y = 200;
			
			this.setHitbox(gfx.scaledWidth, gfx.scaledHeight);
		}
		
		override public function added():void
		{
			
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false)
				{
					//graphic = new Graphiclist(menuButtonHover, buttonText);
					trace("changed to hover true" + String(gfx));
					gfx.tinting = 0;
					graphic = Graphiclist(graphicList);
					//gfx.color = 
				}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					passedWorld.SelectCharacter(passedClass);
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true)
				{
					//graphic = new Graphiclist(menuButton, buttonText);
					trace("changed to hover false" + String(gfx));
					gfx.tinting = .5;
					graphic = Graphiclist(graphicList);
					
				}
				if (Input.mousePressed)
				{
					passedWorld.SelectCharacter(passedClass);
				}
				isHover = false;
			}
			
		}
		
	}

}