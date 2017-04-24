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

class CreditsState extends FlxState
{
	var subHead:FlxText;
	var head:FlxText;
	var playBtn:Button;
	var helpBtn:Button;
	var creditsBtn:Button;
	var goblin:FlxSprite;
	var goblin2:FlxSprite;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();

		add(new FlxSprite(0, 0, AssetPaths.menubackground__png));


		subHead = new FlxText(0, 0, 320);
		subHead.text = "GROW YOUR";
		subHead.setFormat(AssetPaths.Our_Arcade_Games__ttf, 20, FlxColor.RED, "center");
		//subHead.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.BROWN, 1);
		add(subHead);

		head = new FlxText(0, 35, 320);
		head.text = "HOARD";
		head.setFormat(AssetPaths.Our_Arcade_Games__ttf, 20, FlxColor.RED, "center");
		//head.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.BROWN, 1);
		head.scale.set(2, 2);
		add(head);

		playBtn = new Button(100, 100, 120, 30, AssetPaths.button__png, "PLAY", play, 18);
		add(playBtn);

		helpBtn = new Button(100, 135, 120, 30, AssetPaths.button__png, "HELP", help, 18);
		add(helpBtn);
		
		creditsBtn = new Button(100, 170, 120, 30, AssetPaths.button__png, "Credits", credits, 18);
		add(creditsBtn);
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
		//FlxG.switchState(new states.HelpState());
	}

	public function credits(sprite:FlxSprite = null)
	{
		//FlxG.switchState(new states.CreditsState());
	}
}