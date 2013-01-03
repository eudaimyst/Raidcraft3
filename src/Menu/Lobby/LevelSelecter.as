package Menu.Lobby 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LevelSelecter extends Entity 
	{
		protected var background:Image;
		protected var backgroundActive:Image;
		protected var levelText:Text
		
		private var isHover:Boolean = false;
		
		private var dropDown:LevelDropdown;
		
		private var levelName:String;
		
		public function LevelSelecter(_levelName:String, _selecterNum:int, _x:Number, _y:Number, _dropDown:LevelDropdown) 
		{
			dropDown = _dropDown;
			levelName = _levelName;
			
			background = Image.createRect(246, 26, 0x000000, 1);
			background.x = _x + 2;
			background.y = (_y + (_selecterNum - 1) * 28) + 2;
			backgroundActive = Image.createRect(246, 26, 0x222222, 1);
			backgroundActive.x = _x + 2;
			backgroundActive.y = (_y + (_selecterNum - 1) * 28) + 2;
			
			levelText = new Text(_levelName);
			levelText.x = _x + 6;
			levelText.y = _y + ((_selecterNum - 1) * 28) + 6;
			
			graphic = new Graphiclist(background, levelText);
			
			setHitboxTo(background);
		}
		
		override public function update():void
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				isHover = true;
				graphic = new Graphiclist(backgroundActive, levelText);
				if (Input.mousePressed) //on mouseclick
				{
					dropDown.disableDropdown();
					dropDown.setLevel(levelName);
					//do stuff
				}
			}
			else 
			{
				if (isHover == true)
				{
					isHover = false;
					graphic = new Graphiclist(background, levelText);
				}
			}
		}
		
		
		
	}

}