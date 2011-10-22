package entities
{
	import entities.Match;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class NewPlayer extends Entity
	{
		private var speed : Number = 100.0;
		private var diagMov : Boolean = false;
		private var lastlastKey : int = 0;
		public var direction : String = "RIGHT";
		
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
				if (Input.check(Key.RIGHT)) { x += speed * FP.elapsed; }
				if (Input.check(Key.UP)) { y -= speed * FP.elapsed; }
				if (Input.check(Key.DOWN)) { y += speed * FP.elapsed; }
			}
			else
			{
				if (Input.pressed(Key.SPACE))
				{
					world.add(new Match(x + 8, y + 8, direction));
				}
				
				if (Input.check(Key.UP) || Input.check(Key.DOWN) || Input.check(Key.LEFT) || Input.check(Key.RIGHT))
					switch(Key.name(lastlastKey))
					{
						case "LEFT":
							direction = "LEFT";
							x -= speed * FP.elapsed;
							break;
						case "RIGHT":
							direction = "RIGHT";
							x += speed * FP.elapsed;
							break;
						case "DOWN":
							direction = "DOWN";
							y += speed * FP.elapsed;
							break;
						case "UP":
							direction = "UP";
							y -= speed * FP.elapsed;
							break;	
					}
					
				if(Input.lastKey != Key.SPACE)
				{
					lastlastKey = Input.lastKey;
				}
			}
		}
	}
}