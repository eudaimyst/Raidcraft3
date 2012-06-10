package Menu.Character 
{
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import Menu.MenuButton;
	import net.flashpunk.World;
	import UI.SimpleText;
	import user.UserVariables;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SelectCharacter extends World 
	{
		public static var selectedChar:Class
		
		protected var numOfChars:int = 0;
		
		protected var mageSelect:CharacterSelecter;
		protected var rogueSelect:CharacterSelecter;
		protected var warriorSelect:CharacterSelecter;
		
		
		
		public function SelectCharacter(_newChar:Class = null) 
		{

			
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("create", 5, CreateCharacter, 5));
			add (new MenuButton("back", 5, MainMenu, 1));
			
			add (new SimpleText(1, 2, "Select Character:"));
			
			if (UserVariables.loggedIn == false && _newChar == null) //if user is not logged in
			{
				add (new SimpleText(1, 4, "Login to access saved characters"));
				
			}
			if (UserVariables.loggedIn == true)
			{
				AddCharacter(GC.GFX_SELECT_MAGE);
				AddCharacter(GC.GFX_SELECT_MAGE);
				AddCharacter(GC.GFX_SELECT_WARRIOR);
			}
			
			if (_newChar != null)
			{
				AddCharacter(_newChar);
			}
		}
		
		public function AddCharacter(_class:Class):void
		{
			add (new CharacterBox(numOfChars + 1, _class));
			numOfChars += 1;
		}
		
		public function GenericButton():void
		{
			
		}
		
	}

}