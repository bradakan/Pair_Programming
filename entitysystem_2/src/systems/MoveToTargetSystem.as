package systems 
{
	import components.PositionComponent;
	import components.MoveToTargetComponent;
	import flash.geom.Point;
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
				if (target.get(PositionComponent) && target.get(MoveToTargetComponent))
				{
					var x:Number = target.get(PositionComponent).x,
						y:Number = target.get(PositionComponent).y,
						speed:Number = target.get(MoveToTargetComponent).speed,
						targetX:Number = target.get(MoveToTargetComponent).targetX,
						targetY:Number = target.get(MoveToTargetComponent).targetY,
						pos:Point = new Point(x, y),
						oldPos:Point = new Point(x, y),
						t:Point = new Point(targetX, targetY),
						v:Point = new Point(t.x - pos.x, t.y - pos.y),
						distance:Number = Math.sqrt(v.x * v.x + v.y * v.y),
						unitVector:Point = new Point(v.x / Math.sqrt(v.x * v.x + v.y * v.y), v.y / Math.sqrt(v.x * v.x + v.y * v.y)),
						dir:Number;
					
					unitVector.x = unitVector.x * speed;
					unitVector.y = unitVector.y * speed;
					pos.x = pos.x + unitVector.x;
					pos.y = pos.y + unitVector.y;
					target.get(PositionComponent).x = pos.x;
					target.get(PositionComponent).y = pos.y;
					
					if (distance < speed || y == targetY)
					{
						trace("Point Reached");
						if (target.get(ExplodeComponent)
						{
							target.get(ExplodeComponent).explode = true;
						}
					}
				}
			}
		}
	}
}