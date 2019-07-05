package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Lazi
	 */
	public class Pacman extends Sprite 
	{
		private var pacleft:Bitmap = new Assets.pacleft();
		private var pacleft2:Bitmap = new Assets.pacleft2();
		private var pacright2:Bitmap = new Assets.pacright2();
		private var pacdown2:Bitmap = new Assets.pacdown2();
		private var pacup2:Bitmap = new Assets.pacup2();
		private var pacright:Bitmap = new Assets.pacright();
		private var pacup:Bitmap = new Assets.pacup();
		private var pacdown:Bitmap = new Assets.pacdown();
		private var movingUp:Boolean;
		private var movingDown:Boolean;
		private var movingLeft:Boolean;
		private var movingRight:Boolean;
		private var paused:Boolean;
		private var left:Bitmap = pacleft;
		private var right:Bitmap = pacright;
		private var down:Bitmap = pacdown;
		private var up:Bitmap = pacup;
		private var speed:int = 1;
		private var frame:int = 0;
		public static var newBoard:Board = Main.board;
		private var board:Board = new Board();
		private var tiles:Array = board.getTiles();
		private var hold:Array = new Array();
		private var points:Array = new Array();
		public static var food:Array = newBoard.getFood();
		public static var foods:int = food.length;
		public static var money:Number = 0;
		private var score:TextField = new TextField();
		private var speeds:TextField = new TextField();
		private var speedprice:TextField = new TextField();
		public static var pacspeedprice:Number = 50;
		private var moneyValue:Number = 1;
		private var moneyValuePrice:Number = 20;
		private var valprice:TextField = new TextField();
		private var rewardMoney:Number = 50;
		public function Pacman(){
			addEventListener(Event.ADDED_TO_STAGE, go);
			
		}
		private function go(e:Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, go);
			speedprice.text = pacspeedprice.toString();
			valprice.text = moneyValuePrice.toString();
			speeds.text = "Speed: "+speed.toString();
			score.text = "$"+money.toString();
			speeds.textColor = 0xFFFFFF;
			score.textColor = 0xFFFFFF;
			speedprice.textColor = 0xFFFFFF;
			valprice.textColor = 0xFFFFFF;
			score.x = 400;
			score.y = 20;
			speeds.y = 20;
			speeds.x = 488.5;
			speedprice.x = 525;
			valprice.x = 525;
			speedprice.y = 60;
			valprice.y = 210;
			speeds.selectable = false;
			score.selectable = false;
			valprice.selectable = false;
			speedprice.selectable = false;
			score.height = 20;
			stage.addChild(speeds);
			
			stage.addChild(score);
			stage.addChild(speedprice);
			stage.addChild(valprice);
			addChild(pacleft);
			//	movingLeft = true; if you want him to start off moving left
			y = 16*20;
			x = 9 * 20;
			points.push(9 * 20);
			points.push(9 * 20);
			tiles.push(points);
			points = [];
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler, false, 0, true);
			Main.Sidebar.addEventListener(CustomEvents.MONEY_VALUE, val, false, 0, true);
			PacGame.red.addEventListener(CustomEvents.GHOST_SPEED2, speedbuy, false, 0, true);
			PacGame.red.addEventListener(CustomEvents.WAITING_TIME2, waits, false, 0, true);
			addEventListener(Event.ENTER_FRAME, enterframe, false, 0, true);
			addEventListener(Event.REMOVED_FROM_STAGE, die, false, 0, true);
			//addEventListener(CustomEvents.SPEED_PAC_BUY, speedpac,false,0,true);
			Main.Sidebar.addEventListener(CustomEvents.SPEED_PAC_BUY, speedpac,false,0,true);
			//money = 5000; //comment out
			
		}
		
		private function keydownhandler(e:KeyboardEvent) : void{
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
			if (!paused)
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
			}
		}
		private function enterframe(e:Event) : void{
//Main.Sidebar.addEventListener(CustomEvents.SPEED_PAC_BUY, speedpac,false,0,true);
			if (collides(x, y, PacGame.red.x, PacGame.red.y) || collides(PacGame.red.x,PacGame.red.y,x,y))
			{
				x = 9 * 20;
				y = 16 * 20;
				PacGame.red.x = 9 * 20;
				PacGame.red.y = 10 * 20;
				
				if (money >= 5)
				{
					money -= 5;
				}
				else
				{
					money = 0;
				}
				dispatchEvent(new CustomEvents(CustomEvents.COLLIDES));
				//newBoard.makeFood();
				//food = newBoard.getFood();
				//foods = food.length;
			}
			speeds.text = "Speed: "+speed.toString();
			score.text = "$"+money.toString();
			if (foods==0)
			{
				newBoard.makeFood();
				money += rewardMoney;
				rewardMoney += 50;
				food = newBoard.getFood();
				foods = food.length;
			}

			if (!paused)
			{
				
				if (movingLeft)
				{
					
					if (frame%(int(stage.frameRate/10))==0) 
					{
					
						if (left==pacleft)
						{
							left = pacleft2;
						
							
						}
						else
						{
							left = pacleft;
							
						}
						addChild(left);
					}
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
						
						x = 380 - pacleft.width;
					}
					for (i = 0; i < tiles.length; i++ )
					{
						if (collides(x, y, tiles[i][0], tiles[i][1]))
						{
							hold.push(tiles[i][0]);
						
						}
					}
					for (i = 0; i < tiles.length; i++ )
					{
						if (collides(x, y, tiles[i][0], tiles[i][1]))
						{
							x = tiles[i][0] + 20;
							if (hold.length <= 1)
							{
								if (tiles[i][1]-y>= pacleft.height*0.2)
								{
									y = y - speed; //* 20;
								}
								if (y-tiles[i][1]>= pacleft.height*0.2)
								{
									y = y + speed; //* 20;
								}
							}
							hold = [];
							break;
							
						}
					}
					for (var i:int = 0; i < food.length; i++ )
					{
						if (collides(x+15, y, food[i][0], food[i][1]) && (food[i][0]!=0 && food[i][1]!=0))
						{
							food[i][0] = 0;
							food[i][1] = 0;//
							newBoard.removeFood(i);
							foods--;
							money+=moneyValue;
							//trace(foods);
							break;
						}
					}
					
					
					
				}
					
				
				if (movingRight)
				{
					
					if (frame%(int(stage.frameRate/10))==0) 
					{
					
						if (right==pacright)
						{
							right = pacright2;
						
							
						}
						else
						{
							right = pacright;
							
						}
						addChild(right);
					}
					if ((x + pacright.width + speed <= stage.stageWidth-20)|| (x+pacright.width+speed>stage.stageWidth-20 && y==200))
					{
						x += speed;
					}
					else
					{
						
						x = stage.stageWidth - pacright.width - 20;
						
					}
					if (x + pacright.width + speed > 380)
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
								if (tiles[i][1]-y>= pacleft.height*0.2)
								{
									y = y - speed; //* 20;
								}
								if (y-tiles[i][1]>= pacleft.height*0.2)
								{
									y = y + speed; //* 20;
								}
							}
							hold = [];
							break;
							
						}
					}	
					for (var i:int = 0; i < food.length; i++ )
					{
						if (collides(x-15, y, food[i][0], food[i][1]) && (food[i][0]!=0 && food[i][1]!=0))
						{
							food[i][0] = 0;
							food[i][1] = 0;
							newBoard.removeFood(i);
							foods--;
							money+=moneyValue;
							//trace(foods);
							break;
						}
					}	
						
				
					
				}
				if (movingUp)
				{
					if (frame%(int(stage.frameRate/10))==0) 
					{
					
						if (up==pacup)
						{
							up = pacup2;
							//addChild(left);
							
						}
						else
						{
							up = pacup;
							
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
						if (collides(x, y, tiles[i][0], tiles[i][1]))
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
								if (tiles[i][0]-x>= pacleft.width*0.2)
								{
									x = x - speed; //* 20;
								}
								if (x-tiles[i][0]>= pacleft.width*0.2)
								{
									x = x + speed; //* 20;
								}
							}
							hold = [];
							break;
							
						}
					}	
					for (var i:int = 0; i < food.length; i++ )
					{
						if (collides(x, y+15, food[i][0], food[i][1]) && (food[i][0]!=0 && food[i][1]!=0))
						{
							food[i][0] = 0;
							food[i][1] = 0;
							newBoard.removeFood(i);
							foods--;
							money+=moneyValue;
							//trace(foods);
							break;
						}
					}	
				
				}
				if (movingDown){
					if (frame%(int(stage.frameRate/10))==0) 
					{
					
						if (down==pacdown)
						{
							down = pacdown2;
							//addChild(left);
							
						}
						else
						{
							down = pacdown;
							
						}
						addChild(down);
					}
					if (y + speed + pacdown.height <= stage.stageHeight-20)
					{
						y += speed;
					}
					else
					{
							y = stage.stageHeight - pacdown.height-20;
							
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
								if (tiles[i][0]-x>= pacleft.width*0.2)
								{
									x = x - speed; //* 20;
								}
								if (x-tiles[i][0]>= pacleft.width*0.2)
								{
									x = x + speed; //* 20;
								}
							}
							hold = [];
							break;
							
						}
					}	
					for (var i:int = 0; i < food.length; i++ )
					{
						if (collides(x, y-15, food[i][0], food[i][1]) && (food[i][0]!=0 && food[i][1]!=0))
						{
							food[i][0] = 0;
							food[i][1] = 0;
							newBoard.removeFood(i);
							foods--;
							money+=moneyValue;
							//trace(foods);
							break;
						}
					}	
				}
				frame++;
				if (frame >= stage.frameRate){
					frame = 0;
					
				}
			}
			
		}
		private function speedpac(e:CustomEvents):void{
			//trace("working");
			if (money>=pacspeedprice)
			{
			
				money -= pacspeedprice;
				if (pacspeedprice == 50)
				{
					pacspeedprice = 100;
					speed = 2;
					
				}
				else if (pacspeedprice==100)
				{
					pacspeedprice = 200;
					speed = 4;
					
				}
				else if(pacspeedprice==200)
				{
					speed = 5;
					speedprice.text = "MAX";
					Main.Sidebar.removeEventListener(CustomEvents.SPEED_PAC_BUY, speedpac);
				}
				if (speed != 5)
				{
					speedprice.text = pacspeedprice.toString();
				}
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
		public function getmoney():Number
		{
			return money;
		}
		
		
		private function speedbuy(e:CustomEvents):void//rebalance
		{
			//trace("fuck");
			//trace(PacGame.red.getredspeedprice());
			if (money>=PacGame.red.getredspeedprice())
			{
			
				money -= PacGame.red.getredspeedprice();

				if(PacGame.red.getredspeedprice()==200)
				{
					
					
					Main.Sidebar.removeEventListener(CustomEvents.GHOST_SPEED2, speedbuy);
				}
					
			}
			
		}	
		private function waits(e:CustomEvents):void
		{
			if (money >= PacGame.red.gettickprice())
			{
				money -= PacGame.red.gettickprice();
				
			}
		}
		private function val(e:CustomEvents):void
		{
			if (money >= moneyValuePrice)
			{
				money -= moneyValuePrice;
				moneyValuePrice *= 2;
				moneyValue++;
				valprice.text = moneyValuePrice.toString();
				
			}
			
		}
		private function die(e:Event): void{
			removeChild(pacleft);
			removeChild(pacleft2);
			removeChild(pacup);
			removeChild(pacdown);
			removeChild(pacright);
			pacleft = null;
			pacleft2 = null;
			pacdown = null;
			pacup = null;
			pacright = null;
			removeEventListener(Event.ENTER_FRAME, enterframe);
			removeEventListener(Event.REMOVED_FROM_STAGE, die);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			
		}
	}
	
}