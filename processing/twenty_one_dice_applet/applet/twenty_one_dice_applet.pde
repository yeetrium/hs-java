//Luis Nunez, CP2, mods 4-5, 176 Dice Applet

Die one;

void setup()
{
  size(640,480);
  background(255);
  PFont f = loadFont("GoudyHandtooledBT-Regular-30.vlw");
  textFont(f,30);
  textMode(SCREEN);
  noLoop(); 
}

void draw()
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

void mouseClicked()
{
  background(255);
  redraw();  
}

class Die
{
  int num,dRed,dGreen,dBlue,eRed,eGreen,eBlue;

  void roll()
  {
    num = int(random(1,7));

    dRed = int(random(25,127));
    dGreen = int(random(25,127));
    dBlue = int(random(25,127));
    eRed = int(random(127,256));
    eGreen = int(random(127,256));
    eBlue = int(random(127,256));
  }

  void show(int x,int y)
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
