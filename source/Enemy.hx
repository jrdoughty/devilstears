package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Enemy extends FlxSprite 
{
	public static var enemies:Array<FlxSprite> = [];
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32, 0xffaa1111);
		acceleration.y = 400;
		enemies.push(this);
	}
	
	override public function hurt(Damage:Float):Void 
	{
		super.hurt(Damage);
		if (!alive)
		{
			FlxG.sound.play(AssetPaths.explode__wav);
			enemies.remove(this);
		}
		else
		{
			FlxG.sound.play(AssetPaths.hit__wav);
		}
	}
	
}