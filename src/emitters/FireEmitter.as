package emitters
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Image;
	
	public class FireEmitter extends Entity
	{		
		public function FireEmitter(newX:Number, newY:Number) 
		{
			x = newX, y = newY;
		}
		
		override public function update():void 
		{
			if (Math.floor(Math.random() * 30) % 28 == 0)
				world.add(new FireParticle(x, y));
		}
	}
}