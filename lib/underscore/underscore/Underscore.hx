package underscore;

import haxe.Json;
/**
 * Underscore.hx 0.0.1
 *
 * pure haxe library
 *
 * tested on neko,flash,js,php
 *
 * ported to haxe by M.Paraiso , contact : mparaiso@online.fr
 *
 * Underscore is freely distributable under the MIT license.
 *
 * https://github.com/Mparaiso/Underscore.hx
 *
 * based on :
 *
 * Underscore.js 1.3.3 by Jeremy Ashkenas, DocumentCloud Inc.
 *
 * http://documentcloud.github.com/underscore
 *
 *
 * Methods implemented so far :
 *
 * size , each , forEach , map , collect , reduce , fold , inject , reduceRight ,foldr , find ,
 * detect , filter , select , reject , every , all , any , some , include ,contains , [invoke] ,
 * pluck , isEqual
 */
class Underscore
{
	static public inline var version:String = "0.0.1";
	
	static public function each(obj:Dynamic,iterator:Dynamic->Dynamic->Dynamic->Dynamic,?context:Dynamic=null) {
		if (obj == null) return;
		//si l'object a un iterateur
		if (isArray(obj) || ( Reflect.hasField(iterator, "iterator") && Reflect.isFunction( Reflect.field(iterator,'iterator')) )) {
			var i = 0;
			Lambda.iter(obj, function(el) {
				iterator(el, i, obj);
				i++;
			});
		}
		// si l'obj est un litéral
		if (isObject(obj)) {
			for (field in Reflect.fields(obj)) {
				iterator(Reflect.field(obj, field),field,obj);
			}
		}
	}
	
	public static var forEach = each;
	
	public static function map(obj:Dynamic, iterator:Dynamic, ?context:Dynamic = null):Array<Dynamic> {
		var results:Array<Dynamic> = [];
		if (obj == null) return results;
		each(obj, function(value, index, list) {
			results[results.length] = iterator(value, index, List);
		},context);
		return results;
	}
	
	public static var collect = map;

		
	public static function reduce(obj:Dynamic, iterator:Dynamic,?memo:Dynamic = null, ?context:Dynamic):Dynamic {
		var first:Bool = true;
		each(obj, function(value:Dynamic, index:Float, list:Dynamic) {
			if (first == true && memo == null) {
				memo = value;
				first = false;
			}else{
				memo = iterator(memo, value, index, list);
			}
		});
		return memo;
	}
	
	public static inline var fold = reduce;
	
	public static var inject = reduce;
	
	public static function reduceRight(obj:Dynamic,iterator:Dynamic,?memo:Dynamic=null,?context:Dynamic):Dynamic{
		var result = reverse(obj);
		return reduce(result, iterator, memo, context);
	}
	
	static public var foldr = reduceRight;
	
	/**
	 * Return the first value
	 * which passes a truth test.
	 * Aliased as detect.
	 */
	static public function find(obj:Dynamic, iterator:Dynamic, ?context:Dynamic=null) {
		var result=null;
		any(obj, function(value, index, list) {
			if (iterator(value, index, list)) {
				result = value;
				return true;
			}else {
				return false;
			}
		});
		return result;
	}
	
	static public inline var detect = find ;
	
	/**
	 * Return all the elements
	 * that pass a truth test.
	 * Aliased as select.
	 */
	static public function filter(obj:Dynamic, iterator:Dynamic, ?context:Dynamic = null):Array<Dynamic> {
		var results = [];
		if (obj == null) return results;
		each(obj, function(value:Dynamic, index:Dynamic, list:Dynamic) {
			if (iterator(value, index, list)) results[results.length] = value;
		});
		return results;
	}
	
	public static var select = filter;
	
	/**
	 * Return all the elements for which a truth test fails.
	 */
	public  static function reject(obj:Dynamic, iterator:Dynamic, ?context = null) {
		var results = [];
		if (obj ==null) return results;
		each(obj, function(value:Dynamic, index:Dynamic, list:Dynamic) {
			if ( ! iterator(value, index, list) ) results[results.length] = value;
		});
		return results;
	}
	
