package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import worlds.Splash;

	import worlds.WorldOne;
	import worlds.Menu;


	[SWF(width="800", height="600")]

	public class Main extends Engine
	{
	    [Embed(source="../RealSfx/FSThemeLoop03.mp3")]
		private const THEME:Class;
	    [Embed(source="../RealSFX/Jamaican.mp3")]
		private static const JAMAICAN:Class;

	    private var theme:Sfx = new Sfx(THEME);
	    private var jamaican:Sfx = new Sfx(JAMAICAN);
		public function Main()
		{
			super(800, 600, 60, false);

			theme.loop(0.5, 0);
			jamaican.play(1, 0);
			FP.console.enable();
			FP.world = new Splash;
		}
	}
}