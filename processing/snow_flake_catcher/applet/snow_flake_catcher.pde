//Luis Nunez, CP2, mods 4-5, Snow Flake Catcher

SnowFlake [] snowFlakes;
int speed;

void setup()
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

void draw()
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

void mouseDragged()
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

void keyPressed()
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
    x = int(random(width));
    y = int(random(-height-601,-2));
    isMoving = true;
  }

  void move()
  {
    fill(0);
    ellipse(x,y,3,3);
    if(isMoving)
    {
      y += speed;
    }
  }

  void draw()
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
