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
		
		public function CreateCharacter() 
		{
			add (new LoginBox());
			add (new MouseCursorEntity());
			add (new MenuButton("back", 5, MainMenu));
			
			add (new SimpleText(7, 2, "Create Character"));
			
		}
		
	}

}