package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import flash.events.MouseEvent;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class MouseCursorEntity extends Entity 
	{
		protected var mouseFlash:Image;
		
		public function MouseCursorEntity() 
		{
			super(x, y);
			trace ("Mouse Cursor Drawn");
			
			//hide mouse usese flash.ui.mouse
			Mouse.hide();
			
			//draw graphic
			graphic = new Image(GC.GFX_MOUSE_CURSOR);
			
			//set hitbox and collision type
			this.setHitbox(2, 2);
			type = GC.TYPE_MOUSE;
			
			Image(this.graphic).scaleX = 2;
			Image(this.graphic).scaleY = 2;
			
			this.layer = -100;
			

		}
		override public function added():void 
		{
			super.added();
			this.x = Input.mouseX;
			this.y = Input.mouseY;
		}
		
		override public function update():void 
		{
			super.update();

			this.x = Input.mouseX + FP.camera.x;
			this.y = Input.mouseY + FP.camera.y;
			
			if (Input.mousePressed) {
				this.world.add (new MouseFlash());
			}
		}
		
	}

}