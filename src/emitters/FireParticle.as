package emitters 
{
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class FireParticle extends Entity
	{
		private var img:Image = Image.createRect(4, 4, 0xFF0000);
		private var vx : Number = 0.0;
		private var vy : Number = -20.0;
		
		public function FireParticle(newX:Number, newY:Number) 
		{
			x = newX;
			y = newY;
			
			graphic = img;	
			
			vx = Math.random() * 20 - 10;
		}
		
		override public function update():void 
		{
			img.alpha -= 0.01;
			
			if (img.alpha <= 0.0)
				world.remove(this);
			
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
		}
	}

}