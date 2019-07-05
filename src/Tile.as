package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;;
	/**
	 * ...
	 * @author ...
	 */
	public class Tile extends Sprite 
	{
		
		private var mytype:Bitmap;
		public function Tile(X:int, Y:int, type:Bitmap)
		{
			addEventListener(Event.ADDED_TO_STAGE, go);
			x = X;
			y = Y;
			mytype = type;
		}
		private function go(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			addChild(mytype);
		}
	}
	
}