	public static function every(obj:Dynamic, iterator:Dynamic, ?context = null):Bool {
	  var result = true;
		each(obj, function(value, index, list) {
			if (! iterator(value, index, List)) {
				result = false;
			}
		});
		return result;
	}
	
	public static var all = every;
	
	/**
	 * Determine if at least one element
	 * in the object matches a truth test.
	 * Aliased as any.
	 */
	public static function any(obj:Dynamic, iterator:Dynamic):Bool {
		var result = false;
		if (obj == null) return result;
		each(obj, function(value, index, list) {
			if (result == false) {
				result = iterator(value, index, list);
			}
		});
		return result;
	}
	
	public static function some(obj:Dynamic, iterator:Dynamic) {
		return any(obj, iterator);
	}
	
	/**
	 * Determine if a given value is included in the array or object.
	 * Aliased as contains.
	 */
	public static function include(obj:Dynamic,target:Dynamic):Bool {
		var found = false;
		if (obj == null) return found;
		found = any(obj, function(value, index, list) {
			return value == target ;
		});
		return found ;
	}
	
	/**
	 * Determine if a given value is included in the array or object.
	 */
	public static var contains = include;
	
	/**
	 * Calls the method
	 * on each value in the list.
	 * Any extra arguments passed
	 * to invoke will be forwarded
	 * on to the method invocation.
	 */
	public static function invoke(obj:Dynamic, method:Dynamic, ?args:Dynamic = null) {
		throw "not implemented yet";
		//ifNullSetValue(args, []);
		//return map(obj, function(value, index, list) {
			//#if (js || flash)
			//trace(method.apply(value, args));
				//return method.apply(value, args);
			//#else
				//return Reflect.callMethod(value, method, args);
			//#end
		//});
	}
	
	/**
	 * Convenience version of a common use case of map:
	 * fetching a property.
	 */
	public static function pluck(obj:Dynamic, key:Dynamic):Dynamic {
		return map(obj, function(value:Dynamic, index:Dynamic, list:Dynamic) {
			if (isArray(value)&& isNumber(key)) {
				return value[key];
			}else {
				return Reflect.field(value, key);
			}
		});
	}
		
	private static function eq(a:Dynamic, b:Dynamic,?stack:Dynamic):Bool{
		//todo re-implement that function
		// testing 2 literals
		if (a == b) return true;
		// test 2 nuls
		if (a == null || b == null) return a == b ;
		// test 2 arrays
		if (isRegExp(a) && isRegExp(b) ){
			return Std.string(a) == Std.string(b);
		}
		if (isArray(a) && isArray(b)){
			if (Lambda.count(a) == Lambda.count(b)) {
				var i = 0;
				while (i++ < (Lambda.count(a) - 1)) {
					if (a[i] != b[i]) return false;
				}
				return true;
			}
			return false;
		}
		//testing 2 objects
		if (isObject(a) && isObject(b)) {
			
			var equals = true ;
			var a_properties:Array<String> = Reflect.fields(a);
			var b_properties:Array<String> = Reflect.fields(b);
			if (Lambda.count(a_properties) != Lambda.count(b_properties)) return false;
			for (prop in a_properties) {
				if (!isConstant(Reflect.field(a, prop))) {
					equals = eq(Reflect.field(a, prop), Reflect.field(b, prop));
				}else if (Reflect.field(a, prop) != Reflect.field(b, prop)) {
					equals = false;
					
				}
				if (equals == false) {
					break;
				}
			}
			return equals;
			
		}
		return false;
	}
	
	static public function clone(obj:Dynamic):Dynamic{
		if (!isObject(obj)) return obj;
		if (isArray(obj)) {
			if (Lambda.count(obj) == 0) return [];
			var array:Array<Dynamic> = [];
			for (val in cast(obj,Array<Dynamic>)) {
				array.push(val);
			}
			return array;
		}
		return extend(cast { },[obj]);
	}
	
	static public function uniqueId(prefix:String=null):String{
		var id:Dynamic = idCounter++;
		return Std.string( prefix != null?prefix + id : id ) ;
	}

