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
		private var speed : Number = 150.0;
		private var diagMov : Boolean = false;
		private var lastlastKey : int = 0;
		public var direction : String = "RIGHT";
		public var vx : Number = 0.0;
		public var vy : Number = 0.0;
		
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
					world.add(new Match(x + 8, y + 8, this));
				}
				
				if (Input.check(Key.UP) || Input.check(Key.DOWN) || Input.check(Key.LEFT) || Input.check(Key.RIGHT))
					switch(Key.name(lastlastKey))
					{
						case "LEFT":
							direction = "LEFT";
							vx = -speed;
							vy = 0.0;
							break;
						case "RIGHT":
							direction = "RIGHT";
							vx = speed;
							vy = 0.0;
							break;
						case "DOWN":
							direction = "DOWN";
							vx = 0.0;
							vy = speed;
							break;
						case "UP":
							direction = "UP";
							vx = 0.0;
							vy = -speed;
							break;	
					}
				else
				{
					vx = 0.0;
					vy = 0.0;
				}
					
				if(Input.lastKey != Key.SPACE)
				{
					lastlastKey = Input.lastKey;
				}
				
				x += vx * FP.elapsed;
				y += vy * FP.elapsed;
			}
		}
	}
}