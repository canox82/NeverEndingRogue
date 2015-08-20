package;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;

class Player extends TextField 
{ 

	public function new (pX:Float, pY:Float, pCol:Int = 0x000000)
	{
		super();

		//center the player start position on the cell
		x = pX+12;
		y = pY+8;
		defaultTextFormat = new TextFormat(Assets.getFont("fonts/Crisp.ttf").fontName,30, pCol);

		text ="@";
	}
	public function move (cordX:Float, cordY:Float) /*collision_map:Array<Array<String>>*/
	{
		if (cordX>0)
			x = cordX*15+12;
		else{
			x = 12;
			cordX = 0;
		}
		if (cordY>0)
			y = cordY*15+8;
		else{
			y = 8;
			cordY = 0;
		}
		trace ("X: ",x," Y: ",y," cordX: ",cordX," cordY: ",cordY);
	}
	
}