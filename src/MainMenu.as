package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author ...
	 */
	public class MainMenu extends Sprite 
	{
		private var play:Sprite;
		private var mute:Sprite;
		public function MainMenu() : void{
			addEventListener(Event.ADDED_TO_STAGE, go);
			addEventListener(Event.REMOVED_FROM_STAGE, die);
		}
		private function go(e:Event) :void
		{
			removeEventListener(Event.ADDED_TO_STAGE, go);
			
			play = item("Play", (285 - 250 * 0.5), (220 - 30 * 0.5)-20, launchGame, 0x33CFF0,000000);
			mute = item("Mute", (285 - 250 * 0.5), (220 - 30 * 0.5) + 20, mutegame, 0x33CFF0,000000);
			addChild(play);
			addChild(mute);
			
		}
		private function launchGame(e:MouseEvent):void
		{
			dispatchEvent(new CustomEvents(CustomEvents.LAUNCH_GAME));
			
		}
		
		private function mutegame(e:MouseEvent):void
		{
			
			dispatchEvent(new CustomEvents(CustomEvents.MUTE_GAME));
		}
		
		
		private function item(buttonText:String, X:int, Y:int, Fuct:Function,buttoncolour:uint = 0x33CFF0, txtColour:uint = 000000):Sprite
		{
				var item:Sprite = new Sprite();
				item.graphics.beginFill(buttoncolour);
				item.graphics.lineStyle(5, buttoncolour, .5);
				item.graphics.drawRoundRect(0, 0, 250, 30, 25);
				//(0, 0, 250, 30);
				var myText:TextField = new TextField();
				myText.selectable = false;
				myText.width = 250;
				myText.height = 30;
				item.addChild(myText);
				myText.autoSize = "center";
				myText.y = myText.y + 4;
				myText.text = buttonText;
				myText.textColor = txtColour;
				item.addEventListener(MouseEvent.CLICK, Fuct);
				item.x = X;
				item.y = Y;
				return item;
			
			
		}
		private function die(e:Event): void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, die);
			play.removeEventListener(MouseEvent.CLICK, launchGame);
			removeChild(play);
			play = null;
			
		}
	}
}