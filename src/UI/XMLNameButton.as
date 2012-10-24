package UI 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	import flash.net.SharedObject;
	import net.flashpunk.FP;
	import user.UserVariables
	 
	public class XMLNameButton extends Button 
	{
		public var sharedOBJ:SharedObject;
		
		protected var selectedWorld:Class;
		protected var classtoPass:Class;
		
		protected var attachedInput:LineInputComm;
		/**
		 * Constructor. Can be used to create a hoverable button.
		 * @param	_text		text to display on button.
		 * @param	_xpos		xpos to display entity in 1/10ths of screen size.
		 * @param	_ypos		ypos to display entity in 1/10ths of screen size.
		 * @param	_centered	should button be centered on x-axis.
		 * @param	_small		should the button use a small graphic?
		 * @param	_attachedInput attached input text box
		 */
		public function XMLNameButton(_text:String = "", _xpos:int = 3, _ypos:int = 1, _centered:Boolean = false, _small:Boolean = false, _attachedInput:LineInputComm = null) 
		{
			sharedOBJ = SharedObject.getLocal("playerName");
			
			attachedInput = _attachedInput;
			
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = _centered;
			this.smallButton = _small;
		}
		
		override public function onPress():void
		{
			trace("name save button pressed");
			//trace (attachedInput.textGraphic.text);
			
			var options:XML = <options></options>; //defines the options tag that contains all the options
			var attachedUser:XML = <user/> //defines the user tag that contains all the users options
			attachedUser.@name = attachedInput.textGraphic.text; //sets the name attribute of the user tag to the attachedInput text
			options.appendChild(attachedUser); //sets the user tag to be a child of the options tag
			trace(options); //traces the result
			
			//saved shared object
			sharedOBJ.data.optionsXML = options; //saves the options tag to the shared object defined above
			sharedOBJ.flush(); //ensures data is saved
			
			UserVariables.userName = attachedInput.textGraphic.text;
		}
		
	}

}