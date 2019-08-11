//Luis Nunez, mods 6-7, APCS, Minesweeper

import interfascia.*;
import processing.core.*;

private GUIController control;
private Cell [][] buttons;
private IFLookAndFeel startLook, mineLook, markedMineLook, clickedLook;
public final static  int ROWS = 10;
public final static int COLS = 10;
public final static int BUTTON_SIZE = 30;
public final static int BOMBS = 10;

//your added declarations here
void setup() 
{
  size(380, 460); 
  buttonSetup();
  setBombs();
  //your added initializations here 
}
void draw() 
{
  //may leave empty
}

public void setBombs()
{
  for(int n = 0;n < BOMBS;n++)
  {
    int row = (int)(Math.random() * ROWS);
    int col = (int)(Math.random() * COLS);
    buttons[row][col].setMine(true);
  }
}  

public boolean isValid(int row, int col)
{
  return row>=0 && row < ROWS && col>=0 && col<COLS;
}  

public int countBombs(int row, int col)
{
  int numBombs = 0;
  if(isValid(row - 1, col - 1) && buttons[row - 1][col - 1].getMine())
  {
    numBombs++;
  }
  if(isValid(row - 1, col) && buttons[row - 1][col].getMine())
  {
    numBombs++;
  }
  if(isValid(row - 1, col + 1) && buttons[row - 1][col + 1].getMine())
  {
    numBombs++;
  }
  if(isValid(row, col - 1) && buttons[row][col - 1].getMine())
  {
    numBombs++;
  }
  if(isValid(row, col + 1) && buttons[row][col + 1].getMine())
  {
    numBombs++;
  }
  if(isValid(row + 1, col - 1) && buttons[row + 1][col - 1].getMine())
  {
    numBombs++;
  }
  if(isValid(row + 1, col) && buttons[row + 1][col].getMine())
  {
    numBombs++;
  }
  if(isValid(row + 1, col + 1) && buttons[row + 1][col + 1].getMine())
  {
    numBombs++;
  }
  return numBombs;
} 
public void changeBackground(int row, int col)
{
  buttons[row][col].setLookAndFeel(clickedLook);
  buttons[row][col].setClicked(true);
  if(countBombs(row, col) > 0)
  {
    buttons[row][col].setLabel(Integer.toString(countBombs(row, col)));
  } 
  else
  {
    if(isValid(row - 1, col) && !buttons[row - 1][col].getClick())
    {
      changeBackground(row - 1, col);
    }
    if(isValid(row + 1, col) && !buttons[row + 1][col].getClick())
    {
      changeBackground(row + 1, col);
    }
    if(isValid(row, col - 1) && !buttons[row][col - 1].getClick())
    {
      changeBackground(row, col - 1);
    }
    if(isValid(row, col + 1) && !buttons[row][col + 1].getClick())
    {
      changeBackground(row, col + 1);
    }
    if(isValid(row - 1, col - 1) && !buttons[row - 1][col - 1].getClick())
    {
      changeBackground(row - 1, col - 1);
    }
    if(isValid(row + 1, col - 1) && !buttons[row + 1][col - 1].getClick())
    {
      changeBackground(row + 1, col - 1);
    }
    if(isValid(row + 1, col + 1) && !buttons[row + 1][col + 1].getClick())
    {
      changeBackground(row + 1, col + 1);
    }
    if(isValid(row - 1, col + 1) && !buttons[row - 1][col + 1].getClick())
    {
      changeBackground(row - 1, col + 1);
    }
  }
}        
public boolean isWon()
{
  int n = 0;
  for(int row = 0; row < ROWS; row++)
  {
    for(int col = 0; col < COLS; col++)
    {
      if(buttons[row][col].getClick())
      {
        n++;
      }
    }

  }
  return n == ((ROWS*COLS))-BOMBS;
}  

public void clearLabels()
{
  String stg = "";
  for(int row = 0; row < ROWS; row++)
  {
    for(int col = 0; col < COLS; col++)
    {
        buttons[row][col].setLabel(stg);
    }
  }
}

