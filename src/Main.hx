package ;

import away3d.containers.View3D;
import away3d.core.render.DefaultRenderer;
import away3d.core.render.RendererBase;
import away3d.entities.Mesh;
import away3d.primitives.CubeGeometry;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.events.UIEvent;
#if js
import js.Browser;
#end
import lime.graphics.Renderer;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.JPEGEncoderOptions;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.display.Stage3D;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.geom.Rectangle;
import openfl.geom.Vector3D;
import openfl.Lib;
import openfl.text.TextField;
import openfl.ui.Keyboard;
import openfl.utils.ByteArray;
import org.vic.box2d.Box2dHelper;
import ru.stablex.ui.UIBuilder;

using Lambda;
/**
 * ...
 * @author vic
 */

class Main extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		// (your code here)
		
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		
		testBox2d();
		
	}
	
	
	function testHaxeUI() {
		//UIBuilder.init();
		//Lib.current.stage.addChild( UIBuilder.buildFn( 'my.xml' )());
		
		//Macros.addStyleSheet("styles/gradient/gradient.css");
		
		Toolkit.init();
        Toolkit.openFullscreen(function(root:Root) {
            var button:Button = new Button();
            button.text = "Click Me!";
            button.x = 100;
            button.y = 100;
            button.onClick = function(e:UIEvent) {
                e.component.text = "You clicked me!";
            };
            root.addChild(button);
       });
		
		Lib.current.stage.color = 0xFFFFFF;
	}
	
	function testAway3d() {
		var v3d = new View3D();
		addChild( v3d );
		
		var p = new Mesh( new CubeGeometry() );
		p.rotationX = 30;
		p.rotationY = 30;
		v3d.scene.addChild( p );
		
		addEventListener( Event.ENTER_FRAME, function( e ) {
			v3d.render();
			p.rotationX++;
			p.rotationY++;
		});
		
		
		/*
		function snapShotView3d( v3d:View3D ) {
			var view3dBitmapData:BitmapData = new BitmapData( 1000, 800 );
			
			//v3d.renderer.swapBackBuffer = false;
			//v3d.camera.y = 0;
			//v3d.camera.lookAt( new Vector3D() );
			//v3d.render();
			v3d.stage3DProxy.context3D.drawToBitmapData( view3dBitmapData ); 
			//v3d.renderer.swapBackBuffer = true;
			//v3d.camera.y = 300;
			//v3d.camera.lookAt( new Vector3D() );
			
			addChild( new Bitmap( view3dBitmapData ));
			
			var b = new ByteArray();
			var c = view3dBitmapData.encode(new Rectangle(0, 0, 1000, 800), new flash.display.JPEGEncoderOptions(), b);
			trace( b, c );
			//trace( view3dBitmapData.get
		}
		
		function snapshot() {
			snapShotView3d( v3d );
		}
		
		#if js
		Reflect.setField( Browser.window, 'snapshot', snapshot );
		#end
		*/
	}
	
	function testBox2d() {
		var scale = 30;
		var helper:Box2dHelper = Box2dHelper.inst;
		var b2w = helper.createWorld( new B2Vec2(0, 0) );
		var s = helper.createSphereBody( b2w, scale );
		s.setLinearDamping( 5 );
		s.setAngularDamping( 5 );
		s.getFixtureList().setRestitution( 1 );
		var ary_cube = [
			helper.createBoxBody( b2w, scale ),
			helper.createBoxBody( b2w, scale ),
			helper.createBoxBody( b2w, scale )
		];
		
		ary_cube.map( function( body ) {
			body.setLinearDamping( 10 );
			body.setAngularDamping( 10 );
			body.setPosition( new B2Vec2( Math.random() * 500 / scale, Math.random() * 500 / scale  ));
		});
		
		addChild( helper.createDebugDraw( b2w, scale, new Sprite() ) );
		
		var acc = new B2Vec2();
		var speed = 5;
		addEventListener( Event.ENTER_FRAME, function( e ) {
			s.getLinearVelocity().add( acc );
			helper.updateB2w( b2w );
		});
		
		
		Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, function( e ) {
			s.setAwake( true );
			switch( e.keyCode ) {
				case Keyboard.UP:
					acc.y = -speed;
				case Keyboard.DOWN:
					acc.y = speed;
				case Keyboard.LEFT:
					acc.x = -speed;
				case Keyboard.RIGHT:
					acc.x = speed;
			}
		});
		
		
		Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, function( e ) {
			switch( e.keyCode ) {
				case Keyboard.UP:
					acc.y = 0;
				case Keyboard.DOWN:
					acc.y = 0;
				case Keyboard.LEFT:
					acc.x = 0;
				case Keyboard.RIGHT:
					acc.x = 0;
					
			}
		});
		
		var aa:DisplayObject;
		var pointT:DisplayObjectContainer;
		var ary_point = [];
		Assets.loadLibrary( 'swfsrc', function( lib:Dynamic ) {
			aa = Assets.getMovieClip( 'swfsrc:mc_a' );
			this.addChild( aa );
			
			var testani = Assets.getMovieClip( 'swfsrc:mc_ani' );
			testani.x = 300;
			testani.y = 300;
			testani.rotation = 50;
			//testani.rotationX = 50;
			this.addChild( testani );
			
			pointT = Assets.getMovieClip( 'swfsrc:pointT' );
			for ( i in 0...pointT.numChildren ) {
				var disobj:DisplayObject = pointT.getChildAt( i );
				ary_point.push( {id:disobj.name.split( '_' )[1], x:disobj.x, y:disobj.y } );
			}
			ary_point.sort( function( a:Dynamic, b:Dynamic ) {
				var ai = Math.floor( a.id );
				var bi = Math.floor( b.id );
				if ( ai > bi ) {
					return 1;
				}
				return -1;
			});
			var at = ary_point.map( function( obj:Dynamic ) {
				trace( obj.id );
				return new B2Vec2( obj.x / scale, obj.y / scale );
			});
			///trace( at );
			helper.createCustomBody( b2w, scale, at );
			//createCustomBody( b2w, ary_point );
		});
		
		
		function createRandomBody() {
			helper.createBoxBody( b2w, scale, 2, Math.floor( Math.random() * 300 ), Math.floor( Math.random() * 300 ) );
		}
		
		#if js
		Reflect.setField( Browser.window, 'createRandomBody', createRandomBody );
		#end
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}
	
	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
