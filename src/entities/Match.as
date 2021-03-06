package entities 
{
	import emitters.FireEmitter;
	import emitters.FireParticle;
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Match extends Entity
	{
		private var img:Image = Image.createRect(8, 4, 0xFF0000);
		private var lifeTime : Number = 0.60;
		private var speed : Number = 50.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		private var rotator : Number = 0.0;
		
		public function Match(newX:Number, newY:Number, creator:NewPlayer) 
		{
			x = newX+img.width/2, y = newY+img.height/2;
			
			graphic = img;		
			
			setHitbox(img.width, img.height);
			originX += img.width / 2;
			originY += img.height / 2;
			type = "match";
			
			switch(creator.direction)
			{
				case "LEFT":
					vx = -speed + creator.vx;
					vy = gravity * 2;
					rotator = 180.0;
					break;
				case "RIGHT":
					vx = speed + creator.vx;
					vy = gravity;
					rotator = -180.0;
					break;
				case "UP":
					vy = -speed + creator.vy;
					rotator = 180.0;
					break;
				case "DOWN":
					vy = speed + creator.vy;
					rotator = -180.0;
					break;
			}
		}
		
		override public function update():void
		{
			if (time >= lifeTime)
				world.remove(this);
						
			Image(graphic).angle += rotator * FP.elapsed;
			
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
			
			time += FP.elapsed;
		}
	}
}