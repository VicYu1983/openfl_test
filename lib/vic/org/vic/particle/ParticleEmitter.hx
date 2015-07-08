package org.vic.particle;

/**
 * ...
 * @author fff
 */
class ParticleEmitter extends Particle
{
	public var numParticlePerFrame = 1;
	
	private var _p:Particle;
	public function new( ps, p ) 
	{
		super( ps);
		
		_p = p;
	}
	
	private function spray() {
		var p = _p.clone();
		p.pos.x = pos.x;
		p.pos.y = pos.y;
		p.born();
	}
	
	override public function clone():Dynamic 
	{
		var p = new ParticleEmitter( getParticleSystem(), _p );
		p.pos.x = pos.x;
		p.pos.y = pos.y;
		p.vel.x = vel.x + ( Math.random() * randomVel.x - randomVel.x / 2 );
		p.vel.y = vel.y + ( Math.random() * randomVel.y - randomVel.y / 2 );
		p.acc = acc;
		p.gra = gra;
		p.fri = fri;
		p.bounce = bounce;
		p.deadAge = deadAge;
		p.extraData = extraData;
		p.numParticlePerFrame = numParticlePerFrame;
		return p;
	}
	
	override public function update():Dynamic 
	{
		super.update();
		
		for ( i in 0...numParticlePerFrame )
			spray();
	}
}