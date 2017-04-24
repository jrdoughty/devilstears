package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.math.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Attack extends FlxSprite 
{

	var t:FlxTimer;
	var enemiesHit:Array<FlxSprite> = [];
	public function new() 
	{
		var directionInt:Int = !Player.the.flipX?1:-1;
		super(Player.the.x + directionInt * 32, Player.the.y);
		loadGraphic(AssetPaths.shock__png, true, 16, 16);
		acceleration.y = 0;
		acceleration.x = 60;
		t = new FlxTimer();
		t.start(.5, end);
		FlxTween.quadPath(this, [
			FlxPoint.get(x + 32 * directionInt, y),
			FlxPoint.get(x + 32 * directionInt, y + 48),
			FlxPoint.get(x + 64 * directionInt, y),
			FlxPoint.get(x + 64 * directionInt, y + 48),
			FlxPoint.get(x + 96 * directionInt, y),
			FlxPoint.get(x + 96 * directionInt, y + 48),
			FlxPoint.get(x + 124 * directionInt, y),
			FlxPoint.get(x + 124 * directionInt, y + 48),
			FlxPoint.get(x + 160 * directionInt, y)], .5);
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		for(i in Enemy.enemies)
		if (FlxG.overlap(this, i))// && enemiesHit.indexOf(i) != -1)
		{
//			enemiesHit.push(i);
			i.hurt(1);
		}
	}
	
	private function end(timer:FlxTimer)
	{
		FlxG.state.remove(this);
		destroy();
	}
}