package Menu.Character 
{
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import UI.MenuButton;
	import net.flashpunk.World;
	import UI.SimpleText;
	import user.UserVariables;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class CreateCharacter extends World 
	{
		public var numberOfChars:int = 3; //used by Character selecter to determine spacing
		
		protected var mageSelect:CharacterSelecter;
		protected var rogueSelect:CharacterSelecter;
		protected var warriorSelect:CharacterSelecter;
		
		public var selectedChar:Class = null;
		
		protected var selectButton:CharacterButton;
		
		public function CreateCharacter() 
		{
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("back", 2, 9, false, SelectCharacter));
			
			add (new SimpleText(7, 2, "Create Character"));
			
			selectButton = new CharacterButton("select", 5, this, 5);
			
			mageSelect = new CharacterSelecter(GC.GFX_SELECT_MAGE, GC.TEXT_SELECT_MAGE, 1, this);
			rogueSelect = new CharacterSelecter(GC.GFX_SELECT_WANDERER, GC.TEXT_SELECT_WANDERER, 3, this);
			warriorSelect = new CharacterSelecter(GC.GFX_SELECT_WARRIOR, GC.TEXT_SELECT_WARRIOR, 2, this);
			
			add (mageSelect);
			add (rogueSelect);
			add (warriorSelect);
			add (selectButton);
		}
		
		public function Select(_selected:Class = null):void
		{
			selectedChar = _selected;
			trace (String(selectedChar));
		}
		
		public function SelectButtonPressed(_tempClass:Class):void
		{
			FP.world = new SelectCharacter(_tempClass);
		}
		
	}

}