package;

import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class MotionGroundPatrol extends Enemy 
{
	var t:FlxTimer;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.walk__png, true, 32, 32);
		setSize(24, 28);
		offset.set(4, 4);
		t = new FlxTimer();
		t.start(.5,idle);
		
	}
	
	private function idle(timer:FlxTimer)
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
	
	private function attackRight()
	{
		FlxTween.linearMotion(this, x, y, x + 128, y,.25);
		t.start(1, left);
	}
	private function attackLeft()
	{
		FlxTween.linearMotion(this, x, y, x - 128, y,.25);
		t.start(1, right);
	}
	private function left(timer:FlxTimer)
	{
		FlxTween.linearMotion(this, x, y, x - 128, y,.25);
		timer.start(1, idle);
	}
	private function right(timer:FlxTimer)
	{
		FlxTween.linearMotion(this, x, y, x + 128, y,.25);
		timer.start(1, idle);
	}
	
}