package entities 
{
	import emitters.FireEmitter;
	import emitters.FireParticle;
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class FireChunk extends Entity
	{
		private var img:Image = Image.createRect(4, 4, 0xFF0000);
		private var lifeTime : Number = 1.0;
		private var speed : Number = 50.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		
		public function FireChunk(newX:Number, newY:Number, dir:int) 
		{
			x = newX-img.width/2, y = newY-img.height/2;
			
			graphic = img;		
			
			setHitbox(img.width, img.height);
			type = "firechunk";
			
			switch(dir)
			{
				case 0:
					vx = -speed;
					break;
				case 1:
					vx = speed;
					break;
				case 2:
					vy = -speed;
					break;
				case 3:
					vy = speed;
					break;
				default:
					trace("WHOA WHOA WHOA");
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