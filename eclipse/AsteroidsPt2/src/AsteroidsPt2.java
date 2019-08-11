//Luis Nunez, Asteroids Part 2, AP Comp Sci mods 6-7
//http://luisito3.webs.com/Asteroids_Part2.html
import processing.core.*;
public class AsteroidsPt2 extends PApplet{
	protected boolean wIsPressed = false;
	protected boolean aIsPressed = false;
	protected boolean dIsPressed = false;
	protected boolean bHyperspace = false;
	Spaceship hawk = new Spaceship();
	Asteroid meteors[] = new Asteroid[10];
	Star dots[] = new Star[100];

	public void setup()
	{
		size(640,480);
		smooth();	
		for(int nI = 0;nI<10;nI++)
		{
			meteors[nI] = new Asteroid();
		}
		for(int nI = 0;nI<100;nI++)
		{
			dots[nI] = new Star();
		}
	}
	public void draw()
	{
		background(0);
		for(int nI = 0;nI<10;nI++)
		{
			meteors[nI].move();
			meteors[nI].show();
		}
		for(int nI = 0;nI<100;nI++)
		{
			dots[nI].show();
		}
		keyPressed();
		keyReleased();
		shipMovement();
		theHyperspace();
		hawk.move();
		hawk.show();	
	}
	class Star
	{
		protected int xPos, yPos, theSize, theColor;
		Star()
		{
			xPos = (int)(Math.random()*640);
			yPos = (int)(Math.random()*480);
			theSize = (int)((Math.random()*5)+3);
			theColor = color((int)((Math.random()*150)+50),(int)((Math.random()*150)+100),(int)((Math.random()*150)+50));
		}
		public void show()
		{
			noStroke();
			fill(theColor);
			ellipse(xPos,yPos,theSize,theSize);
		}
	}
	public void keyPressed()
	{
		if(keyPressed)
		{
			if(key == 'w')
			{
				wIsPressed = true;
			}
			else if(key == 'a')
			{
				aIsPressed = true;
			}
			else if(key == 'd')
			{
				dIsPressed = true;
			}
			else if(key == 'x')
			{
				bHyperspace = true;
			}
		}
	}
	public void keyReleased()
	{
		if(keyPressed == false)
		{
			if(key == 'w')
			{
				wIsPressed = false;
			}
			else if(key == 'a')
			{
				aIsPressed = false;

			}
			else if(key == 'd')
			{
				dIsPressed = false;
			}
			else if(key == 'x')
			{
				bHyperspace = false;
			}
		}
	}
	public void shipMovement()
	{
		if(wIsPressed == true)
		{
			hawk.accelerate(.3);
		}
		if(aIsPressed == true)
		{
			hawk.rotate(-15);
		}
		if(dIsPressed == true)
		{
			hawk.rotate(15);
		}
	}
	public void theHyperspace()
	{
		if(bHyperspace == true)
		{
			hawk.setX((int)(Math.random()*640));
			hawk.setY((int)(Math.random()*480));
			hawk.setDirectionX(0);
			hawk.setDirectionY(0);
			hawk.setPointDirection((int)(Math.random()*360));
		}
	}
	class Spaceship extends Floater
	{
		Spaceship()
		{
			corners = 7;
			xCorners = new int[corners];
			yCorners = new int[corners];
			myColor = color(0,255,0);
			xCorners[0] = -2;
			yCorners[0] = 4;
			xCorners[1] = -8;
			yCorners[1] = 2;
			xCorners[2] = -8;
			yCorners[2] = 8;
			xCorners[3] = 15;
			yCorners[3] = 0;
			xCorners[4] = -8;
			yCorners[4] = -8;
			xCorners[5] = -8;
			yCorners[5] = -2;
			xCorners[6] = -2;
			yCorners[6] = -4;
			myCenterX = 320;
			myCenterY = 240;
			myDirectionX = 0;
			myDirectionY = 0;
			myPointDirection = 0;
		}
		public void setX(int x){myCenterX = x;}
		public int getX(){return (int)myCenterX;}
		public void setY(int y){myCenterY = y;}
		public int getY(){return (int)myCenterY;}
		public void setDirectionX(double x){myDirectionX = x;}
		public double getDirectionX(){return (int)myDirectionX;}
		public void setDirectionY(double y){myDirectionY = y;}
		public double getDirectionY(){return (int)myDirectionY;}
		public void setPointDirection(int degrees){myPointDirection = degrees;}
		public double getPointDirection(){return (int)myPointDirection;}
	}
	class Asteroid extends Floater
	{
		protected int rotation;		
		Asteroid()
		{
			corners = 10;
			xCorners = new int[corners];
			yCorners = new int[corners];
			myColor = color(192,192,192);
			xCorners[0] = (int)((Math.random()*(-4))-18);
			yCorners[0] = (int)((Math.random()*20)+1);
			xCorners[1] = (int)((Math.random()*(-4))-8);
			yCorners[1] = (int)((Math.random()*10)+20);
			xCorners[2] = (int)((Math.random()*8)-4);
			yCorners[2] = (int)(Math.random()*18);
			xCorners[3] = (int)((Math.random()*5)+5);
			yCorners[3] = (int)((Math.random()*5)+15);
			xCorners[4] = (int)((Math.random()*10)+11);
			yCorners[4] = (int)(Math.random()*5);
			xCorners[5] = (int)((Math.random()*10)+15);
			yCorners[5] = (int)((Math.random()*(-5))-1);
			xCorners[6] = (int)((Math.random()*8)+6);
			yCorners[6] = (int)((Math.random()*(-6))-16);
			xCorners[7] = (int)((Math.random()*8)-4);
			yCorners[7] = (int)((Math.random()*(-8))-22);
			xCorners[8] = (int)((Math.random()*(-4))-9);
			yCorners[8] = (int)((Math.random()*(-4))-1);
			xCorners[9] = (int)((Math.random()*(-6))-15);
			yCorners[9] = (int)((Math.random()*(-4))-4);
			myCenterX = (int)(Math.random()*640);
			myCenterY = (int)(Math.random()*480);
			myDirectionX = ((Math.random()*6)-3);
			myDirectionY = ((Math.random()*6)-3);
			myPointDirection = 0;
			rotation = (int)((Math.random()*20)-10);
		}
		public void setX(int x){myCenterX = x;}
		public int getX(){return (int)myCenterX;}
		public void setY(int y){myCenterY = y;}
		public int getY(){return (int)myCenterY;}
		public void setDirectionX(double x){myDirectionX = x;}
		public double getDirectionX(){return (int)myDirectionX;}
		public void setDirectionY(double y){myDirectionY = y;}
		public double getDirectionY(){return (int)myDirectionY;}
		public void setPointDirection(int degrees){myPointDirection = degrees;}
		public double getPointDirection(){return (int)myPointDirection;}
		public void move ()
		{  
			//Moves the floater towards the coordinates
			//myDirectionX and myDirectionY

			//move the floater in the current direction of travel
			myCenterX += myDirectionX;
			myCenterY += myDirectionY;
			if(rotation == 0 && Math.random()>.5)
			{
				rotation = 1;
			}
			if(rotation == 0 && Math.random()<.5)
			{
				rotation = -1;
			}
			rotate(rotation);
			//wrap around screen
			if(myCenterX >width){
				myCenterX = 0;
			}
			else if (myCenterX<0){
				myCenterX = width;
			}
			if(myCenterY >height){
				myCenterY = 0;
			}
			else if (myCenterY < 0){
				myCenterY = height;
			}
		}
		public void show ()
		{  
			//Draws the floater at the current position

			noFill();
			stroke(myColor);
			//convert degrees to radians for sin and cos     
			double dRadians = myPointDirection*(Math.PI/180);

			int xRotatedTranslated, yRotatedTranslated;
			beginShape();

			//rotate and translate the coordinates of the floater using current direction	
			for(int nI = 0; nI < corners; nI++)
			{
				xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
				yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
				vertex(xRotatedTranslated,yRotatedTranslated);
			}
			endShape(CLOSE);
		}
	}
	abstract class Floater
	{
		protected int[] xCorners;
		protected int[] yCorners;
		protected int corners;  //the number of corners, a triangular floater has 3
		protected int myColor;
		protected double myCenterX, myCenterY; //holds center coordinates
		protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
		protected double myPointDirection; //holds current direction the ship is pointing in degrees

