package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class GroundPatrol extends Enemy 
{
	var t:FlxTimer;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		t = new FlxTimer();
		t.start(1,right);
	}
	private function right(timer:FlxTimer)
	{
		FlxTween.linearMotion(this, x, y, x + 128, y,.25);
		timer.start(1, left);
	}
	private function left(timer:FlxTimer)
	{
		FlxTween.linearMotion(this, x, y, x - 128, y,.25);
		timer.start(1, right);
	}
}