public void displayWinMessage()
{
  String[] stg = {"Y","o","u"," "," "," ","W","i","n","!"};
  for(int row = (ROWS/2)-1; row < (ROWS/2); row++)
  {
    for(int col = 0; col < COLS; col++)
    {
      buttons[row][col].setLabel(stg[col]);
    }

  }
}      
public void displayLosingMessage()
{
  String[] stg = {"G","a","m","e"," "," ","O","v","e","r"};
  for(int row = (ROWS/2)-1; row < (ROWS/2); row++)
  {
    for(int col = 0; col < COLS; col++)
    {
        buttons[row][col].setLabel(stg[col]);
    }
  }
}        
public void actionPerformed (GUIEvent e) 
{
  Cell shot = (Cell)e.getSource();
  int row = ((Cell)e.getSource()).getRow();
  int col = ((Cell)e.getSource()).getCol();
  shot.setClicked(true);
  if(mousePressed == true && mouseButton == LEFT && shot.getMine())
  {
    shot.setLookAndFeel(mineLook);
    clearLabels();
    displayLosingMessage();
    System.out.println("("+row+","+col+")");
    //noLoop();
  }  
  else if(mousePressed == true && mouseButton == LEFT)
  {
    changeBackground(shot.getRow(), shot.getCol());
    System.out.println("("+row+","+col+")");
  }
  else if(mousePressed == true && mouseButton == RIGHT)
  {
    shot.setLookAndFeel(markedMineLook);
    System.out.println("("+row+","+col+")");
  }
  if(isWon() == true)
  {
    clearLabels();
    displayWinMessage();
  }  
}


public class Cell extends IFButton
{
  public boolean isAMine, clicked;
  private int myRow, myCol;
  public Cell(int x, int y, int row, int col)
  {
    super("", x, y, BUTTON_SIZE, BUTTON_SIZE);
    isAMine = false;
    clicked = false;
    myRow = row;
    myCol= col;
  }
  public void setMine(boolean changeMine)
  {
    isAMine = changeMine;
  }
  public void setClicked(boolean changeClicked)
  {
    clicked = changeClicked;
  }
  public boolean getMine()
  {
    return isAMine;  
  }
  public boolean getClick()
  {
    return clicked;
  }
  public int getRow()
  {
    return myRow;
  }
  public int getCol()
  {
    return myCol;
  } 

}


public void buttonSetup()
{
  control = new GUIController (this); 
  buttons = new Cell[ROWS][COLS];
  setLookAndFeelColors();
  for(int r = 0; r < ROWS; r++)
  {
    for(int c = 0; c < COLS; c++)
    {
      int x = c * (BUTTON_SIZE+1) + 40; //cols at x=40,70,100,130,150,190,220,250,280,310
      int y = r * (BUTTON_SIZE+1) + 60; //rows at y=60,90,120,150,180,210,240,270,300,330
      //buttons[r][c] = new IFButton ("", x, y, BUTTON_SIZE, BUTTON_SIZE);
      buttons[r][c] = new Cell (x, y, r, c);
      buttons[r][c].addActionListener(this);
      control.add (buttons[r][c]);
      buttons[r][c].setLookAndFeel(startLook);
    }
  }
}
public void setLookAndFeelColors()
{
  startLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  startLook.baseColor = color(0,255,255);
  startLook.borderColor = color(0, 0, 255);
  startLook.highlightColor = color(0,0,255);
  startLook.activeColor = color(0,255,255);

  mineLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  mineLook.baseColor = color(255, 0, 0);
  mineLook.activeColor = color(255, 0, 0);
  mineLook.highlightColor = color(255, 0, 0);

  markedMineLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  markedMineLook.baseColor = color(0,255, 0);
  markedMineLook.activeColor = color(0, 255,0);
  markedMineLook.highlightColor = color(0, 255,0);

  clickedLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  clickedLook.baseColor = color(175, 175, 175);
  clickedLook.activeColor = color(175,175, 175);
  clickedLook.highlightColor = color(175,175, 175);
}




