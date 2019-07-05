package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Lazi
	 */
	public class Main extends Sprite 
	{
		public static var pacman:Pacman;
		
		private var menu:MainMenu;
		private var game:PacGame;
		public static var Sidebar:sidebar;
		private var walls:Tile;
		private var food:Tile;
		private var wall:Bitmap = new Assets.wall();
		private var pellet:Bitmap = new Assets.pellet();
		
		private var num:int = 0;
		public static var board:Board=new Board();
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//entry point
			
			buildMenu();
		
		}
		private function buildMenu():void
		{
			menu = new MainMenu();
			addChild(menu);
			//menu.addEventListener(KeyboardEvent.KEY_DOWN, startgame2, false, 0, true);
			menu.addEventListener(CustomEvents.LAUNCH_GAME, startgame, false, 0 , true);
			menu.addEventListener(CustomEvents.MUTE_GAME, mutegame, false, 0 , true);

			
		}
		private function startgame(e:CustomEvents):void
		{
			removeChild(menu);
			menu.removeEventListener(CustomEvents.LAUNCH_GAME, startgame);
			menu = null;
			Sidebar = new sidebar();
			game = new PacGame();
			
			//walls = new Tile(0, 0, wall);
			
			
			

			stage.stageFocusRect = false;
			stage.focus = game;
			stage.color = 000000;
			
			addChild(board);
					
			
			addChild(game);
			addChild(Sidebar);
			
		}
		
		private function fillFood():void
		{
			
			
		}
		
		private function mutegame(e:CustomEvents):void
		{
			//menu.removeEventListener(CustomEvents.MUTE_GAME, mutegame);
			trace("helloWorld");
			
		}
		
		private function startgame2(e:KeyboardEvent):void
		{
			
			if (e.keyCode == 13)
			{
				menu.removeEventListener(KeyboardEvent.KEY_DOWN, startgame2);
				
				removeChild(menu);
				
				menu = null;
				game = new PacGame();
				stage.stageFocusRect = false;
				stage.focus = game;
				stage.color = 000000;
				addChild(game);
			}
			
		}
	}
	
}