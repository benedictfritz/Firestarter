package worlds
{
	import entities.NewPlayer;
    import net.flashpunk.FP;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.graphics.Text;

    import util.Util;

    public class NewWorld extends World
    {
		private var 
			welcomeText:Text,
			welcomeTextEntity:Entity;

		public function NewWorld()
		{
			Util.addCenteredText("Welcome to the new world!", this, 10);
			add(new NewPlayer);
		}
    }
}