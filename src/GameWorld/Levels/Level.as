package GameWorld.Levels 
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Level extends Entity 
	{
		private var _tiles:Tilemap;
		private var xml:Class;
		public var playerSpawnLocationsX:Array = new Array;
		public var playerSpawnLocationsY:Array = new Array;
		public var levelWidth:Number = 2560;
		public var levelHeight:Number = 1920;
		
		public function Level(_xml:Class) 
		{
			xml = _xml;
			_tiles = new Tilemap(GC.GFX_TILES, levelWidth, levelHeight, 32, 32);
			graphic = _tiles;
			layer = 1; //the higher the number the lower the object
			
			//_tiles.setRect(0, 0, 800 / 32, 600 / 32);
			
			loadLevel();
		}
		
		private function loadLevel():void
		{
			//loads the xml file
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			var xmlData:XML = new XML (dataString);
			//trace(xmlData); //display xml file in trace
			
			var dataList:XMLList;
			var dataElement:XML;
			
			dataList = xmlData.Ground.tile; //newLayer1 is defined in ogmo
			for each(dataElement in dataList)
			{
				_tiles.setTile(int(dataElement.@x), int(dataElement.@y), int(dataElement.@tx));
			}
			dataList = xmlData.Objects.PlayerSpawn;
			for each(dataElement in dataList)
			{
				trace(int(dataElement.@id), int(dataElement.@x), int(dataElement.@y));
				playerSpawnLocationsX[int(dataElement.@id)] = int(dataElement.@x);
				playerSpawnLocationsY[int(dataElement.@id)] = int(dataElement.@y);
			}
		}
		
	}

}