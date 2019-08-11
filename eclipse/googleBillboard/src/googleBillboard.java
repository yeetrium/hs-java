//Luis Nunez, Google Billboard, AP Comp Sci mods 6,7
//7.427466391E9
import processing.core.*;

public class googleBillboard extends PApplet 
{
	public final static String e = "2.718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466391932003059";
	public void setup()
	{
		size(300,300);
		double dNum;
		int xIndex = 2;
		do
		{
			String digits = e.substring(xIndex,xIndex + 10);
			dNum = Double.parseDouble(digits);
			xIndex++;	
		}while(isPrime(dNum) == false);
		System.out.println(dNum);
		
	
	}
	public boolean isPrime(double dNum)
	{	
		for(int divisor = 2;divisor <= Math.sqrt(dNum); divisor++)
        {
        	if(dNum % divisor == 0)
        	{
        		return false;
        	}
        }
		return true;
	}
}