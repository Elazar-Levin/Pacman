package 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CustomEvents extends Event 
	{
		public static const LAUNCH_GAME:String = "launch_game";
		public static const MUTE_GAME:String = "mute_game";
		public static const PAUSE_GAME:String = "pause_game";
		public static const SPEED_PAC_BUY:String = "speed_pac_buy";
		public static const GHOST_SPEED:String = "ghost_speed";
		public static const GHOST_SPEED2:String = "ghost_speed2";
		public static const MONEY_VALUE:String = "money_value";
		public static const COLLIDES:String = "collides";
		public static const WAITING_TIME:String = "waiting_time";
		public static const WAITING_TIME2:String = "waiting_time2";
		
		
		public function CustomEvents(e:String):void
		{
			super(e);
			
		}
	}
	
}