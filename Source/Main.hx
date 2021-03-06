package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.ui.Keyboard;

class Main extends Sprite {
		
	var player1 : Player = new Player(1,1, 0x00e536); //Green color for player
	private var keys:Array<Bool>;
	public var rows:Int = 40;
	public var cols:Int = 38;
	var messageField:TextField;
	var x_plr: Int =0; //Player coordinates
	var y_plr: Int =0; //Player coordinates

	public var Map_array:Array<Array<String>>;

	private function initMap():Void {
		// create random map
		Map_array=[];
		var new_row:Array<String>;
		var random_wall:Float;
		for (yy in 0...rows){
			new_row=[];
			if (yy == 0) {
				new_row.push("|");
				for (xx in 1...37){
					new_row.push("-");
				}
				new_row.push("|");
			}
			else if (yy==39){
				new_row.push("|");
				for (xx in 1...37){
					new_row.push("-");
				}
				new_row.push("|");
			}
			else{
				for (xx in 0...cols) {
					if ((xx==0) || (xx==37)){
						new_row.push("|");
					}
					else {
						random_wall=Math.random(); // Set random number to have a wall or not
						if (random_wall>0.75)
							new_row.push("#");
						else
							new_row.push(".");
					}
				}
			}
			Map_array.push(new_row);
		}
		

		Map_array[1][1]=".";
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
				block.x=posx;
				block.y=posy;
				posx+=15;
				addChild(block);
			}
			posy+=15;
		}
	}

	private function putMessage(Msg:String):Void{
		var messageFormat:TextFormat = new TextFormat(Assets.getFont("fonts/Crisp.ttf").fontName,14, 0x00ff21);
		if (messageField!= null){
			// delete an old istance
			removeChild(messageField);
			messageField=null;
		}
		messageField = new TextField();
		messageField.width = 190;
		messageField.height = 400;
		messageField.x = 590;
		messageField.y = 100;
		messageField.wordWrap = true;
		messageField.defaultTextFormat = messageFormat;
		messageField.text = Msg;
		addChild(messageField);
	}

	public function new () {
		
		super ();
		// Let's start
		init();
		
	}

	public function init(){
		initMap();
		drawMap();
		putMessage("Welcome to Never Ending Rogue!");
		addChild(player1);
		keys=[];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, on_KeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, on_KeyUp);
	}

	private function on_KeyDown(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = true;
		if (keys[Keyboard.UP]) {
			if (y_plr>0){
				y_plr-=1;
				if (Map_array[y_plr+1][x_plr+1]!="#"){
					player1.move(x_plr,y_plr);
				}
				else{
					trace("Wall!");
					putMessage("Wall!");
					y_plr+=1;
				}
			}
			else y_plr = 0;
		}
		if (keys[Keyboard.DOWN]) {
			if (y_plr<37){
				y_plr+=1;
				if (Map_array[y_plr+1][x_plr+1]!="#"){
					player1.move(x_plr,y_plr);
				}
				else{
					trace("Wall!");
					putMessage("Wall!");
					y_plr-=1;
				}
			}
			else y_plr = 37;
		}
		if (keys[Keyboard.LEFT]) {
			if (x_plr>0){
				x_plr-=1;
				if (Map_array[y_plr+1][x_plr+1]!="#"){
					player1.move(x_plr,y_plr);
				}
				else{
					trace("Wall!");
					putMessage("Wall!");
					x_plr+=1;
				}
			}
			else x_plr = 0;
		}
		if (keys[Keyboard.RIGHT]) {
			if (x_plr<35){
				x_plr+=1;
				if (Map_array[y_plr+1][x_plr+1]!="#"){
					player1.move(x_plr,y_plr);
				}
				else{
					trace("Wall!");
					putMessage("Wall!");
					x_plr-=1;
				}
			}
			else x_plr = 35;
		}
	}
	
	private function on_KeyUp(evt:KeyboardEvent):Void {
		keys[evt.keyCode] = false;
	}
	
}