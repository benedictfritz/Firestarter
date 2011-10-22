package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class NewPlayer extends Entity
	{
		public function NewPlayer()
		{
			var img:Image = Image.createCircle(16, 0xFFFFFF);
			graphic = img;
		}

		override public function update():void
		{
			if (Input.check(Key.LEFT)) { x -= 50 * FP.elapsed; }
			if (Input.check(Key.RIGHT)) { x += 50 * FP.elapsed; ; }
			if (Input.check(Key.UP)) { y -= 50 * FP.elapsed; ; }
			if (Input.check(Key.DOWN)) { y += 50 * FP.elapsed; ; }
		}
	}
}