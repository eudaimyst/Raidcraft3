package Menu.Character 
{
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import Menu.MenuButton;
	import net.flashpunk.World;
	import UI.SimpleText;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CreateCharacter extends World 
	{
		public var numberOfChars:int = 3;
		
		protected var mageSelect:CharacterSelect;
		protected var rogueSelect:CharacterSelect;
		protected var warriorSelect:CharacterSelect;
		
		protected var selectedChar:Class;
		
		protected var selectButton:MenuButton;
		
		public function CreateCharacter() 
		{
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("back", 5, SelectCharacter, 1));
			
			add (new SimpleText(7, 2, "Create Character"));
			
			selectButton = new MenuButton("select", 5, SelectCharacter, 5);
			
			mageSelect = new CharacterSelect(GC.GFX_SELECT_MAGE, GC.TEXT_SELECT_MAGE, 1, this);
			rogueSelect = new CharacterSelect(GC.GFX_SELECT_WANDERER, GC.TEXT_SELECT_WANDERER, 3, this);
			warriorSelect = new CharacterSelect(GC.GFX_SELECT_WARRIOR, GC.TEXT_SELECT_WARRIOR, 2, this);
			
			add (mageSelect);
			add (rogueSelect);
			add (warriorSelect);
		}
		
		public function Select(_selected:Class):void
		{
			selectedChar = _selected;
			add (selectButton);
			
			if (_selected == GC.GFX_SELECT_MAGE)
			{
				trace("mage selected");
			}
			if (_selected == GC.GFX_SELECT_WANDERER)
			{
				trace("wanderer selected");
			}
			if (_selected == GC.GFX_SELECT_WARRIOR)
			{
				trace("warrior selected");
			}
		}
		
	}

}