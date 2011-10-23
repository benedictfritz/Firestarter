package entities
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;
    import worlds.*;

    public class Score extends Entity
    {
	private var 
	    text:Text,
	    score:Number;

	public function Score() 
	{
	    layer = -20;
	    score = 0;
	    text = new Text("Score: " + score);
	    text.color = 0xFFFFFF;
	    text.size = 16;
	    graphic = text;
	    score = 0;
	    this.x = FP.camera.x + 10;
	    this.y = FP.camera.y + FP.screen.height - 30;
	}

	public function incrementScore(amount:Number):void
	{
	    score += amount;
	}

	override public function update():void
	{
	    this.x = FP.camera.x + 10;
	    this.y = FP.camera.y + FP.screen.height - 30;
	    text = new Text("Score: " + score);
	    text.color = 0xFFFFFF;
	    text.size = 16;
	    graphic = text;
	}
    }
}