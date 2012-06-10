package Menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.php.*;
	import UI.*;
	/**
	 * ...
	 * @author skipgamer
	 */
	public class RegisterButton extends Entity 
	{
		protected var buttonText:Text;
		protected var button:Image;
		protected var buttonHover:Image;
		protected var buttonGraphicList:Graphiclist;
		protected var isHover:Boolean;
		protected var selectedWorld:Class;
		
		protected var attachedUserInput:LineInputComm;
		protected var attachedPassInput:LineInputComm;
		protected var attachedPassConfirmInput:LineInputComm;
		protected var attachedEmailInput:LineInputComm;
		
		//protected var attachedText:SimpleText;
		
		protected var loginInstance:phpRegister;
		
		public var result:String = "boo";
		
		
		public function RegisterButton(xPos:int, yPos:int, text:String, _userInput:LineInputComm, _passInput:LineInputComm, _passConfirmInput:LineInputComm, _emailInput:LineInputComm) 
		{
			
			attachedUserInput = _userInput;
			attachedPassInput = _passInput;
			attachedPassConfirmInput = _passConfirmInput;
			attachedEmailInput = _emailInput;
			
			
			
			//define button text and button graphic
			button = new Image(GC.GFX_LOGIN_BUTTON);
			buttonText = new Text(text);
			buttonHover = new Image(GC.GFX_LOGIN_BUTTON_HOVER);
			
			//draw button text and button graphic
			buttonGraphicList = new Graphiclist(button, buttonText);
			
			//position button text and graphic scale
			
			button.scale = 2;
			buttonHover.scale = 2;
			
			buttonText.color = 0x111111;
			buttonText.size = 14;
			buttonText.x = button.scaledWidth / 2 - buttonText.textWidth / 2;
			buttonText.y = button.scaledHeight / 2 - buttonText.textHeight / 2;
			
			
			// draw graphics and text
			graphic = Graphiclist(buttonGraphicList);
			
			// position this entity
			this.x = FP.width/20 * xPos;
			this.y = FP.width/20 * yPos;
			
			//set hitbox for entity (to the dimensions of the button graphic)
			this.setHitbox(button.scaledWidth, button.scaledHeight);
			
		}
		
		public function PopupMessage(_message:String):void
		{
			world.add (new PopupBox(_message));
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false) {graphic = new Graphiclist(buttonHover, buttonText); trace("changed to hover true");}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					
					loginInstance = new phpRegister(); //create new phpRegister instance
					loginInstance.getphp(attachedUserInput.textGraphic.text, attachedPassInput.textGraphic.text, attachedPassConfirmInput.textGraphic.text, attachedEmailInput.textGraphic.text, this); //run phpLogin.getphp with attached lineinput instance's textGraphic.text value
					
					//trace (attachedInput.textGraphic.text);
					
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true) {graphic = new Graphiclist(button, buttonText); trace("changed to hover false");}
				isHover = false;
			}
		}
		
		
		public function setresult():void //this is called from phpComm
		{
			trace("result set from phpComm");
			//trace (communicationInstance.phpVar1);
			//trace(attachedText.text, communicationInstance.phpVar1)
			//attachedText.text = communicationInstance.phpVar1;
			//trace(communicationInstance.phpVar1);
		}
		
		
	}

}