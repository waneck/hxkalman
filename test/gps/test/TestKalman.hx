package gps.test;
import gps.math.Kalman;
import gps.math.Matrix;
import utest.Assert;

/**
 * ...
 * @author waneck
 */

class TestKalman 
{

	public function new() 
	{
		
	}
	
	/* Test the example of a train moving along a 1-d track */
	function testTrain()
	{
		var f = new Kalman(2, 1);
		/* The train state is a 2d vector containing position and velocity.
		 * Velocity is measured in position units per timestep units. */
		f.state_transition = new Matrix(2, 2,
		[
			1.0, 1.0,
			0.0, 1.0
		]);
		
		/* We only observe position */
		f.observation_model = new Matrix(1, 2, [ 1.0, 0.0 ]);
		
		/* The covariance matrices are blind guesses */
		f.process_noise_covariance.identity();
		f.observation_noise_covariance.identity();
		
		/* Our knowledge of the start position is incorrect and unconfident */
		var derivation = 1000.0;
		f.state_estimate.set(0,0, 10 * derivation);
		f.estimate_covariance.identity();
		f.estimate_covariance.scale(derivation * derivation);
		
		/* Test with time steps of the position gradually increasing */
		for (i in 0...10)
		{
			f.observation.set(0, 0, i);
			f.update();
		}
		
		/* Our prediction should be close to (10, 1) */
		trace("estimated position: " + f.state_estimate.get(0, 0));
		trace("estimated velocity: " + f.state_estimate.get(1, 0));
		
		Assert.isTrue(true);
	}
	
}