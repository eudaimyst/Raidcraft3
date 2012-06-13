package Menu.Login 
{
	import net.php.phpComm;
	import net.php.phpLogin;
	import UI.Button;
	import UI.LineInputComm;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class LoginButton extends Button 
	{
		protected var attachedUserInput:LineInputComm;
		protected var attachedPassInput:LineInputComm;
		public var loginBox:LoginBox;
		protected var loginInstance:phpLogin;
		public var result:String = "boo";
		
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_text		text to display on button.
		 * @param	_userInput	username LineInputComm
		 * @param	_passInput	password LineInputComm
		 * @param	_loginBox	loginBox this button belongs to
		 */
		public function LoginButton(_xpos:int, _ypos:int, _text:String, _userInput:LineInputComm, _passInput:LineInputComm, _loginBox:LoginBox)
		{
			
			attachedUserInput = _userInput;
			attachedPassInput = _passInput;
			loginBox = _loginBox;
			
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = false;
			this.smallButton = true;
		}
		override public function onPress():void
		{
			loginInstance = new phpLogin(); //create new phpComm instance
			loginInstance.getphp(attachedUserInput.textGraphic.text, attachedPassInput.textGraphic.text, this); //run phpLogin.getphp with attached lineinput instance's textGraphic.text value
		}
		
		public function setresult():void //this is called from phpComm
		{
			trace("result set from phpComm");
		}
		
		
	}

}