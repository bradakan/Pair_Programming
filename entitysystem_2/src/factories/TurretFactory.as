package factories 
{
	import adobe.utils.CustomActions;
	import components.DisplayComponent;
	import components.PositionComponent;
	import components.VelocityComponent;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class TurretFactory 
	{
		
		public static var NORMALTURRET	:	String	=	"normalturret";
		
		public function TurretFactory() 
		{
			
		}
		
		public  function makeTurret(type : String) : Entity
		{
			
			// we maken de componenten aan. Hier kan het systeem zijn 'data' in opslaan
			// met data kunnen we waardes opslaan (positie, rotatie, etc.)
			if (type == NORMALTURRET)
			{
				var display	:	DisplayComponent		=	new DisplayComponent();
				display.view							=	new TurretImage();
			}
			
			var position	:	PositionComponent	=	new PositionComponent();
			position.x								=	Math.random() * 600;
			position.y								=	200;
			
			
			// als laatste maken we onze entity aan
			// de entity bestaat uit componenten.
			var turret	:	Entity						=	new Entity();
			
			// we voegen de componenten toe aan de entity Turret
			// hiermee bepalen we het gedrag van deze entity
			turret.add(display);
			turret.add(position);
			
			
			return turret;
		}
		
	}

}