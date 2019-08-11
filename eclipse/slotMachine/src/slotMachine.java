//Luis Nunez, AP Comp Sci, mods 6-7, Slot Machine
//URL
import processing.core.*;
import java.util.*;

public class slotMachine extends PApplet{
	private int nMoney;
	private ArrayList <String>  reel1, reel2, reel3;
	String sWin1, sWin2, sWin3;
	PImage pBars, pCherries, pSeven, pBlank, pYouLose, pClickMe, pPayLine;

	public void setup(){
		size(500,200);
		smooth();

		PFont fontA = loadFont("KabelITCbyBT-Book-20.vlw");
		textFont(fontA, 20);
		pPayLine  = loadImage("slot_payline.JPG");
		pBars     = loadImage("bars.JPG");
		pCherries = loadImage("cherry.jpg");
		pSeven    = loadImage("seven.JPG");
		pBlank    = loadImage("blank.JPG");
		pClickMe  = loadImage("click_me.JPG");
		pYouLose  = loadImage("losing_message.JPG");

		reel1 = new ArrayList <String>();
		for(int nI = 0;nI<20;nI++)
		{
			reel1.add(new String("Blank"));
		}
		for(int nI = 0;nI<5;nI++)
		{
			reel1.add(new String("Bars"));
		}
		for(int nI = 0;nI<5;nI++)
		{
			reel1.add(new String("Seven"));
		}
		for(int nI = 0;nI<2;nI++)
		{
			reel1.add(new String("Cherries"));
		}

		reel2 = new ArrayList <String>();
		for(int nI = 0;nI<23;nI++)
		{
			reel2.add(new String("Blank"));
		}
		for(int nI = 0;nI<4;nI++)
		{
			reel2.add(new String("Bars"));
		}
		for(int nI = 0;nI<2;nI++)
		{
			reel2.add(new String("Seven"));
		}
		for(int nI = 0;nI<3;nI++)
		{
			reel2.add(new String("Cherries"));
		}

		reel3 = new ArrayList <String>();
		for(int nI = 0;nI<22;nI++)
		{
			reel3.add(new String("Blank"));
		}
		for(int nI = 0;nI<5;nI++)
		{
			reel3.add(new String("Bars"));
		}
		for(int nI = 0;nI<3;nI++)
		{
			reel3.add(new String("Seven"));
		}
		for(int nI = 0;nI<2;nI++)
		{
			reel3.add(new String("Cherries"));
		}
		nMoney = 20;
		noLoop();
	}
	public void draw()
	{
		if(nMoney <= 0)
		{
			background(0);
			tint(255);
			System.out.println("Try Again?");
			image(pYouLose, 5, 5, 490, 190);
		}
		else
		{
			background(0);
			sWin1 = reel1.get((int)(Math.random()* (double)reel1.size()));
			sWin2 = reel2.get((int)(Math.random()* (double)reel2.size()));
			sWin3 = reel3.get((int)(Math.random()* (double)reel3.size()));

			tint(255);
			image(pPayLine, 0, 40, 500, 100);
			//1st reel, sWin1
			if(sWin1.equals("Blank"))
			{
				image(pBlank, 60, 47, 112, 87);
			}
			if(sWin1.equals("Bars"))
			{
				image(pBars, 60, 47, 112, 87);
			}
			if(sWin1.equals("Seven"))
			{
				image(pSeven, 60, 47, 112, 87);
			}
			if(sWin1.equals("Cherries"))
			{
				image(pCherries, 60, 47, 112, 87);
			}
			//2nd reel, sWin2
			if(sWin2.equals("Blank"))
			{
				image(pBlank, 194, 47, 112, 87);
			}
			if(sWin2.equals("Bars"))
			{
				image(pBars, 194, 47, 112, 87);
			}
			if(sWin2.equals("Seven"))
			{
				image(pSeven, 194, 47, 112, 87);
			}
			if(sWin2.equals("Cherries"))
			{
				image(pCherries, 194, 47, 112, 87);
			}
			//3rd reel, sWin3
			if(sWin3.equals("Blank"))
			{
				image(pBlank, 327, 47, 112, 87);
			}
			if(sWin3.equals("Bars"))
			{
				image(pBars, 327, 47, 112, 87);
			}
			if(sWin3.equals("Seven"))
			{
				image(pSeven, 327, 47, 112, 87);
			}
			if(sWin3.equals("Cherries"))
			{
				image(pCherries, 327, 47, 112, 87);
			}
			tint(0,255,0);
			image(pClickMe, 0, 0, 500, 40);

			fill(color(0,155,0));
			stroke(color(0,255,0));
			rect(0,140,nMoney,60);
			textMode(SCREEN);
			textAlign(CENTER);
			fill(255);
			text("$" + nMoney,nMoney+20,175);
		}
	}
	public void mousePressed(){
		if(mouseX>=0 && mouseX <=500 && mouseY>=0 && mouseY <=40) // replace with coordinates that match your "click me" button
		{
			nMoney += Winnings(sWin1, sWin2, sWin3); //replace with nMoney += Winnings(/* your code here */);
			System.out.println("$" + nMoney);
			redraw();
		}
	}
	public int Winnings(String sOne, String sTwo, String sThree)
	{
		if(sOne.equals("Seven") && sTwo.equals("Seven") && sThree.equals("Seven"))
		{
			return 250;
		}
		if(sOne.equals("Bars") && sTwo.equals("Bars") && sThree.equals("Bars"))
		{
			return 75;
		}
		if(sOne.equals("Cherries") && sTwo.equals("Cherries") && sThree.equals("Cherries"))
		{
			return 12;
		}
		//exactly two cherries
		if(sThree.equals("Cherries") && sTwo.equals("Cherries") && (!sOne.equals("Cherries")))
		{
			return 8;
		}
		if(sOne.equals("Cherries") && sThree.equals("Cherries") && (!sTwo.equals("Cherries")))
		{
			return 8;
		}
		if(sOne.equals("Cherries") && sTwo.equals("Cherries") && (!sThree.equals("Cherries")))
		{
			return 8;
		}
		//exactly one cherry
		if(sOne.equals("Cherries") && (!sTwo.equals("Cherries")) && (!sThree.equals("Cherries")))
		{
			return 2;
		}
		if(sTwo.equals("Cherries") && (!sOne.equals("Cherries")) && (!sThree.equals("Cherries")))
		{
			return 2;
		}
		if(sThree.equals("Cherries") && (!sTwo.equals("Cherries")) && (!sOne.equals("Cherries")))
		{
			return 2;
		}
		return -1;
	}
}