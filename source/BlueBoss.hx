package;

import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class BlueBoss extends Enemy 
{
	var t:FlxTimer;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.sharkman__png, true, 159, 224);
		//setSize(141, 220);
		//offset.set(9, 4);
		health = 4;
		t = new FlxTimer();
		t.start(2,idle);
		
	}
	
	private function idle(timer:FlxTimer)
	{
		if (Player.the.x > x - 256 && Player.the.x < x)
		{
			attackLeft();
		}
		else if (Player.the.x < x + 256 && Player.the.x > x)
		{
			attackRight();
		}
		else
		{
			t.start(.5,idle);
		}
	}
	
	private function attackRight()
	{
		FlxTween.linearMotion(this, x, y, x + 256, y,.25);
		t.start(1, idle);
	}
	private function attackLeft()
	{
		FlxTween.linearMotion(this, x, y, x - 256, y,.25);
		t.start(1, idle);
	}
	
}