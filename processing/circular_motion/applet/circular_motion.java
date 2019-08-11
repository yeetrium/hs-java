import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class circular_motion extends PApplet {

//Luis Nunez, CP2, mods 4-5, Circular Motion

Planet [] planets;
int eyeX, eyeY, eyeZ;

public void setup()
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

public void draw()
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

public void mouseDragged()
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
    amtRed = PApplet.parseInt(random(256));
    amtGreen = PApplet.parseInt(random(129));
    amtBlue = PApplet.parseInt(random(256));
    theta = random(0,2*PI);
    radius = PApplet.parseInt(random(50,120));
    cSize = PApplet.parseInt(random(3,9));
    speed = random(0,.05f);
  }
  public void move()
  {
    theta += speed;
  }
  public void show()
  {
    fill(amtRed,amtGreen,amtBlue);
    int x = PApplet.parseInt(radius * cos(theta));
    int z = PApplet.parseInt(radius * sin(theta));
    translate(x, 0, -z);
    sphere(cSize);
    translate(-x, 0, z);
  }  
}  







  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ece9d8", "circular_motion" });
  }
}
