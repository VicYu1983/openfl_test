package org.vic.particle;

import org.vic.event.VicEvent;
import org.vic.VicVector;

class Particle {
	public static var PARTICLE_UPDATE = "particle_update";
	public static var PARTICLE_DEAD = "particle_dead";
	public static var PARTICLE_BORN = "particle_born";
	
	public var id:Int;
	public var vel:VicVector;
	public var acc:VicVector;
	public var pos:VicVector;
	public var gra = 0.0;
	public var fri = 1.0;
	public var bounce = -.7;
	public var age = 0;
	public var deadAge = 100;
	public var extraData:Dynamic;
	
	public var randomVel:VicVector;
	
	private var _idDead = false;
	private var _particleSystem:ParticleSystem;
	
	public function new( ps ) {
		
		_particleSystem = ps;
		this.id = _particleSystem.getPid();
		
		vel = new VicVector();
		acc = new VicVector();
		pos = new VicVector();
		randomVel = new VicVector();
	}
	
	public function born() {
		getParticleSystem().dispatchEvent( new VicEvent( PARTICLE_BORN, this ));
	}
	
	public function update() {
		if ( _idDead )
			return;
			
		vel = vel.add( acc );
		vel.y += gra;
		vel.x *= fri;
		vel.y *= fri;
		pos = pos.add( vel );
		
		age++;
		if ( age > deadAge )
		{
			_idDead = true;
			getParticleSystem().dispatchEvent( new VicEvent( PARTICLE_DEAD, this ));
		}
		else
			getParticleSystem().dispatchEvent( new VicEvent( PARTICLE_UPDATE, this ));
	}
	
	public function clone() {
		var p = new Particle( getParticleSystem() );
		p.pos.x = pos.x;
		p.pos.y = pos.y;
		p.vel.x = vel.x + ( Math.random() * randomVel.x - randomVel.x / 2 );
		p.vel.y = vel.y + ( Math.random() * randomVel.y - randomVel.y / 2 );
		p.acc = acc;
		p.gra = gra;
		p.fri = fri;
		p.bounce = bounce;
		p.deadAge = deadAge;
		
		//這邊之後要處理成for each
		p.extraData = extraData;
		p.randomVel = randomVel;
		return p;
	}
	
	private function getParticleSystem() {
		return _particleSystem;
	}
}