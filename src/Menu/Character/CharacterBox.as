package Menu.Character 
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image
	import net.flashpunk.FP
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CharacterBox extends Entity 
	{
		protected var boxBg:Image;
		protected var outline:Image;
		protected var charIcon:Image;
		protected var graphiclist:Graphiclist;
		protected var hoverGraphiclist:Graphiclist;
		protected var charName:Text;
		protected var charLevel:Text;
		protected var charClass:Text;
		protected var charNameStr:String = "test name";
		protected var charLevelStr:String = "1";
		protected var charClassStr:String = "class";
		
		protected var isHover:Boolean = false;
		
		public function CharacterBox(_charNum:int, _charClass:Class) 
		{
			//charNameStr = _charName;
			if (_charClass != null) //get name from class
			{
				if (_charClass == GC.GFX_SELECT_MAGE)
				{
					charClassStr = GC.TEXT_SELECT_MAGE
				}
				if (_charClass == GC.GFX_SELECT_WANDERER)
				{
					charClassStr = GC.TEXT_SELECT_WANDERER
				}
				if (_charClass == GC.GFX_SELECT_WARRIOR)
				{
					charClassStr = GC.TEXT_SELECT_WARRIOR
				}
			}
			
			
			//bg box for button
			boxBg = Image.createRect(FP.screen.width - FP.screen.width / 2, FP.screen.height / 8 - FP.screen.height / 50, 0x000000, 1);
			boxBg.x = FP.screen.width / 12;
			boxBg.y = FP.screen.height / 8 * (_charNum + 1);
			//outline
			outline = Image.createRect(boxBg.width + 4, boxBg.height + 4, 0xffffff, 1);
			outline.x = boxBg.x - 2;
			outline.y = boxBg.y - 2;
			//char icon for button
			charIcon = new Image(_charClass);
			charIcon.y = boxBg.y + (boxBg.height - charIcon.height) / 2;
			charIcon.x = boxBg.x;
			//text for button
			charClass = new Text(charClassStr, charIcon.x + charIcon.width + boxBg.width / 20, charIcon.y);
			charLevel = new Text("Lvl: " + charLevelStr, charIcon.x + charIcon.width + (boxBg.width / 20 * 14), charIcon.y + boxBg.height / 2);
			
			charLevel.size = 20;
			charClass.size = 20;
			
			graphiclist = new Graphiclist(boxBg, charIcon, charLevel, charClass);
			hoverGraphiclist = new Graphiclist(outline, boxBg, charIcon, charLevel, charClass);
			
			graphic = graphiclist
			
			this.setHitboxTo(boxBg);
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide("popupbox", x, y)) //if this is colliding with popupbox do nothing;
			{
				
			}
			else
			{
				if (this.collide(GC.TYPE_MOUSE, x, y))
				{
					if (isHover == false) //first frame when hovering
					{
						trace("changed to hover true");
						graphic = hoverGraphiclist;
					}
					isHover = true;
					
					if (Input.mousePressed) //on mouseclick
					{
						trace("mousepressed");
					}
				}
				else 
				{
					if (isHover == true) //first frame not hovering
					{
						trace("changed to hover false");
						graphic = graphiclist;
					}
				isHover = false;
				}
			}
		}
		
	}

}