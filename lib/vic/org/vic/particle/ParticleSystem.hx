package org.vic.particle;
import org.vic.event.VicEventDispatcher;

/**
 * ...
 * @author fff
 */
class ParticleSystem extends VicEventDispatcher
{
	public var particles:Array<Particle>;
	
	private var _pid = 0;
	private var emtters:Dynamic;

	public function new() 
	{
		super();
		
	}
	
	public function startSystem() {
		addEventListener(Particle.PARTICLE_BORN, _onParticleBorn );
		addEventListener(Particle.PARTICLE_DEAD, _onParticleDead );
	}
	
	public function stopSystem() {
		removeEventListener(Particle.PARTICLE_BORN, _onParticleBorn );
		removeEventListener(Particle.PARTICLE_DEAD, _onParticleDead );
	}
	
	public function addEmitter( name, emitter ) {
		if ( getEmitter( name ) != null )
		{
			trace("has same name, invalud action" );
			return ;
		}
		else
		{
			emtters = { };
			emtters.name = emitter;
		}
	}
	
	public function getEmitter( name ) {
		if ( emtters != null )
			if ( emtters.name != null )
				return emtters.name;
		return null;
	}
	
	public function getPid() {
		return _pid++;
	}
	
	private function _onParticleBorn( e ) {
		if ( particles == null )
			particles = new Array<Particle>();
				
		var p = cast( e.data, Particle );
		particles.push( p );
	}
	
	private function _onParticleDead( e ) {
		var p = cast( e.data, Particle );
		var idx = Lambda.indexOf( particles, p );
		
		if ( idx != -1 )
			particles.splice( idx, 1 );
	}
}