package systems {
	import components.VelocityComponent;
	import components.PositionComponent;
	import components.DisplayComponent;
	/**
	 * @author berendweij
	 */
	public class MovementSystem extends System {
		
		override public function update():void
		{
			// in deze update staat de logica om de objecten te laten bewegen
			for each( var target:Entity in targets )
			{
				// aangezien we door alle targets heen loopen moeten we ook kijken of deze target wel de components
				// die wij nodig hebben
				if (target.get(PositionComponent) && target.get(VelocityComponent))
				{
					// zorg ervoor dat we visueel echt laten zien hoe de game er op dit moment uitziet
					target.get(PositionComponent).x			+=	target.get(VelocityComponent).velocityX;
					target.get(PositionComponent).y 		+=	target.get(VelocityComponent).velocityY;
					target.get(PositionComponent).rotation	+=	target.get(VelocityComponent).angularVelocity;
				}
			}
		}
		
	}
}
