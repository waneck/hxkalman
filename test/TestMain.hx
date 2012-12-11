package ;

import gps.test.TestMatrix;
import neko.Lib;
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
		
		Report.create(runner);
		runner.run();
	}
	
}