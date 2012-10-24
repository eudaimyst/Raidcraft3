package GameEngine.HUD.UnitFrame 
{
	import GameEngine.Characters.Hero;
	import GameEngine.HUD.HUDElement;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class PlayerFrame extends HUDElement 
	{
		protected var currentHealthBar:Image;
		protected var currentPowerBar:Image;
		protected var maxHealthBar:Image;
		protected var maxPowerBar:Image;
		protected var maxHealthText:Text;
		protected var maxPowerText:Text;
		
		protected var graphiclist:Graphiclist;
		
		public function PlayerFrame(_hero:Hero) 
		{
			trace("playerFrame loaded" + _hero.maxHealth)
			maxHealthBar = Image.createRect(200, 20, 0xBB0000, 1);
			maxPowerBar = Image.createRect(200, 20, 0x0000BB, 1);
			currentHealthBar = Image.createRect(200, 20, 0xFF0000, 1);
			currentPowerBar = Image.createRect(200, 20, 0x0000FF, 1);
			
			maxHealthBar.x = 20;
			maxPowerBar.x = 20;
			currentHealthBar.x = 20;
			currentPowerBar.x = 20;
			maxHealthBar.y = 20;
			maxPowerBar.y = 50;
			currentHealthBar.y = 20;
			currentPowerBar.y = 50;
			
			maxHealthText = new Text(String(_hero.maxHealth), 225, 20);
			maxPowerText = new Text(String(_hero.maxPower), 225, 50);
			
			graphiclist = new Graphiclist(maxHealthBar, maxPowerBar, currentHealthBar, currentPowerBar, maxHealthText, maxPowerText);
			
			graphic = graphiclist;
		}
		
	}

}