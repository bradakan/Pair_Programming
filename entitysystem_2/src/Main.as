package 
{
	import adobe.utils.CustomActions;
	import components.CollisionComponent;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	import components.ShootComponent;
	import factories.CarFactory;
	import factories.MissileFactory;
	import factories.TurretFactory;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import systems.CollisionSystem;
	import systems.GravitySystem;
	import systems.MovementSystem;
	import systems.MoveToTargetSystem;
	import systems.RenderSystem;
	import systems.RotateToTargetSystem;
	public class Main extends Sprite
	{
		private var _engine	:	Engine;
		
		public function Main()
		{
			
			// we maken als eerste de engine aan. Deze is het belangrijkste
			_engine	=	new Engine();
			
			// vervolgens initieren wij de systemen
			// dit doen we door ze toe te voegen aan de engine
			//_engine.addSystem(new GravitySystem());
			//_engine.addSystem(new MovementSystem());
			//_engine.addSystem(new CollisionSystem());
			_engine.addSystem(new RenderSystem());	
			_engine.addSystem(new RotateToTargetSystem(stage));
			_engine.addSystem(new MoveToTargetSystem());
			
			// de wereld willen we ook als Entity hebben
			var world : Entity = new Entity();
			
			var worldPosition : PositionComponent = new PositionComponent();
			worldPosition.x = 0;
			worldPosition.y = 400;
			
			var worldDisplay	: DisplayComponent = new DisplayComponent();
			worldDisplay.view = new Landscape();
			
			world.add(worldPosition);
			world.add(worldDisplay);
			// laat de auto ook visueel zien
			// we voegen hem toe aan de stage
			addChild(world.get(DisplayComponent).view);
			
			// we hebben 1 component nodig die door alle objecten gebruikt kan worden
			// deze component bevat een verwijzing naar de wereld
			var collision : CollisionComponent = new CollisionComponent();
			collision.world	=	world;
			
			var turretFactory	:	TurretFactory	=	new TurretFactory();
			
			for (var i : int = 0; i < 3; i++)
			{
				var x:Number = 100 + i * 250,
					y:Number = 500,
					turret : Entity	=	turretFactory.makeTurret(TurretFactory.NORMALTURRET, x, y);
				//turret.add(collision);
				addChild(turret.get(DisplayComponent).view);
				// registreer de auto bij de engine zodat de game ook gaat werken
				_engine.addEntity(turret);
			}
			
			_engine.addEntity(world);
			
			// start het updaten van het spel
			stage.addEventListener(Event.ENTER_FRAME, updateEngine);
			// kijk of er geklikt word in de stage
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function updateEngine(e : Event) : void
		{
			_engine.update();
		}
		private function onClick(e : MouseEvent) : void
		{
			var tempTargets:Vector.<Entity> = new Vector.<Entity>,
				random:int,
				x:Number,
				y:Number,
				missileFactory:MissileFactory = new MissileFactory(),
				radian:Number;
			for each (var target:Entity in _engine.entities) 
			{
				if (target.get(ShootComponent)) 
				{
					tempTargets.push(target);
				}
			}
			random = Math.random() * tempTargets.length;
			x = tempTargets[random].get(PositionComponent).x;
			y = tempTargets[random].get(PositionComponent).y;
			var missile:Entity = missileFactory.makeMissile(MissileFactory.PLAYER_MISSILE, stage.mouseX, stage.mouseY, x, y);
			addChild(missile.get(DisplayComponent).view);
			_engine.addEntity(missile);
		}
	}
}
