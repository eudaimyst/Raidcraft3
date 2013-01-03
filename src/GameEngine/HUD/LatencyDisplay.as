package GameEngine.HUD 
{
	import GameEngine.Controllers.NetworkController;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author ...
	 */
	public class LatencyDisplay extends HUDElement 
	{
		private var latency:Number = 0;
		private var graphicList:Graphiclist;
		private var textGraphic:Text;
		
		private var timeSinceUpdate:Number = 0;
		
		private var updateRequested:Boolean;
		
		private var networkController:NetworkController;
		
		public function LatencyDisplay(_networkController:NetworkController) 
		{
			networkController = _networkController;
			textGraphic = new Text(String(latency) + "ms");
			graphicList = new Graphiclist(textGraphic);
			graphic = graphicList;
			x = FP.width - textGraphic.width;
			y = FP.height - textGraphic.height;
		}
		
		public function RequestUpdate():void
		{
			trace("ping requested");
			networkController.ping(this);
		}
		
		public function RecieveUpdate():void
		{
			trace("pong recieved");
			trace("latency = ", Math.round((timeSinceUpdate - 3) * 1000));
			latency = Math.round((timeSinceUpdate - 3) * 1000);
			textGraphic.text = (String(latency) + "ms");
			graphic = graphicList;
			x = FP.width - textGraphic.width;
			y = FP.height - textGraphic.height;
			
			timeSinceUpdate = 0;
			updateRequested = false
		}
		
		override public function update():void
		{
			timeSinceUpdate += FP.elapsed;
			
			if (timeSinceUpdate > 3)
			{
				if (updateRequested == false)
				{
					updateRequested = true;
					RequestUpdate();
				}
			}
			
			super.update();
			
		}
		
	}

}