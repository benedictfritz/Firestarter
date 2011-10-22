package emitters
{
	import net.flashpunk.Entity;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class FireEmitter extends Entity
	{
		public function FireEmitter() 
		{
		}
		
		override public function update():void 
		{
			if (Input.mouseDown)
			{
				world.add(new FireParticle(FP.world.mouseX, FP.world.mouseY));
			}
		}
	}
}