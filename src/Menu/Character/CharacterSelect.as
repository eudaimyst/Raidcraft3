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
		protected var passedWorld:CreateCharacter;
		protected var gfx:Image;
		protected var graphicList:Graphiclist;
		protected var selectedGraphicList:Graphiclist;
		protected var charClass:Text;
		protected var isHover:Boolean = false;
		public var isSelected:Boolean = false;
		
		
		public function CharacterSelect(_gfx:Class, _text:String, _num:int, _world:CreateCharacter) 
		{
			passedWorld = _world;
			passedClass = _gfx;
			
			trace("character" + String(_gfx) + "drawn");
			gfx = new Image(_gfx);
			gfx.scale = 3;
			gfx.color = 0x000000;
			gfx.tinting = .5;
			
			charClass = new Text(_text);
			charClass.y = gfx.scaledHeight + 10;
			charClass.x = gfx.scaledWidth/2-charClass.textWidth/2;
			charClass.color = 0xffffff;
			
			graphicList = new Graphiclist(gfx);
			selectedGraphicList = new Graphiclist(gfx, charClass);
			
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
					gfx.tinting = 0;
					if (isSelected == true) { }
					else {graphic = Graphiclist(graphicList);}
					//gfx.color = 
				}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					passedWorld.Select(passedClass);
					isSelected = true;
					gfx.tinting = 0;
					graphic = Graphiclist(selectedGraphicList);
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true)
				{
					//graphic = new Graphiclist(menuButton, buttonText);
					gfx.tinting = .5;
					if (isSelected == true) { gfx.tinting = 0; }
					else graphic = Graphiclist(graphicList);
					
				}
				if (Input.mousePressed)
				{
					//passedWorld.SelectCharacter(passedClass);
					isSelected = false;
					gfx.tinting = .5;
					graphic = Graphiclist(graphicList);
				}
				isHover = false;
			}
			
		}
		
	}

}