package entities
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;
    import net.flashpunk.graphics.Spritemap;
    
    public class Road extends Entity
    {
	[Embed(source = '../../levels/images/Road_Tiles.png')]
	    private const ROADTILES:Class;
	public var sprBuildings:Spritemap = new Spritemap(ROADTILES, 32, 32);

	public function Road(x:int, y:int, tX:int, tY:int)
	{
	    sprBuildings.add("0", [0], 1, false);
	    sprBuildings.add("32", [1], 1, false);
	    sprBuildings.add("64", [2], 1, false);
	    sprBuildings.add("96", [3], 1, false);
	    sprBuildings.add("128", [4], 1, false);
	    sprBuildings.add("160", [5], 1, false);
	    sprBuildings.add("192", [6], 1, false);
	    sprBuildings.add("224", [7], 1, false);
	    sprBuildings.add("256", [8], 1, false);
	    sprBuildings.add("288", [9], 1, false);
	    sprBuildings.add("320", [10], 1, false);
	    sprBuildings.add("352", [11], 1, false);
	    
	    graphic=sprBuildings;
	    sprBuildings.play(String(tX), false);

	    FP.console.log(String(tX));
		
		setHitbox(32, 32);
		type = "road";
			
	    this.x = x;
	    this.y = y;
	}
    }
}