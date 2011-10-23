package entities
{
    import flash.geom.Point;
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Image;

    public class HUDright extends Entity
    {
	[Embed(source='../../levels/images/rightsideMatchesUI.png')]
	    private const RIGHT_HUD:Class;
	private var img:Image = new Image(RIGHT_HUD);

	public function HUDright()
	{
	    graphic = img;
	    this.x = FP.camera.x;
	    this.y = FP.camera.y;
	    layer = -10;
	}

	override public function update():void 
	{
	    this.x = (FP.camera.x + FP.screen.width) - img.width;
	    this.y = (FP.camera.y + FP.screen.height) - img.height;
	    FP.console.log("HUD: x - " + String(this.x) + " y - " + String(this.y));
	}
    }
}