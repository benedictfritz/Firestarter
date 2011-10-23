package emitters 
{
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class StreetFireParticle extends Entity
	{
		//private var randSq : uint = uint(Math.floor(Math.random() * 10) + 4);
		//private var img:Image = Image.createRect(randSq,randSq, 0xFF0000);
		private var img:Image = Image.createCircle(uint(Math.floor(Math.random() * 6.0) + 2), 0xFF3300);
		private var vx : Number = 0.0;
		private var vy : Number = -20.0;
		//private var fadeAmt : Number = 0.025;
		private var totalTime : Number = 0.0;
		private var shrinkAmt : Number = 0.03;
		
		public function StreetFireParticle(newX:Number, newY:Number) 
		{
			x = newX-img.width/2, y = newY-img.height/2;
			
			graphic = img;	
			
			vx = Math.random() * 20 + 10;
		}
		
		override public function update():void 
		{
			//img.alpha -= fadeAmt;
			img.scale -= shrinkAmt;
			
			if (totalTime >= 0.25 && totalTime < 0.5)
				img.color = 0xFF6633;
			else if (totalTime >= 0.5 && totalTime < 0.75)
				img.color = 0xCC3300;
			else if (totalTime >= 0.75)
				img.color = 0x330000;
			
			if (/*img.alpha <= 0.0 || */img.scale <= 0.0)
				world.remove(this);
			
			x += vx * FP.elapsed;
			y += vy * FP.elapsed;
			
			totalTime += FP.elapsed;
		}
		
		override public function render():void {
			if (onCamera) {
				super.render();
			}
		}
	}

}