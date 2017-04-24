package;

import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class Bat extends Enemy 
{
	var t:FlxTimer;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.bat__png, true, 32, 32);
		acceleration.y = 0;
		t = new FlxTimer();
		t.start(1,right);
		
	}
	private function right(timer:FlxTimer)
	{
		FlxTween.quadPath(this, [new FlxPoint(x, y), new FlxPoint(x + 64, y + 64), new FlxPoint(x + 128, y)],.25);
		timer.start(1, left);
	}
	private function left(timer:FlxTimer)
	{
		FlxTween.quadPath(this, [new FlxPoint(x, y), new FlxPoint(x - 64, y + 64), new FlxPoint(x - 128, y)],.25);
		timer.start(1, right);
	}
	
}