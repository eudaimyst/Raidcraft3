package Menu.Character 
{
	import GameEngine.Characters.Heroes.*;
	import Menu.Lobby.LobbyMenu;
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import Menu.Spells.SpellChooserWorld;
	import UI.MenuButton;
	import net.flashpunk.World;
	import UI.SimpleText;
	import user.UserCharacter;
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
			//add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("back", 2, 9, false, MainMenu));
			
			add (new SimpleText(7, 2, "Choose Character"));
			
			selectButton = new SelectCharacterButton("play", 9, this, 8);
			
			mageSelect = new NewCharacterChooser(Mage.GFX_SELECT, Mage.TEXT_SELECT, 1, this);
			rogueSelect = new NewCharacterChooser(Rogue.GFX_SELECT, Rogue.TEXT_SELECT, 3, this);
			warriorSelect = new NewCharacterChooser(Warrior.GFX_SELECT, Warrior.TEXT_SELECT, 2, this);
			
			add (mageSelect);
			add (rogueSelect);
			add (warriorSelect);
			
		}
		
		public function Select(_selected:Class = null):void //called by new character chooser when a class is selected
		{
			selectedChar = _selected;
			trace (String(selectedChar));
			
		}
		
		override public function update():void
		{
			if (selectedChar == null)
			{
				
			}
			else
			{
				add (selectButton);
			}
			super.update();
		}
		
		public function SelectButtonPressed(_tempClass:Class):void //when a character is chosen
		{
			UserCharacter.charClass = _tempClass;
			UserVariables.newCharClass = _tempClass;
			//FP.world = new SelectCharacter(_tempClass);
			FP.world = new LobbyMenu();
		}
		
	}

}