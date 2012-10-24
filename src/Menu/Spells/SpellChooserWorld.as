package Menu.Spells 
{
	import GameEngine.Spells.BaseSpell;
	import GameEngine.Spells.GS;
	import UI.SimpleText;
	import GameEngine.Spells.SpellData;
	import GameEngine.Characters.Heroes.*;
	import net.flashpunk.World;
	import UI.MenuButton;
	import Menu.Character.SelectCharacter;
	import user.UserVariables;
	
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
		
		public static var chosenSpells:Array = new Array;
		
		public function SpellChooserWorld(_selectedClass:Class) 
		{
			thisWorld = this;
			
			add (mousecurser);
			
			//spawn spell holders
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
				UserVariables.newCharClass = Mage;
				
			}
			if (_selectedClass == Warrior.GFX_SELECT)
			{
				refreshChoosers(4);
				UserVariables.newCharClass = Warrior;
			}
			if (_selectedClass == Rogue.GFX_SELECT)
			{
				refreshChoosers(7);
				UserVariables.newCharClass = Rogue;
			}
			
			
			//spawn chosen class display
			add (new SimpleText(0, 1, String(_selectedClass)));
			
			add (new MenuButton("save", 8.5, 9, false, SelectCharacter, false, UserVariables.newCharClass));
		}
		
		public function refreshChoosers(_chosenSpec:int):void
		{
			var choosersArray:Array = new Array;
			var remnantsArray:Array = new Array;
			getClass (SpellChooserButton, choosersArray); //get all instances of spellchooser button, store them in choosersArray
			getClass (SpellChooserRemnant, remnantsArray); //get all instances of spellchooser button, store them in remnantsArray
			var i:int = 0;
			var currentButton:SpellChooserButton;
			var currentRemnant:SpellChooserRemnant;
			while (i < remnantsArray.length)
			{
				currentRemnant = remnantsArray[i];
				remove(currentRemnant);
				i++;
			}
			i = 0;
			while (i < choosersArray.length)
			{
				currentButton = choosersArray[i];
				if (currentButton.inHolder == false)
				{
					remove(currentButton);
				}
				remove(currentRemnant);
				i++;
			}
			choosersArray = null; //reset arrays
			remnantsArray = null;
			
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
			var spellID2:Number = spellID; //temporary variable for while loop only
			while (spellID < spellID2 + 12) //spawn chooser buttons
			{
				add (new SpellChooserRemnant(getSpellData.loadData(spellID)));
				add (new SpellChooserButton(getSpellData.loadData(spellID)));
				spellID++;
			}
		}
		
		//public function displaySpells():void;
		
	}

}