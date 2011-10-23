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
	
    public class Menu extends World
    {
		[Embed(source = '../../levels/images/Firestartermainmenu.png')]
		private const MAINMENU:Class;
		
		private var mainMenu:Image = new Image(MAINMENU);
		
		private var 
	    titleText:Text,
	    titleTextEntity:Entity,
	    titleScale:Number,
	    startText:Text,
	    startTextEntity:Entity;
		
		public function Menu() 
		{
			this.addGraphic(mainMenu, 20, 0, 0);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
			FP.world = new WorldOne;
		}
	}
}