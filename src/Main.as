package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.NewWorld;
	
	public class Main extends Engine
	{
		public function Main()
		{
			super(800, 600, 60, false);

			FP.world = new NewWorld;
		}

		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
}