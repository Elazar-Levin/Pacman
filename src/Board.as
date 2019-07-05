package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author ...
	 */
	public class Board extends Sprite 
	{
		
		private var walls:Tile;
		private var tiles:Array = new Array();
		private var points:Array = new Array();
		private var wall:Bitmap = new Assets.wall();
		private var pellet:Bitmap = new Assets.pellet();
		private var obj:DisplayObject ;
		private var objarr:Array = new Array();
		private var food:Array = new Array();
		public function Board()
		{
			for (var j:int = 0; j < 22; j++ )//full vertical
			{
				if (j != 10 && j!=8 && j!=12)
				{
					addChild(new Tile(0*20, j*20, new Assets.wall()));
					addChild(new Tile(18 * 20, j * 20, new Assets.wall()));
					points.push(0 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(18 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					
				}
				
				if (j == 0 || j == 7 || j == 9 || j == 11 || j == 13 || j == 17 || j == 21)
				{
					addChild(new Tile(1 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(17 * 20, j * 20, new Assets.wall()));
					points.push(1 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(17 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
				}
				else if(j!= 8 && j!=10 &&j!=12) 
				{
					obj=addChild(new Tile(1 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(1 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(17 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(17 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if (j == 0 || j==2 || j==3 || j==5 || j == 7 || j == 9 || j == 11 || j == 13 || j==15 || j == 19 || j == 21)
				{
					addChild(new Tile(2 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(16 * 20, j * 20, new Assets.wall()));
					points.push(2 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(16 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
				}
				else if(j!= 8 && j!=10 &&j!=12) 
				{
					obj=addChild(new Tile(2 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(2 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj = addChild(new Tile(16 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(16 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if (j == 0 || j==2 || j==3 || j==5 || j == 7 || j==8 || j == 9 || j == 11 || j==12 || j == 13 || j==15 ||j==16 ||j==17|| j == 19 || j == 21)
				{
					addChild(new Tile(3 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(15 * 20, j * 20, new Assets.wall()));
					points.push(3 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(15 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
				}
				else if(j!=10) 
				{
					obj=addChild(new Tile(3 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(3 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(15 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(15 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					
				}
				if (j == 0 || j == 19 || j == 21)
				{
					addChild(new Tile(4 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(14 * 20, j * 20, new Assets.wall()));
					points.push(4 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(14 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					
				}
				else
				{
					obj=addChild(new Tile(4 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(4 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(14 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(14 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if (j != 1 && j != 4 && j != 10 && j != 14 && j != 16 && j != 20)
				{
					
					addChild(new Tile(5 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(13 * 20, j * 20, new Assets.wall()));
					points.push(5 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(13 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					
				}
				else
				{
					
					obj=addChild(new Tile(5 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(5 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(13 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(13 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if(j==0||j==2||j==3||j==7||j==15 ||j==19  ||j==21)
				{
					addChild(new Tile(6 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(12 * 20, j * 20, new Assets.wall()));
					points.push(6 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(12 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
				}
				else
				{
					obj=addChild(new Tile(6 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(6 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(12 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(12 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if(j==0||j==2||j==3|| j==5  || j==7 || j==9 ||j==10 ||j==11 ||j==13 || j==15 ||j==17  ||j==19  ||j==21)
				{
					addChild(new Tile(7 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(11 * 20, j * 20, new Assets.wall()));
					points.push(7 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(11 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
				}
				else
				{
					obj = addChild(new Tile(7 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(7 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj = addChild(new Tile(11 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(11 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if(j==0||j==5||j==9||j==11||j==13 ||j==17  ||j==21)
				{
					addChild(new Tile(8 * 20, j * 20, new Assets.wall()));
					addChild(new Tile(10 * 20, j * 20, new Assets.wall()));
					points.push(8 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
					points.push(10 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];
				}
				else if(j!=10) 
				{
					obj=addChild(new Tile(8 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(8 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(10 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(10 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if(j!=4 && j!=8 && j!=9 && j!=10 && j!=12 && j!=16 && j!=20)
				{
					addChild(new Tile(9 * 20, j * 20, new Assets.wall()));
					points.push(9 * 20);
					points.push(j * 20);
					tiles.push(points);
					points = [];			
				}
				else if(j!=10 && j!=9) 
				{
					obj = addChild(new Tile(9 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(9 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				
		
			}
			
			
			
			
			
		}
		public function makeFood():void
		{
			for (var t:int = 0; t < objarr.length; t++ )
			{
				if (objarr[t] != null)
				{
					
					removeFood(t);
				}
				
			}
			objarr = new Array();
			food = new Array();
			
			for (var j:int = 0; j < 22; j++ )//full vertical
			{
								
				if (!(j == 0 || j == 7 || j == 9 || j == 11 || j == 13 || j == 17 || j == 21) && j!= 8 && j!=10 &&j!=12)
				{
					obj=addChild(new Tile(1 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(1 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(17 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(17 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				if (!(j == 0 || j==2 || j==3 || j==5 || j == 7 || j == 9 || j == 11 || j == 13 || j==15 || j == 19 || j == 21) && j!= 8 && j!=10 &&j!=12)
				{
					obj=addChild(new Tile(2 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(2 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj = addChild(new Tile(16 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(16 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				
				if (!(j == 0 || j==2 || j==3 || j==5 || j == 7 || j==8 || j == 9 || j == 11 || j==12 || j == 13 || j==15 ||j==16 ||j==17|| j == 19 || j == 21) && j!=10)
				{
					obj=addChild(new Tile(3 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(3 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(15 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(15 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					
				}
				
				if (!(j == 0 || j == 19 || j == 21))
				{
					obj=addChild(new Tile(4 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(4 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(14 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(14 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
				
				if (!(j != 1 && j != 4 && j != 10 && j != 14 && j != 16 && j != 20))
				{
					
					obj=addChild(new Tile(5 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(5 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(13 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(13 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					
				}
				
				if(!(j==0||j==2||j==3||j==7||j==15 ||j==19  ||j==21))
				{
					obj=addChild(new Tile(6 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(6 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(12 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(12 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}

				if(!(j==0||j==2||j==3|| j==5  || j==7 || j==9 ||j==10 ||j==11 ||j==13 || j==15 ||j==17  ||j==19  ||j==21))
				{
					obj = addChild(new Tile(7 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(7 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj = addChild(new Tile(11 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(11 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
			
				if(!(j==0||j==5||j==9||j==11||j==13 ||j==17  ||j==21) && j!=10)
				{
					obj=addChild(new Tile(8 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(8 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
					obj=addChild(new Tile(10 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(10 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
			
				if(!(j!=4 && j!=8 && j!=9 && j!=10 && j!=12 && j!=16 && j!=20) && (j!=10 && j!=9) )
				{
					obj = addChild(new Tile(9 * 20, j * 20, new Assets.pellet()));
					objarr.push(obj);
					points.push(9 * 20);
					points.push(j * 20);
					food.push(points);
					points = [];
				}
			
			
		}
		}
		public function getTiles():Array
		{
			return tiles;
		}
		public function getFood():Array
		{
			return food;
		}
		public function removeFood(index:int):void
		{
			removeChild(objarr[index]);
			objarr[index] = null;
		}
		
	}
	
	
}