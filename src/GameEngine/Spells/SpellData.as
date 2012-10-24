package GameEngine.Spells 
{
	/**
	 * ...
	 * @author skipgamer
	 */
	public class SpellData 
	{
		
		
		
		public function SpellData() 
		{
			
		}
		
		public function loadData(_spellID:int):BaseSpell
		{
			
			var spell:BaseSpell = new BaseSpell;
			
			
			trace ("Spell Data Loaded");
			trace ("****************************************************************************************");
			
			//spell ID 0 - 59 = mage
			//spell ID 0 - 19 = elemental
			if (_spellID == 0)
			{
				spell.SPELL_ICON = GS.FIREBALL;
				spell.SPELL_NAME = "fireball";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 1; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 1; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1.5;
				spell.spellCoolDown = 3.5;
			}
			if (_spellID == 1)
			{
				spell.SPELL_ICON = GS.FROSTBOLT;
				spell.SPELL_NAME = "frostbolt";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 3; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 1; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1;
				spell.spellCoolDown = 1.5;
			}
			if (_spellID == 2)
			{
				spell.SPELL_ICON = GS.LIGHTNING_BOLT;
				spell.SPELL_NAME = "lightning strike";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 5; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 1; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = .5;
				spell.spellCoolDown = .75;
			}
			if (_spellID == 3)
			{
				spell.SPELL_ICON = GS.BONEFREEZE;
				spell.SPELL_NAME = "bone freeze";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 4; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 2; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1.5;
				spell.spellCoolDown = 3.5;
			}
			if (_spellID == 4)
			{
				spell.SPELL_ICON = GS.ARCANE_POWER;
				spell.SPELL_NAME = "arcane power";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 3; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 4; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1.5;
				spell.spellCoolDown = 3.5;
			}
			if (_spellID == 5)
			{
				spell.SPELL_ICON = GS.CHAIN_LIGHTNING;
				spell.SPELL_NAME = "chain lightning";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 6; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 1; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1.5;
				spell.spellCoolDown = 3.5;
			}
			//spell ID 20 - 39 = necro
			if (_spellID == 20)
			{
				spell.SPELL_ICON = GS.CHAIN_LIGHTNING;
				spell.SPELL_NAME = "chain lightning";
				spell.id = _spellID;
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 6; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 1; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1.5;
				spell.spellCoolDown = 3.5;
			}
			//spell ID 40 - 59 = holy
			
			//spell ID 60 - 119 = warrior
			if (_spellID == 60)
			{
				spell.SPELL_ICON = GS.CHAIN_LIGHTNING;
				spell.SPELL_NAME = "taunt";
				spell.id = _spellID
				trace (spell.SPELL_NAME);
				spell.isCastTime = true;
				spell.xPosition = 6; //x position on the spell selection screen (starts at 1)
				spell.yPosition = 1; //y position on the spell selection screen (starts at 1)
			
				spell.isActive = true;
				spell.isCastTime = true;
				spell.isCoolDown = true;
				spell.isDamage = true;
			
				spell.spellCastTime = 1.5;
				spell.spellCoolDown = 3.5;
			}
			//spell ID 60 - 79 = guard
			//spell ID 80 - 99 = knight
			//spell ID 100 - 119 = paladin
			
			//spell ID 120 - 179 = rogue
			
			//spell ID 120 - 139 = hunter
			//spell ID 140 - 159 = assassin
			//spell ID 160 - 179 = rogue
			
			
			return spell;
			
		}
		
	}

}