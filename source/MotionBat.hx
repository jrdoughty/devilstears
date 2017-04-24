package;

import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class MotionBat extends Enemy 
{
	var t:FlxTimer;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.bat__png, true, 32, 32);
		setSize(24, 28);
		offset.set(4, 4);
		acceleration.y = 0;
		t = new FlxTimer();
		t.start(.5,idle);
		
	}
	
	private function idle(timer:FlxTimer)
	{
		if (Player.the.y > y && Player.the.y < y + 96)
		{
			if (Player.the.x > x - 128 && Player.the.x < x)
			{
				attackLeft();
			}
			else if (Player.the.x < x + 128 && Player.the.x > x)
			{
				attackRight();
			}
			else
			{
				t.start(.5,idle);
			}
		}
		else
		{
			t.start(.5,idle);
		}
	}
	
	private function attackRight()
	{
		FlxTween.quadPath(this, [new FlxPoint(x, y), new FlxPoint(x + 64, y + 96), new FlxPoint(x + 128, y)],.25);
		t.start(1, left);
	}
	private function attackLeft()
	{
		FlxTween.quadPath(this, [new FlxPoint(x, y), new FlxPoint(x - 64, y + 96), new FlxPoint(x - 128, y)],.25);
		t.start(1, right);
	}
	private function left(timer:FlxTimer)
	{
		FlxTween.quadPath(this, [new FlxPoint(x, y), new FlxPoint(x - 64, y + 64), new FlxPoint(x - 128, y)],.25);
		timer.start(1, idle);
	}
	private function right(timer:FlxTimer)
	{
		FlxTween.quadPath(this, [new FlxPoint(x, y), new FlxPoint(x + 64, y + 64), new FlxPoint(x + 128, y)],.25);
		timer.start(1, idle);
	}
	
}