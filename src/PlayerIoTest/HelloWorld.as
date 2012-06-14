package PlayerIoTest 
{
	import flash.display.MovieClip
	import net.playerio.* // Needed to use PlayerIO functions
	import net.flashpunk.FP
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HelloWorld extends MovieClip
	{
		protected var gameID:String = "raidcraft-xtvo0f290cfdaf48sewrq"
		
		public function HelloWorld():void
		{
			stop();
			PlayerIO.connect(FP.stage, gameID, "public", "Guest", "", "", handleConnect, handleError);
		}
		
		private function handleConnect(client:Client):void
		{
			trace("Sucessfully connected to player.io");
			
			//Set developmentsever (Comment out to connect to your server online)
			client.multiplayer.developmentServer = "localhost:8184";
			
			//Create pr join the room test
			client.multiplayer.createJoinRoom(
				"test",								//Room id. If set to null a random roomid is used
				"MyCode",							//The game type started on the server
				true,								//Should the room be visible in the lobby?
				{},									//Room data. This data is returned to lobby list. Variabels can be modifed on the server
				{},									//User join data
				handleJoin,							//Function executed on successful joining of the room
				handleError							//Function executed if we got a join error
			);
		}
		
		
		private function handleJoin(connection:Connection):void
		{
			trace("Sucessfully connected to the multiplayer server");
			
			//Add disconnect listener
			connection.addDisconnectHandler(handleDisconnect);
					
			//Add listener for messages of the type "hello"
			connection.addMessageHandler("hello", function(m:Message){
				trace("Recived a message with the type hello from the server");			 
			})
			
			//Add message listener for users joining the room
			connection.addMessageHandler("UserJoined", function(m:Message, userid:uint){
				trace("Player with the userid", userid, "just joined the room");
			})
			
			//Add message listener for users leaving the room
			connection.addMessageHandler("UserLeft", function(m:Message, userid:uint){
				trace("Player with the userid", userid, "just left the room");
			})
			
			//Listen to all messages using a private function
			connection.addMessageHandler("*", handleMessages)
		}
		
		private function handleMessages(m:Message):void
		{
			trace("Recived the message", m)
		}
		
		private function handleDisconnect():void
		{
			trace("Disconnected from server")
		}
		
		private function handleError(error:PlayerIOError):void
		{
			trace("got",error)
		}
		
	}

}










