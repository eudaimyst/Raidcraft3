package GameWorld.Controllers 
{
	import GameWorld.Characters.Hero;
	import GameWorld.Level;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import playerio.*;
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class NetworkController extends Entity 
	{
		protected var gameID:String = playerioserver.gameID;
		protected var testConnection:Connection;
		protected var client:Client;
		
		private var currentLevel:Level; //current level (world) that this instance of networkController belongs to
		private var currentHero:Hero; //user controlled hero communicating with this instance of Network Controller.
		
		public var currentRooms:Array = new Array("test");
		
	
		
		public function NetworkController():void
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
		
		public function setLevel(_level:Level):void
		{
			currentLevel = _level;
		}
		
		public function setHero(_hero:Hero):void
		{
			currentHero = _hero;
		}
		
		public function createRaid(_roomName:String):void //called by CreateRoomButton onPress function
		{
			client.multiplayer.createRoom(_roomName, "raid", true, { }, handleCreate, handleError); //creates a room with the name from onPress(from lineinput)
		}
		
		public function joinRaid(_roomName:String):void //called by GameWorld.Level
		{
			client.multiplayer.joinRoom(_roomName, null, handleJoin, handleError); //joins room with passed roomname (from roombox)
		}
		
		public function refreshList():void
		{
			client.multiplayer.listRooms("raid", null, 128, 0, handleRoomList, handleError); //updates number of rooms on server, and calls handleRoomList
		}
		public function sendWalkMessage(_direction:int):void
		{
			trace("Sent walk message to server");
			testConnection.send("walk", _direction);
		}
		
		public function sendStopWalkMessage(_direction:int)
		{
			trace("Sent stopwalk message to server");
			testConnection.send("stopwalk");
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
			
			//Add message listener for walk commands
			_connection.addMessageHandler("SendWalk", RecieveWalk);
			
			//Add message listener for stopwalk commands
			_connection.addMessageHandler("StopWalk", StopWalk);

			//Listen to all messages using a private function
			_connection.addMessageHandler("*", handleMessages);
		}

		private function Hello(m:Message):void
		{
			trace("Recived a message with the type hello from the server");
		}
		
		private function RecieveWalk(_message:Message, userid:uint, _direction:uint):void
		{
			trace("Recieved walk message from server", _direction);
			var direction:int;
			direction = _message.getInt(0);
		}
		
		private function StopWalk(_message:Message, userid:uint):void
		{
			trace("Recieved StopWalk message from server");
		}

		private function UserJoined(m:Message, userid:uint):void //new user has joined
		{
			if (userid != 1) currentLevel.SpawnFriendlyPlayer();
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