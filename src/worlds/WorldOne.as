package worlds
{
    import flash.utils.ByteArray;

    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import entities.Building;
    import entities.Road;
    import entities.NewPlayer;

    public class WorldOne extends World
    {
	[Embed(source="../../levels/JerrysTest.oel", mimeType="application/octet-stream")]
	    private static const LEVEL_ONE:Class;

	override public function begin():void
	{
	    var rawData:ByteArray = new LEVEL_ONE;
	    var dataString:String = rawData.readUTFBytes(rawData.length);

	    var levelData:XML = new XML(dataString);
	    
	    var dataList:XMLList;
	    var dataElement:XML;

	    dataList = levelData.Roads.tile;
	    for each(dataElement in dataList)
	    {
		add(new Road(dataElement.@x, dataElement.@y,
			     dataElement.@tx, dataElement.@ty));
	    }

	    dataList = levelData.Objects.buildingL;
	    for each(dataElement in dataList)
	    {
		add(new Building(dataElement.@x, dataElement.@y, "buildingL"));
	    }

	    dataList = levelData.Objects.buildingM;
	    for each(dataElement in dataList)
	    {
		add(new Building(dataElement.@x, dataElement.@y, "buildingM"));
	    }

	    dataList = levelData.Objects.buildingS;
	    for each(dataElement in dataList)
	    {
		add(new Building(dataElement.@x, dataElement.@y, "buildingS"));
	    }

	    dataList = levelData.Objects.buildingS2h;
	    for each(dataElement in dataList)
	    {
		add(new Building(dataElement.@x, dataElement.@y, "buildingS2h"));
	    }

	    dataList = levelData.Objects.buildingS2v;
	    for each(dataElement in dataList)
	    {
		add(new Building(dataElement.@x, dataElement.@y, "buildingS2v"));
	    }

	    dataList = levelData.Objects.playerStart;
	    for each(dataElement in dataList)
	    {
		add(new NewPlayer(dataElement.@x, dataElement.@y));
	    }
	}
    }
}