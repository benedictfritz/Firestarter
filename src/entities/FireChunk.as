package entities 
{
	import emitters.FireEmitter;
	import emitters.StreetFireEmitter;
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class FireChunk extends Entity
	{
		private var img:Image = Image.createRect(16, 16, 0xFF0000);
		private var lifeTime : Number = 1.0;
		private var speed : Number = 75.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		private var ignited : Boolean = false;
		
		public function FireChunk(newX:Number, newY:Number) 
		{
			x = newX-img.width/2, y = newY-img.height/2;
			
			graphic = img;		
			
			setHitbox(img.width, img.height);
			type = "firechunk";
			
			vx = (Math.random() * speed*2) - speed;
			vy = (Math.random() * speed*2) - speed;
		}
		
		override public function update():void
		{
			if (time >= lifeTime)
				world.remove(this);
			
			var col:NewPlayer = collide("player", x, y) as NewPlayer;
			if (col)
				col.dead = true;
				
			var road:Road = collide("road", x, y) as Road;
			if (road && !ignited)
			{
				ignited = true;
				world.add(new StreetFireEmitter(road.x+16, road.y+16));
			}
				
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
			
			time += FP.elapsed;
		}
		
		override public function render():void {
			if (onCamera) {
				super.render();
			}
		}
	}
}