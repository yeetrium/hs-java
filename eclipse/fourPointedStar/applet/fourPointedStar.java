//Your Name, Four Pointed Star, AP Comp Sci mods 6,7
//Your URL for this assignment
import processing.core.*;

public class fourPointedStar extends PApplet
{
    int startX = 150;
    int startY = 0;
    int endX = 150;
    int endY = 150;
    boolean pntX = true;
    boolean pntY = true;
    public void setup()
    {
      size(300,300);
      frameRate(10);
      smooth();
      background(0);
    }
    public void draw()
    {
      stroke(0,255,0);
      line(startX,startY,endX,endY);
      if(startY<=0)
      {  
          pntY = true;
      }
      if(endX<=0)
      {
          pntX = true;
      }
      if(endX>=300)
      {
          pntX = false;
      }
      if(startY>=300)
      {
          pntY = false;
      }
      if(pntX == true)
      {
          endX+=5;
      }
      if(pntX == false)
      {
          endX-=5;
      }
      if(pntY == true)
      {
          startY+=5;
      }
      if(pntY == false)
      {
          startY-=5;
      }
    }
}

