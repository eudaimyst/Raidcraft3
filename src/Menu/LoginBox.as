package Menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import UI.*
	import Menu.*
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
		
		public function LoginBox() 
		{
			super ();
			
			trace("login loaded");
			
			userInput = (new LineInputComm(1, 1, "user"));
			passInput = (new LineInputComm(1, 2, "pass"));
			login = (new LoginButton(1, 3, "login",userInput,passInput, this));
		}
		
		public function LoginMessage(_message:String):void
		{
			trace(_message);
			world.add (new PopupBox(_message));
		}
		
		override public function added():void
		{
			world.add (userInput);
			world.add (passInput);
			world.add (login);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}