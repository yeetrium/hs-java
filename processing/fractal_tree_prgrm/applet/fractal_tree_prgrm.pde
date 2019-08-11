//Luis Nunez, CP2, mods 4-5, Fractal Tree

float fractionLength = .8;
int smallestBranch = 10;
float branchAngle = .4;

void setup()
{
  size(630,480);
  PFont f = loadFont("KabelITCbyBT-Book-20.vlw");
  textFont(f,20);  
  noLoop();
}
void draw()
{
  background(0);  
  stroke(255,128,90);
  line(320,height,320,height-100);
  drawBranches(320,380,100,3*PI/2);
  fill(255,128,0);
  textMode(SCREEN);
  text("Press '8' or '2' to change:",50,420);
  text("Press '7' or '9' to change:",50,440);
  text("Press '4' or '6' to change:",50,460);
  text("Fraction Length: " + int(fractionLength*100) + "%",380,420);
  text("Smallest Branch: " + smallestBranch,380,440);
  text("Branch Angle: " + int(branchAngle*100) + " degrees",380,460);
}
void drawBranches(int x,int y, float branchLength, float angle)
{
  float angle1 = angle + branchAngle;
  float angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1 = int((branchLength*cos(angle1) + x));
  int endY1 = int((branchLength*sin(angle1) + y));
  int endX2 = int((branchLength*cos(angle2) + x));
  int endY2 = int((branchLength*sin(angle2) + y));
  stroke(0,255,0);
  line(x,y,endX1,endY1); 
  line(x,y,endX2,endY2);
  if(branchLength > smallestBranch)
  {
    drawBranches(endX1,endY1,branchLength,angle1);
    drawBranches(endX2,endY2,branchLength,angle2);
  }  
}

void keyTyped()
{
  if(key == '4')
  {
    branchAngle += .01;
  }
  if(key == '6')
  {
    branchAngle -= .01;
  }
  if(key == '8')
  {
    fractionLength += .01;
  }
  if(key == '2')
  {
    fractionLength -= .01;
  }
  if(fractionLength <= 0)
  {
    fractionLength = 0;
  }
  else if(fractionLength >= .84)
  {
    fractionLength = .84;
  }
  if(key == '7')
  {
    smallestBranch+=2;
  }
  if(key == '9')
  {
    smallestBranch-=2;
  }
  if(smallestBranch <= 8)
  {
    smallestBranch = 8;
  }
  else if(smallestBranch >= 80)
  {
    smallestBranch = 80;
  }  
  redraw();
}  
