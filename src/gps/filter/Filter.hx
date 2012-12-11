package gps.filter;
import gps.Position;

/**
 * An abstract filter interface for GPS location data.
 * The filter will 
 * @author waneck
 */

interface Filter 
{
	/**
	 * The original position, as observed by the device
	 */
	var observedPosition(get_observedPosition, null):Position;
	
	/**
	 * The calculated - filtered - position, smoothed by the filter.
	 */
	var calculatedPosition(get_calculatedPosition, null):Position;
	
	/**
	 * The Calculated Velocity, in m/s
	 */
	var calculatedVelocity(get_calculatedVelocity, null):Float;
	
	/**
	 * The filter should be called in regular intervals.
	 * In here, you can set the interval each update will be called.
	 */
	var secondsPerTimeStep(get_secondsPerTimeStep, set_secondsPerTimeStep):Float;
	
	/**
	 * Updates 
	 * @param	p	the new observed position, from the GPS device
	 * @param	secondsSinceLastUpdate	how many seconds have elapsed since last update
	 */
	function update(p:Position, secondsSinceLastUpdate:Float):Void;
}