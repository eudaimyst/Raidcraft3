package PlayerIoTest 
{
	import flash.display.Stage;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import playerio.* // Needed to use PlayerIO functions
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class HelloWorldEntity extends Entity 
	{
		protected var gameID:String = "raidcraft-xtvo0f290cfdaf48sewrq";
		protected var gameStage:Stage;
		public var debugText:Text;
		
		
		public function HelloWorldEntity() 
		{
			debugText = new Text("debug");
			graphic = (new Graphiclist(debugText));
			this.x = 400;
		}
		
		private function ConnectWithPlayerIO(gameID:String, userName:String, userAuth:String = "", connectionID:String = "public"):void
		{
			PlayerIO.connect(FP.stage, gameID, connectionID, userName, userAuth, "", OnSuccessfulConnection, OnFailedConnection);
		}
		
		private function OnSuccessfulConnection(client:Client):void
		{
			trace("Connected to Player.IO");
		}
		
		private function OnFailedConnection(error:PlayerIOError):void
		{
			trace("An error has occurred:", error);
		}
		
		override public function added():void
		{
			ConnectWithPlayerIO("raidcraft-xtvo0f290cfdaf48sewrq", "RichardMarks");
			
			super.added();
		}
		
		
	}

}