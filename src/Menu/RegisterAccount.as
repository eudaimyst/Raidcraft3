package Menu 
{
	import net.flashpunk.World;
	import UI.*;
	import Menu.*;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class RegisterAccount extends World 
	{
		public var userInput:LineInputComm;
		public var passInput:LineInputComm;
		public var passConfirmInput:LineInputComm;
		public var emailInput:LineInputComm;
		public var register:RegisterButton;
		
		
		public function RegisterAccount() 
		{
			add (new MenuButton("exit", 1, 5, true, MainMenu));
			
			userInput = (new LineInputComm(1, 1, "username"));
			passInput = (new LineInputComm(1, 2, "password"));
			passConfirmInput = (new LineInputComm(1, 3, "confirm password"));
			emailInput = (new LineInputComm(1, 4, "email"));
			register = (new RegisterButton(1, 5, "register", userInput, passInput, passConfirmInput, emailInput));
			
			add (userInput);
			add (passInput);
			add (passConfirmInput);
			add (emailInput);
			add (register);
			
			add (new MouseCursorEntity());
		}
			
	}
	
}