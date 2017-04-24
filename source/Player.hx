package;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxTimer;
import haxe.Timer;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite 
{
	public static var the:Player;
	
	public var invulnerable = false;
	
	private var idleFrames = [0];
	private var walkFrames = [0, 1];
	private var attackFrames = [0, 2];
	
	private var jumpable = true;
	private var jumptimerstarted = false;
	private var jumpTimer:FlxTimer = new FlxTimer();
	private var readyToAttack:Bool = true;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y);
		health = 5;
		loadGraphic(AssetPaths.main__png, true, 64, 64);
		setSize(28, 56);
		offset.set(20, 8);
		maxVelocity.x = 200;
		maxVelocity.y = 600;
		acceleration.y = 400;
		drag.x = maxVelocity.x * 4;
		FlxG.camera.follow(this);
		the = this;
	}

	override public function update(elapsed:Float):Void 
	{	
		acceleration.x = 0;
		if (!isTouching(FlxObject.FLOOR) && jumpable && !jumptimerstarted)
		{
			jumpTimer.start(.3, function(t:FlxTimer)
			{
				if (!isTouching(FlxObject.FLOOR)) 
				jumptimerstarted = false; 
				jumpable = false; 
			});
			jumptimerstarted = true;
		}
		else if (isTouching(FlxObject.FLOOR))
		{
			jumpable = true;
			jumptimerstarted = false; 
			jumpTimer.cancel();
		}
		if (FlxG.keys.anyPressed([LEFT, A]))
		{
			acceleration.x -= maxVelocity.x * 4;
			flipX = true;
		}
		if (FlxG.keys.anyPressed([RIGHT, D]))
		{
			acceleration.x += maxVelocity.x * 4;
			flipX = false;
		}
		if (FlxG.keys.anyPressed([W, UP]) && jumpable)
		{
			velocity.y = -maxVelocity.y / 2;
			jumpable = false;
		}
		if (FlxG.keys.anyPressed([SPACE]))
		{
			if (readyToAttack)
			{
				var oAttack:Attack = new Attack();
				FlxG.sound.play(AssetPaths.attack__wav);
				readyToAttack = false;
				var coolDown = new FlxTimer();
				coolDown.start(1, function(time:FlxTimer){readyToAttack = true; });
			}
			
		}
		for (i in Enemy.enemies)
		{
			if(FlxG.overlap(i,this))
			{
				if(!invulnerable)
				{
					hurt(1);
					invulnerable = true;
					var t = new Timer(2000);
					var visTimer = new Timer(100);
					visTimer.run = function() {
						set_visible(!visible);
					}
					t.run = function() {
						invulnerable = false;
						t.stop();
						visTimer.stop();
						visible = true;
						trace('ready');
						visTimer = null;
						t = null;
					}
				}
			}
		}
		
		super.update(elapsed);	
	}
	
	override public function kill():Void 
	{
		super.kill();
		FlxG.resetState();
	}
}