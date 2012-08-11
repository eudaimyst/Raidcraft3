package Menu.Spells 
{
	import GameWorld.Characters.Heroes.*;
	import GameWorld.Spells.BaseSpell;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellChooserRemnant extends Entity 
	{
		[Embed(source = '../../../assets/spells/spell_button_normal.png')]
		public static const spellButtonGFX:Class;
		[Embed(source = '../../../assets/spells/spell_button_pressed.png')]
		public static const spellButtonPressedGFX:Class;
		
		protected var spellChooserBG:Image;
		protected var spellChooserBGPressed:Image;
		protected var spellImage:Image;
		protected var graphicList:Graphiclist;
		protected var graphicPressed:Graphiclist;
		protected var isHover:Boolean;
		protected var isPressed:Boolean;
		private var buttonActive:Boolean = false;
		private var mouseOrigX:Number;
		private var mouseOrigY:Number;
		private var origXpos:Number;
		private var origYpos:Number;
		
		private var spellSelected:Boolean;
		
		public var passedSpell:BaseSpell;
		public var inHolder:Boolean = false; //set this to true when button is in holder, is checked when button is removed
		
		private var allSpellHolders:Array;
		
		public function SpellChooserRemnant(_passedSpell:BaseSpell)
		{
			origXpos = _passedSpell.xPosition - 1;
			origYpos = _passedSpell.yPosition;
			spellChooserBG = new Image(spellButtonGFX);
			spellChooserBG.scale = 2;
			spellChooserBG.alpha = .7;
			spellChooserBG.color = 0x880000;
			
			
			passedSpell = _passedSpell;
			spellImage = new Image(_passedSpell.SPELL_ICON);
			spellImage.scale = 2;
			spellImage.alpha = .7;
			spellImage.color = 0x880000;
			
			graphicList = new Graphiclist(spellChooserBG, spellImage);
			graphic = graphicList;
			
			this.x = 50 + (FP.screen.width / 13 * (_passedSpell.xPosition - 1));
			this.y = 105 + 100 * (_passedSpell.yPosition - 1);
		}
		
	}

}

		
