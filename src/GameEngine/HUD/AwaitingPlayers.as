package GameEngine.HUD 
{
	import GameEngine.GameWorld;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author ...
	 */
	public class AwaitingPlayers extends HUDElementNoScroll 
	{
		protected var background:Image;
		protected var backgroundText:Image;
		protected var button:Image
		protected var buttonText:Image;
		
		protected var graphicList:Graphiclist;
		
		private var gameWorld:GameWorld;
		public function AwaitingPlayers(_gameWorld:GameWorld) 
		{
			gameWorld = _gameWorld;
			background = Image.createRect(320, 140, 0x000000, 1)
			background.x = FP.halfWidth - 160;
			background.y = FP.halfHeight - 70;
			backgroundText = new Text("Awaiting Players", FP.halfWidth - 150, FP.halfHeight - 60)
			
			buttonText = new Text("Just go", background.x + background.width - 20, background.y + background.height - 20);
			buttonText.y -= buttonText.height;
			buttonText.x -= buttonText.width;
			button = Image.createRect(buttonText.width + 10, buttonText.height + 10, 0x444444, 1);
			button.x = buttonText.x - 5;
			button.y = buttonText.y - 5;
			
			graphicList = new Graphiclist(background, backgroundText, button, buttonText);
			graphic = graphicList;
			
			setHitboxTo(button);
		}
		
		
		
		override public function update():void
		{
			
			if (Input.mousePressed)
			{
				
				if (this.collide("mouse collision", x, y))
				{
				//trace("mouse colliding with enemy");
					gameWorld.StartLevel();
					FP.world.remove(this);
				}
			}
			super.update();
		}
		
	}

}