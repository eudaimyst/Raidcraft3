package Menu.Lobby 
{
	import GameWorld.Controllers.NetworkController;
	import GameWorld.Level;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import user.UserCharacter;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class RoomBox extends Entity 
	{
		protected var boxBg:Image;
		protected var outline:Image;
		protected var graphiclist:Graphiclist;
		protected var hoverGraphiclist:Graphiclist;
		protected var roomName:Text;
		protected var roomNameString:String;//to be passed on to level
		protected var roomUsers:Text;
		protected var roomType:Text;
		protected var roomLevel:Text;
		
		protected var isHover:Boolean = false;
		protected var isPressed:Boolean = true;
		
		private var lobbycontroller:NetworkController;
		
		public function RoomBox(_roomNum:int, _roomName:String, _roomUsers:int, _roomType:String, _roomLevel:String, _lobbycontroller:NetworkController) 
		{
			roomNameString = _roomName;
			lobbycontroller = _lobbycontroller;
			//bg box for button
			boxBg = Image.createRect(FP.screen.width - FP.screen.width / 2, FP.screen.height / 8 - FP.screen.height / 50, 0x000000, 1);
			
			//outline
			outline = Image.createRect(boxBg.width + 4, boxBg.height + 4, 0xffffff, 1);
			outline.x = boxBg.x - 2;
			outline.y = boxBg.y - 2;
			//char icon for button
			/*charIcon = new Image(_charClass);
			charIcon.y = boxBg.y + (boxBg.height - charIcon.height) / 2;
			charIcon.x = boxBg.x;*/ ///use this to implement levelIcons later
			//text for button
			roomName = new Text("room name: " + _roomName, boxBg.width / 20, 5);
			roomType = new Text("type: " + _roomType, boxBg.width / 20, 20);
			roomUsers = new Text("players: " + String(_roomUsers), boxBg.width / 20, 30);
			roomLevel = new Text(_roomLevel, boxBg.width / 20, 40);
			
			
			graphiclist = new Graphiclist(boxBg, roomName, roomType, roomUsers);
			hoverGraphiclist = new Graphiclist(outline, boxBg, roomName, roomType, roomUsers);
			
			graphic = graphiclist
			
			this.setHitboxTo(boxBg);
			
			this.x = FP.screen.width / 12;
			this.y = FP.screen.height / 6 * (_roomNum + 1);
			
			this.type = "roombox"; //so it can be removed in loby menu on update
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
						FP.world = new Level(UserCharacter.charClass, lobbycontroller, roomNameString);
						
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