//Luis Nunez, CP2 mods 4-5, Color Mixer

import interfascia.*;
GUIController c;
IFButton b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12;
int rectSize    = -128;
int rectSizeII  = -128;
int rectSizeIII = -128;
int delta = 16;
int opacity = 255;

void setup() 
{
  size(410, 410);
  smooth();

  PFont f = loadFont("ComicSansMS-Bold-12.vlw");
  textFont(f, 12);
  textMode(SCREEN);

  c = new GUIController (this); 
  b1 = new IFButton ("More Red",          20, 305, 70, 17);
  b2 = new IFButton ("Less Red",          20, 330, 70, 17);
  b3 = new IFButton ("More Green",       100, 305, 70, 17);
  b4 = new IFButton ("Less Green",       100, 330, 70, 17);
  b5 = new IFButton ("More Blue",        180, 305, 70, 17);
  b6 = new IFButton ("Less Blue",        180, 330, 70, 17);
  b7 = new IFButton ("Delta x 2",         20, 380, 70, 17);
  b8 = new IFButton ("Delta / 2",        100, 380, 70, 17);
  b9 = new IFButton ("~! ! ! R  E  S  E  T ! ! !~", 180, 380,138, 17);
  b10 = new IFButton ("+Opacity+",       258, 305, 60, 17);
  b11 = new IFButton ("-Opacity-",       258, 330, 60, 17);
  b12 = new IFButton 
    ("********************************************************RANDOMCOLOR  **************************************************", 
  258,  45, 60,255);

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

  IFLookAndFeel newLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  
  newLook.baseColor      = color(50,0,0);
  newLook.highlightColor = color(128,128,0);
  newLook.activeColor    = color(255,255,0);
  newLook.borderColor    = color(255,0,0);
  newLook.textColor      = color(255,0,0);
  b1.setLookAndFeel(newLook);
  b2.setLookAndFeel(newLook);

  IFLookAndFeel newLookII = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  newLookII.baseColor      = color(0,50,0);
  newLookII.highlightColor = color(0,128,128);
  newLookII.activeColor    = color(0,255,255);
  newLookII.borderColor    = color(0,255,0);
  newLookII.textColor      = color(0,255,0);
  b3.setLookAndFeel(newLookII);
  b4.setLookAndFeel(newLookII);

  IFLookAndFeel newLookIII = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  newLookIII.baseColor      = color(0,0,50);
  newLookIII.highlightColor = color(128,0,128);
  newLookIII.activeColor    = color(255,0,255);
  newLookIII.borderColor    = color(0,0,255);
  newLookIII.textColor      = color(0,0,255);
  b5.setLookAndFeel(newLookIII);
  b6.setLookAndFeel(newLookIII);

  IFLookAndFeel newLookIV = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  newLookIV.baseColor      = color(100);
  newLookIV.highlightColor = color(50);
  newLookIV.activeColor    = color(0);
  newLookIV.textColor      = color(255,128,32);
  b7.setLookAndFeel(newLookIV);
  b8.setLookAndFeel(newLookIV);

  IFLookAndFeel newLookV = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  newLookV.baseColor      = color(255,255,0);
  newLookV.highlightColor = color(240,128,32);
  newLookV.activeColor    = color(255,0,0);
  b9.setLookAndFeel(newLookV);

  IFLookAndFeel newLookVI = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  
  newLookVI.baseColor      = color(255);
  newLookVI.highlightColor = color(50);
  newLookVI.activeColor    = color(0);
  newLookVI.borderColor    = color(0,150,150);
  newLookVI.textColor      = color(0,150,150);
  b10.setLookAndFeel(newLookVI);
  b11.setLookAndFeel(newLookVI);

  IFLookAndFeel newLookVII = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  
  newLookVII.baseColor      = color(255,128,0);
  newLookVII.highlightColor = color(63,54,191);
  newLookVII.activeColor    = color(0);
  newLookVII.borderColor    = color(255,255,0);
  newLookVII.textColor      = color(100,255,128);
  b12.setLookAndFeel(newLookVII);
}

void draw() 
{
  background(0);

  stroke(255,0,0);
  fill(rectSize * -1,0,0);
  rect(20,300,70,rectSize);

  stroke(0,255,0);
  fill(0,rectSizeII * -1,0);
  rect(100,300,70,rectSizeII);

  stroke(0,0,255);
  fill(0,0,rectSizeIII * -1);
  rect(180,300,70,rectSizeIII);

  stroke(255);
  fill(rectSize * -1,rectSizeII * -1,rectSizeIII * -1,opacity);   
  for(int y = 30;y <= 380;y += 10)
  {
    for(int x = 330;x <= 390;x += 10)
    {
      ellipse(x,y,10,10);
    }
  }  

  fill(255);
  text("Delta = " + delta,65,370);
  text("Opacity = " + opacity,240,370);
  text("Red = " + (rectSize * -1), 25, 42);
  text("Green = " + (rectSizeII * -1), 102, 42);
  text("Blue = " + (rectSizeIII * -1), 185, 42);
}

void actionPerformed (GUIEvent e) 
{
  if (e.getSource() == b1) 
  {
    rectSize = rectSize - delta;
  } 
  else if (e.getSource() == b2) 
  {
    rectSize = rectSize + delta;
  }
  else if (e.getSource() == b3) 
  {
    rectSizeII = rectSizeII - delta;
  }
  else if (e.getSource() == b4) 
  {
    rectSizeII = rectSizeII + delta;
  }
  else if (e.getSource() == b5) 
  {
    rectSizeIII = rectSizeIII - delta;
  }
  else if (e.getSource() == b6) 
  {
    rectSizeIII = rectSizeIII + delta;
  } 

  if (rectSize <= -255) 
  {
    rectSize = -255;
  }
  if (rectSizeII <= -255) 
  {
    rectSizeII = -255;
  }
  if (rectSizeIII <= -255) 
  {
    rectSizeIII = -255;
  }

  if (rectSize >= 0) 
  {
    rectSize = 0;
  }
  if (rectSizeII >= 0) 
  {
    rectSizeII = 0;
  }
  if (rectSizeIII >= 0) 
  {
    rectSizeIII = 0;
  }

  if (e.getSource() == b7) 
  {
    delta *= 2;
  }
  else if (e.getSource() == b8) 
  {
    delta /= 2;
  }

  if (delta >= 128) 
  {
    delta = 128;
  }
  else if (delta <= 1) 
  {
    delta = 1;
  }

  if (e.getSource() == b10)
  {
    opacity += delta;
  }

  else if (e.getSource() == b11)
  {
    opacity -= delta;
  }

  if (opacity >= 255) 
  {
    opacity = 255;
  }
  else if (opacity <= 0) 
  {
    opacity = 0;
  }

  if(e.getSource() == b9) 
  {
    rectSize = -128;
    rectSizeII = -128;
    rectSizeIII = -128;
    delta = 16;
    opacity = 255;
  } 

  if(e.getSource() == b12) 
  {
    rectSize = int(random(-256,1));
    rectSizeII = int(random(-256,1));
    rectSizeIII = int(random(-256,1));
  }  
}
