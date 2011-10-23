package emitters
{
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	
	public class StreetFireEmitter extends Entity
	{		
		private var totalTime : Number = 0.0;
		private var lifeTime : Number = 3.0;
		
		public function StreetFireEmitter(newX:Number, newY:Number) 
		{
			x = newX, y = newY;
			
			setHitbox(24, 24);
			originX += 12;
			originY += 12;
			type = "streetfire";
		}
		
		override public function update():void 
		{
			if (Math.floor(Math.random() * 40) % 38 == 0)
				world.add(new StreetFireParticle(x + (Math.random() * 10) - 5, y + (Math.random() * 10) - 5));
				
			var col:NewPlayer = collide("player", x, y) as NewPlayer;
			if (col)
				col.dead = true;
				
			if (totalTime > lifeTime)
				world.remove(this);
				
			totalTime += FP.elapsed;
		}
	}
}