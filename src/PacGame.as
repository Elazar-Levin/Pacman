package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PacGame extends Sprite 
	{
		public static var pac:Pacman;
		public static var red:redGhost;
		public function PacGame():void
		{
			addEventListener(Event.ADDED_TO_STAGE, go);
			
		}
		private function go(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			pac = new Pacman();
			red = new redGhost();
			addChild(pac);
			addChild(red);
			
			
		}
	}
	
}