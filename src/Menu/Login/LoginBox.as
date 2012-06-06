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
		protected var loginShowing:Boolean = false;
		
		public var userInput:LineInputComm;
		public var passInput:LineInputComm;
		public var login:LoginButton;
		public var register:SmallButton;
		
		public var displayLoggedIn:SimpleText;
		public var displayNotLoggedIn:SimpleText;
		public var logout:LogoutButton;
		public var showLogin:ShowLoginButton;
		public var showCancel:ShowLoginButton;
		
		protected var xPos:int = 0;
		protected var yPos:int = 0;
		
		public function LoginBox(_xPos:int = 0, _yPos:int = 0) 
		{
			super ();
			
			xPos = _xPos;
			yPos = _yPos;
			
			trace("login loaded");
			
			displayLoggedIn = new SimpleText(xPos + 1, yPos + 1, "you are logged in as " + UserVariables.userName);
			displayNotLoggedIn = new SimpleText(xPos + 1, yPos + 1, "not logged in");
			showLogin = new ShowLoginButton(xPos + 15, yPos + 1, this, "login");
			showCancel = new ShowLoginButton(xPos + 15, yPos + 1, this, "cancel");
			logout = new LogoutButton(xPos + 15, yPos + 1, this);
			userInput = (new LineInputComm(xPos + 1, yPos + 1, "user"));
			passInput = (new LineInputComm(xPos + 1, yPos + 2, "pass"));
			login = (new LoginButton(xPos + 1, yPos + 3, "submit", userInput, passInput, this));
			register = (new SmallButton(xPos + 6, yPos + 3, "register", RegisterAccount));
			
		}
		
		public function LoginMessage(_message:String):void
		{
			trace(_message);
			world.add (new PopupBox(_message));
		}
		
		public function ShowLoginBox():void
		{
			if (loginShowing == false)
			{
				world.add (userInput);
				world.add (passInput);
				world.add (login);
				world.add (register);
				world.remove (showLogin);
				world.remove (displayNotLoggedIn);
				world.add (showCancel);
				
				loginShowing = true;
			}
			else
			{
				world.remove (userInput);
				world.remove (passInput);
				world.remove (login);
				world.remove (register);
				world.add (showLogin);
				world.add (displayNotLoggedIn);
				world.remove (showCancel);
				
				loginShowing = false;
			}
			
			
			
			
		}
		
		public function RemoveLogin():void
		{
			trace("login removed");
			world.remove (userInput);
			world.remove (passInput);
			world.remove (login);
			world.remove (register);
			displayLoggedIn = new SimpleText(xPos + 1, yPos + 1, "you are logged in as " + UserVariables.userName);
			logout = new LogoutButton(xPos + 15, yPos + 1, this);
			
			world.add (displayLoggedIn);
			world.add (logout);
			
			//world.remove (this);
		}
		
		public function RemoveLoggedIn():void
		{
			trace("loggedIn removed");
			world.remove (displayLoggedIn);
			world.remove (logout);
			displayLoggedIn = new SimpleText(xPos + 1, yPos + 1, "you are logged in as " + UserVariables.userName);
			logout = new LogoutButton(xPos + 15, yPos + 1, this);
			
			world.add (displayNotLoggedIn);
			world.add (showLogin);
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
				world.add (displayNotLoggedIn);
				world.add (showLogin);
			}
			
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}