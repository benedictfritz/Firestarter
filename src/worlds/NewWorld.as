package worlds
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import util.Util;

    public class TestWorld extends World
    {
	private var 
	    welcomeText:Text,
	    welcomeTextEntity:Entity;

	public function TestWorld()
	{
	    Util.addCenteredText("Welcome to the new world!", this, 10);
	}
    }
}