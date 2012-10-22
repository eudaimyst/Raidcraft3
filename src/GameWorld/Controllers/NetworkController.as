package GameWorld.Controllers 
{
	import GameWorld.Characters.FriendlyHero;
	import GameWorld.Characters.Hero;
	import GameWorld.Level;
	import Menu.Lobby.LobbyMenu;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import playerio.*;
	import user.UserCharacter;
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class NetworkController extends Entity 
	{
		protected var gameID:String = playerioserver.gameID;
		protected var connection:Connection;
		protected var client:Client;
		
		public var currentLevel:Level; //current level (world) that this instance of networkController is referenced in
		public var currentLobby:LobbyMenu; //current lobby (world) that this instance of networkController is referenced in
		public var currentHero:Hero; //user controlled hero communicating with this instance of Network Controller.
		public var userID:int;
		
		public var currentRooms:Array = new Array("test");
		
	
		
		public function NetworkController():void
		{
		}
		
		
		override public function added():void
		{
			if (playerioserver.isConnected == false)
			{
				trace("connecting to player.io...");
				PlayerIO.connect(FP.stage, gameID, "public", "Guest", "", "", handleConnect, handleError);//////////function to connect to the server
			}
			else trace("already connected to player.io");
		}
		
		private function handleConnect(_client:Client):void 
		{
			client = _client;
			trace("handling connection attempt");
			//Set developmentsever (Comment out to connect to your server online)
			client.multiplayer.developmentServer = "localhost:8184";
			
			refreshList(); //gets number of rooms
			
		}
		
		public function setLevel(_level:Level):void
		{
			currentLevel = _level;
			trace ("********************");
			trace ("level set");
			trace ("***********************");
			currentLevel.Test();
		}
		
		public function setLobby(_lobby:LobbyMenu):void
		{
			currentLobby = _lobby;
			trace ("********************");
			trace ("lobby set");
			trace ("***********************");
		}
		
		public function setHero(_hero:Hero):void
		{
			currentHero = _hero;
		}
		
		public function createRaid(_roomName:String):void //called by CreateRoomButton onPress function
		{
			if (client == null) { }
			else
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
			if (connection == null) {}
			else connection.send("walk", _direction);
		}
		
		public function sendStopWalkMessage(_direction:int):void
		{
			trace("Sent stopwalk message to server");
			connection.send("stopwalk", _direction);
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
			currentLobby.updateRooms();
		}
		
		public function getRooms():Array //returns the current rooms array, called by lobbymenu
		{
			return currentRooms;
		}
		
		public function setClass(_char:int):void
		{
			connection.send("SetClass", _char);
		}
		
		private function handleJoin(_connection:Connection):void
		{
			trace("Sucessfully joined the room");
			
			
			
			playerioserver.isConnected = true;
			
			connection = _connection;
			
			currentHero.setClass();

			//Add disconnect listener
			_connection.addDisconnectHandler(handleDisconnect);
			
			_connection.addMessageHandler("setUserID", SetUserID);

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

			//Add message listener for send spawn commands
			_connection.addMessageHandler("SendSpawn", RecieveSpawn);
			
			//Listen to all messages using a private function
			_connection.addMessageHandler("*", handleMessages);
		}

		private function SetUserID(m:Message, _userid:uint):void
		{
			trace("Recived a message with SetUserID from the server");
			trace("your user id = " + _userid);
			userID = _userid;
		}
		
		private function Hello(m:Message):void
		{
			trace("Recived a message with the type hello from the server");
		}
		
		private function RecieveSpawn(_message:Message, _userid:uint, _char:uint = 0, _origX:int = 0, _origY:int = 0):void
		{
			trace("Recieved spawn message from server");
			if (_userid != userID) //if the user sending spawn message is not self (to prevent spawning a friendly player for the users own hero)
			{
			currentLevel.SpawnFriendlyPlayer(_userid, _char, _origX, _origY); 
			}
		}
		
		private function RecieveWalk(_message:Message, _userid:uint, _direction:uint):void
		{
			trace("Recieved walk message from server", _direction);
			if (_userid != userID)
			{
				var friendlyPlayer:FriendlyHero = currentLevel.friendlyPlayerArray[_userid];
				if (_direction == 1)
				{
					friendlyPlayer.RecieveInput("Up", 1);
				}
				if (_direction == 2)
				{
					friendlyPlayer.RecieveInput("Left", 1);
				}
				if (_direction == 3)
				{
					friendlyPlayer.RecieveInput("Down", 1);
				}
				if (_direction == 4)
				{
					friendlyPlayer.RecieveInput("Right", 1);
				}
			}
		}
		
		private function StopWalk(_message:Message, _userid:uint, _direction:uint):void
		{
			trace("Recieved StopWalk message from server");
			if (_userid != userID)
			{
			var friendlyPlayer:FriendlyHero = currentLevel.friendlyPlayerArray[_userid];
			if (_direction == 1)
			{
				friendlyPlayer.RecieveInput("Up", 2);
			}
			if (_direction == 2)
			{
				friendlyPlayer.RecieveInput("Left", 2);
			}
			if (_direction == 3)
			{
				friendlyPlayer.RecieveInput("Down", 2);
			}
			if (_direction == 4)
			{
				friendlyPlayer.RecieveInput("Right", 2);
			}
			}
		}

		private function UserJoined(m:Message, _userid:uint, _char:int = 0):void //new user has joined
		{
			trace("Player with the userid", _userid, "and class", _char, "just joined the room");
			connection.send("SendSpawn", userID, currentHero.x, currentHero.y)
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