package  
{
	/**
	 * ...
	 * @author skipgamer
	 * 
	 * All Global Constants, and types go here
	 */
	public class GC 
	{
		//Tilemaps
		[Embed(source = '../assets/tilemaps/TestLevel.oel', mimeType = "application/octet-stream")]
		public static const TILEMAP_TEST_LEVEL:Class;
		
		//Text
		public static const TEXT_GAME_NAME:String = "RaidCraft";
		public static const TEXT_GAME_VERSION:String = "Version 0.01";
		public static const TEXT_PLAY_BUTTON:String = "Play Game";
		public static const TEXT_OPTIONS_BUTTON:String = "Options";
		public static const TEXT_EXIT_BUTTON:String = "Exit";
		public static const TEXT_DONE_SPELL_SELECT:String = "Done";
		
		//Types
		public static const TYPE_MOUSE:String = "mouse collision";
		public static const TYPE_SPELL_BUTTON_EMPTY:String = "empty spell button";
		public static const TYPE_SPELL_BUTTON:String = "non empty spell button";
		public static const TYPE_ENEMY:String = "enemy collision";
		
		//Graphics
		[Embed(source = '../assets/raidcraft_title.png')]
		public static const GFX_TITLE:Class;
		
		[Embed(source = '../assets/player.png')]
		public static const GFX_PLAYER:Class;
		
		[Embed(source = '../assets/tileset.png')]
		public static const GFX_TILE_TEST:Class;
		
		[Embed(source = '../assets/cooldown_spritesheet.png')]
		public static const GFX_COOLDOWN:Class;
		
		// enemies
		
		[Embed(source = '../assets/portal.png')]
		public static const GFX_ENEMY_PORTAL:Class;
		
		[Embed(source = '../assets/dragon.png')]
		public static const GFX_ENEMY_DRAGON:Class;
		
		///////////////////////////////////////
		//Character - moved to specific character classes
		///////////////////////////////////////
		/*
		[Embed(source = '../assets/char/select_mage.png')]
		public static const GFX_SELECT_MAGE:Class;
		public static const TEXT_SELECT_MAGE:String = "MAGE";
		
		[Embed(source = '../assets/char/select_warrior.png')]
		public static const GFX_SELECT_WARRIOR:Class;
		public static const TEXT_SELECT_WARRIOR:String = "WARRIOR";
		
		[Embed(source = '../assets/char/select_rogue.png')]
		public static const GFX_SELECT_WANDERER:Class;
		public static const TEXT_SELECT_WANDERER:String = "WANDERER";
		*/
		///////////////////////////////////////
		//WEAPONS
		///////////////////////////////////////
		
		[Embed(source="../assets/char/weapons/mage_staff.png")]
		public static const GFX_WEAPON_MAGE:Class;
		
		[Embed(source="../assets/char/weapons/warrior_sword.png")]
		public static const GFX_WEAPON_WARRIOR:Class;
		
		[Embed(source = "../assets/char/weapons/rogue_dagger.png")]
		public static const GFX_WEAPON_WANDERER:Class;
		
		
		///////////////////////////////////////
		//UI
		///////////////////////////////////////
		
		//menu buttons
		
		[Embed(source = '../assets/ui/menu_button.png')]
		public static const GFX_MENU_BUTTON:Class;
		
		[Embed(source = '../assets/ui/menu_button_hover.png')]
		public static const GFX_MENU_BUTTON_HOVER:Class;
		
		// login buttons
		
		[Embed(source = '../assets/ui/login_button.png')]
		public static const GFX_LOGIN_BUTTON:Class;
		
		[Embed(source = '../assets/ui/login_button_hover.png')]
		public static const GFX_LOGIN_BUTTON_HOVER:Class;
		
		// mouse cursor
		
		[Embed(source = '../assets/ui/mouse_cursor.png')]
		public static const GFX_MOUSE_CURSOR:Class;
		
		[Embed(source = '../assets/ui/mouse_flash.png')]
		public static const GFX_MOUSE_FLASH:Class;
		
		//checkbox
		
		[Embed(source = '../assets/ui/checkbox.png')]
		public static const GFX_CHECKBOX:Class;
		
		[Embed(source = '../assets/ui/checkbox_hover.png')]
		public static const GFX_CHECKBOX_HOVER:Class;
		
		[Embed(source = '../assets/ui/checkbox_pressed.png')]
		public static const GFX_CHECKBOX_PRESSED:Class;
		
		///////////////////////////////////////
		
		
/*		// spell buttons
		
		[Embed(source = '../assets/spell_button_normal.png')]
		public static const GFX_SPELL_BUTTON_NORMAL:Class;
		
		[Embed(source = '../assets/spell_button_pressed.png')]
		public static const GFX_SPELL_BUTTON_PRESSED:Class;
		
		[Embed(source = '../assets/spell_button_empty.png')]
		public static const GFX_SPELL_BUTTON_EMPTY:Class;
		
		//spell icons
		[Embed(source = '../assets/spell_icon_melee.png')]
		public static const GFX_SPELL_ICON_MELEE:Class;
		
		[Embed(source = '../assets/spell_icon_fireball.png')]
		public static const GFX_SPELL_ICON_FIRE:Class;
		
		[Embed(source = '../assets/spell_icon_arcane.png')]
		public static const GFX_SPELL_ICON_ARCANE:Class;
		
		[Embed(source = '../assets/spell_icon_frost.png')]
		public static const GFX_SPELL_ICON_FROST:Class;
		
		[Embed(source = '../assets/spell_icon_death.png')]
		public static const GFX_SPELL_ICON_DEATH:Class;
		
		[Embed(source = '../assets/spell_icon_lightning.png')]
		public static const GFX_SPELL_ICON_LIGHTNING:Class;
		*/
		//sound effects
		
		[Embed(source = '../assets/rc-cast-test.mp3')]
		public static const SFX_SPELL_CAST:Class;
		
	}

}