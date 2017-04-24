package;

import flixel.animation.FlxAnimation;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class Walker extends Enemy 
{
	var accel:Int;
	var t:FlxTimer;
	public function new(?X:Float=0, ?Y:Float=0, health:Int = 1, speed:Int = 1, jump:Int = 0, attack:Int = 0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.walk__png, true, 32, 32);
		setSize(24, 28);
		offset.set(4, 4);
		//flipX = true;
		animation.add('main', [0, 1], 4);
		animation.play('main');
		this.health = health;
		accel = 50 * -speed;
		t = new FlxTimer();
		t.start(.5, idle);
	}
	
	private function idle(timer:FlxTimer)
	{
		if (x - Player.the.x > 640)
		{
			t.start(.5, idle);
		}
		else
		{
			this.acceleration.x = accel;
		}
	}
}
/*
Health
1 = Easy 
3 = Medium
5 = Difficult

Speed
0 = Static (remains in one spot, e.g. Venus’s flytrap) 
1 = Slow
2 = Medium
3 = Fast
5 = Super fast
10 = Slow, but fast when the player is nearby
Jump height

0 = Cannot jump 

1 = Low
2 = Medium
3 = High
10 = High when the player is directly above

Attack style
0 = None, just wander around 

1 = Near range melee
2 = Medium range melee
3 = Shoot projectiles
*/