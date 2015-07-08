package org.vic.box2d;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import box2D.dynamics.joints.B2DistanceJointDef;
import flash.display.Sprite;
using Lambda;
/**
 * ...
 * @author vic
 */
class Box2dHelper
{
	public static var inst = new Box2dHelper();

	private function new() 
	{
		
	}
	
	public function createWorld( gravity:B2Vec2 ) {
		return new B2World( gravity, true );
	}
	
	public function createBoxBody( b2w:B2World, scale:Float, type = 2, x = 0, y = 0, w = 30, h = 30, degree = 0.0, density = 1, friction = 1, restitution = 0 ) {
		var def = new B2BodyDef();
		def.position.set( x / scale, y / scale );
		def.angle = degree / 180 * Math.PI;
		def.type = type;
		
		var body:B2Body = b2w.createBody( def );
		
		var fixdef = new B2FixtureDef();
		fixdef.density = density;
		fixdef.friction = friction;
		fixdef.restitution = restitution;
		
		var shape = new B2PolygonShape();
		shape.setAsBox( w / scale, h / scale );
		
		fixdef.shape = shape;
		body.createFixture( fixdef );
		
		return body;
	}
	
	public function createCustomBody( b2w:B2World, scale:Float, ary_point:Array<B2Vec2>, type = 2, x = 0, y = 0, degree = 0.0, density = 1, friction = 1, restitution = 0 ) {
		var def = new B2BodyDef();
		def.position.set( x / scale, y / scale );
		def.angle = degree / 180 * Math.PI;
		def.type = type;
		
		var body:B2Body = b2w.createBody( def );
		
		var fixdef = new B2FixtureDef();
		fixdef.density = density;
		fixdef.friction = friction;
		
		var shape = new B2PolygonShape();
		[ for ( i in 0...Math.floor( ary_point.length / 4 ) ) i ].mapi( function( id, pos ) {
			var ta = [	ary_point[id * 4],
						ary_point[id * 4 + 1],
						ary_point[id * 4 + 2],
						ary_point[id * 4 + 3]];
						
			var fixdef = new B2FixtureDef();
			fixdef.density = density;
			fixdef.friction = friction;
			fixdef.restitution = restitution;
			fixdef.shape = shape;
			shape.setAsArray( ta, ta.length );
			body.createFixture( fixdef );
		});
		
		return body;
	}
	
	public function createSphereBody( b2w:B2World, scale:Float, type = 2, x = 0, y = 0, radius = 20, degree = 0.0, density = 1, friction = 1, restitution = 0 ) {
		var def = new B2BodyDef();
		def.position.set( x / scale, y / scale );
		def.angle = degree / 180 * Math.PI;
		def.type = type;
		
		var body:B2Body = b2w.createBody( def );
		
		var fixdef = new B2FixtureDef();
		fixdef.density = density;
		fixdef.friction = friction;
		fixdef.restitution = restitution;
		
		var shape = new B2CircleShape( radius / scale );
		
		fixdef.shape = shape;
		body.createFixture( fixdef );
		
		return body;
	}
	
	public function createJoint( b2w:B2World, scale:Float, bodyA, bodyB, length = 50, dampingRatio = 0.0, frequencyHz = 0.0, ?offsetA:B2Vec2, ?offsetB:B2Vec2 ) {
		var j = new B2DistanceJointDef();
		j.bodyA = bodyA;
		j.bodyB = bodyB;
		j.localAnchorA = (function() {
			if ( offsetA == null ) return bodyA.getLocalCenter();
			else {
				var t = bodyA.getLocalCenter().copy();
				t.add( offsetA );
				return t;
			}
		})();
		j.localAnchorB = (function() {
			if ( offsetB == null ) return bodyB.getLocalCenter();
			else {
				var t = bodyB.getLocalCenter().copy();
				t.add( offsetB );
				return t;
			}
		})();
		j.length = length / scale;
		j.dampingRatio = dampingRatio;
		j.frequencyHz = frequencyHz;
		b2w.createJoint( j );
		return j;
	}
	
	public function createDebugDraw( b2w:B2World, scale, sprite ) {
		var dd = new B2DebugDraw();
		dd.setFillAlpha( .5 );
		dd.setFlags( B2DebugDraw.e_shapeBit );
		dd.setDrawScale( scale );
		dd.setSprite( sprite );
		b2w.setDebugDraw( dd );
		return sprite;
	}
	
	public function updateB2w( b2w:B2World, dt:Float = 1 / 30, velocityIterations:Int = 6, positionIterations:Int = 2 ) {
		b2w.drawDebugData();
		b2w.step( dt, velocityIterations, positionIterations );
	}
}