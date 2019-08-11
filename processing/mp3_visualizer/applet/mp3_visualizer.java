import processing.core.*; 
import processing.xml.*; 

import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import interfascia.*; 

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

public class mp3_visualizer extends PApplet {







Minim minim;
AudioPlayer song;
GUIController c;
IFButton b1, b2, b3, b4;
int redColor    = 100;
int greenColor  = 255;
int blueColor = 255;

public void setup()
{
  size(640,300);
  noStroke();
  smooth();

  c = new GUIController (this);

  IFLookAndFeel newLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  
  newLook.baseColor      = color(0,50,0);
  newLook.highlightColor = color(128,128,0);
  newLook.activeColor    = color(255,255,0);
  newLook.borderColor    = color(0,255,0);
  newLook.textColor      = color(0,255,0);
  c.setLookAndFeel(newLook);

  b1 = new IFButton ("Play",     5, 283, 70, 17);
  b2 = new IFButton ("Pause",   80, 283, 70, 17);
  b3 = new IFButton ("Rewind", 155, 283, 70, 17);
  b4 = new IFButton ("Color",  230, 283, 70, 17);

  b1.addActionListener(this);
  b2.addActionListener(this);
  b3.addActionListener(this);
  b4.addActionListener(this);

  c.add (b1);
  c.add (b2);
  c.add (b3);
  c.add (b4);

  minim = new Minim(this);

  song = minim.loadFile("easyJam.MP3");
}

public void draw()
{  
  background(0);

  //red lines
  stroke(255,0,0);
  line(0,100,640,100);
  line(0,200,640,200);

  //top circle
  float biggest = 0;
  for(int i = 0; i < song.bufferSize(); i++)
  {
    if(song.left.get(i) > biggest)
    {
      biggest = song.left.get(i);
    }
  }
  int diameter = PApplet.parseInt(200 * biggest);
  stroke(150,greenColor,blueColor,100);
  fill(150,greenColor,blueColor,100);
  ellipse(320,100,diameter,diameter);

  //bottom circle
  float biggestAmp = 0;
  for(int j = 0; j < song.bufferSize(); j++)
  {
    if(song.right.get(j) > biggestAmp)
    {
      biggestAmp = song.right.get(j);
    }
  }
  int diameterII = PApplet.parseInt(200 * biggestAmp);
  stroke(redColor,150,blueColor,100);
  fill(redColor,150,blueColor,100);
  ellipse(320,200,diameterII,diameterII);

  //top bars
  for(int k = 0; k < song.bufferSize(); k+=20)
  {
    float amplitude = song.left.get(k);
    int height = PApplet.parseInt(-200 * abs(amplitude));
    fill(200,greenColor,100);
    stroke(200,greenColor,100);
    rect(k,100,10, height);
  }

  //bottom bars
  for(int m = 0; m < song.bufferSize(); m+=20)
  {
    float amplitude = song.right.get(m);
    int height = PApplet.parseInt(200 * abs(amplitude));
    fill(100,200,blueColor);
    stroke(100,200,blueColor);
    rect(m,200,10, height);
  }

  //top squares and lines
  for(int q = 0; q < song.bufferSize(); q+=20)
  {
    float amplitude = song.left.get(q);
    int height = PApplet.parseInt(-200 * abs(amplitude));
    fill(150,greenColor,blueColor);
    stroke(150,greenColor,blueColor);
    rect(q, height + 80, 10, 10);
    line(abs(height), 100, abs(height), 200);
  }

  //bottom squares and lines
  for(int p = 0; p < song.bufferSize(); p+=20)
  {
    float amplitude = song.right.get(p);
    int height = PApplet.parseInt(200 * abs(amplitude));
    fill(redColor,150,blueColor);
    stroke(redColor,150,blueColor);
    rect(p, height + 210, 10, 10);
    line(640-height, 100, 640-height, 200);
  }
}

public void actionPerformed (GUIEvent e) 
{
  if (e.getSource() == b1) 
  {
    song.play();
    background(255);
  }
  if (e.getSource() == b2) 
  {
    song.pause();
    background(255);
  }
  if (e.getSource() == b3) 
  {
    song.rewind();
    background(255);
  }
  if (e.getSource() == b4) 
  {
    redColor   = PApplet.parseInt(random(30,256));
    greenColor = PApplet.parseInt(random(30,256));
    blueColor  = PApplet.parseInt(random(30,256));
  }
}

public void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ece9d8", "mp3_visualizer" });
  }
}
