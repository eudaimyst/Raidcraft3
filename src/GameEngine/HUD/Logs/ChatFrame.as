package GameEngine.HUD.Logs
{
	import GameEngine.GameWorld;
	import GameEngine.HUD.HUDElementNoScroll;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ChatFrame extends HUDElementNoScroll
	{
		protected var background:Image;
		protected var inputBackground:Image;
		
		protected var graphicList:Graphiclist;
		protected var activeGraphicList:Graphiclist;
		
		protected var firstActiveFrame:Boolean = false;
		protected var inputActiveVar:Boolean = false;
		
		protected var _text:String = "";
		protected var textGraphic:Text = new Text("");
		
		protected var gameWorld:GameWorld;
		
		protected var messagesRecieved:int = 0;
		protected var newMessages:Array = new Array;
		
		public function ChatFrame(_gameWorld:GameWorld)
		{
			gameWorld = _gameWorld;
			
			background = Image.createRect(320, 140, 0x000000, .3)
			background.x = 20;
			background.y = FP.height - 230;
			
			inputBackground = Image.createRect(310, 25, 0x000000, .4)
			inputBackground.x = 25;
			inputBackground.y = FP.height - 120;
			
			textGraphic.x = inputBackground.x;
			textGraphic.y = inputBackground.y;
			
			graphicList = new Graphiclist(background, inputBackground);
			activeGraphicList = new Graphiclist(background, inputBackground, textGraphic);
			graphic = graphicList;
			
			setHitboxTo(inputBackground);
		}
		
		public function recieveChat(_text:String, _name:String):void
		{
			messagesRecieved += 1;
			var newText:Text = new Text(_name + ": " + _text);
			trace("num of chat msgs recieved:", messagesRecieved);
			newMessages[messagesRecieved] = newText;
			var i:int = 1;
			graphicList = new Graphiclist(background, inputBackground);
			activeGraphicList = new Graphiclist(background, inputBackground, textGraphic);
			while (i <= messagesRecieved)
			{
				if (messagesRecieved >= 5)
				{
					var messagesToIgnore:int = messagesRecieved - 4;
				}
				if (i < messagesToIgnore)
				{
					//do nothing
				}
				else
				{
					var _newText:Text = newMessages[i];
					_newText.y = inputBackground.y + (_newText.height * i) - _newText.height * newMessages.length;
					_newText.x = inputBackground.x;
					graphicList.add(newMessages[i]);
					activeGraphicList.add(newMessages[i]);
					graphic = graphicList;
				}
				i++
			}
		
		}
		
		public function inputActive():void
		{
			gameWorld.playerInputController.DisableInput();
			text = "";
			_text = "";
			inputActiveVar = true;
			firstActiveFrame = true;
			inputBackground.alpha = 1;
			graphic = activeGraphicList;
			trace("chat input active");
		
		}
		
		public function inputInactive():void
		{
			gameWorld.playerInputController.EnableInput();
			graphic = graphicList;
			inputBackground.alpha = .4;
			inputActiveVar = false;
		}
		
		public function get text():String
		{
			return _text;
		}
		
		public function set text(value:String):void
		{
			_text = value;
			textGraphic.text = value;
		}
		
		override public function update():void
		{
			x = FP.camera.x;
			y = FP.camera.y;
			
			if (inputActiveVar == true)
			{
				//capture text
				if (firstActiveFrame == true)
				{
					firstActiveFrame = false;
					Input.keyString = "";
				}
				text += Input.keyString;
				Input.keyString = "";
				
				if (Input.pressed(Key.BACKSPACE))
				{
					trace("reduce text by 1");
					text = text.substr(0, _text.length - 1);
						//activeFlash.x = labelText.scaledWidth + 5 + textGraphic.textWidth;
						//graphic = activeGraphicList;
				}
				if (Input.pressed(Key.ESCAPE))
				{
					inputInactive();
				}
				if (Input.pressed(Key.ENTER))
				{
					if (_text == "")
					{
						//do nothing
					}
					else
					{
						trace("chat sent", _text);
						gameWorld.networkController.sendChat(_text);
					}
					inputInactive();
				}
			}
			else
			{
				if (Input.pressed(Key.ENTER))
				{
					inputActive();
				}
			}
			
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//on mouseclick
				if (Input.mousePressed)
				{
					if (inputActiveVar == true)
					{
						//do nothing
					}
					else
					{
						inputActive();
					}
				}
			}
			else //if mouse is not hovering over box
			{
				if (Input.mousePressed)
				{
					if (inputActiveVar == true)
						inputInactive();
						//trace ("inputboxpressed");
						//inputActive = false;
				}
			}
		}
	
	}

}