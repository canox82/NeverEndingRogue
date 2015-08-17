package;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;

class Player extends TextField 
{

	public function new (pX:Float = 0, pY:Float = 0, pCol:Int = 0x000000)
	{
		super();

		x = pX;
		y = pY;
		defaultTextFormat = new TextFormat(Assets.getFont("fonts/Crisp.ttf").fontName,30, pCol);

		text ="@";
	}
	
}