package Menu.Character 
{
	//import HUD.SpellButton;
	//import Levels.SpellSelect;
	//import Levels.TestLevel;
	import UI.Button;
	
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SelectCharacterButton extends Button 
	{
		protected var passedWorld:CreateCharacter;
		
		public function SelectCharacterButton(_text:String, _ypos:int, _passedWorld:CreateCharacter, _xpos:int) 
		{
			passedWorld = _passedWorld;
			
			this.text = _text;
			this.xpos = _xpos;
			this.ypos = _ypos;
			this.centered = false;
			this.smallButton = false;
			
			passedWorld = _passedWorld;
		}
		
		override public function onPress():void
		{
			passedWorld.SelectButtonPressed(passedWorld.selectedChar);
		}
	}
}