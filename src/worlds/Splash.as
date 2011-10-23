package worlds 
{
    import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.World;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Key;
    import net.flashpunk.utils.Input;
    import net.flashpunk.graphics.Text;

    import util.Util;
    import worlds.*;
	
    public class Splash extends World
    {
		[Embed(source = '../../levels/images/Arcade.jpg')]
		private const ARCADE:Class;
		
		private var fbi:Image = new Image(ARCADE);
		
		private var 
	    titleText:Text,
	    titleTextEntity:Entity,
	    titleScale:Number,
	    startText:Text,
	    startTextEntity:Entity;
		
		public function Splash() 
		{
			this.addGraphic(fbi, 0, -125, 0);
			fbi.scale *= 0.55;
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
			FP.world = new Menu;
		}
	}
}