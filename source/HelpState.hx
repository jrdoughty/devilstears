package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;


/**
 * A FlxState which can be used for the game's menu.
 */

class HelpState extends FlxState
{
	var subHead:FlxText;
	var head:FlxText;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();

		add(new FlxSprite(0, 0, AssetPaths.menubackground__png));


		
		head = new FlxText(0, 35, 320);
		head.text = "WELCOME TO THE SHOW";
		head.setFormat(AssetPaths.Our_Arcade_Games__ttf, 20, FlxColor.WHITE, "center");
		head.setBorderStyle(OUTLINE, FlxColor.BROWN, 1);
		add(head);
		
		var credit1 = new FlxText(0, 35+60, 320,'A and D along with Left and Right move the character left and right');
		add(credit1);
		var credit2 = new FlxText(0, 55+60, 320,'W and Up are Jump');
		add(credit2);
		var credit3 = new FlxText(0, 75+60, 320,'SPACE launches sonic mayhem!');
		add(credit3);
		var credit4 = new FlxText(0, 95+60, 320,'');
		add(credit4);

		var playBtn = new Button(170, 200, 120, 30, AssetPaths.button__png, "PLAY", play, 18);
		add(playBtn);

		var helpBtn = new Button(30, 200, 120, 30, AssetPaths.button__png, "CREDITS", credits, 18);
		add(helpBtn);
		
		FlxG.autoPause = false;
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}


	public function play(sprite:FlxSprite = null)
	{
		//Reg.reset();
		FlxG.switchState(new PlayState());
	}

	public function help(sprite:FlxSprite = null)
	{
		FlxG.switchState(new HelpState());
	}

	public function credits(sprite:FlxSprite = null)
	{
		FlxG.switchState(new CreditsState());
	}
}