package emitters
{
	import entities.NewPlayer;
	import entities.Road;
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	
	public class StreetFireEmitter extends Entity
	{		
		private var totalTime : Number = 0.0;
		private var lifeTime : Number = 3.0;
		private var road : Road;
		
		public function StreetFireEmitter(newX:Number, newY:Number, creator:Road) 
		{
			x = newX, y = newY;
			
			road = creator;
			road.sprBuildings.color = 0xFF0000;
				
			setHitbox(24, 24);
			originX += 12;
			originY += 12;
			type = "streetfire";
		}
		
		override public function update():void 
		{
			if (Math.floor(Math.random() * 10) % 8 == 0)
				world.add(new StreetFireParticle(x + (Math.random() * 10) - 5, y + (Math.random() * 10) - 5));
				
			var col:NewPlayer = collide("player", x, y) as NewPlayer;
			if (col)
				col.dead = true;
				
			if (totalTime > lifeTime)
			{
				road.sprBuildings.color = 0xFFFFFF;
				world.remove(this);
			}
				
			totalTime += FP.elapsed;
		}
	}
}