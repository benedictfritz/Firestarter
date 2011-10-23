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
		private var speed : Number = 75.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		private var ignited : Boolean = false;
		
		public function FireChunk(newX:Number, newY:Number) 
		{
		    sprRubble.add("1", [0], 1, false);
		    sprRubble.add("2", [1], 1, false);
		    sprRubble.add("3", [2], 1, false);
		    sprRubble.add("4", [3], 1, false);

		    graphic = sprRubble;
		    sprRubble.play(String(Math.random()*4));

		    x = newX-16/2;
		    y = newY-16/2;

		    //x = newX-img.width/2, y = newY-img.height/2;
			
		    setHitbox(16, 16);
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