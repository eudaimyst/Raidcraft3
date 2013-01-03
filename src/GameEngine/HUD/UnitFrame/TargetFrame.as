package GameEngine.HUD.UnitFrame 
{
	import GameEngine.Characters.Unit;
	import GameEngine.HUD.HUDElement;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class TargetFrame extends HUDElement 
	{
		protected var currentHealthBar:Image;
		protected var currentPowerBar:Image;
		protected var maxHealthBar:Image;
		protected var maxPowerBar:Image;
		protected var maxHealthText:Text = new Text("");
		protected var maxPowerText:Text = new Text("");
		protected var unitNameText:Text = new Text("");
		
		protected var graphiclist:Graphiclist;
		protected var targettedGraphiclist:Graphiclist;
		
		public function TargetFrame() 
		{
			trace("targetFrame loaded")
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
			
			//maxHealthText = new Text(String(_hero.maxHealth), 225, 20);
			//maxPowerText = new Text(String(_hero.maxPower), 225, 50);
			
			graphiclist = new Graphiclist();
			graphic = graphiclist;
		}
		
		public function setTarget(_target:Unit):void
		{
			currentHealthBar.scaleX = _target.health / _target.maxHealth;
			currentPowerBar.scaleX = _target.power / _target.maxPower;
			maxHealthText = new Text(String(_target.health), 0, 20);
			maxPowerText = new Text(String(_target.power), 0, 50);
			unitNameText = new Text(String(_target.unitName), 20, 75);
			maxHealthText.x = 20 - maxHealthText.width;
			maxPowerText.x = 20 - maxPowerText.width;
			x = FP.width - 240;
			trace("target set ", _target.maxHealth, _target.maxPower);
			targettedGraphiclist = new Graphiclist(maxHealthBar, maxPowerBar, currentHealthBar, currentPowerBar, maxHealthText, maxPowerText, unitNameText);
			graphic = targettedGraphiclist;
			
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
		
		public function removeTarget():void
		{
			
			graphic = graphiclist
		}
		
		
	}

}