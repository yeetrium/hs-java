//Luis Nunez, CP2, mods 4-5, Dice Applet

Dice one,two;

void setup()
{
  size(400,480);
  background(255);
  PFont f = loadFont("GoudyHandtooledBT-Regular-30.vlw");
  textFont(f,30);
  textMode(SCREEN);
  noLoop(); 
}

void draw()
{ 
  int total;
  
  Dice one = new Dice();
  one.roll();
  one.show(75,50);
  
  Dice two = new Dice();
  two.roll();
  two.show(225,50);
  
  total = (one.num + two.num);
  
  if(total == 2)
  {
    fill(0);
    text("You rolled a two",90,250);    
  }
  if(total == 3)
  {
    fill(0);
    text("You rolled a three",90,250);    
  }
  if(total == 4)
  {
    fill(0);
    text("You rolled a four",90,250);    
  }
  if(total == 5)
  {
    fill(0);
    text("You rolled a five",90,250);    
  }
  if(total == 6)
  {
    fill(0);
    text("You rolled a six",90,250);    
  }
  if(total == 7)
  {
    fill(0);
    text("You rolled a seven",90,250);    
  }
  if(total == 8)
  {
    fill(0);
    text("You rolled an eight",90,250);    
  }
  if(total == 9)
  {
    fill(0);
    text("You rolled a nine",90,250);    
  }
  if(total == 10)
  {
    fill(0);
    text("You rolled a ten",90,250);    
  }
  if(total == 11)
  {
    fill(0);
    text("You rolled an eleven",90,250);    
  }
  if(total == 12)
  {
    fill(0);
    text("You rolled a twelve",90,250);    
  }
  text("Click to roll again",90,300);  
} 

void mouseClicked()
{
  background(255);
  redraw();  
}

class Dice
{
  int num,dColor,dColorII,dColorIII,eColor,eColorII,eColorIII;
  
  void roll()
  {
    num = int(random(1,7));
    
    dColor = int(random(25,127));
    dColorII = int(random(25,127));
    dColorIII = int(random(25,127));
    
    eColor = int(random(127,256));
    eColorII = int(random(127,256));
    eColorIII = int(random(127,256));
  }
  
  void show(int x,int y)
  {
    noStroke();
    fill(dColor,dColorII,dColorIII);
    rect(x,y,100,100);    
    
    if(num == 1)
    {
      smooth();
      noStroke();      
      fill(eColor,eColorII,eColorIII);
      ellipse(x+50,y+50,20,20);           
    }
    if(num == 2)
    {
      smooth();
      noStroke();      
      fill(eColor,eColorII,eColorIII);
      ellipse(x+20,y+20,20,20);
      ellipse(x+80,y+80,20,20); 
    }
    if(num == 3)
    {
      smooth();
      noStroke();      
      fill(eColor,eColorII,eColorIII);
      ellipse(x+20,y+20,20,20);
      ellipse(x+50,y+50,20,20);      
      ellipse(x+80,y+80,20,20); 
    }
    if(num == 4)
    {
      smooth();
      noStroke();      
      fill(eColor,eColorII,eColorIII);
      ellipse(x+20,y+20,20,20);
      ellipse(x+80,y+20,20,20);
      ellipse(x+20,y+80,20,20);
      ellipse(x+80,y+80,20,20); 
    }
    if(num == 5)
    {
      smooth();
      noStroke();      
      fill(eColor,eColorII,eColorIII);
      ellipse(x+20,y+20,20,20);
      ellipse(x+80,y+20,20,20);
      ellipse(x+50,y+50,20,20);
      ellipse(x+20,y+80,20,20);
      ellipse(x+80,y+80,20,20); 
    }
    if(num == 6)
    {
      smooth();
      noStroke();      
      fill(eColor,eColorII,eColorIII);
      ellipse(x+20,y+20,20,20);
      ellipse(x+80,y+20,20,20);
      ellipse(x+20,y+50,20,20);
      ellipse(x+80,y+50,20,20);
      ellipse(x+20,y+80,20,20);
      ellipse(x+80,y+80,20,20); 
    }
  } 
}
