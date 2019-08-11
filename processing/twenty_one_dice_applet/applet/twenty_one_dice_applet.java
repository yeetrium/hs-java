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

public class twenty_one_dice_applet extends PApplet {

//Luis Nunez, CP2, mods 4-5, 176 Dice Applet

Die one;

public void setup()
{
  size(640,480);
  background(255);
  PFont f = loadFont("GoudyHandtooledBT-Regular-30.vlw");
  textFont(f,30);
  textMode(SCREEN);
  noLoop(); 
}

public void draw()
{      
  int total;
  total = 0;
  for(int row = 0; row < 11; row++)
  {
    for(int col = 0; col < 16; col++)
    {
      Die one = new Die();
      one.roll();
      one.show(col * 40 + 5,row * 40 + 5);
      total += one.num;
    }
  }  
  fill(0);
  textAlign(CENTER);
  text("Your total roll is " + total,320,465);    
} 

public void mouseClicked()
{
  background(255);
  redraw();  
}

class Die
{
  int num,dRed,dGreen,dBlue,eRed,eGreen,eBlue;

  public void roll()
  {
    num = PApplet.parseInt(random(1,7));

    dRed = PApplet.parseInt(random(25,127));
    dGreen = PApplet.parseInt(random(25,127));
    dBlue = PApplet.parseInt(random(25,127));
    eRed = PApplet.parseInt(random(127,256));
    eGreen = PApplet.parseInt(random(127,256));
    eBlue = PApplet.parseInt(random(127,256));
  }

  public void show(int x,int y)
  {
    noStroke();
    fill(dRed,dGreen,dBlue);
    rect(x,y,30,30);    

    if(num == 1)
    {
      smooth();
      noStroke();      
      fill(eRed,eGreen,eBlue);
      ellipse(x+15,y+15,5,5);           
    }
    if(num == 2)
    {
      smooth();
      noStroke();      
      fill(eRed,eGreen,eBlue);
      ellipse(x+5,y+5,5,5);
      ellipse(x+25,y+25,5,5); 
    }
    if(num == 3)
    {
      smooth();
      noStroke();      
      fill(eRed,eGreen,eBlue);
      ellipse(x+5,y+5,5,5);
      ellipse(x+15,y+15,5,5);      
      ellipse(x+25,y+25,5,5);
    }
    if(num == 4)
    {
      smooth();
      noStroke();      
      fill(eRed,eGreen,eBlue);
      ellipse(x+5,y+5,5,5);
      ellipse(x+25,y+5,5,5);
      ellipse(x+5,y+25,5,5);
      ellipse(x+25,y+25,5,5); 
    }
    if(num == 5)
    {
      smooth();
      noStroke();      
      fill(eRed,eGreen,eBlue);
      ellipse(x+5,y+5,5,5);
      ellipse(x+25,y+5,5,5);
      ellipse(x+15,y+15,5,5);
      ellipse(x+5,y+25,5,5);
      ellipse(x+25,y+25,5,5); 
    }
    if(num == 6)
    {
      smooth();
      noStroke();      
      fill(eRed,eGreen,eBlue);
      ellipse(x+5,y+5,5,5);
      ellipse(x+25,y+5,5,5);
      ellipse(x+5,y+15,5,5);
      ellipse(x+25,y+15,5,5);
      ellipse(x+5,y+25,5,5);
      ellipse(x+25,y+25,5,5); 
    }
  } 
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ece9d8", "twenty_one_dice_applet" });
  }
}
