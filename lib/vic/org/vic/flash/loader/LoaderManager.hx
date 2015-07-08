package org.vic.flash.loader;
import org.vic.event.VicEventDispatcher;

/**
 * ...
 * @author fff
 */
class LoaderManager extends VicEventDispatcher
{
	public static var PROGRESS:String = 'progress';
	
	public static var inst = new LoaderManager();
	private var _map_loader:Map<String,LoaderTask>;

	private function new() 
	{
		super();
		_map_loader = new Map<String,LoaderTask>();
	}
	
	public function addTask( name, loader:LoaderTask) {
		if ( hasTask( name ))
			return;
		loader.mediator = this;
		loader.load();
		_map_loader.set( name, loader );
	}
	
	public function hasTask( name ) {
		return _map_loader.exists( name );
	}
	
	public function getTask( name ) {
		if ( hasTask( name ))
			return _map_loader.get( name );
		return null;
	}
}