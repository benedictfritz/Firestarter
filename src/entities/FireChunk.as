package entities 
{
	import emitters.FireEmitter;
	import emitters.StreetFireEmitter;
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	public class FireChunk extends Entity
	{
	    [Embed(source="../../levels/images/FlamingRubble16.png")]
		private const RUBBLE:Class;

		private var sprRubble:Spritemap = new Spritemap(RUBBLE, 16, 16);
		private var lifeTime : Number = 1.0;
		private var speed : Number = 100.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		private var ignited : Boolean = false;
		
		public function FireChunk(newX:Number, newY:Number) 
		{
		    sprRubble.add("spin", [0, 1, 2, 3], 20, true);

		    graphic = sprRubble;
		    sprRubble.play("spin");

		    x = newX-16/2;
		    y = newY-16/2;

		    //x = newX-img.width/2, y = newY-img.height/2;
			
		    setHitbox(16, 16);
		    type = "firechunk";
			
			while(vx > -50.0 && vx < 50)
				vx = (Math.random() * speed * 2) - speed;
			while(vy > -50.0 && vy < 50)
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
				world.add(new StreetFireEmitter(road.x+16, road.y+16, road));
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