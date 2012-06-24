package Menu.Lobby 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import playerio.*;
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LobbyController extends Entity 
	{
		protected var gameID:String = playerioserver.gameID;
		protected var testConnection:Connection;
		protected var client:Client;
		
		public var currentRooms:Array = new Array("test");
		
	
		
		public function LobbyController():void
		{
		}
		
		
		override public function added():void
		{
			if (playerioserver.isConnected == false)
			{
				trace("connecting to player.io...");
				PlayerIO.connect(FP.stage, gameID, "public", "Guest", "", "", handleConnect, handleError);
			}
			else trace("already connected to player.io");
		}
		
		private function handleConnect(_client:Client):void
		{
			client = _client;
			trace("handling connection attempt");
			//Set developmentsever (Comment out to connect to your server online)
			_client.multiplayer.developmentServer = "localhost:8184";
			
			refreshList(); //gets number of rooms
			
		}
		
		public function createRaid(_roomName:String):void //called by CreateRoomButton onPress function
		{
			client.multiplayer.createRoom(_roomName, "raid", true, { }, handleCreate, handleError); //creates a room with the name one int higher than the current # of rooms
		}
		
		public function refreshList():void
		{
			client.multiplayer.listRooms("raid", null, 128, 0, handleRoomList, handleError); //updates number of rooms on server, and calls handleRoomList
		}
		
		private function handleCreate(roomID:String):void //called when createRaid succeeds
		{
			trace("handleCreate: room created id = ", roomID); 
			refreshList();
		}
		
		private function handleRoomList(_rooms:Array):void //updates the currentRooms array with the current roomlist from the server
		{
			trace("handeRoomList: rooms listed");
			trace(_rooms.length);
			currentRooms = _rooms;
		}
		
		public function getRooms():Array //returns the current rooms array, called by lobbymenu
		{
			return currentRooms;
		}
		
		private function handleJoin(_connection:Connection):void
		{
			trace("Sucessfully connected to the multiplayer server");
			playerioserver.isConnected = true;
			
			testConnection = _connection;

			//Add disconnect listener
			_connection.addDisconnectHandler(handleDisconnect);

			//Add listener for messages of the type "hello"
			_connection.addMessageHandler("hello", Hello);

			//Add message listener for users joining the room
			_connection.addMessageHandler("UserJoined", UserJoined);

			//Add message listener for users leaving the room
			_connection.addMessageHandler("UserLeft", UserLeft);

			//Listen to all messages using a private function
			_connection.addMessageHandler("*", handleMessages);
		}

		private function Hello(m:Message):void
		{
			trace("Recived a message with the type hello from the server");
		}

		private function UserJoined(m:Message, userid:uint):void
		{
			trace("Player with the userid", userid, "just joined the room");
		}

		private function UserLeft(m:Message, userid:uint):void
		{
			trace("Player with the userid", userid, "just left the room");
		}

		private function handleMessages(m:Message):void
		{
			//trace("Recived the message", m);
		}

		private function handleDisconnect():void
		{
			trace("Disconnected from server");
		}

		private function handleError(error:PlayerIOError):void
		{
			trace("got",error)
		}
		
	}

}