//Luis Nunez, mods 4-5, Spray Paint

import interfascia.*;
GUIController c;
IFButton b1, b2, b3, b4, b5, b6, b7, b8, b9,
b10, b11, b12, bRed, bGreen, bBlue, bYellow, 
bCyan, bBlack, bMirror, erase;
int spraySize = 20;
int strength = 100;
int dotSize = 2;

boolean mirrors = true;

int redAmt = 0;
int greenAmt = 0;
int blueAmt = 0;

void setup()
{
  size(640,480);
  background(255);
  noStroke();

  c = new GUIController (this);

  IFLookAndFeel newLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  
  newLook.baseColor      = color(0);
  newLook.highlightColor = color(255);
  newLook.activeColor    = color(255,255,0);
  newLook.borderColor    = color(0,255,0);
  newLook.textColor      = color(0,255,0);
  c.setLookAndFeel(newLook);

  b1      = new IFButton ("Red",       1, 463, 40, 17);
  b2      = new IFButton ("Green",    40, 463, 40, 17);
  b3      = new IFButton ("Blue",     80, 463, 40, 17);
  b4      = new IFButton ("Yellow",  120, 463, 40, 17);
  b5      = new IFButton ("Cyan",    160, 463, 40, 17);
  b6      = new IFButton ("Black",   200, 463, 40, 17);
  b7      = new IFButton ("White",   240, 463, 40, 17);
  b8      = new IFButton ("Size 80", 280, 463, 40, 17);
  b9      = new IFButton ("Size 20", 320, 463, 40, 17);
  b10     = new IFButton ("Size 5",  360, 463, 40, 17);
  b11     = new IFButton ("Dots 20", 400, 463, 50, 17);
  b12     = new IFButton ("Dots 2",  450, 463, 50, 17);
  bRed    = new IFButton ("Red BG",   75,  1, 70, 17);
  bGreen  = new IFButton ("Green BG",155,  1, 70, 17);
  bBlue  = new IFButton  ("Blue BG", 235,  1, 70, 17);
  bYellow  = new IFButton("Yellow BG",315,  1, 70, 17);
  bCyan  = new IFButton  ("Cyan BG",  395,  1, 70, 17);
  bBlack  = new IFButton ("Black BG",  475,  1, 70, 17);
  bMirror = new IFButton ("Mirrors On",500, 463, 75, 17);
  erase   = new IFButton ("Erase",   600, 463, 40, 17);
    
  b1.addActionListener(this);
  b2.addActionListener(this);
  b3.addActionListener(this);
  b4.addActionListener(this);
  b5.addActionListener(this);
  b6.addActionListener(this);
  b7.addActionListener(this);
  b8.addActionListener(this);
  b9.addActionListener(this);
  b10.addActionListener(this);
  b11.addActionListener(this);
  b12.addActionListener(this);
  bRed.addActionListener(this);
  bGreen.addActionListener(this);
  bBlue.addActionListener(this);
  bYellow.addActionListener(this);
  bCyan.addActionListener(this);
  bBlack.addActionListener(this);
  bMirror.addActionListener(this);
  erase.addActionListener(this);
  
  c.add (b1);
  c.add (b2);
  c.add (b3);
  c.add (b4);
  c.add (b5);
  c.add (b6);
  c.add (b7);
  c.add (b8);
  c.add (b9);
  c.add (b10);
  c.add (b11);
  c.add (b12);
  c.add (bRed);
  c.add (bGreen);
  c.add (bBlue);
  c.add (bYellow);
  c.add (bCyan);
  c.add (bBlack);
  c.add (bMirror);
  c.add (erase);    
}

void draw()
{
  fill(redAmt,greenAmt,blueAmt);

  if(mousePressed == true && mouseY < 463 && mouseY > 18)
  {
    if(mouseButton == LEFT)
    {
      for(int i = 0; i < strength; i++)
      {
        float theta = random(0,2*PI);  //random angle in radians
        int radius = int(random(0,spraySize));
        int x = mouseX + int(cos(theta)*radius);
        int y = mouseY + int(sin(theta)*radius);
        ellipse(x,y,dotSize,dotSize);
        if(mirrors)
        {
        ellipse(width - x,height - y,dotSize,dotSize);
        ellipse(x,height - y,dotSize,dotSize);
        ellipse(width - x,y,dotSize,dotSize);
        }
      }
    }
    else if(mouseButton == RIGHT)
    {
      fill(255);
      ellipse(mouseX,mouseY,20,20);
    }  
  }

}

void actionPerformed (GUIEvent e)
{
  if(e.getSource() == b1)
  {
    redAmt = 255;
    greenAmt = 0;
    blueAmt = 0;
  } 
  if(e.getSource() == b2)
  {
    redAmt = 0;
    greenAmt = 255;
    blueAmt = 0;
  } 
  if(e.getSource() == b3)
  {
    redAmt = 0;
    greenAmt = 0;
    blueAmt = 255;
  }
  if(e.getSource() == b4)
  {
    redAmt = 255;
    greenAmt = 255;
    blueAmt = 0;
  }
  if(e.getSource() == b5)
  {
    redAmt = 0;
    greenAmt = 255;
    blueAmt = 255;
  }
  if(e.getSource() == b6)
  {
    redAmt = 0;
    greenAmt = 0;
    blueAmt = 0;
  }
  if(e.getSource() == b7)
  {
    redAmt = 255;
    greenAmt = 255;
    blueAmt = 255;
  }
  if(e.getSource() == b8)
  {
    spraySize = 80;
    strength = 200;
    dotSize = 2;
  }
  if(e.getSource() == b9)
  {
    spraySize = 20;
    strength = 100;
    dotSize = 2;
  }
  if(e.getSource() == b10)
  {
    spraySize = 5;
    strength = 10;
    dotSize = 2;
  }
  if(e.getSource() == b11)
  {
    dotSize = 20;
  }
  if(e.getSource() == b12)
  {
    dotSize = 2;
  }
  if(e.getSource() == bRed)
  {
    background(255,0,0);
  }
  if(e.getSource() == bGreen)
  {
    background(0,255,0);
  }
  if(e.getSource() == bBlue)
  {
    background(0,0,255);
  }
  if(e.getSource() == bYellow)
  {
    background(255,255,0);
  }
  if(e.getSource() == bCyan)
  {
    background(0,255,255);
  }
  if(e.getSource() == bBlack)
  {
    background(0);
  }
  if(e.getSource() == bMirror)
  {
    mirrors = !mirrors;
    if(mirrors)
    {
      bMirror.setLabel("Mirrors On");
    }
    else
    {
      bMirror.setLabel("Mirrors Off");
    }  
  }
  if(e.getSource() == erase)
  {
    spraySize = 20;
    strength = 100;
    dotSize = 2;
    background(255);
  }  
}  

