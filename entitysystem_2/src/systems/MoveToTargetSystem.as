package systems 
{
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class MoveToTargetSystem extends System
	{
		override public function update():void
		{
			for each( var target:Entity in targets )
			{
				// aangezien we door alle targets heen loopen moeten we ook kijken of deze target wel de components
				// die wij nodig hebben
				if (target.get(PositionComponent) && target.get(VelocityComponent))
				{}
			}
		}
		
		
	}

}