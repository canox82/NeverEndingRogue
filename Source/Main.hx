package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.ui.Keyboard;

class Main extends Sprite {
		
	var player1 : Player = new Player(100,100, 0x00e536); //Green color for player
	private var keys:Array<Bool>;
	public var rows:Int = 30;
	public var cols:Int = 30;

	public var Map_array:Array<Array<String>>;

	private function initMap():Void {
		// create random map
		Map_array=[];
		var new_row:Array<String>;
		var random_wall:Float;
		for (yy in 0...rows){
			new_row=[];
			random_wall=Math.random(); // Set random number to have a wall or not
			for (xx in 0...cols) {
				if (Math.random()>random_wall)
					new_row.push("#");
				else
					new_row.push(".");
			}
			Map_array.push(new_row);
		}
	}

	private function drawMap():Void{
		var posy:Float=0;
		for (yy in 0...rows) {
			var posx:Float=0;
			for (xx in 0...cols){
				var block = new TextField();
				block.text = Map_array[yy][xx];
				var BlockTextFormat = new TextFormat(Assets.getFont("fonts/PixelCarnageMono.ttf").fontName,15, 0xffffff);
				block.defaultTextFormat = BlockTextFormat;
				//block.textColor=0xffffff;	
				block.x=posx;
				block.y=posy;
				posx+=15;
				addChild(block);
			}
			posy+=15;
		}
	}

	public function new () {
		
		super ();
		// Let's start
		init();
		
	}

	public function init(){
		initMap();
		drawMap();
		addChild(player1);
		keys=[];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, on_KeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, on_KeyUp);
	}

	private function on_KeyDown(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = true;
		if (keys[Keyboard.UP]) {
			player1.y-=15;
		}
		if (keys[Keyboard.DOWN]) {
			player1.y+=15;
		}
		if (keys[Keyboard.LEFT]) {
			player1.x-=15;
		}
		if (keys[Keyboard.RIGHT]) {
			player1.x+=15;
		}
	}
	
	private function on_KeyUp(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = false;
	}
	
}