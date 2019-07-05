package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Lazi
	 */
	
	public class sidebar extends Sprite 
	{
		private var speedup:Sprite;
		private var enemydown:Sprite;
		private var waiting:Sprite;
		private var value:Sprite;
		private var pacman:Pacman = Main.pacman;
		public function sidebar()
		{
			addEventListener(Event.ADDED_TO_STAGE, go);
			
		}
		private function go(e:Event):void
		{
			//pacman.addEventListener(CustomEvents.SPEED_PAC_BOUGHT, speedpacbought, false, 0, true);
			removeEventListener(Event.ADDED_TO_STAGE, go);
			speedup = item("speed up", 400, 60, speedpac, 0x33CFF0, 0xFFFFFF);
			enemydown = item("ghost speed", 400,110,ghostspeed,0x33CFF0, 0xFFFFFF);
			waiting = item("waiting time", 400,160,wait,0x33CFF0, 0xFFFFFF);
			value = item("money value", 400,210,money,0x33CFF0, 0xFFFFFF);
			//to do:add money value button
		
			
			//mute = item("Mute", (380 - 250 * 0.5), (220 - 30 * 0.5) + 20, mutegame, 0x33CFF0,000000);
			addChild(enemydown);
			addChild(speedup);
			addChild(waiting);
			addChild(value);
			//addChild(speeduptxt);
			
			//addChild(mute);
		
		}	
		private function item(buttonText:String, X:int, Y:int, Fuct:Function,buttoncolour:uint = 0x33CFF0, txtColour:uint = 000000):Sprite
		{
				var item:Sprite = new Sprite();
				item.graphics.beginFill(buttoncolour);
				item.graphics.lineStyle(5, buttoncolour, .5);
				item.graphics.drawRoundRect(0, 0, 70, 30, 25);
				//(0, 0, 250, 30);
				var myText:TextField = new TextField();
				myText.selectable = false;
				myText.width = 50;
				myText.height = 30;
				item.addChild(myText);
				myText.autoSize = "center";
				myText.y = myText.y + 4;
				myText.x = myText.x + 10;
				myText.text = buttonText;
				myText.textColor = txtColour;
				item.addEventListener(MouseEvent.CLICK, Fuct);
				item.x = X;
				item.y = Y;
				return item;
			
			
		}
		private function text(mytext:String,X:int,Y:int,txtcolour:uint=000000):TextField
		{
			var txt:TextField = new TextField();
			txt.textColor = txtcolour;
			txt.text = mytext;
			txt.x = X;
			txt.y = Y;
			return txt;
		}
		private function speedpac(e:MouseEvent):void
		{
			//trace("blah");
			dispatchEvent(new CustomEvents(CustomEvents.SPEED_PAC_BUY));
			
		}
		private function ghostspeed(e:MouseEvent):void
		{
			dispatchEvent(new CustomEvents(CustomEvents.GHOST_SPEED));
		}
		private function wait(e:MouseEvent):void
		{
			dispatchEvent(new CustomEvents(CustomEvents.WAITING_TIME));
		}
		private function money(e:MouseEvent):void
		{
			dispatchEvent(new CustomEvents(CustomEvents.MONEY_VALUE));
		}
	}
	
}