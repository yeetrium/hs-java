//Luis Nunez, CP2, mods 4-5, Circular Motion

Planet [] planets;
int eyeX, eyeY, eyeZ;

void setup()
{
  size(640,480,P3D); 
  eyeX = 0;
  eyeY = -240;
  eyeZ = 1;
  noStroke(); 
  planets = new Planet [9];
  for(int i = 0; i < planets.length;i++)
  {
    planets[i] = new Planet();
  } 
}

void draw()
{ 
  camera(eyeX, eyeY, eyeZ, 0, 0, 0, 0, 1, 0);
  pointLight(255, 255, 255, eyeX, eyeY, eyeZ);
  lights();
  background(0);  
  for(int i  = 0; i < planets.length;i++)
  {  
    planets[i].move();
    planets[i].show();
  }
  fill(255,100,0);
  sphere(40);
}

void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    eyeX = mouseX;
    eyeY = mouseY;
  }
  if(mouseButton == RIGHT)
  {
    eyeZ = mouseX;
    eyeY = mouseY;
  }
}  

class Planet
{
  int cSize, radius, amtRed, amtGreen, amtBlue;
  float theta, speed;
  Planet()
  {
    amtRed = int(random(256));
    amtGreen = int(random(129));
    amtBlue = int(random(256));
    theta = random(0,2*PI);
    radius = int(random(50,120));
    cSize = int(random(3,9));
    speed = random(0,.05);
  }
  void move()
  {
    theta += speed;
  }
  void show()
  {
    fill(amtRed,amtGreen,amtBlue);
    int x = int(radius * cos(theta));
    int z = int(radius * sin(theta));
    translate(x, 0, -z);
    sphere(cSize);
    translate(-x, 0, z);
  }  
}  






