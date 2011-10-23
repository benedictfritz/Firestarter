package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;
    import worlds.*;

    public class MatchCount extends Entity
    {
	public var 
	    text:Text,
	    count:Number;

	public function MatchCount() 
	{
	    layer = -20;
	    count = 2;
	    text = new Text(String(count));
	    text.color = 0xFFFFFF;
	    text.size = 16;
	    graphic = text;
	    this.x = FP.camera.x + 700;
	    this.y = FP.camera.y + FP.screen.height - 30;
	}

	public function incrementMatchCount():void
	{
	    count++;
	}

	public function decrementMatchCount():void
	{
	    count--;
	}
	
	public function hasMatches():Boolean
	{
	    if (count > 0) {
		return true;
	    }
	    else {
		return false;
	    }
	}

	override public function update():void
	{
	    this.x = FP.camera.x + 750;
	    this.y = FP.camera.y + FP.screen.height - 32;
	    text = new Text(String(count));
	    text.color = 0xFFFFFF;
	    text.size = 16;
	    graphic = text;
	}
    }
}