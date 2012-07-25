package Menu.Character 
{
	import GameWorld.Characters.Heroes.*;
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import Menu.Spells.SpellChooserWorld;
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
		public var numberOfChars:int = 4; //used by Character selecter to determine spacing
		
		protected var mageSelect:NewCharacterChooser;
		protected var rogueSelect:NewCharacterChooser;
		protected var warriorSelect:NewCharacterChooser;
		
		public var selectedChar:Class = null;
		
		protected var selectButton:SelectCharacterButton;
		
		public function CreateCharacter() 
		{
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("back", 2, 9, false, SelectCharacter));
			
			add (new SimpleText(7, 2, "Create Character"));
			
			selectButton = new SelectCharacterButton("select", 9, this, 8);
			
			mageSelect = new NewCharacterChooser(Mage.GFX_SELECT, Mage.TEXT_SELECT, 1, this);
			rogueSelect = new NewCharacterChooser(Rogue.GFX_SELECT, Rogue.TEXT_SELECT, 3, this);
			warriorSelect = new NewCharacterChooser(Warrior.GFX_SELECT, Warrior.TEXT_SELECT, 2, this);
			
			add (mageSelect);
			add (rogueSelect);
			add (warriorSelect);
			add (selectButton);
		}
		
		public function Select(_selected:Class = null):void //whats this called by?
		{
			selectedChar = _selected;
			trace (String(selectedChar));
		}
		
		public function SelectButtonPressed(_tempClass:Class):void //when a character is chosen
		{
			FP.world = new SpellChooserWorld(_tempClass);
			//FP.world = new SelectCharacter(_tempClass);
		}
		
	}

}