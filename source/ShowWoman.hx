package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxTimer;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class ShowWoman extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.main__png, true, 64, 64);
		animation.add('guitar', [1]);
		animation.add('guitar pick', [2]);
		animation.add('stand', [0]);
		animation.play('guitar');
		var t = new FlxTimer();
		t.start(1,pickUp);
	}
	
	public function pickUp(t:FlxTimer)
	{
		animation.play('guitar pick');
		t.start(10, stand);
		FlxG.sound.playMusic(AssetPaths.smallworld__wav, 1, false);
	}
	
	public function stand(t:FlxTimer)
	{
		animation.play('stand');
		t.start(1, run);
	}
	
	public function run(t:FlxTimer)
	{
		velocity.x = 150;
	}
	
}