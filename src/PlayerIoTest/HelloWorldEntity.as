package PlayerIoTest 
{
	import flash.display.Stage;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import playerio.* // Needed to use PlayerIO functions

	/**
	 * ...
	 * @author skipgamer
	 */
	public class HelloWorldEntity extends Entity 
	{
		protected var gameID:String = playerioserver.gameID;
		protected var gameStage:Stage;
		protected var testMessage:Message;
		protected var testConnection:Connection;
		protected var testComm:playerioComm;
		
		public function HelloWorldEntity():void
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
		
		public function sendTest(_testComm:playerioComm, sentVariable:String):void
		{
			testComm = _testComm;
			testConnection.send("test", sentVariable);
			trace ("blahblah", sentVariable);
		}
		
		public function returnTest():void
		{
			//testComm.phpVar1 = 
		}

		private function handleConnect(client:Client):void
		{
			trace("handling connection attempt");
			//Set developmentsever (Comment out to connect to your server online)
			client.multiplayer.developmentServer = "localhost:8184";

			//Create pr join the room test
			client.multiplayer.createJoinRoom("test", "MyCode", true, { }, { }, handleJoin, handleError);
		}

		private function handleJoin(connection:Connection):void
		{
			
			
			trace("Sucessfully connected to the multiplayer server");
			playerioserver.isConnected = true;
			
			testConnection = connection;

			//Add disconnect listener
			connection.addDisconnectHandler(handleDisconnect);

			//Add listener for messages of the type "hello"
			connection.addMessageHandler("hello", Hello);
			
			//Add listener for messages of the type "hello"
			connection.addMessageHandler("testrecieved", TestRecieved);

			//Add message listener for users joining the room
			connection.addMessageHandler("UserJoined", UserJoined);

			//Add message listener for users leaving the room
			connection.addMessageHandler("UserLeft", UserLeft);

			//Listen to all messages using a private function
			connection.addMessageHandler("*", handleMessages);
		}

		private function Hello(m:Message):void
		{
			trace("Recived a message with the type hello from the server");
		}

		private function TestRecieved(m:Message):void
		{
			trace("Test message Recieved from server");
			trace(m.getString(0));
			testComm.valueReturn(m.getString(0));
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