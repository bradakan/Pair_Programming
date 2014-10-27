package factories 
{
	import flash.geom.Point;
	import components.*;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class MissileFactory 
	{
		public static const PLAYER_MISSILE : String = "player missile";
		public static const ENEMY_MISSILE : String = "enemy  missile";
		public  function makeMissile(type : String, targetX:Number, targetY:Number, startX:Number,startY:Number) : Entity
		{
			
			// we maken de componenten aan. Hier kan het systeem zijn 'data' in opslaan
			// met data kunnen we waardes opslaan (positie, rotatie, etc.)
			if (type == PLAYER_MISSILE)
			{
				var display	:	DisplayComponent		=	new DisplayComponent();
				display.view							=	new PlayerMissileImage();
			}
			
			var position	:	PositionComponent	=	new PositionComponent();
			position.x								=	startX;
			position.y								=	startY;
			
			var velocity	:	VelocityComponent	=	new VelocityComponent();
			velocity.velocityX						=	Math.random() * 10 - 5;
			velocity.velocityY						=	0;
			
			var rotateToTarget : RotateToTargetComponent = new RotateToTargetComponent();
			rotateToTarget.lookTarget 				= 	new Point(targetX, targetY);
			rotateToTarget.lookToMouse 				=	false;
			
			var movePoint : MoveToTargetComponent = new MoveToTargetComponent();
			movePoint.targetX = targetX;
			movePoint.targetY = targetY;
			// als laatste maken we onze entity aan
			// de entity bestaat uit componenten.
			var missile	:	Entity						=	new Entity();
			
			// we voegen de componenten toe aan de entity car
			// hiermee bepalen we het gedrag van deze entity
			missile.add(display);
			missile.add(position);
			missile.add(velocity);
			missile.add(rotateToTarget);
			missile.add(movePoint);
			
			
			
			return missile;
		}
	}

}