package Menu.Character 
{
	import GameWorld.Level;
	import Menu.Login.LoginBox;
	import Menu.MainMenu;
	import UI.MenuButton;
	import net.flashpunk.World;
	import UI.PlayButton;
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
		
		public var newLeveL:Level;
		
		
		
		public function SelectCharacter(_newChar:Class = null) 
		{
			if (_newChar != null)
			{
				newLeveL = new Level(_newChar);
			}
			
			
			
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("create", 8, 9, false, CreateCharacter));
			add (new MenuButton("back", 2, 9, false, MainMenu));
			add (new PlayButton("play", 2, 9, true, newLeveL));
			
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