package GameEngine.HUD.ActionBar 
{
	import GameEngine.GameWorld;
	import GameEngine.HUD.HUDElement;
	import GameEngine.HUD.HUDElementNoScroll;
	import GameEngine.Spells.BaseSpell;
	import GameEngine.Spells.SpellData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellButton extends HUDElementNoScroll
	{
		[Embed(source = '../../../../assets/spells/spell_button_normal.png')]
		public static const spellButtonGFX:Class;
		[Embed(source = '../../../../assets/spells/spell_button_hover.png')]
		public static const spellButtonHoverGFX:Class;
		[Embed(source = '../../../../assets/spells/spell_button_pressed.png')]
		public static const spellButtonPressedGFX:Class;
		[Embed(source = '../../../../assets/spells/cooldown_spritesheet.png')]
		public static const cooldownSpritesheetGFX:Class;
		
		protected var sprCooldown:Spritemap = new Spritemap(cooldownSpritesheetGFX, 32, 32);
		protected var sprGlobalCooldown:Spritemap = new Spritemap(cooldownSpritesheetGFX, 32, 32);
		
		protected var text:Text;
		protected var spellIcon:Image;
		protected var spellIconPressed:Image;
		protected var buttonBG:Image;
		protected var buttonBGhover:Image;
		protected var buttonBGpressed:Image;
		
		protected var graphicList:Graphiclist;
		protected var graphicListHover:Graphiclist;
		protected var graphicListPressed:Graphiclist;
		
		protected var actionBarNum:int;
		protected var spellID:int;
		protected var isHover:Boolean;
		public var spell:BaseSpell;
		
		protected var keyText:String;
		
		protected var origX:Number;
		protected var origY:Number;
		
		public var gameWorld:GameWorld;
		
		protected var spellPressed:Boolean;
		protected var spellPressedTimer:Number;
		
		public var onCooldown:Boolean;
		public var onGCD:Boolean;
		
		public function SpellButton(_passedSpell:BaseSpell, _actionbarNum:int = 0, _gameWorld:GameWorld = null) 
		{
			gameWorld = _gameWorld;
			spell = _passedSpell;
			actionBarNum = _actionbarNum;
			trace("loading spell data");
			spellIcon = new Image(spell.SPELL_ICON);
			spellIcon.scale = 2;
			spellIconPressed = new Image(spell.SPELL_ICON);
			spellIconPressed.scale = 2;
			spellIconPressed.x = -2;
			spellIconPressed.y = +2;
			
			
			trace("added spell button");
			buttonBG = new Image(spellButtonGFX);
			buttonBG.scale = 2;
			buttonBGhover = new Image(spellButtonHoverGFX);
			buttonBGhover.scale = 2;
			buttonBGpressed = new Image(spellButtonPressedGFX);
			buttonBGpressed.scale = 2;
			
			graphicList = new Graphiclist(buttonBG, spellIcon);
			graphicListHover = new Graphiclist(buttonBGhover, spellIcon);
			graphicListPressed = new Graphiclist(buttonBGpressed, spellIconPressed);
			
			if (_passedSpell.isCoolDown)
			{
				sprCooldown.add("cooldown", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], 32 / _passedSpell.spellCoolDown, true);
				sprCooldown.callback = removeCooldown;
				sprCooldown.scale = 2;
				sprCooldown.alpha = .5;
				sprCooldown.color = 0x000000;
			}
			
			if (_passedSpell.isGCD)
			{
				sprGlobalCooldown.add("cooldown", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], 32 / .5, true);
				sprGlobalCooldown.callback = removeGCD;
				sprGlobalCooldown.scale = 2;
				sprGlobalCooldown.alpha = .5;
				sprGlobalCooldown.color = 0x000000;
			}
			
			graphic = Graphiclist(graphicList);
			
			origX = (buttonBG.scaledWidth + 5) * actionBarNum + 20;
			origY = FP.screen.height - (buttonBG.scaledHeight + 20);
			
			setHitbox(buttonBG.scaledWidth, buttonBG.scaledHeight, 0, 0);
			
		}
		
		override public function update():void
		{
			x = FP.camera.x + origX;
			y = FP.camera.y + origY;
			if (spellPressed == true)
			{
				spellPressedTimer++;
				if (spellPressedTimer >= 5)
				{
					graphic = graphicList;
					spellPressed = false;
				}
			}
			
			if (this.collide(GC.TYPE_MOUSE, x, y))
			{
				//change this entities graphic to the hover button, set hovering flag to false so else knows to change it back
				if (isHover == false) {graphic = graphicListHover; trace("spellHover")}
				isHover = true;
				
				if (Input.mousePressed) //on mouseclick - spawn cast bar is here because this is nto picked up by playerinput controller
				{
					gameWorld.CastSpell(spell.id);
				}
			}
			else 
			{
				//return this entities graphic to normal button, set hovering flag to true so if statement above knows to change it back
				if (isHover == true) {graphic = graphicList;}
				isHover = false;
			}
		}
		
		public function playGCD():void
		{
			onGCD = true;
			sprGlobalCooldown.play("cooldown");
			graphicList.add(sprGlobalCooldown);
			graphicListHover.add(sprGlobalCooldown);
			graphicListPressed.add(sprGlobalCooldown);
		}
		
		public function removeGCD():void
		{	
			onGCD = false;
			sprGlobalCooldown.play("cooldown");
			graphicList.remove(sprGlobalCooldown);
			graphicListHover.remove(sprGlobalCooldown);
			graphicListPressed.remove(sprGlobalCooldown);
		}
		
		public function playCooldown():void
		{
			onCooldown = true;
			sprCooldown.play("cooldown");
			graphicList.add(sprCooldown);
			graphicListHover.add(sprCooldown);
			graphicListPressed.add(sprCooldown);
		}
		
		public function removeCooldown():void
		{	
			onCooldown = false;
			sprCooldown.play("cooldown");
			graphicList.remove(sprCooldown);
			graphicListHover.remove(sprCooldown);
			graphicListPressed.remove(sprCooldown);
		}
		
		public function onPress():void //this is called not only by input.mousepress above, but also by playerinput controller through gameworld
		{
			gameWorld.StartGCD();
			//playCooldown();
			graphic = graphicListPressed;
			spellPressed = true;
			spellPressedTimer = 0;
		}
	}
}