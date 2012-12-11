package gps;

/**
 * ...
 * @author waneck
 */

class Position 
{
	public var lat(default, null):Float;
	public var lon(default, null):Float;
	
	public function new(latitude:Float, longitude:Float) 
	{
		this.lat = latitude;
		this.lon = longitude;
	}
	
}