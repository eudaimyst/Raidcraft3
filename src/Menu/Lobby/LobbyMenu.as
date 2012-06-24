package Menu.Lobby 
{
	import Menu.Character.SelectCharacter;
	import net.flashpunk.World;
	import playerio.RoomInfo;
	import UI.MenuButton;
	import UI.*;
	import user.UserCharacter;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LobbyMenu extends World 
	{
		public var lobbyController:LobbyController = new LobbyController();
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
			add (new CreateRoomButton(9, 1, "create", false, null, createRooms));
			add (new CreateRoomButton(9, 2, "refresh", false, null, updateRooms));
			add (numOfRooms);
		}
		
		private function createRooms():void
		{
			add (roomNameInput);
			add (okButton);
		}
		
		private function okPressed():void
		{
			remove (roomNameInput);
			remove (okButton);
			lobbyController.createRaid(roomNameInput.text);
			lobbyController.refreshList();
		}
		
		private function updateRooms():void
		{
			numOfRooms.text = String(lobbyController.currentRooms.length) + " rooms";
			for (var i:Number = 0; i <= lobbyController.currentRooms.length; i++) 
			{
				roomInfo = lobbyController.currentRooms[i];
				trace ("room name: " + roomInfo.id + " " + "players: " + roomInfo.onlineUsers + "type: " + roomInfo.roomType);
				//trace ("room names", lobbyController.currentRooms[i]);
			}
		}
	}

}