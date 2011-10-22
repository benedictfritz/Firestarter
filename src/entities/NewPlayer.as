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
		private var img:Image = Image.createCircle(8, 0xFFFFFF);
		private var speed : Number = 150.0;
		private var diagMov : Boolean = false;
		private var lastlastKey : int = 0;
		public var direction : String = "RIGHT";
		public var vx : Number = 0.0;
		public var vy : Number = 0.0;
		
		public function NewPlayer()
		{
			graphic = img;
			
			setHitbox(img.width, img.height);
			type = "player";
		}

		override public function update():void
		{
			//////////////////////////////////////////////////////////////////
			//Keep camera within
			if (x > -FP.screen.width/2 && x < FP.screen.width)
				world.camera.x = x - FP.screen.width/2;
			if (y > -FP.screen.height/2 && y < FP.screen.height)
				world.camera.y = y - FP.screen.height/2;
			
			if (y < -FP.screen.height/2 + 10)
				world.camera.y = -FP.screen.height;
			else if (y > FP.screen.height - 10)
				world.camera.y = FP.screen.height / 2;
				
			if (x < -FP.screen.width/2 + 10)
				world.camera.x = -FP.screen.width;
			else if (x > FP.screen.width - 10)
				world.camera.x = FP.screen.width/2;
			//////////////////////////////////////////////////////////////////
				
			//Set diagMov to true for diagonal movement
			if (diagMov)
			{
				if (Input.check(Key.LEFT)) { x -= speed * FP.elapsed; }
				if (Input.check(Key.RIGHT)) { x += speed * FP.elapsed; }
				if (Input.check(Key.UP)) { y -= speed * FP.elapsed; }
				if (Input.check(Key.DOWN)) { y += speed * FP.elapsed; }
			}
			else
			{
				//Create a match when hitting space bar
				if (Input.pressed(Key.SPACE))
					world.add(new Match(x+img.width/2, y+img.height/2, this));
				
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
					vx = 0.0, vy = 0.0; //Clear the velocitys if not moving
					
				//Save the key before space so we don't stop moving when hitting space
				if(Input.lastKey != Key.SPACE)
					lastlastKey = Input.lastKey;
				
				//Apply the velocities
				x += vx * FP.elapsed;
				y += vy * FP.elapsed;
			}
		}
	}
}