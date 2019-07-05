package 
{
	import com.adobe.tvsdk.mediacore.PSDK;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;

	/**
	 * ...
	 * @author lazi
	 */
	public class redGhost extends Sprite 
	{
		private var redleft:Bitmap = new Assets.redleft1();
		private var redleft2:Bitmap = new Assets.redleft2();
		private var redright2:Bitmap = new Assets.redright2();
		private var reddown2:Bitmap = new Assets.reddown2();
		private var redup2:Bitmap = new Assets.redup2();
		private var redright:Bitmap = new Assets.redright1();
		private var redup:Bitmap = new Assets.redup1();
		private var reddown:Bitmap = new Assets.reddown1();
		private var movingUp:Boolean;
		private var movingDown:Boolean;
		private var movingLeft:Boolean;
		private var movingRight:Boolean;
		private var paused:Boolean;
		private var left:Bitmap = redleft;
		private var right:Bitmap = redright;
		private var down:Bitmap = reddown;
		private var up:Bitmap =redup;
		private var speed:int = 5;
		private var frame:int = 0;
		private var pacman2:Pacman = Main.pacman;
		public static var newBoard:Board = new Board();
		private var tiles:Array = newBoard.getTiles();//tiles isnt working no idea why
		private var hold:Array = new Array();
		private var points:Array = new Array();
		private var stuff:Array = new Array();
		private var blah:String = "";
		private var arr:Array = new Array();
		private var speedprice:TextField = new TextField();
		private var waitprice:TextField = new TextField();
		private var waitingtime:Number = 100;
		private var ticks:Number = 0;
		private var tickprice:Number = 5;
		private var arr2:Array = new Array();
		private	var store:Array = new Array();
		public static var redspeedprice:Number = 50;
		
		public function redGhost(){
			addEventListener(Event.ADDED_TO_STAGE, go);
			
		}
		private function go(e:Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, go);
		
			speedprice.text = redspeedprice.toString();
			waitprice.text = tickprice.toString();
			speedprice.textColor = 0xFFFFFF;
			waitprice.textColor = 0xFFFFFF;
			
			speedprice.x = 525;
			waitprice.x = 525;
			speedprice.y = 110;
			waitprice.y = 160;
			speedprice.selectable = false;
			waitprice.selectable = false;
			
			stage.addChild(speedprice);
			stage.addChild(waitprice);
			addChild(redleft);
			//	movingLeft = true; if you want him to start off moving left
			y = 10*20;
			x = 9 * 20;
			//points.push(9 * 20);
			//points.push(9 * 20);
			//tiles.push(points);
			//points = [];
			for (var i = 0; i < 22; i++ )
			{
				stuff[i] = new Array();
				stuff[i].length = 19;
				
			}
			for (var i = 0; i < 22; i++ )
			{
				for (var j = 0; j < 19; j++ )
				{
					stuff[i][j] = true;
					
				}
				
			}
			/*for (var i = 0; i < 22; i++ )
			{
				for (var j = 0; j < 19; j++ )
				{
					if ((i == 0 ) || (i==1 && (j==0 || j==9 || j==18) ) || ((i==2 || i== 3 ) && (j!=1 && j!=4 && j!=8 && j!=10 && j!=14 && j!=17))|| (i==4 &&(j==0 || j==18) ))
					{
						stuff[i][j] = false;
						
					}
					
				}
				
			}*/
			
	
			
			
			
			
			
			
			
			for (var j:int = 0; j < 22; j++ )//full vertical
			{
				if (j != 10 && j!=8 && j!=12)
				{
					stuff[j][0] = false;
					stuff[j][18] = false;
					
					
				}
				
				if (j == 0 || j == 7 || j == 9 || j == 11 || j == 13 || j == 17 || j == 21)
				{
					stuff[j][1] = false;
					stuff[j][17] = false;
					
				}
				
				if (j == 0 || j==2 || j==3 || j==5 || j == 7 || j == 9 || j == 11 || j == 13 || j==15 || j == 19 || j == 21)
				{
					stuff[j][2] = false;
					stuff[j][16] = false;
					
				}
				
				if (j == 0 || j==2 || j==3 || j==5 || j == 7 || j==8 || j == 9 || j == 11 || j==12 || j == 13 || j==15 ||j==16 ||j==17|| j == 19 || j == 21)
				{
					stuff[j][3] = false;
					stuff[j][15] = false;
					
				}
				if (j == 0 || j == 19 || j == 21)
				{
					stuff[j][4] = false;
					stuff[j][14] = false;
				}
				
				if (j != 1 && j != 4 && j != 10 && j != 14 && j != 16 && j != 20)
				{
					stuff[j][5] = false;
					stuff[j][13] = false;
					
				}
				if(j==0||j==2||j==3||j==7||j==15 ||j==19  ||j==21)
				{
					stuff[j][6] = false;
					stuff[j][12] = false;
									}
				if(j==0||j==2||j==3|| j==5  || j==7 || j==9 ||j==10 ||j==11 ||j==13 || j==15 ||j==17  ||j==19  ||j==21)
				{
					stuff[j][7] = false;
					stuff[j][11] = false;
				}
				
				if(j==0||j==5||j==9||j==11||j==13 ||j==17  ||j==21)
				{
					stuff[j][8] = false;
					stuff[j][10] = false;
					
				}
				if(j!=4 && j!=8 && j!=9 && j!=10 && j!=12 && j!=16 && j!=20)
				{
					stuff[j][9] = false;
								
				}
			
			}
			
			Main.Sidebar.addEventListener(CustomEvents.GHOST_SPEED, speedbuy, false, 0, true);			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler, false, 0, true);
			PacGame.pac.addEventListener(CustomEvents.COLLIDES, collision, false, 0, true );

			addEventListener(Event.REMOVED_FROM_STAGE, die, false, 0, true);
			Main.Sidebar.addEventListener(CustomEvents.WAITING_TIME, wait, false, 0, true);
			
		}
		
		private function keydownhandler(e:KeyboardEvent) : void{
			addEventListener(Event.ENTER_FRAME, enterframe, false, 0, true);
			if (e.keyCode == 80 || e.keyCode==13)
			{
			
				if (paused == false)
				{
					paused = true;
					
				}
				else
				{
					paused = false;
					
				}
				
			}
			/*if (!paused)
			{
				if (e.keyCode == 37 || e.keyCode== 65){
					movingLeft = true;
					movingRight = false;
					movingUp = false;
					movingDown = false;
					addChild(left);
				}
				if (e.keyCode == 39 || e.keyCode == 68)
				{
					movingRight = true;
					movingLeft = false;
					movingUp = false;
					movingDown = false;
					addChild(right);		
					
				}
				if (e.keyCode == 38|| e.keyCode== 87)
				{
					movingUp = true;
					movingLeft = false;
					movingRight = false;
					movingDown = false;
					addChild(up);
				}
				if (e.keyCode == 40 || e.keyCode==83)
				{
					movingDown = true;
					movingUp = false;
					movingLeft = false;
					movingRight = false;
					addChild(down);
				}
			}*/
		}
		private function enterframe(e:Event) : void{
			
			if (!paused)
			{
				//trace(waitingtime);
				if (ticks >= waitingtime){
					var p:String = bfs();
					if (p == "left")
					{
						movingLeft = true;
						movingRight = false;
						movingUp = false;
						movingDown = false;
						addChild(left);
					}
					else if (p == "right")
					{
						movingRight = true;
						movingLeft = false;
						movingUp = false;
						movingDown = false;
						addChild(right);	
					}
					else if (p == "up")
					{
						movingUp = true;
						movingLeft = false;
						movingRight = false;
						movingDown = false;
						addChild(up);
						
					}
					else
					{
						movingDown = true;
						movingUp = false;
						movingLeft = false;
						movingRight = false;
						addChild(down);
					}
					
					if (movingLeft)
					{
						
						if (frame%(int(stage.frameRate/10))==0) 
						{
						
							if (left==redleft)
							{
								left = redleft2;
							
								
							}
							else
							{
								left = redleft;
								
							}
							addChild(left);
						}
						//blah=bst(pacman2.x, pacman2.y);
						//blah = bst(5, 6);
						if (x - speed >= 20 || (x-speed<20 && y==20*10))
						{
							x -= speed;
						}
						else 
						{
							x = 20;
						}
						if (x - speed < 0)
						{
							
							x = 380 - redleft.width;
						}
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								hold.push(tiles[i][0]);
							
							}
						}
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								x = tiles[i][0] + 20;
								if (hold.length <= 1)
								{
									if (tiles[i][1]-y>= redleft.height*0.2)
									{
										y = y - speed; //* 20;
									}
									if (y-tiles[i][1]>= redleft.height*0.2)
									{
										y = y + speed; //* 20;
									}
								}
								hold = [];
								break;
								
							}
						}
						
						
						
						
					}
						
					
					if (movingRight)
					{
						
						if (frame%(int(stage.frameRate/10))==0) 
						{
						
							if (right==redright)
							{
								right = redright2;
							
								
							}
							else
							{
								right = redright;
								
							}
							addChild(right);
						}
						if ((x + redright.width + speed <= stage.stageWidth-20)|| (x+redright.width+speed>stage.stageWidth-20 && y==200))
						{
							x += speed;
						}
						else
						{
							
							x = stage.stageWidth - redright.width - 20;
							
						}
						if (x + redright.width + speed > 380)
						{
							x = 0;
						}
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								hold.push(tiles[i][0]);
							
							}
						}
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								x = tiles[i][0]- 20;
								if (hold.length <= 1)
								{
									if (tiles[i][1]-y>= redleft.height*0.2)
									{
										y = y - speed; //* 20;
									}
									if (y-tiles[i][1]>= redleft.height*0.2)
									{
										y = y + speed; //* 20;
									}
								}
								hold = [];
								break;
								
							}
						}	
						
							
					
						
					}
					if (movingUp)
					{
						if (frame%(int(stage.frameRate/10))==0) 
						{
						
							if (up==redup)
							{
								up = redup2;
								//addChild(left);
								
							}
							else
							{
								up = redup;
								
							}
							addChild(up);
						}
						if (y - speed >= 20)
						{
							y -= speed;
						}
						//else
						//{
								//y = 20;
						//
						//}
						/*for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]) && y!=20)
							{
								y = tiles[i][1]+20 ;
								break;
							}
						}*/
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]) )
							{
								hold.push(tiles[i][1]);
							
							}
						}
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								y = tiles[i][1]+ 20;
								if (hold.length <= 1)
								{
									if (tiles[i][0]-x>= redleft.width*0.2)
									{
										x = x - speed; //* 20;
									}
									if (x-tiles[i][0]>= redleft.width*0.2)
									{
										x = x + speed; //* 20;
									}
								}
								hold = [];
								break;
								
							}
						}	
						
					
					}
					if (movingDown){
						if (frame%(int(stage.frameRate/10))==0) 
						{
						
							if (down==reddown)
							{
								down = reddown2;
								//addChild(left);
								
							}
							else
							{
								down = reddown;
								
							}
							addChild(down);
						}
						if (y + speed + reddown.height <= stage.stageHeight-20)
						{
							y += speed;
						}
						else
						{
								y = stage.stageHeight - reddown.height-20;
								
						}
					
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								hold.push(tiles[i][1]);
							
							}
						}
						for (var i:int = 0; i < tiles.length; i++ )
						{
							if (collides(x, y, tiles[i][0], tiles[i][1]))
							{
								y = tiles[i][1]- 20;
								if (hold.length <= 1)
								{
									if (tiles[i][0]-x>= redleft.width*0.2)
									{
										x = x - speed; //* 20;
									}
									if (x-tiles[i][0]>= redleft.width*0.2)
									{
										x = x + speed; //* 20;
									}
								}
								hold = [];
								break;
								
							}
						}	
						
					}
					frame++;
					if (frame >= stage.frameRate){
						frame = 0;
						
					}
					
				}
				ticks++;
				
			}
			
		
		}
		private function collides(xchar:int,ychar:int,xobj:int,yobj:int):Boolean 
		{
			if (movingLeft)
			{
				if (ychar > yobj-20 && ychar < yobj+20 && (xchar - speed < xobj+20) && (xchar-20-speed>=xobj-20))
				{
					
					return true;
					
				}
				return false;
			}
			else if (movingRight)
			{
				if (ychar > yobj - 20 && ychar < yobj + 20 && (xchar  + speed >= xobj-20) && (xchar+20 +speed<= xobj+20))
				{
					return true;
				}
				return false;
				
			}
			else if (movingUp)
			{
				if (xchar > xobj-20 && xchar < xobj + 20 && (ychar + speed <= yobj+20) && (ychar-20+speed>yobj-20) )
				{
					return true;
				}
				return false;
				
			}
			else if (movingDown)
			{
			
				if (xchar > xobj-20 && xchar < xobj + 20 && (ychar+20 - speed < yobj+20) && (ychar-speed>=yobj-20) )
				{
					return true;
				}
				return false;
				
			}
			return false;
		}
		private function bfs():String
		{
			
			var currx:int = getblock()[0];
			var curry:int = getblock()[1];
			arr[0] = getblock();
			arr2 = [];
			store = [];
			arr = bfsrecur(currx,curry);
			//private var 
			if (arr[1][0] > arr[0][0])
			{
				return "right";
				
			}
			else if (arr[1][0] < arr[0][0])
			{
				return "left";
			}
			else
			{
				if (arr[1][1] > arr[0][1])
				{
					return "down";
				}
				else
				{
					return "up";
				}
			}
			return "hello";
			
		}
		private function bfsrecur(startx:Number,starty:Number):Array
		{
			
			var currx:Number = startx;
			var curry:Number = starty;
			trace(currx);
			trace(curry);
			var holdy:Array = new Array();
			holdy[0] = currx;
			holdy[1] = curry;
			arr2.push(holdy);
			store.push(holdy);
			holdy = [];
			//path[0] = getblock();
			if (collides(currx, curry, PacGame.pac.x, PacGame.pac.y) || collides(PacGame.pac.x,PacGame.pac.y,currx,curry))
			{
				return arr2;
				
			}
			if (stuff[curry - 1] == true && check(currx,curry-1,store))
			{
							
				return bfsrecur(currx, curry - 1 );
			}
			else if (stuff[currx + 1] == true && check(currx+1,curry,store))
			{
				//holdy[0] = currx+1;
				//holdy[1] = curry;
				//arr2.push(holdy);
				//store.push(holdy);
				//holdy = [];
				return bfsrecur(currx + 1, curry);
			}
			else if (stuff[curry + 1] == true && check(currx,curry+1,store))
			{
				//holdy[0] = currx;
				//holdy[1] = curry+1;
				//arr2.push(holdy);
				//store.push(holdy);
				//holdy = [];
				
				return bfsrecur(currx, curry + 1);
			}
			else if (stuff[currx - 1] == true && check(currx-1,curry,store))
			{
				//holdy[0] = currx-1;
				//holdy[1] = curry;
				//arr2.push(holdy);
				//store.push(holdy);
				//holdy = [];
				
				return bfsrecur(currx - 1, curry);
			}
			if (collides(currx, curry, Main.pacman.x, Main.pacman.y))
			{
				return arr2;
			}
			
			return arr2;
		}
		private function getblock():Array
		{
			var block:Array = new Array();
			block[0] = 0;
			block[1] = 0;
			if (x % 20 > 10)
			{
				block[0] = int(x / 20);
				
			}
			else
			{
				block[0] = int(x / 20) + 1;
			}
			if (y % 20 > 10)
			{
					block[1] = int(y / 20);
			}
			else
			{
				block[1] = int(y / 20) + 1;
			}
			
			
			return block;
			
		}
		private function speedpac(e:CustomEvents):void{
			//trace("working");
			
			
			
		}
		
		private function speedbuy(e:CustomEvents):void//rebalance
		{
			
		
			if (PacGame.pac.getmoney()>=redspeedprice)
			{
				
				dispatchEvent(new CustomEvents(CustomEvents.GHOST_SPEED2));
				if (redspeedprice == 50)
				{
					redspeedprice = 100;
					speed = 4;
					
				}
				else if (redspeedprice==100)
				{
					redspeedprice = 200;
					speed = 2;
					
				}
				else if(redspeedprice==200)
				{
					speed = 1;
					speedprice.text = "MAX";
					Main.Sidebar.removeEventListener(CustomEvents.GHOST_SPEED, speedbuy);
				}
				if (speed != 1)
				{
					speedprice.text = redspeedprice.toString();
				}
			}
			
		}
		
		private function wait(e:CustomEvents):void
		{
			if (PacGame.pac.getmoney() >= tickprice)
			{
				dispatchEvent(new CustomEvents(CustomEvents.WAITING_TIME2));
				//money -= tickprice;
				tickprice+= 5;
				waitingtime += 50;
				//if (waitingtime >= 1000)
				//{
				//	waitprice.text = "MAX";
				//	removeEventListener(CustomEvents.WAITING_TIME, wait);
				//	
				//}
				//else
				//{
					waitprice.text = tickprice.toString();
				//}
				
			}
		}
				
				
		public function getredspeedprice():Number
		{
			return redspeedprice;
			
		}
		public function gettickprice():Number
		{
			return tickprice; 
		}
		public function collision(e:Event):void
		{
			ticks = 0;
		}
		private function check(xs:Number, ys:Number, ps:Array):Boolean
		{
			for (var i:int = 0; i < ps.length; i++ )
			{
				if (ps[i][0] == xs && ps[i][1] == ys)
				{
					return false;
				}
			}
			return true;
		}
		private function die(e:Event): void{
			removeChild(redleft);
			removeChild(redleft2);
			removeChild(redup);
			removeChild(reddown);
			removeChild(redright);
			redleft = null;
			redleft2 = null;
			reddown = null;
			redup = null;
			redright = null;
			removeEventListener(Event.ENTER_FRAME, enterframe);
			removeEventListener(Event.REMOVED_FROM_STAGE, die);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			
		}
	}
	
}