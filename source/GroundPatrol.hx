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
		loadGraphic(AssetPaths.walk__png, true, 32, 32);
		setSize(24, 28);
		offset.set(4, 4);
		//flipX = true;
		animation.add('main', [0, 1], 4);
		animation.play('main');
		t = new FlxTimer();
		t.start(1,right);
	}
	private function right(timer:FlxTimer)
	{
		FlxTween.linearMotion(this, x, y, x + 128, y,.25);
		timer.start(1, left);
		flipX = true;
	
	}
	private function left(timer:FlxTimer)
	{
		FlxTween.linearMotion(this, x, y, x - 128, y,.25);
		timer.start(1, right);
		flipX = false;
	}
}