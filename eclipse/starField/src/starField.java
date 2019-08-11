//Luis Nunez, Starfield, AP Comp Sci mods 6-7
//URL
import processing.core.*;

public class starField extends PApplet
{	
	Particle bob[] = new Particle[50];
	//declare particles variables here
	public void setup()
	{
		size(500,500);
		background(0);
		smooth();	
		for(int nI = 0;nI<50;nI++)
		{
			bob[nI] = new Particle();
		}
		//initialize particles variables here
	}
	public void draw()
	{
		background(0);
		for(int nI = 0;nI<50;nI++)
		{
			bob[nI].move();
			bob[nI].show();
		} 
		//move and show the particles

	}
	class Particle 
	{
		int color;
		double posX, posY, dSpeed, dTheta;
		Particle()
		{
			color = color((int)((Math.random()*200)+50),(int)((Math.random()*200)+50),(int)((Math.random()*200)+50));
			posX = 250;
			posY = 250;
			dSpeed = 5;
			dTheta = Math.random()*(2*(Math.PI));
		}
		void move()
		{
			posX += (Math.cos(dTheta)*dSpeed);
			posY += (Math.sin(dTheta)*dSpeed);
		}
		void show()
		{
			fill(color);
			ellipse((float)posX,(float)posY,20,20);
		}
		//lots of java!
	}
}