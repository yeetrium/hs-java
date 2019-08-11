//Luis Nunez, Mods 6-7, AP Comp Sci
//URL adress

import processing.core.*;

public class chemotaxis extends PApplet
{
	Bacteria bob[] = new Bacteria[50];
	public void setup()
	{
		size(500,500);
		background(0);
		smooth();	
		for(int nI = 0;nI<50;nI++)
		{
			bob[nI] = new Bacteria();
		}
	}
	public void draw()
	{
		fill(255,255,255,1);
		fill(0,0,0,1);	
		stroke(0,255,0);
		strokeWeight(5);
	    rect(0,0,500,500);
	    for(int nI = 0;nI<50;nI++)
		{
	    	bob[nI].move();
	    	bob[nI].show();
		}
	}
	class Bacteria 
	{
		int xPosition, yPosition, theR, theG, theB;
		Bacteria()
   		{
   			xPosition = 250;
   			yPosition = 250;
   			theR = (int)((Math.random()*150)+50);
   			theG = (int)((Math.random()*150)+100);
   			theB = (int)((Math.random()*150)+50);
   		}
   		void move()
   		{
   			xPosition += ((Math.random()*11)-5);
   			yPosition += ((Math.random()*11)-5);
   			
   			if(xPosition <= 10)
   			{
   				xPosition = 10;
   			}
   			if(yPosition <= 10)
   			{
   				yPosition = 10;
   			}
   			if(xPosition >= 490)
   			{
   				xPosition = 490;
   			}
   			if(yPosition >= 490)
   			{
   				yPosition = 490;
   			}			
   		}
   		void show()
   		{
   			stroke(0,255,255);
   			fill(theR,theG,theB);
   			ellipse(xPosition,yPosition,10,10);
   		}
	}
}