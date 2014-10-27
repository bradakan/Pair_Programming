package systems 
{
	import components.PositionComponent;
	import components.RotateToTargetComponent;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class RotateToTargetSystem extends System
	{
		private var _stage:Stage;
		public function RotateToTargetSystem(	stage : Stage	)
		{
			_stage = stage;
		}
		override public function update():void
		{
			for each( var target:Entity in targets )
			{
				if (target.get(PositionComponent) && target.get(RotateToTargetComponent))
				{
					
					var x:Number,
						y:Number,
						rotationInRadians:Number;
					if (target.get(RotateToTargetComponent).lookToMouse)
					{
						x = target.get(PositionComponent).x - _stage.mouseX;
						y = target.get(PositionComponent).y - _stage.mouseY;
					} else {
						x = target.get(RotateToTargetComponent).lookTarget.get(PositionComponent).x;
						y = target.get(RotateToTargetComponent).lookTarget.get(PositionComponent).y;
					}
					rotationInRadians = Math.atan2(x, y);
					target.get(PositionComponent).rotation =  -rotationInRadians * (180 / Math.PI);
				}
			}
		}
	}
}