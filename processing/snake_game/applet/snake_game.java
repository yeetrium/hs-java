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

public class snake_game extends PApplet {

//Luis Nunez, CP2, mods 4-5, Snake Game

Snake theSnake;
int addSegments;
boolean gameOver;

public void setup()
{
  size(640,480);
  PFont f = loadFont("Impact-20.vlw");
  textFont(f,20);
  frameRate(10);
  theSnake = new Snake(10,RIGHT,320,240,color(0,128,0));
  addSegments = 0;
  gameOver = false;
}

public void draw()
{ 
  background(0);
  addSegments++;
  if(addSegments % 20 == 0 && theSnake.currentLength < theSnake.maxLength)
  {
    theSnake.currentLength++;
  } 

  if(!gameOver)
  {
    theSnake.move();
    theSnake.show();
  }
  else
  {
    fill(80,0,255);
    textMode(SCREEN);
    text("GAME OVER",280,240);
    noLoop();
  }
  if(theSnake.currentLength == theSnake.maxLength)
  {
    fill(0,255,0);
    textMode(SCREEN);
    text("You Win!!!",270,240);
    noLoop();
  }
  fill(255);
  textMode(SCREEN);
  text("Sement Count: " + theSnake.currentLength,492,478);  
}

public void keyPressed()
{
  if(keyCode != UP && keyCode != DOWN && keyCode != RIGHT && keyCode != LEFT)
  {
    return;
  }
  else
  {  
    theSnake.theDirection = keyCode;
  }
}

class Segment
{
  int x,y,howLong; 
  int whatColor;
  Segment(int someX, int someY, int someColor)
  {
    x = someX;
    y = someY;
    howLong = 20;
    whatColor = someColor;
  }
  public void show()
  {
    stroke(0);
    fill(whatColor);
    rect(x,y,howLong,howLong);
  }  
}

class Snake
{
  Segment [] segments;
  int theDirection, currentLength, maxLength;
  int snakeColor;
  Snake(int someLength, int someDirection, int headX, int headY, int someColor)
  {
    theDirection = someDirection;
    currentLength = someLength;
    maxLength = 100;
    snakeColor = someColor;
    segments = new Segment[maxLength];
    segments[0] = new Segment(headX,headY,color(255,128,0));
    for (int i = 1; i < maxLength; i++)
    {
      segments[i] = new Segment(headX,headY,someColor);  
    }
  }
  public void move()
  {
    for(int i = currentLength - 1; i > 0; i--)
    {
      segments[i].x = segments[i-1].x;
      segments[i].y = segments[i-1].y;
    }

    if(theDirection == UP)
    {
      segments[0].y -= segments[0].howLong;
    }
    else if(theDirection == DOWN)
    {
      segments[0].y += segments[0].howLong;
    }
    else if(theDirection == LEFT)
    {
      segments[0].x -= segments[0].howLong;
    }
    else if(theDirection == RIGHT)
    {
      segments[0].x += segments[0].howLong;
    }
    if(segments[0].x >= width)
    {
      segments[0].x = 0;
    }
    else if(segments[0].x < 0)
    {
      segments[0].x = width - segments[0].howLong;
    }
    if(segments[0].y >= height)
    { 
      segments[0].y = 0;
    } 
    else if(segments[0].y < 0)
    {
      segments[0].y = height - segments[0].howLong;
    }      
  }
  public void show()
  { 
    for(int i = 0; i < currentLength;i++)
    { 
      segments[i].show();
    } 
    if(get(segments[0].x + 1, segments[0].y + 1) != color(255,128,0))
    {
      gameOver = true;  
      segments[0].show();
    }   
  }  
}  







  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ece9d8", "snake_game" });
  }
}
