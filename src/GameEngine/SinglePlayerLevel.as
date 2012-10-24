package GameWorld 
{
	import GameWorld.Characters.FriendlyHero;
	import GameWorld.Characters.Hero;
	import GameWorld.Characters.Unit;
	import GameWorld.Controllers.PlayerInputController;
	import GameWorld.HUD.ActionBar.ActionBar;
	import GameWorld.HUD.ActionBar.SpellButton;
	import GameWorld.Spells.SpellData;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SinglePlayerLevel extends World
	{
		public var playerInputController:PlayerInputController = new PlayerInputController;
		public var spellButtons:Array = new Array;
			
		public function SinglePlayerLevel(_char:Class) 
		{
			add (new MouseCursorEntity());
			
			//spawn spell buttons
			var i:Number = 0; 
			while (i <= 7)
			{
				var spellID:Number = i;
				var getSpellData:SpellData = new SpellData;
				
				spellButtons[i] = new SpellButton(getSpellData.loadData(i), i);
				
				add (spellButtons[i]);
				i++; 
			}
			
			add (playerInputController);
		}
		
		public function Test():void
		{
			trace("test function in level");
		}
	}

}