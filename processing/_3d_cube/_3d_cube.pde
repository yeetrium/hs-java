float rotAmountX = -.3;
float rotAmountY = -.3;


void setup()
{
  size(300,300,P3D);
  smooth();
}

void draw()
{
  background(0);
  translate(150,150,-250);
  rotateX(rotAmountX);
  rotateY(rotAmountY);  
  box(100);
}  

void keyTyped()
{
  if(key == 'w')
  {
  rotAmountX = rotAmountX + .05;
  }
  if(key == 's')
  {
  rotAmountX = rotAmountX - .05;
  }
  if(key == 'd')
  {
   rotAmountY = rotAmountY + .05; 
  }
  if(key == 'a')
  {
   rotAmountY = rotAmountY - .05; 
  }  
}
