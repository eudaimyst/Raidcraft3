package Menu.Spells 
{
	import net.flashpunk.World;
	import UI.SimpleText;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellWorld extends World 
	{
		public var spellHolder:Array = new Array;
		public var specChooser:Array = new Array;
		
		public function SpellWorld(_selectedClass:Class) 
		{
			add (new MouseCursorEntity());
			
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
				
				specChooser[i] = new SpecChooserButton(i, _selectedClass);
				add (specChooser[i]);
				i++;
			}
			
			add (new SimpleText(1, 1, String(_selectedClass)));
		}
		
	}

}