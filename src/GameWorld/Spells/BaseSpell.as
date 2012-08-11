package GameWorld.Spells 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	public class BaseSpell 
	{
		public var SPELL_ICON:Class = GS.ERROR;
		public var SPELL_NAME:String = "no spell exists";
		public var id:Number;
		
		public var xPosition:Number = 10;
		public var yPosition:Number = 0;
		
		public var isActive:Boolean;
		public var isCastTime:Boolean;
		public var isCoolDown:Boolean;
		public var isDamage:Boolean;
		public var isDot:Boolean;
		public var isHeal:Boolean;
		public var isHot:Boolean;
		public var isTargetted:Boolean;
		
		public var spellCastTime:Number;
		public var spellCoolDown:Number;
		public var spellDamage:Number;
		public var spellDotDamage:Number;
		public var spellDotTickTime:Number;
		public var spellHealDamage:Number;
		public var spellHotHeal:Number;
		public var spellHotTickTime:Number;
		
		public function BaseSpell() 
		{
			
		}
		
	}

}