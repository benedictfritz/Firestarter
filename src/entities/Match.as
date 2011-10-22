package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Match extends Entity
	{
		private var lifeTime : Number = 0.5;
		private var speed : Number = 50.0;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		
		public function Match(newX:Number, newY:Number, dir:String) 
		{
			x = newX + 4;
			y = newY + 4;
			var img:Image = Image.createRect(8, 4, 0xFF0000);
			graphic = img;			
			switch(dir)
			{
				case "LEFT":
					vx = -speed;
					break;
				case "RIGHT":
					vx = speed;
					break;
				case "UP":
					vy = -speed;
					break;
				case "DOWN":
					vy = speed;
					break;
			}
		}
		
		override public function update():void
		{
			if (time >= lifeTime)
				world.remove(this);
			
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
						
			time += FP.elapsed;
		}
	}
}