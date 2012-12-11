package ;

import gps.test.TestFilter;
import gps.test.TestKalman;
import gps.test.TestMatrix;
import utest.Runner;
import utest.TestResult;
import utest.ui.Report;

/**
 * ...
 * @author waneck
 */

class TestMain 
{
	
	static function main() 
	{
		var runner = new Runner();
		
		runner.addCase(new TestMatrix());
		runner.addCase(new TestKalman());
		runner.addCase(new TestFilter());
		
		Report.create(runner);
		runner.run();
	}
	
}