		abstract public void setX(int x);
		abstract public int getX();
		abstract public void setY(int y);
		abstract public int getY();
		abstract public void setDirectionX(double x);
		abstract public double getDirectionX();
		abstract public void setDirectionY(double y);
		abstract public double getDirectionY();
		abstract public void setPointDirection(int degrees);
		abstract public double getPointDirection();

		public void accelerate (double dAmount)
		{  
			//Accelerates the floater in the direction it is pointing
			//(myPointDirection)

			//convert the current direction the floater is pointing to radians
			double dRadians =myPointDirection*(Math.PI/180);

			//change coordinates of direction of travel
			myDirectionX += ((dAmount) * Math.cos(dRadians));
			myDirectionY += ((dAmount) * Math.sin(dRadians));    
		}
		void rotate (int nDegreesOfRotation)
		{  
			//rotates the floater by a given number of degrees
			myPointDirection+=nDegreesOfRotation;
		}
		public void move ()
		{  
			//Moves the floater towards the coordinates
			//myDirectionX and myDirectionY

			//move the floater in the current direction of travel
			myCenterX += myDirectionX;
			myCenterY += myDirectionY;

			//wrap around screen
			if(myCenterX >width){
				myCenterX = 0;
			}
			else if (myCenterX<0){
				myCenterX = width;
			}
			if(myCenterY >height){
				myCenterY = 0;
			}
			else if (myCenterY < 0){
				myCenterY = height;
			}
		}
		public void show ()
		{  
			//Draws the floater at the current position

			fill(myColor);
			stroke(myColor);
			//convert degrees to radians for sin and cos     
			double dRadians = myPointDirection*(Math.PI/180);

			int xRotatedTranslated, yRotatedTranslated;
			beginShape();

			//rotate and translate the coordinates of the floater using current direction	
			for(int nI = 0; nI < corners; nI++)
			{
				xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
				yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
				vertex(xRotatedTranslated,yRotatedTranslated);
			}
			endShape(CLOSE);
		}

	}

}