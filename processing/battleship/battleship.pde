//Luis Nunez, CP2 mods 4-5, Battleship

import interfascia.*;
GUIController control;
IFButton [][] buttons;
IFButton reset;
IFLookAndFeel seaLook, hit, miss;
PImage bg, bgTwo;

int rows = 7;
int cols = 7;
int buttonSize = 30;
int run = int(random(1,3));
int a   = int(random(0,4));
int b   = int(random(0,4));
int numHits = 0;
int numMisses = 0;
Ship bob;

void setup() 
{
  size(290, 370);
  PFont f = loadFont("InformalRoman-Regular-40.vlw");
  textFont(f,40);
  bg = loadImage("ship_shot.jpg");
  bgTwo = loadImage("sunk_ship.jpg");
  buttonSetup();
  bob = new Ship(); 
}

void draw() 
{
  background(3, 168, 158);
  fill(0,0,255);
  textMode(SCREEN);
  text("Battleship",76,40);
  text("Hits:" + numHits,30,320);
  text("Misses:" + numMisses,10,350);
  text("Shots:" + (numHits + numMisses),155,350);  
  if(numHits >= 4)
  {
    image(bgTwo, 0, 0, width, height);
    fill(255,0,0);
    textMode(SCREEN);
    text("You sunk my",53,40);
    text("ship with " + (numHits + numMisses) + " shots!!!",8,350);
  } 
  if((numHits + numMisses) >= 20)
  {
    background(3, 168, 158);
    fill(255,255,0);
    text("Out of ammo!!!",53,40);
    text("Try Again",80,350);
  }  
}

void actionPerformed (GUIEvent e) 
{  
  if(e.getSource() == reset)
  {        
    for(int r = 0;r < rows;r++)   
    {
      for(int c = 0;c < cols;c++)
      {
        buttons[r][c].setLookAndFeel(seaLook);
      }
    }
    run = int(random(1,3));
    a   = int(random(0,4));
    b   = int(random(0,4));
    bob = new Ship();    
    numHits = 0;
    numMisses = 0;
  } 

  else
  {
    IFButton shot = (IFButton)e.getSource();
    if(bob.isHit(shot))
    {
      shot.setLookAndFeel(hit);
      if(bob.isHitFirst(shot))
      {
        numHits++;
        image(bg, 0, 0, width, height);
      }
      else
      {        
        numMisses++;
      }
    }

    else
    {
      shot.setLookAndFeel(miss);
      numMisses++;
    }
  } 
}

class Ship
{
  IFButton b1,b2,b3,b4;
  boolean BL1,BL2,BL3,BL4;

  Ship()
  {
    if (run == 1)
    {
      b1 = buttons[a][b];
      b2 = buttons[a][b+1];
      b3 = buttons[a][b+2];
      b4 = buttons[a][b+3];
    }
    else if (run == 2)
    {
      b1 = buttons[a][b];
      b2 = buttons[a+1][b];
      b3 = buttons[a+2][b];
      b4 = buttons[a+3][b];
    }
    BL1 = false;
    BL2 = false;
    BL3 = false;
    BL4 = false;
  }

  boolean isHit(IFButton shot)
  {
    return b1 == shot || b2 == shot || b3 == shot || b4 == shot;
  }  

  boolean isHitFirst(IFButton shot)
  {
    if(shot == b1 && BL1 == false)
    {
      BL1 = true;
      return true;
    }
    if(shot == b2 && BL2 == false)
    {
      BL2 = true;
      return true;
    }
    if(shot == b3 && BL3 == false)
    {
      BL3 = true;
      return true;
    }
    if(shot == b4 && BL4 == false)
    {     
      BL4 = true;
      return true;
    }
    else
    {
      return false; 
    }
  }
}

void buttonSetup()
{
  control = new GUIController (this); 
  buttons = new IFButton[rows][cols];
  reset = new IFButton ("Reset", 180,290,70,17);
  reset.addActionListener(this);
  control.add (reset);

  IFLookAndFeel newLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  
  newLook.baseColor      = color(255,255,0);
  newLook.highlightColor = color(0,255,255);
  newLook.activeColor    = color(255,255,0);
  newLook.borderColor    = color(255,0,0);
  newLook.textColor      = color(255,0,0);
  reset.setLookAndFeel(newLook);

  setLookAndFeelColors();
  for(int r = 0; r < rows; r++)
  {
    for(int c = 0; c < cols; c++)
    {
      int x = c * (buttonSize + 1) + 40; //cols at x=40,70,100,130,150,190,220
      int y = r * (buttonSize + 1) + 60; //rows at y=60,90,120,150,180,210,240
      buttons[r][c] = new IFButton ("", x, y, buttonSize, buttonSize);
      buttons[r][c].addActionListener(this);
      control.add (buttons[r][c]);
    }
  }
}

void setLookAndFeelColors()
{
  seaLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  seaLook.baseColor = color(32,178,170);
  seaLook.borderColor = color(0, 0, 255);
  seaLook.activeColor = color(32,178,170);
  seaLook.highlightColor = color(32,178,170);
  control.setLookAndFeel(seaLook);

  hit = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  hit.baseColor = color(255, 0, 0);
  hit.borderColor = color(0,255,0);
  hit.activeColor = color(255, 255, 0);
  hit.highlightColor = color(255, 255, 0);

  miss = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  miss.baseColor = color(0, 100, 200);
  miss.borderColor = color(0,255,255);
  miss.activeColor = color(0, 100, 200);
  miss.highlightColor = color(0, 100, 200);
}