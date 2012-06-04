package UI 
{
	import Menu.MenuButton;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class PopupBox extends Entity 
	{
		protected var buttonText:Text;
		protected var button:Image;
		protected var buttonHover:Image;
		protected var bg:Image;
		protected var graphicList:Graphiclist;
		protected var graphicListHover:Graphiclist;
		
		protected var message:String;
		protected var messageText:Text;
		
		protected var isHover:Boolean;
		
		
		
		public function PopupBox(_message:String):void
		{
			message = _message;
			messageText = new Text(message);
			
			bg = Image.createRect(messageText.scaledWidth,200,0x000000,.5);
			
			button = new Image(GC.GFX_LOGIN_BUTTON);
			button.scale = 2;
			button.x = messageText.scaledWidth / 2 - button.scaledWidth / 2;
			button.y = messageText.scaledHeight;
			
			buttonHover = new Image(GC.GFX_LOGIN_BUTTON_HOVER);
			buttonHover.scale = 2;
			buttonHover.x = messageText.scaledWidth / 2 - button.scaledWidth / 2;
			buttonHover.y = messageText.scaledHeight;
			
			buttonText = new Text("OK");
			buttonText.color = 0x000000;
			buttonText.y = button.y + 2;
			buttonText.x = button.x + button.scaledWidth / 2 - buttonText.scaledWidth / 2;
			
			graphicList = new Graphiclist(bg, messageText, button, buttonText);
			graphicListHover = new Graphiclist(bg, messageText, buttonHover, buttonText);
		}
		
		override public function added():void
		{
			graphic = graphicList;
			this.x = FP.width / 2 - messageText.scaledWidth / 2;
			this.y = FP.height / 2;
			
			trace(button.scaledWidth, button.scaledHeight, this.x, this.y);
			this.setHitbox(button.scaledWidth, button.scaledHeight, -(messageText.scaledWidth / 2 - button.scaledWidth / 2),-(messageText.scaledHeight));
			
			MenuButton.isDisabled = true; //disables menuButtons
		}
		
		override public function update():void 
		{
			super.update();
			
			//if mouse is colliding with this entities hit box
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false) {graphic = graphicListHover; trace("changed to hover true");}
				isHover = true;
				//on mouseclick
				if (Input.mousePressed)
				{
					//MenuButton.isDisabled = false;
					this.world.remove(this);
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true) {graphic = graphicList; trace("changed to hover false");}
				isHover = false;
			}
		}
		
		
		
		
	}

}