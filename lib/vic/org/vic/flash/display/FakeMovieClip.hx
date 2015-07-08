package org.vic.flash.display;

import flash.display.MovieClip;
import flash.text.TextField;

/**
 * ...
 * @author VicYu
 */
class FakeMovieClip extends MovieClip
{
	private var _name:TextField;
	private var _txt_frame:TextField;

	public function new( name, width = 100, height = 100 ) 
	{
		super();
		
		var rc:Int =  Std.int( Math.random() * 0xffffff );
		graphics.beginFill( rc );
		graphics.drawRect( 0, 0, width, height );
		graphics.endFill();
		
		_name = new TextField();
		_name.text = name;
		addChild( _name );
		
		_txt_frame = new TextField();
		_txt_frame.text = "F_1";
		_txt_frame.y = 20;
		addChild( _txt_frame);
		
		//mouseEnabled = false;
		mouseChildren = false;
	}
	/*
	override public function gotoAndPlay(frame:Dynamic, ?scene:String):Void 
	{
		super.gotoAndPlay(frame, scene);
		
		_txt_frame.text = "F_" + frame;
	}*/
}