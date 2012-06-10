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
		public var numberOfChars:int = 3;
		
		protected var mageSelect:CharacterSelect;
		protected var rogueSelect:CharacterSelect;
		protected var warriorSelect:CharacterSelect;
		
		protected var selectedChar:Class;
		
		public function SelectCharacter() 
		{
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("create", 5, CreateCharacter, 5));
			add (new MenuButton("back", 5, MainMenu, 1));
			
			add (new SimpleText(1, 2, "Select Character:"));
			
/*			if (UserVariables.loggedIn == false) //if user is not logged in
			{
				add (new SimpleText(1, 4, "Login to access saved characters"));
				
			}
			else
			{*/
				add (new CharacterBox(1));
				add (new CharacterBox(2));
				add (new CharacterBox(3));
				add (new CharacterBox(4));
				add (new CharacterBox(5));
			//}
			
			
		}
		
		public function GenericButton():void
		{
			
		}
		
	}

}