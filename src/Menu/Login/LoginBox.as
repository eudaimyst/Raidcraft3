package Menu.Login 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import UI.*
	import Menu.*
	import user.UserVariables;
	import user.variables;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LoginBox extends Entity 
	{
		//create variables to hold the instances of the username and password inputs
		public var userInput:LineInputComm;
		public var passInput:LineInputComm;
		public var login:LoginButton;
		public var register:SmallButton;
		
		public var displayLoggedIn:SimpleText;
		public var logout:LogoutButton;
		
		public function LoginBox() 
		{
			super ();
			
			
			
			trace("login loaded");
			
			displayLoggedIn = new SimpleText(1, 1, "you are logged in as " + UserVariables.userName);
			logout = new LogoutButton(15, 1, this);
			userInput = (new LineInputComm(1, 1, "user"));
			passInput = (new LineInputComm(1, 2, "pass"));
			login = (new LoginButton(1, 3, "login", userInput, passInput, this));
			register = (new SmallButton(6, 3, "register", RegisterAccount));
			
		}
		
		public function LoginMessage(_message:String):void
		{
			trace(_message);
			world.add (new PopupBox(_message));
		}
		
		public function RemoveLogin():void
		{
			trace("login removed");
			world.remove (userInput);
			world.remove (passInput);
			world.remove (login);
			world.remove (register);
			displayLoggedIn = new SimpleText(1, 1, "you are logged in as " + UserVariables.userName);
			logout = new LogoutButton(15, 1, this);
			
			world.add (displayLoggedIn);
			world.add (logout);
			
			//world.remove (this);
		}
		
		public function RemoveLoggedIn():void
		{
			trace("loggedIn removed");
			world.remove (displayLoggedIn);
			world.remove (logout);
			displayLoggedIn = new SimpleText(1, 1, "you are logged in as " + UserVariables.userName);
			logout = new LogoutButton(15, 1, this);
			
			world.add (userInput);
			world.add (passInput);
			world.add (login);
			world.add (register);
			
			//world.remove (this);
		}
		
		override public function added():void
		{
			if (UserVariables.loggedIn == true) //if user is logged in
			{
				world.add (displayLoggedIn);
				world.add (logout);
			}
			else
			{
				world.add (userInput);
				world.add (passInput);
				world.add (login);
				world.add (register);
			}
			
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}