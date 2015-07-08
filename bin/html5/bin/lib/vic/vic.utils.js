var vic = vic || {};
vic.utils = vic.utils || {};

vic.utils.includeJS = function( ary_path ){
	for( var i = 0; i < ary_path.length; ++i ){
		document.write( '<script type="text/javascript" src="' + ary_path[i] + '"></script>' );
	}
}

vic.utils.includeCSS = function( ary_path ){
	for( var i = 0; i < ary_path.length; ++i ){
		document.write( '<link href="' + ary_path[i] + '" rel="stylesheet" type="text/css" />' );
	}
}

vic.utils.createElement = function( type, obj ){
	var element = document.createElement( type );
	for( prop in obj ){
		element[ prop ] = obj[ prop ];
	}
	return element;
}

vic.utils.getElement = function( id ){
	return document.getElementById( id );
}

vic.utils.appendChild = function(){
	if( arguments.length > 1 ){
		var a = arguments[0];
		for( i = 1; i < arguments.length; ++i ){
			if( arguments[i] ){
				a.appendChild( arguments[i] );
			}
		}
		return a;
	}else{
		return null;
	}
}

vic.utils.removeChildren = function( node ){
	if( node == null )	return;
	while( node.hasChildNodes() ){
		node.removeChild( node.firstChild );
	}
}

vic.utils.addEventListener = function( obj, eventName, listener ){
	if( obj.attachEvent )			obj.attachEvent( 'on' + eventName, listener );
	else if( obj.addEventListener )	obj.addEventListener( eventName, listener, false );
	else							return false;
	return true;
}

vic.utils.removeEventListener = function( obj, eventName, listener ){
	if( obj.detachEvent )				obj.detachEvent( 'on' + eventName, listener );
	else if( obj.removeEventListener )	obj.removeEventListener( eventName, listener, false );
	else return false;
	return true;
}

vic.utils.changeOpacity = function( opacity, id ){
	var styleobj = document.getElementById( id ).style;
	styleobj.opacity = opacity;
	styleobj.MozOpacity = opacity;
	styleobj.KhtmlOpacity = opacity;
	styleobj.filter = 'alpha(opacity=' + opacity + ')';
}

vic.utils.inherit = function(from, fields) {
	function Inherit() {} Inherit.prototype = from.prototype; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	proto.uber = from.prototype;
	return proto;
}

vic.utils.toURL = function(url, data, method, success){
	$.ajax({
		url: url,
		data: data,
		type: method,
		dataType:'json',
		success: success,
		error:function(xhr, ajaxOptions, thrownError){ 
			alert('status:' + xhr.status);
			alert('error' + thrownError);
		}
	});
}

vic.utils.secondToData = function( secs ){
	var t = new Date(1970,0,1);
    t.setSeconds( secs );
    var s = t.toTimeString().substr(0,8);
    return {hour:Math.floor((t - Date.parse("1/1/70")) / 3600000), minute:s.substr(3, 2), second: s.substr( 6, 2)};
}

vic.utils.unixtimeToDate = function( unixtime ){
	return new Date(unixtime*1000);
}

vic.utils.scaleCanvas = function( canvas, width, height, drawWidth, drawHeight ){
	var newcanvas = document.createElement( 'canvas' );
	var newcanvasCtx = newcanvas.getContext( '2d' );
	newcanvas.width = width
	newcanvas.height = height;
	var scaleWidth = drawWidth / canvas.width;
	var scaleHeight = drawHeight / canvas.height;
	newcanvasCtx.transform( scaleWidth, 0, 0, scaleHeight, 0, 0 );
	newcanvasCtx.drawImage( canvas, 0, 0 );
	return newcanvas;
}

vic.utils.centerAndScaleImage = function( imageWidth, imageHeight, containerWidth, containerHeight ){
	var ratio = imageWidth / imageHeight;
	var toRatio = containerWidth / containerHeight;
	var fac;
	if ( ratio > toRatio ) {
		fac = containerWidth / imageWidth;
	}else {
		fac = containerHeight / imageHeight;
	}
	imageWidth = imageWidth * fac;
	imageHeight = imageHeight * fac;
	var offsetX = ( containerWidth - imageWidth ) / 2;
	var offsetY = ( containerHeight - imageHeight ) / 2;
	return {scale:fac, offset:{x:offsetX, y:offsetY}};
};

/*<meta name="viewport" content="width=device-width,initial-scale=0.5,maximum-scale=1.0, user-scalable=1"/>*/
vic.utils.resizeWebViewport = function( targetWidth ){
	viewport = document.querySelector("meta[name=viewport]");
	var result = $(window).width() / targetWidth * .5;
	viewport.setAttribute('content', 'width=640, initial-scale='+result+',maximum-scale='+result+', user-scalable=1');
}

vic.utils.shareFB = function( link, title ){
	window.open( 'http://www.facebook.com/sharer.php?u=' + link  + '&t=' + title );
}

