package entities
{
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;
    import net.flashpunk.FP;

    import worlds.WorldOne;

    public class MatchSpawn extends Entity
    {
	[Embed(source="../../levels/images/matchcircleicon.png")]
	    private const MATCH:Class;

	public var icon:Image = new Image(MATCH);
	public var alive:Boolean = false;
	
	public function MatchSpawn(x:int, y:int)
	{
	    this.x = x;
	    this.y = y;
	    type = "matchSpawn";
	    layer = 100;
	    graphic = icon;
	    setHitbox(icon.width, icon.height)
	}

	override public function update():void
	{
	    if (alive) {
		layer = -9;
	    }
	    else {
		layer = 100;
		if(Math.floor(Math.random() * 1000) == 3) {
		    alive = true;
		}
		return;
	    }

	    
	    var player:NewPlayer = collide("player", x, y) as NewPlayer;
	    if(player) {
		alive = false;
		WorldOne(FP.world).matchCount.incrementMatchCount();
	    }
	}
    }
}