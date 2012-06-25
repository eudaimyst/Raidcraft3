package Menu.Character 
{
	import GameWorld.Characters.Heroes.*;
	import GameWorld.Level;
	import Menu.Lobby.LobbyMenu;
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import UI.MenuButton;
	import net.flashpunk.World;
	import UI.PlayButton;
	import UI.SimpleText;
	import user.UserCharacter;
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SelectCharacter extends World 
	{
		public static var selectedChar:Class
		
		protected var numOfChars:int = 0;
		
		protected var mageSelect:NewCharacterChooser;
		protected var rogueSelect:NewCharacterChooser;
		protected var warriorSelect:NewCharacterChooser;
		
		public function SelectCharacter(_newChar:Class = null) 
		{
			
			
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("create", 8, 9, false, CreateCharacter));
			add (new MenuButton("back", 2, 9, false, MainMenu));
			add (new MenuButton("play", 2, 9, true, LobbyMenu));
			
			add (new SimpleText(1, 2, "Select Character:"));
			
			if (UserVariables.loggedIn == false && _newChar == null) //if user is not logged in
			{
				add (new SimpleText(1, 4, "Login to access saved characters"));
				
			}
			if (UserVariables.loggedIn == true)
			{
				AddCharacter(Mage.GFX_SELECT);
				AddCharacter(Warrior.GFX_SELECT);
				AddCharacter(Rogue.GFX_SELECT);
			}
			
			if (_newChar != null)
			{
				if (_newChar == Mage.GFX_SELECT)
				{
					trace ("magemagemage");
					UserCharacter.charClass = Mage;
				}
				if (_newChar == Warrior.GFX_SELECT)
				{
					trace ("warriorwarrior");
					UserCharacter.charClass = Warrior;
				}
				if (_newChar == Rogue.GFX_SELECT)
				{
					trace ("rogueogueogue");
					UserCharacter.charClass = Rogue;
				}
				AddCharacter(_newChar);
			}
		}
		
		public function AddCharacter(_class:Class):void
		{
			add (new CharacterBox(numOfChars + 1, _class));
			numOfChars += 1;
		}
		
	}

}