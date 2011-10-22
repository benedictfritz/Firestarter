package entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class NewPlayer extends Entity
	{
		private var speed : Number = 100.0;
		private var diagMov : Boolean = false;
		
		public function NewPlayer()
		{
			var img:Image = Image.createCircle(16, 0xFFFFFF);
			graphic = img;
		}

		override public function update():void
		{
			if (diagMov)
			{
				if (Input.check(Key.LEFT)) { x -= speed * FP.elapsed; }
				if (Input.check(Key.RIGHT)) { x += speed * FP.elapsed; ; }
				if (Input.check(Key.UP)) { y -= speed * FP.elapsed; ; }
				if (Input.check(Key.DOWN)) { y += speed * FP.elapsed; ; }
			}
			else
			{
				if (Input.check(Key.ANY))
					switch(Key.name(Input.lastKey))
					{
						case "LEFT":
							x -= speed * FP.elapsed;
							break;
						case "RIGHT":
							x += speed * FP.elapsed;
							break;
						case "DOWN":
							y += speed * FP.elapsed;
							break;
						case "UP":
							y -= speed * FP.elapsed;
							break;	
					}
			}
		}
	}
}