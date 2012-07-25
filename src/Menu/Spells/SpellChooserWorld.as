package Menu.Spells 
{
	import GameWorld.Spells.BaseSpell;
	import GameWorld.Spells.GS;
	import GameWorld.Spells.Mage.Fireball;
	import UI.SimpleText;
	import GameWorld.Spells.SpellData;
	import GameWorld.Characters.Heroes.*;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellChooserWorld extends World 
	{
		public var spellHolder:Array = new Array;
		public var specChooser:Array = new Array;
		public var spellLoader:SpellData;
		public var mousecurser:MouseCursorEntity = new MouseCursorEntity();
		public static var thisWorld:SpellChooserWorld;
		
		public function SpellChooserWorld(_selectedClass:Class) 
		{
			thisWorld = this;
			
			add (mousecurser);
			
			//spawn spell buttons
			var i:int = 0; 
			while (i < 8)
			{
				spellHolder[i] = new SpellHolder(i);
				add (spellHolder[i]);
				i++; 
			}
			
			//spawn spec chooser
			i = 0;
			while (i < 3)
			{
				
				specChooser[i] = new SpecChooserButton(i, _selectedClass, this);
				add (specChooser[i]);
				i++;
			}
			//spawn spec chooser bg
			i = 0;
			while (i < 4)
			{
				add (new SpecChooserBG(i));
				i++;
			}
			
			//spawn spellChooser buttons
			if (_selectedClass == Mage.GFX_SELECT)
			{
				refreshChoosers(1);
			}
			if (_selectedClass == Warrior.GFX_SELECT)
			{
				refreshChoosers(4);
			}
			if (_selectedClass == Rogue.GFX_SELECT)
			{
				refreshChoosers(7);
			}
			
			
			//spawn chosen class display
			add (new SimpleText(0, 1, String(_selectedClass)));
		}
		
		public function chooseSpec(chosenSpec):void
		{
			
		}
		
		public function refreshChoosers(_chosenSpec:int):void
		{
			var refreshArray:Array = new Array;
			getClass (SpellChooserButton, refreshArray); //get all instances of spellchooser button, store them in refresh arrray
			var i:int = 0;
			var currentButton:SpellChooserButton = null;
			while (i < refreshArray.length)
			{
				currentButton = refreshArray[i];
				trace (currentButton.inHolder);
				if (currentButton.inHolder == false)
				{
					remove(currentButton);
				}
				i++;
			}
			refreshArray = null; //reset array
			
			var spellID:int;
			if (_chosenSpec == 1)  spellID = 0;
			if (_chosenSpec == 2)  spellID = 20;
			if (_chosenSpec == 3)  spellID = 40;
			if (_chosenSpec == 4)  spellID = 60;
			if (_chosenSpec == 5)  spellID = 80;
			if (_chosenSpec == 6)  spellID = 100;
			if (_chosenSpec == 7)  spellID = 120;
			if (_chosenSpec == 8)  spellID = 140;
			if (_chosenSpec == 9)  spellID = 160;
			
			var getSpellData:SpellData = new SpellData;
			while (spellID < 12)
			{
				add (new SpellChooserButton(getSpellData.loadData(spellID)));
				spellID++;
			}
		}
		
		//public function displaySpells():void;
		
	}

}