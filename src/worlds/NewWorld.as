package worlds
{
	import emitters.FireEmitter;
	import entities.Building;
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
			add(new Building(50, 100));
			add(new Building(100, 100));
			add(new Building(50, 150));
			add(new Building(0, 100));
		}
    }
}