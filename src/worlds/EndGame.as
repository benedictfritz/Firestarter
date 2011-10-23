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
	
    public class EndGame extends World
    {
		[Embed(source = '../../levels/images/FirestarterScore.png')]
		private const ENDMENU:Class;
		
		private var endMenu:Image = new Image(ENDMENU);
		
		private var playerScore : Number;
		
		private var 
	    titleText:Text,
	    titleTextEntity:Entity,
	    titleScale:Number,
	    startText:Text,
	    startTextEntity:Entity;
		
		public function EndGame(score : Number) 
		{
			this.addGraphic(endMenu, 20, 0, 0);
			playerScore = score;
			Util.addCenteredText(String(score), this, 320, 5);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.SPACE))
				FP.world = new WorldOne;
		}
	}
}