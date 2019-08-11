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

public class snow_flake_catcher extends PApplet {

//Luis Nunez, CP2, mods 4-5, Snow Flake Catcher

SnowFlake [] snowFlakes;
int speed;

public void setup()
{
  size(300,300); 
  background(0);
  noStroke();
  speed = 2;
  snowFlakes = new SnowFlake[500];
  for(int i = 0; i < snowFlakes.length;i++)
  {
    snowFlakes[i] = new SnowFlake();
  }
}

public void draw()
{ 
  for(int i  = 0; i < snowFlakes.length;i++)
  {  
    snowFlakes[i].move();
    snowFlakes[i].draw();
    if(snowFlakes[i].y > height)
    {
      snowFlakes[i] = new SnowFlake();
    }
  }
}

public void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    fill(0,255,0);
    ellipse(mouseX,mouseY,5,5);
  }    
  else
  {
    fill(0);
    ellipse(mouseX,mouseY,10,10);
  } 
}  

public void keyPressed()
{
  if(key == 'v')
  {
    speed = 100;
  }
  if(key == 'b')
  {
    speed = 10;
  }
  if(key == 'n')
  {
    speed = 2;
  }  
  if(key == 'e')
  {
    background(0);
  }
}  

class SnowFlake
{
  int x, y;
  boolean isMoving;
  SnowFlake()
  {
    x = PApplet.parseInt(random(width));
    y = PApplet.parseInt(random(-height-601,-2));
    isMoving = true;
  }

  public void move()
  {
    fill(0);
    ellipse(x,y,3,3);
    if(isMoving)
    {
      y += speed;
    }
  }

  public void draw()
  {
    if(y >= -2 && y < height-2 && (get(x,y + 2) != color(0)))
    {
      isMoving = false;
      fill(255);
      ellipse(x,y,3,3);
    }
    else
    {
      isMoving = true;
      fill(255);
      ellipse(x,y,3,3);
    } 
  }  
}  

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ece9d8", "snow_flake_catcher" });
  }
}
