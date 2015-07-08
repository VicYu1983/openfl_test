package org.vic.event;
	/**
	 * ...
	 * @author fff
	 */
class VicEvent<T>
{
	public var name:String;
	public var data:T;
	
	public function new( name, ?data:T ) {
		this.name = name;
		this.data = data;
	}
	
}