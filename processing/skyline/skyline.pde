//Luis Nunez, CP2, mods 4-5, Skyline

void setup()
{
  size(640,480);
  noStroke();
  smooth();
  noLoop();
}

void draw()
{  
  int xPosition = 0;
  background(50,0,215);

  for(int stars = 0; stars < width; stars++)
  {
    int opacity =int(random(100,256));
    int z = int(random(height));
    fill(255,255,255,opacity);        
    rect(stars,z,2,2);   
  }

  fill(255);
  int moonXPosition = int(random(width));
  int moonYPosition = int(random(height));
  int moonDiameter = int(random(100,201));
  ellipse(moonXPosition,moonYPosition,moonDiameter,moonDiameter);

  while(xPosition < 640)
  {     
    Building one = new Building();
    one.show(xPosition);
    xPosition = xPosition + one.howWide;
  }  

}

void mouseClicked()
{
  redraw();  
}

class Building
{
  int howTall,howWide,wPositionX,wPositionY,numWindows;
  
  Building()
  {    
    howWide = int(random(50,76));
    howTall = int(random(-250,-121));
  }
  
  void show(int x)
  {        
    fill(0);
    rect(x,480,howWide,howTall);    
    
    for(int windows = 5;windows < howWide-5;windows+=5)
    {
      numWindows = int(random(3,251));
      fill(250,250,0);  
      rect(x+windows,480+howTall+numWindows,5,5); 
    }
    
  }
  
}
