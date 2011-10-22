package util
{
    /* utility class by benedict */
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    public class Util
    {
	// Adds a piece of text to the world at the horizontal center of the screen
	public static function addCenteredText(string:String, world:World, 
					       y:Number=0, scale:Number=1):void
	{
	    var text:Text;
	    text = new Text(string);
	    text.scale = scale;

	    var textEntity:Entity;
	    textEntity = new Entity(FP.halfWidth - scale*(text.width/2), y, text);
	    world.add(textEntity);
	}
    }
}