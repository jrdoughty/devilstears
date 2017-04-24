package;


import flixel.FlxObject;

import flixel.FlxSprite;

import flixel.group.FlxGroup;

import flixel.text.FlxText;

import flixel.util.FlxColor;

import flixel.input.mouse.FlxMouseEventManager;

import flixel.FlxG;

import flixel.input.touch.FlxTouch;

/**

 * ...

 * @author John Doughty

 */

class Button extends FlxGroup

{

	public var background:FlxSprite;

	public var text:FlxText;

	public var clickRegion:FlxSprite;

	public var clickFunc:Dynamic;



	public function new(x:Float, y:Float, width:Int, height:Int, backgroundSpriteFile:String, textString:String, click:Dynamic,?fontSize:Int)

	{

		super();



		background = new FlxSprite(x, y, backgroundSpriteFile);

		background.setGraphicSize(width, height);

		background.updateHitbox();



		text = new FlxText(x, y + height/8, width);

		text.text = textString;

		text.setFormat("assets/fonts/Our-Arcade-Games.ttf", fontSize == null?Std.int(height - height/3):fontSize-2, FlxColor.WHITE, "center");

		//text.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.BROWN, 1);



		clickRegion = new FlxSprite(x, y);

		clickRegion.makeGraphic(width, height);

		clickRegion.alpha = 0;



		add(background);

		add(text);

		add(clickRegion);

		#if !FLX_NO_MOUSE

		FlxMouseEventManager.add(clickRegion, null, click, over, out, false, true, false);

		#end

		clickFunc = click;

	}



	public function over(sprite:FlxSprite)

	{

		clickRegion.alpha = 0.2;

	}



	public function out(sprite:FlxSprite)

	{

		clickRegion.alpha = 0;

	}

	
	override public function update(e):Void 

	{

		super.update(e);

		#if !FLX_NO_TOUCH

		var touch:FlxTouch;

		for (touch in FlxG.touches.list)

		{

			if (touch.justPressed && 

			touch.x >= clickRegion.x &&

			touch.x <= clickRegion.x + clickRegion.width &&

			touch.y >= clickRegion.y &&

			touch.y <= clickRegion.y + clickRegion.height &&

			clickFunc != null)

			{

				clickFunc();

			}



			if (touch.pressed)

			{

			}



			if (touch.justReleased)

			{

			}

		}

		#end

	}

}
