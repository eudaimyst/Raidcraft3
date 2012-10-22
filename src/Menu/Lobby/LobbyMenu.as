package Menu.Lobby 
{
	import GameWorld.Controllers.NetworkController;
	import Menu.Character.SelectCharacter;
	import net.flashpunk.World;
	import playerio.RoomInfo;
	import UI.MenuButton;
	import UI.*;
	import user.UserCharacter;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LobbyMenu extends World 
	{
		public var lobbyController:NetworkController = new NetworkController();
		public var numOfRooms:SimpleText = new SimpleText(1, 2, "rooms");
		public var roomNameInput:CreateRoomInput = new CreateRoomInput(5, 5, "room name");
		public var okButton:CreateRoomButton = new CreateRoomButton (5, 6, "OK", true, null, okPressed);
		
		public var roomInfo:RoomInfo;
		
		public function LobbyMenu() 
		{
			add (new MouseCursorEntity);
			add (new SimpleText(1, 1, "Lobby - Select Room"));
			add (new MenuButton("back", 2, 9, false, SelectCharacter, false, UserCharacter.charClass));
			//add (new PlayButton("play", 2, 9, true, JoinLobby));
			add (lobbyController);
			add (new CreateRoomButton(9, 1, "create", false, null, createRoom));
			add (new CreateRoomButton(9, 2, "refresh", false, null, requestNewRoom));
			add (new CreateRoomButton(9, 3, "join", false, null, joinRoom));
			add (numOfRooms);
			
			lobbyController.setLobby(this);
		}
		
		private function createRoom():void
		{
			add (roomNameInput);
			add (okButton);
		}
		
		private function okPressed():void
		{
			remove (roomNameInput);
			remove (okButton);
			lobbyController.createRaid(roomNameInput.text);
			updateRooms();
		}
		
		private function joinRoom():void
		{
			
		}
		
		public function connectionError():void
		{
			add new PopupBox("unable to connect to server");
		}
		
		private function requestNewRoom():void
		{
			lobbyController.refreshList();
		}
		
		public function updateRooms():void
		{
			var removeArray:Array = new Array;
			
			numOfRooms.text = String(lobbyController.currentRooms.length) + " rooms";
			FP.world.getClass(RoomBox, removeArray);
			if (removeArray != null) FP.world.removeList(removeArray);
			
			for (var i:Number = 0; i < lobbyController.currentRooms.length; i++) 
			{
				roomInfo = lobbyController.currentRooms[i];
				trace ("room name: " + roomInfo.id + " players: " + roomInfo.onlineUsers + " type: " + roomInfo.roomType);
				add (new RoomBox(i, roomInfo.id, roomInfo.onlineUsers, roomInfo.roomType, "", lobbyController));
				//trace ("room names", lobbyController.currentRooms[i]);

			}
		}
		
	}

}