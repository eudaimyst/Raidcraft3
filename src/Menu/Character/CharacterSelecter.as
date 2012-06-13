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
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CharacterSelecter extends Entity 
	{
		public var passedClass:Class;
		protected var passedWorld:CreateCharacter;
		protected var gfx:Image;
		protected var graphicList:Graphiclist;
		protected var selectedGraphicList:Graphiclist;
		protected var charClass:Text;
		protected var isHover:Boolean = false;
		public var isSelected:Boolean = false;
		
		public function CharacterSelecter(_gfx:Class, _text:String, _num:int, _world:CreateCharacter) 
		{
			passedWorld = _world;
			passedClass = _gfx;
			
			trace("character" + String(_gfx) + "drawn");
			gfx = new Image(_gfx);
			gfx.scale = 3;
			gfx.color = 0x000000;
			gfx.tinting = .5;
			
			charClass = new Text(_text);
			charClass.color = 0xffffff;
			charClass.size = 24;
			charClass.y = gfx.scaledHeight + 10;
			charClass.x = gfx.scaledWidth / 2 - charClass.textWidth / 2;
			
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
				//if mouse was not hovering last frame
				if (isHover == false)
				{
					gfx.tinting = 0; //no tinting (highlighted)
					if (isSelected == true)
					{
						graphic = Graphiclist(selectedGraphicList);
					}
					else
					{
						graphic = Graphiclist(graphicList); //update graphic
					}
				}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					passedWorld.Select(passedClass);
					trace(String(passedClass));
					isSelected = true;
					gfx.tinting = 0;
					graphic = Graphiclist(selectedGraphicList);
				}
			}
			else //if mouse is not colliding
			{
				//if mouse was hovering last frame
				if (isHover == true)
				{
					//graphic = new Graphiclist(menuButton, buttonText);
					
					if (isSelected == false) // if this character is not selected, make dark
					{
						trace("test");
						gfx.tinting = .5;
						graphic = Graphiclist(graphicList);
					} 
					else
					{
						gfx.tinting = 0;
						graphic = Graphiclist(selectedGraphicList);
					}
					
				}
				if (Input.mousePressed) //if mouse is clicked when not hovering
				{
					//passedWorld.Select(null);
					if (isSelected == true) //if this character is selected
					{
						isSelected = false; //make not selected
						passedWorld.Select(null);
					}
					gfx.tinting = .5;
					graphic = Graphiclist(graphicList);
				}
				isHover = false; //so above if knows we are no longer hovering
			}
			
		}
		
	}

}