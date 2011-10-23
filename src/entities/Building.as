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
	    [Embed(source = '../../levels/images/BuildingL.png')]
		private const BUILDING_L:Class;
	    [Embed(source = '../../levels/images/BuildingM.png')]
		private const BUILDING_M:Class;
	    [Embed(source = '../../levels/images/BuildingS.png')]
		private const BUILDING_S:Class;
	    [Embed(source = '../../levels/images/BuildingS2h.png')]
		private const BUILDING_S2_H:Class;
	    [Embed(source = '../../levels/images/BuildingS2v.png')]
		private const BUILDING_S2_V:Class;

	    [Embed(source = '../../levels/images/BuildingL_rub.png')]
		private const BUILDING_L_RUB:Class;
	    [Embed(source = '../../levels/images/BuildingM_rub.png')]
		private const BUILDING_M_RUB:Class;
	    [Embed(source = '../../levels/images/BuildingS_rub.png')]
		private const BUILDING_S_RUB:Class;
	    [Embed(source = '../../levels/images/BuildingS2h_rub.png')]
		private const BUILDING_S2_H_RUB:Class;
	    [Embed(source = '../../levels/images/BuildingS2v_rub.png')]
		private const BUILDING_S2_V_RUB:Class;

		private var lifeTotal : Number = 100.0;
		private var degrader : Number = 0.0; //Takes life away from buildings
		private var degraderInc : Number = 0.2; //Increase the damage being done to buildings when hit by match
		private var speed : Number = 50.0;
		private var gravity : Number = 9.8;
		private var vx : Number = 0.0;
		private var vy : Number = 0.0;
		private var time : Number = 0.0;
		private var fireCnt : int = 0;
		private var emitterF : Entity;
		private var emitterList : Array = new Array();
		private var onFire : Boolean = false; //Is the building on fire
                private var rubble: Boolean = false; // is this building rubble now?
	        private var buildingType : String;
		private var burningTime : Number = 0.0;
		private var incTimer : Number = 2.5; //Time it takes while on fire to add another emitter
		private var chunks : uint = 1.0; //How many chunks break out when a building collapses
		
	    public function Building(x:Number, y:Number, buildingType:String) 
		{
		    this.buildingType = buildingType;
		    type="building";

		    var buildingImage:Image;

		    switch (buildingType) {
		    case "buildingL":
			lifeTotal = 300.0;
			chunks = 3;
			buildingImage = new Image(BUILDING_L);
			break;
		    case "buildingM":
			lifeTotal = 250.0;
			chunks = 2;
			buildingImage = new Image(BUILDING_M);
			break;
		    case "buildingS":
			lifeTotal = 100.0;
			chunks = 1;
			buildingImage = new Image(BUILDING_S);
			break;
		    case "buildingS2h":
			lifeTotal = 200.0;
			chunks = 2;
			buildingImage = new Image(BUILDING_S2_H);
			break;
		    case "buildingS2v":
			lifeTotal = 200.0;
			chunks = 2;
			buildingImage = new Image(BUILDING_S2_V);
			break;
		    }
	    
		    graphic = buildingImage;
		    setHitbox(buildingImage.width, buildingImage.height);

		    this.x = x;
		    this.y = y;
		    
		    type = "building";
		}
		
		override public function update():void
		{
		    if(rubble)
			return;

			var match:Match = collide("match", x, y) as Match;
			var fireC:FireChunk = collide("firechunk", x, y) as FireChunk;
			
			if (burningTime >= incTimer)
			{
				burningTime = 0.0;
				emitterF = new FireEmitter(x + (Math.random() * this.width), y + (Math.random() * this.height));
				emitterList.push(emitterF);
				world.add(emitterF);	
				fireCnt++;			
			}
			
			if (match || fireC)
			{
				if (match)
					world.remove(match);
				else
					world.remove(fireC);
					
				onFire = true;
				emitterF = new FireEmitter(x + (Math.random() * this.width), y + (Math.random() * this.height));
				emitterList.push(emitterF);
				world.add(emitterF);
				degrader += degraderInc;
				fireCnt++;
			}
			
			if (lifeTotal <= 0)
			{
				world.add(new FireChunk(x + this.width / 2, y + this.height / 2));
				world.add(new FireChunk(x + this.width / 2, y + this.height / 2));
				world.add(new FireChunk(x + this.width / 2, y + this.height / 2));
				for (var i:int = 0; i < fireCnt; i++)
					world.remove(emitterList[i]);

				rubble = true;
				var buildingImage:Image;

				switch (buildingType) {
				case "buildingL":
				    buildingImage = new Image(BUILDING_L_RUB);
				    break;
				case "buildingM":
				    buildingImage = new Image(BUILDING_M_RUB);
				    break;
				case "buildingS":
				    buildingImage = new Image(BUILDING_S_RUB);
				    break;
				case "buildingS2h":
				    buildingImage = new Image(BUILDING_S2_H_RUB);
				    break;
				case "buildingS2v":
				    buildingImage = new Image(BUILDING_S2_V_RUB);
				    break;
				}
				this.graphic = buildingImage;
				return;
			}
			
			lifeTotal -= degrader;
			
			if (onFire)
				burningTime += FP.elapsed;
		}
		
		override public function render():void {
			if (onCamera) {
				super.render();
			}
		}
	}
}