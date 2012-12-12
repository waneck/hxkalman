package gps.test;
import gps.filter.KalmanFilter;
import gps.Position;
import haxe.io.Eof;
import haxe.io.StringInput;
import haxe.Resource;
import utest.Assert;

/**
 * ...
 * @author waneck
 */

class TestFilter 
{

	public function new() 
	{
		
	}
	
	function testBearingNorth()
	{
		var f = new KalmanFilter(1);
		for (i in 0...100)
		{
			f.update(new Position(i * 0.0001, 0.0), 1.0);
		}
		var bearing = f.bearing();
		
		Assert.isTrue( Math.abs(bearing) < 0.01 );
		
		/* Velocity should be 0.0001 x units per timestep */
		Assert.isTrue( Math.abs(f.deltaLat - 0.0001) < 0.00001 );
		Assert.isTrue( Math.abs(f.deltaLon) < 0.00001 );
	}
	
	function testBearingEast()
	{
		var f = new KalmanFilter(1);
		for (i in 0...100)
		{
			f.update(new Position(0, i * 0.0001), 1);
		}
		
		var bearing = f.bearing();
		Assert.isTrue( Math.abs(bearing - 90) < 0.01 );
		
		/* 
			At this rate, it takes 10,000 timesteps to travel one longitude
			unit, and thus 3,600,000 timesteps to travel the circumference of
			the earth. Let's say one timestep is a second, so it takes
 			3,600,000 seconds, which is 60,000 minutes, which is 1,000
 			hours. Since the earth is about 40008 km around, this means we
 			are traveling at about 40 km per hour. 
		*/
		var ms = f.calculatedVelocity;
		var kmh = ms * 3.6;
		Assert.isTrue( Math.abs(kmh - 40) < 2 );
	}
	
	function testBearingSouth()
	{
		var f = new KalmanFilter(1);
		for (i in 0...100)
		{
			f.update(new Position(i * -0.0001, 0), 1);
		}
		
		var bearing = f.bearing();

		Assert.isTrue( Math.abs(bearing - 180) < 0.01 );
	}
	
	function testBearingWest()
	{
		var f = new KalmanFilter(1);
		for (i in 0...100)
		{
			f.update(new Position(0, i * -0.0001), 1);
		}
		
		var bearing = f.bearing();
		Assert.isTrue( Math.abs(bearing - 270) < 0.01 );
	}
}