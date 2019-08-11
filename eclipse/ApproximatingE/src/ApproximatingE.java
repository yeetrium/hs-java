//Your Name, Getting Started, AP Comp mods 6-7
//your url for the program here
import processing.core.*;


public class ApproximatingE extends PApplet
{
	
	int nTimes = 0;
	int trials = 0;
	public void setup() 
	{
	    size(200,200);
	    background(0);
	    //noLoop();
	}
	public void draw() 
    {
		int count = 0;
		double dSum = 0;
		while(dSum < 1)
		{
			dSum += Math.random();
			count++;
		}
		System.out.println("Sum: " + dSum);
		System.out.println("count: " + count);
		//System.out.println("Tries: " + nTimes);
		//System.out.println("Trials: " + trials);	
	}
	public void mouseClicked()
	{
		redraw();
	}
	
}