	public static function ifNullSetValue(obj:Dynamic, val:Dynamic) {
		if (obj == null) {
			obj = val;
		}
		return obj;
	}
	
	static public function isEmpty(obj:Dynamic) {
		if (obj == null) return true;
		if (isArray(obj)) return Lambda.count(obj) == 0;
		if (isString(obj)) return cast(obj, String).length == 0;
		if (isObject(obj)) {
			for (key in Reflect.fields(obj)) {
				if (has(obj, key)) return false;
			}
		}
		return true;
	}
	
	/**
	 * Shuffle an array
	 */
	static public function shuffle(obj:Dynamic) {
		var shuffled = [], rand;
		each(obj, function(value, index, list) {
			rand = Math.floor(Math.random() * (index +1 ));
			shuffled[index] = shuffled[rand];
			shuffled[rand] = value;
		});
		return shuffled;
	}
	
	
	static private var idCounter:Int = 0;
	
	public static function size(obj:Dynamic):Int {
		var s:String = "";
		return ( isString(obj) || isArray(obj) ) ? Reflect.field(obj, "length") : Reflect.fields(obj).length;
	}
	

	public static function reverse(obj:Dynamic):Dynamic{
		var result:Array<Dynamic>= [];
		if (isArray(obj)) {
			if (Reflect.hasField(obj, "reverse")&& Reflect.isFunction(Reflect.field(obj,"reverse"))) {
				return obj.reverse();
			}
			Lambda.iter(obj, function(value) {
				result.unshift(value);
			});
		}
		return result;
	}
	
	//
	// ARRAY FUNCTIONS
	//
	
	/**
	 * Return the maximum element or (element-based computation).
	 */
	public static function max(list:Dynamic):Dynamic{
		var result:Dynamic = reduce(list, function(memo:Dynamic, value:Dynamic, index:Int, list:Dynamic) {
			if ( memo > value ) return memo;
			return value ;
		});
		return result;
	}
	
	/**
	 * Return the minimum element (or element-based computation).
	 */
	public static function min(list:Dynamic):Dynamic {
		var result:Dynamic = reduce(list, function(memo:Dynamic, value:Dynamic, index:Int, list:Dynamic) {
			if (memo < value) return memo;
			return value;
		});
		return result;
	}
	
	/**
	 * Zip together multiple lists into a single array -- elements
	 * that share an index go together.
	 */
	static public function zip(array:Array<Dynamic>) {
		var result = new Array();
		var lengths:Array<Dynamic> = pluck(array, "length");
		var length:Int = max(lengths);
		for (i in 0...length) {
			result[i] = pluck(array, i);
		}
		return result;
	}
	
	/**
	 *  Return the position
	 * of the first occurrence
	 * of an item in an array, or -1
	 * if the item is not included in the array.
	 */
	static public function indexOf(array:Array<Dynamic>, item:Dynamic) {
		return Lambda.indexOf(array,item);
	}
	
	static public function lastIndexOf(array:Array<Dynamic>, item:Dynamic) {
		if (array == null) return -1;
		var i = array.length;
		while (i-->= 0) {
			if (array[i] == item)
			return i;
		}
		return -1;
	}
	
	/**
	 * Generate an integer Array
	 * containing an arithmetic progression.
	 * A port of the native Python range() function.
	 */
	static public function range(start:Int, stop:Int, ?step:Int = 1):Array<Int> {
		var i, d, result:Array<Int> = [ ];
		step = Math.floor(Math.abs(step));
		result.push((i=start));
		if (start < stop){
			while ( ( i += step ) <= stop) {
				result.push(i);
			}
		}else if (start > stop) {
			while ((i -= step) >= stop) {
				result.push(i);
			}
		}
		return result;
	}
	
	//
	// FUNCTIONS FUNCTIONS
	//
	
