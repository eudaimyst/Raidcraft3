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
		
		public function HelloWorldEntity():void
		{
			
		}
		
		override public function added():void
		{
			PlayerIO.connect(FP.stage, gameID, "public", "Guest", "", "", handleConnect, handleError);
		}

		private function handleConnect(client:Client):void
		{
			trace("Sucessfully connected to player.io");

			//Set developmentsever (Comment out to connect to your server online)
			client.multiplayer.developmentServer = "localhost:8184";

			//Create pr join the room test
			client.multiplayer.createJoinRoom("test", "MyCode", true, { }, { }, handleJoin, handleError);
		}

		private function handleJoin(connection:Connection):void
		{
			trace("Sucessfully connected to the multiplayer server");

			//Add disconnect listener
			connection.addDisconnectHandler(handleDisconnect);

			//Add listener for messages of the type "hello"
			connection.addMessageHandler("hello", Hello);

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
			trace("Recived the message", m);
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