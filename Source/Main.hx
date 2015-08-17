package;

import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

class Main extends Sprite {
		
	var player1 : Player = new Player(100,100, 0x00e536); //Green color for player
	private var keys:Array<Bool>;

	public function new () {
		
		super ();
		// Let's start
		init();
		
	}

	public function init(){
		addChild(player1);
		keys=[];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, on_KeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, on_KeyUp);
	}

	private function on_KeyDown(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = true;
		if (keys[Keyboard.UP]) {
			player1.y-=10;
		}
		if (keys[Keyboard.DOWN]) {
			player1.y+=10;
		}
		if (keys[Keyboard.LEFT]) {
			player1.x-=10;
		}
		if (keys[Keyboard.RIGHT]) {
			player1.x+=10;
		}
	}
	
	private function on_KeyUp(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = false;
	}
	
}