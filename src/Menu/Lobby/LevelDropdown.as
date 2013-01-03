package Menu.Lobby 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import Menu.Lobby.LevelSelecter;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LevelDropdown extends Entity 
	{
		protected var graphicList:Graphiclist;
		protected var activeGraphicList:Graphiclist;
		protected var selectedLevelBackground:Image;
		protected var levelSelecterBackground:Image;
		protected var dropdownSelecter:Image;
		protected var labelText:Text;
		protected var levelText:Text;
		
		private var dropdown:Boolean = false;
		private var levelSelected:Boolean = false;
		private var lobbyMenu:LobbyMenu;
		
		public function LevelDropdown(xPos:int, yPos:int, _lobbyMenu:LobbyMenu) 
		{
			lobbyMenu = _lobbyMenu;
			labelText = new Text("level: ");
			labelText.color = 0xffffff;
			labelText.x = 0;
			labelText.y = 0;
			labelText.size = 24;
			
			levelText = new Text("");
			levelText.color = 0xffffff;
			levelText.x = labelText.scaledWidth + 4;
			levelText.y = 0;
			levelText.size = 24;
			
			selectedLevelBackground = Image.createRect(250, 30, 0x000000, 1);
			selectedLevelBackground.x = labelText.scaledWidth;
			
			levelSelecterBackground = Image.createRect(250, 86, 0xffffff, 1);
			levelSelecterBackground.x = labelText.scaledWidth;
			levelSelecterBackground.y = selectedLevelBackground.scaledHeight;
			
			dropdownSelecter = Image.createRect(30, 30, 0x000000, 1);
			dropdownSelecter.x = labelText.scaledWidth + selectedLevelBackground.scaledWidth + 10;
			graphicList = new Graphiclist(labelText, selectedLevelBackground, dropdownSelecter, levelText);
			activeGraphicList = new Graphiclist(labelText, selectedLevelBackground, dropdownSelecter, levelSelecterBackground);
			graphic = graphicList;
			
			// position this entity
			this.x = FP.width / 20 * xPos;
			this.y = FP.width / 20 * yPos;
			
			setHitboxTo(dropdownSelecter);
		}
		
		public function activateDropdown():void
		{
			dropdown = true;
			FP.world.add (new LevelSelecter("training", 1, this.x + labelText.scaledWidth, this.y + selectedLevelBackground.scaledHeight, this));
			FP.world.add (new LevelSelecter("lava", 2, this.x + labelText.scaledWidth, this.y + selectedLevelBackground.scaledHeight, this));
			FP.world.add (new LevelSelecter("test", 3, this.x + labelText.scaledWidth, this.y + selectedLevelBackground.scaledHeight, this));
			graphic = activeGraphicList;
		}
		
		public function disableDropdown():void
		{
			dropdown = false;
			var selecterArray:Array = new Array;
			FP.world.getClass(LevelSelecter, selecterArray)
			{
				FP.world.removeList(selecterArray);
				graphic = graphicList;
			}
		}
		
		public function setLevel(_levelName:String):void //called by levelselecter on click
		{
			levelText.text = _levelName;
			levelSelected = true;
			lobbyMenu.createRoomOk();
		}
		
		override public function update():void
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				if (Input.mousePressed) //on mouseclick
				{
					if (dropdown == false)
					{
						activateDropdown();
					}
					else
					{
						disableDropdown();
					}
				}
			}
			else 
			{
				
			}
		}
		
	}

}