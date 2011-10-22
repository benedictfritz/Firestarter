package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.NewWorld;

	[SWF(width="800", height="600")]

	public class Main extends Engine
	{
		public function Main()
		{
			super(800, 600, 60, false);
			FP.console.enable();
			FP.world = new NewWorld;
		}

		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
}