	/**
	 * Create a function bound to a given object
	 * (assigning this, and arguments, optionally).
	 * Binding with arguments is also known as curry.
	 */
	static public function bind(func:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Bind all of an object's methods to that object.
	 * Useful for ensuring that all callbacks
	 * defined on an object belong to it.
	 */
	static public function bindAll(func:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Memoize an expensive
	 * function by storing
	 * its results.
	 */
	static public function memoize(func:Dynamic, hasher:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Delays a function
	 * for the given number of milliseconds,
	 * and then calls it with the arguments supplied.
	 */
	static public function delay(func:Dynamic, wait:Float) {
		throw "not implemented yet";
	}
	
	/**
	 * Defers a function,
	 * scheduling it to run
	 * after the current
	 * call stack has cleared.
	 */
	static public function defer(func:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Returns a function,
	 * that, when invoked,
	 * will only be triggered
	 * at most once during a
	 * given window of time.
	 */
	static public function throttle(func:Dynamic, wait:Float) {
		throw "not implemented yet";
	}
	
	/**
	 * Returns a function, that, as long as it continues to be invoked,
	 * will not be triggered.
	 * The function will be called after it
	 * stops being called for N milliseconds. If immediate is passed,
	 * trigger the function on the leading edge,
	 * instead of the trailing.
	 *
	 */
	static public function debounce(func:Dynamic, wait:Dynamic, immediate:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Returns a function that
	 * will be executed at most
	 * one time, no matter
	 * how often you call it.
	 * Useful for lazy initialization.
	 */
	static public function once(func:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Returns the first function
	 * passed as an argument to the second,
	 * allowing you to adjust arguments,
	 * run code before and after, and conditionally
	 * execute the original function.
	 */
	static public function wrap(func:Dynamic,wrapper:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Returns a function that is the composition
	 * of a list of functions,
	 * each consuming the return
	 * value of the function that follows.
	 */
	static public function compose(functionList:Dynamic) {
		throw "not implemented yet";
	}
	
	/**
	 * Returns a function that will
	 * only be executed after
	 * being called N times.
	 */
	static public function after(times:Dynamic, func:Dynamic) {
		throw "not implemented yet";
	}
	
	//
	// OBJECT FUNCTIONS
	//
	/**
	 * Perform a deep comparison to check if two objects are equal.
	 */
	public static function isEqual(a:Dynamic, b:Dynamic):Bool {
		var _a = a ;
		var _b = b;
		return eq(_a,_b);
	}

	/**
	 * Retrieve the names of an object's properties.
	 */
	static public function keys(obj:Dynamic):Array<Dynamic> {
		return Reflect.fields(obj);
	}
	
	/**
	 * Retrieve the values of an object's properties.
	 */
	static public function values(obj:Dynamic):Array<Dynamic> {
		return map(obj, identity);
	}
	
	/**
	 * Extend a given object with all
	 * the properties in passed-in object(s).
	 * @param	target
	 * @param	sources
	 */
	public static function extend(target:Dynamic, sources:Array<Dynamic>) {
		if (!isArray(sources)) throw "sources must be an array";
		for(source in sources){
			for (property in Reflect.fields(source)) {
				Reflect.setField(target, property, Reflect.getProperty(source, property));
			}
		}
		return target;
	}
	
	/**
	 * 	Return a sorted list of the
	 * function names available on the object. Aliased as methods
	 */
	static public function functions(obj:Dynamic):Array<String> {
		var names:Array<String>= [];
		for (propname in Reflect.fields(obj)) {
			if (Reflect.isFunction(Reflect.field(obj, propname))) {
				names.push(propname);
			}
		}
		names.sort(function(a, b) {
			if (a == b) {
				return 0;
			}else if (a < b ) {
				return -1;
			}else {
				return 1;
			}
		});
		return names;
	}
	
	static public var methods:Dynamic->Array<String> = functions;
	
	/**
	 * Return a copy of the object only
	 * containing the whitelisted properties.
	 */
	static public function pick(obj:Dynamic,params:Array<String>){
		var result = cast { };
		each(params, function(key, index, list) {
			if (Reflect.hasField(obj, key)) Reflect.setField(result, key, Reflect.field(obj, key));
		});
		return result;
	}
	
	static public function defaults(obj:Dynamic,?properties:Array<Dynamic>=null):Dynamic{
		if (properties != null) {
			each(properties, function(source, index, list) {
				for (property in Reflect.fields(source)) {
					if (Reflect.hasField(obj, property) && Reflect.field(obj,property)==null) {
						Reflect.setField(obj, property, Reflect.field(source, property));
					}
				}
			});
		}
		return obj;
	}
	
	static public function tap(obj:Dynamic) {
		throw "not implemented yet";
	}
	
	static public function isObject(obj:Dynamic):Bool {
		if (isString(obj)) return false;
		if (isArray(obj)) return false;
		if (isFunction(obj)) return false;
		return Reflect.isObject(obj);
	}
	
	/**
	 * returns the object type
	 */
	public static function typeOf(obj:Dynamic):String {
		var typeName:Dynamic = Type.getClass(obj);
		if (typeName == null) return Std.string(Type.typeof(obj));
		return Type.getClassName(typeName);
	}
	
	/**
	 * return true if the object is a list , a hash or an array
	 */
	public static function isArray(obj:Dynamic):Bool {
		if (typeOf(obj) == "Array" || typeOf(obj) == "List" || typeOf(obj) == "Hash") {
			return true;
		}
		return false;
	}
	
	public static function isFunction(obj:Dynamic):Bool{
		return Reflect.isFunction(obj);
	}

	static public function isString(obj:Dynamic) {
		var class_  = Type.getClass(obj);
		if (class_ == null) return false;
		return Type.getClassName(Type.getClass(obj)) == "String";
	}
	
	static public function isInt(el:Dynamic):Bool {
		return Std.string(Type.typeof(el)) == "TInt";
	}
	
	/**
	 * returns true if value is a float or a integer
	 */
	public static function isNumber(value:Dynamic):Bool{
		return typeOf(value)== "TInt" || typeOf(value) == "TFloat";
	}
	
	static public function isNaN(obj:Dynamic) {
		throw "not implemented yet , contact me at mparaiso@online.fr if you have a proposal";
	}
	
	static public function isBoolean(obj:Dynamic) {
		return Std.string(Type.typeof(obj)) == "TBool";
	}
	
	static public function isDate(obj:Dynamic):Bool {
		return Type.getClassName(Type.getClass(obj)) == "Date";
	}
	
	static public function isRegExp(obj:Dynamic):Bool {
		var class_ = Type.getClass(obj);
		if (class_ == null) return false;
		return Type.getClassName(class_) == "EReg";
	}
	
	public static function isNull(obj:Dynamic):Bool{
		return obj == null;
	}
	
	static public function isUndefined(obj) {
		throw "isUndefined is not implemented yet";
	}
	
	static public function has(obj:Dynamic, attr:String):Bool{
		if (obj == null) throw "obj is null!";
		return Reflect.hasField(obj, attr);
	}
	
	public static function isConstant(value:Dynamic) {
		return (!isArray(value) && !isObject(value) && !isDate(value) || isRegExp(value));
	}
	//
	// UTILITY FUNCTIONS
	//
	
	/**
	 * Run a function n times.
	 */
	static public function times(n, iterator, ?context = null) {
		for (i in 0...n) {
			iterator(i);
		}
	}
	
	/**
	 * Keep the identity function around for default iterators.
	 * @param	value
	 */
	public static function identity<T>(value:T):T{
		return value;
	}
	
	/**
	 * Escape a string for HTML interpolation.
	 * @param	string
	 */
	static public function escape(string:String):String {
		var a = [~/&/g, ~/</g, ~/>/g, ~/"/g, ~/'/g, ~/\//g];
		var r = ['&amp;', '&lt;', '&gt;', '&quot;', '&#x27;', '&#x2F;'];
		for (i in 0...a.length) {
			string = a[i].replace(string, r[i]);
		}
		return string;
	}

	/**
	 * Add your own custom functions to
	 * the Underscore object, ensuring that
	 * they're correctly added to the OOP wrapper as well.
	 */
	static public function mixin(obj) {
		throw "not implemented yet";
	}
	
	static public inline var templateSettings = {
		evaluate : ~/<%([\s\S]+?)%>/g ,
		interpolate : ~/<%=([\s\S]+?)%>/g,
		escape : ~/<%-([\s\S]+?)%>/g
	};
	
	static private inline var noMatch = ~/.^/;
	
}