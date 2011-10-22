package emitters 
{
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class FireParticle extends Entity
	{
		//private var randSq : uint = uint(Math.floor(Math.random() * 8) + 2);
		//private var img:Image = Image.createRect(randSq,randSq, 0xFF0000);
		private var img:Image = Image.createCircle(uint(Math.floor(Math.random() * 4.5) + 1), 0xFF0000);
		private var vx : Number = 0.0;
		private var vy : Number = -20.0;
		private var fadeAmt : Number = 0.02;
		private var shrinkAmt : Number = 0.01;
		
		public function FireParticle(newX:Number, newY:Number) 
		{
			x = newX-img.width/2, y = newY-img.height/2;
			
			graphic = img;	
			
			vx = Math.random() * 20 - 10;
		}
		
		override public function update():void 
		{
			img.alpha -= fadeAmt;
			img.scale -= shrinkAmt;
			
			if (img.alpha <= 0.0)
				world.remove(this);
			
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
		}
	}

}