//Luis Nunez, CP2, mods 4/5, Penguin Assignment

void setup()
{
  size(640,480);
  noStroke();
  smooth();
  noLoop();
}

void draw()
{
  background(0,235,235);
  fill(139,69,19);
  //body
  ellipse(320,240,100,200);
  //flippers
  ellipse(380,220,150,50);
  ellipse(260,220,150,50);
  //head
  ellipse(320,170,85,95);
  //tail
  bezier(270,240,270,450,400,450,450,350);
  fill(0,235,235);
  triangle(361,298,350,350,375,360);
  fill(0);
  triangle(380+65,208,380+65,216,380+80,212);
  //nails
  triangle(380+65,208,380+65,216,380+80,212);
  triangle(380+65,208+8,380+65,216+8,380+80,212+8);
  triangle(380+65,208+16,380+65,216+16,380+80,212+16);

  triangle(260-65,208,260-65,216,260-80,212);
  triangle(260-65,208+8,260-65,216+8,260-80,212+8);
  triangle(260-65,208+16,260-65,216+16,260-80,212+16);
  //face
  
}


