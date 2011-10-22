package entities 
{
	import emitters.FireEmitter;
	import emitters.FireParticle;
	import entities.NewPlayer;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Building extends Entity
	{
		private var lifeTotal : Number = 100.0;
		private var degrader : Number = 0.0;
		private var speed : Number = 50.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		private var rotator : Number = 0.0;
		private var img : Image = Image.createRect(32, 32, 0x00FF00);
		private var fireCnt : int = 0;
		private var fireMax : int = 5;
		//private var emitterList : Array;
		
		public function Building(newX:Number, newY:Number) 
		{
			x = newX + img.width / 2, y = newY + img.height / 2;
			
			graphic = img;
			//emitterList = new Array();
			
			setHitbox(img.width, img.height);
			type = "building";
		}
		
		override public function update():void
		{
			var match:Match = collide("match", x, y) as Match;
			var fireC:FireChunk = collide("firechunk", x, y) as FireChunk;
			
			if ((match || fireC) && fireCnt < fireMax)
			{
				if (match)
					world.remove(match);
				else
					world.remove(fireC);
					
				var tmp : Entity = world.add(new FireEmitter(x + (Math.random() * img.width), y + (Math.random() * img.height)));
				//emitterList.push(tmp);
				degrader += 0.5;
				fireCnt++;
			}
			
			if (lifeTotal <= 0)
			{
				world.remove(this);
				//for (var i : int = 0; i < emitterList.length; i++)
					//world.remove(emitterList[i]);
				world.add(new FireChunk(x+img.width/2, y+img.height/2, Math.floor(Math.random() * 4)));
			}
			
			lifeTotal -= degrader;
		}
	}
}