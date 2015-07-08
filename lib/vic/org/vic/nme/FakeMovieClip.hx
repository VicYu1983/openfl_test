package org.vic.nme;

import nme.display.MovieClip;

/**
 * ...
 * @author VicYu
 */
class FakeMovieClip extends MovieClip
{

	public function new() 
	{
		super();
		
		graphics.beginFill(0xff0000);
		graphics.drawCircle(0, 0, 10 );
		graphics.endFill();
	}
	
}