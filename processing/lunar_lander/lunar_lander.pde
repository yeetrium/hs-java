Lander theShip = new Lander();

void setup()
{
  size(640,480);
  smooth();
  PFont f = loadFont("KabelITCbyBT-Book-20.vlw");
  textFont(f,20);
  background(0);
}

void draw()
{
  background(0);
  textMode(SCREEN);
  text("Your Direction: " + theShip.myPointDirection,455,25);
  terrain();
  theShip.draw();
  if(theShip.landed == false)
  {
    theShip.move();
  }
  else
  {
    return;
  }  
}

void terrain()
{
  fill(255);
  quad(0, (height/2)+200, 0, height, width, height, width/2, (height/2)+200);
}  

void keyPressed()
{
  if(key == 'a')
  {
    theShip.rotate(-10);
  }
  else if(key == 'd')
  {
    theShip.rotate(10);
  }
  if(key == 'w')
  {
    theShip.accelerate(.05);
    theShip.drawRockets();
  }
}

/*
void keyTyped()
 {
 if(key == 'w')
 {
 theShip.accelerate(.05);
 theShip.drawRockets();
 }
 }
 */

class Lander extends Floater
{
  public Lander()
  {
    numCorners = 3;
    xCorners = new int[numCorners];
    yCorners = new int[numCorners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 0;
    yCorners[1] = 25;
    xCorners[2] = 8;
    yCorners[2] = -8;
    myColor = color(0,255,0);
    myCenterX = 320;
    myCenterY = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 270;
    crashed = false;
    landed = false;
  }  

  void draw()
  {
    super.checkForCrashLanding();
    if (crashed == true)
    {
      fill(255,0,0);
      ellipse(myCenterX,myCenterY,50,50);
      fill(255,255,0);
      ellipse(myCenterX,myCenterY,35,35);
      noLoop();
    }

    else if (landed == true)
    {
      text("You landed successfully!8)",100,200);
      println("You landed successfully!");
      super.draw();
    }  
    else
    {
      super.draw();
    }
  }
}  

class Floater
{     
  int[] xCorners;
  int[] yCorners;
  int numCorners;  //the number of corners, a triangular floater has 3
  color myColor;
  float myCenterX, myCenterY; //holds center coordinates
  float myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  float myPointDirection; //holds current direction the ship is pointing in degrees
  boolean crashed, landed;
  public void accelerate (float amount)
  {  
    //Accelerates the floater in the direction it is pointing
    //(myPointDirection)

    //change coordinates of direction of travel
    myDirectionX += ((amount) * cos(radians(myPointDirection)));
    myDirectionY += ((amount) * sin(radians(myPointDirection)));
  }
  void rotate (int degreesOfRotation)
  {  
    //rotates the floater by a given number of degrees
    myPointDirection+=degreesOfRotation;
  }
  public void move ()
  {
    //add the effect of gravity in the y direction
    myDirectionY += .003;
    

    //Now move the floater towards the coordinates
    //myDirectionX and myDirectionY

    //move the floater in the current direction of travel
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
  public void draw ()
  {  
    //Draws the floater at the current position
    noStroke();
    fill(myColor);

    //Declare new array to hold positions of rotated coordinates	
    int[] xCorRotated = new int[numCorners];
    int[] yCorRotated = new int[numCorners];  
    beginShape();
    //rotate and translate the coordinates of the floater using current direction	
    for(int nI = 0; nI < numCorners; nI++)
    {
      xCorRotated[nI] = (int)((xCorners[nI]* cos(radians(myPointDirection-90))) - (yCorners[nI] * sin(radians(myPointDirection-90)))+myCenterX);
      yCorRotated[nI] = (int)((xCorners[nI]* sin(radians(myPointDirection-90))) + (yCorners[nI] * cos(radians(myPointDirection-90)))+myCenterY); 
      vertex(xCorRotated[nI],yCorRotated[nI]);
    }
    endShape();
  }
  void checkForCrashLanding()
  {
    //change these two numbers to change which of the corners are "the bottom" of the lander
    int bottomRightCorner = 2;
    int bottomLeftCorner = 0;

    //rotate and translate the two bottom corners
    int xBottomRight = (int)((xCorners[bottomRightCorner]* cos(radians(myPointDirection-90))) - (yCorners[bottomRightCorner] * sin(radians(myPointDirection-90)))+myCenterX);
    int yBottomRight = (int)((xCorners[bottomRightCorner]* sin(radians(myPointDirection-90))) + (yCorners[bottomRightCorner] * cos(radians(myPointDirection-90)))+myCenterY);
    int xBottomLeft = (int)((xCorners[bottomLeftCorner]* cos(radians(myPointDirection-90))) - (yCorners[bottomLeftCorner] * sin(radians(myPointDirection-90)))+myCenterX);
    int yBottomLeft = (int)((xCorners[bottomLeftCorner]* sin(radians(myPointDirection-90))) + (yCorners[bottomLeftCorner] * cos(radians(myPointDirection-90)))+myCenterY);

    if(landed)
    { 
      //return means go back
      return;
    } 

    //calculate if our speed is too fast to land
    boolean tooFast = abs(myDirectionX) > .3 || abs(myDirectionY) > .3;


    if(!tooFast && myPointDirection == 270 && get(xBottomRight,yBottomRight) != color(0) && get(xBottomLeft,yBottomLeft) != color(0))
    {
      landed = true;
    }
    else if(get(xBottomRight,yBottomRight) != color(0) || get(xBottomLeft,yBottomLeft) != color(0))
    {
      crashed = true;
      text("KABOOM! Try Again!",100,200);
      //landed = true;
    }
  }
  void drawRockets()
  {
    //change these two numbers to change which of the corners are "the bottom" of the lander
    int bottomRightCorner = 2;
    int bottomLeftCorner = 0;

    //rotate and translate the two bottom corners
    int xBottomRight = (int)((xCorners[bottomRightCorner]* cos(radians(myPointDirection-90))) - (yCorners[bottomRightCorner] * sin(radians(myPointDirection-90)))+myCenterX);
    int yBottomRight = (int)((xCorners[bottomRightCorner]* sin(radians(myPointDirection-90))) + (yCorners[bottomRightCorner] * cos(radians(myPointDirection-90)))+myCenterY);
    int xBottomLeft = (int)((xCorners[bottomLeftCorner]* cos(radians(myPointDirection-90))) - (yCorners[bottomLeftCorner] * sin(radians(myPointDirection-90)))+myCenterX);
    int yBottomLeft = (int)((xCorners[bottomLeftCorner]* sin(radians(myPointDirection-90))) + (yCorners[bottomLeftCorner] * cos(radians(myPointDirection-90)))+myCenterY);

    //draw two circles at the bottom two corners for rockets
    fill(255,0,0);
    ellipse(xBottomRight,yBottomRight,5,15);
    ellipse(xBottomLeft,yBottomLeft,5,15);
    fill(255,255,0);
    ellipse(xBottomRight,yBottomRight-2,2,5);
    ellipse(xBottomLeft,yBottomLeft-2,2,5);
  }
}

