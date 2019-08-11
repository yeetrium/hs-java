//Luis Nunez, Old MacDonald, AP Comp Sci mods 6,7
//URL

public class OldMacDonald 
{
	public static void main(String args[])
	{
		Farm mac = new Farm();
		mac.animalSounds();
	}
}

interface Animal
{
   public String getSound();    
   public String getType();
}

class Cow implements Animal
{
    String myType;
    String mySound;

    Cow(String type, String sound)
    {
        myType = type;
        mySound = sound;
    }
    Cow()
    {
        myType = "unknown";
        mySound = "unknown";
    }

    public String getSound() 
    { 
       return mySound; 
    }
    public String getType() 
    { 
       return myType; 
    }
}

class Chick implements Animal
{
    String myType;
    String mySound;
    String mySound2;

    Chick(String type, String sound2, String sound)
    {
        myType = type;
        mySound = sound;
        mySound2 = sound2;
    }
    Chick()
    {
        myType = "unknown";
        mySound2 = "unknown";
        mySound = "unknown";
    }

    public String getSound() 
    { 
    	if(Math.random() <= .5)
    	{
    		return mySound; 
    	}
        else
        {
    	   return mySound2;
        }
    }
    public String getType() 
    { 
       return myType; 
    }
}

class Pig implements Animal
{
    String myType;
    String mySound;

    Pig(String type, String sound)
    {
        myType = type;
        mySound = sound;
    }
    Pig()
    {
        myType = "unknown";
        mySound = "unknown";
    }

    public String getSound() 
    { 
       return mySound; 
    }
    public String getType() 
    { 
       return myType; 
    }
}

class Farm 
{

   Animal[] aBunchOfAnimals = new Animal[3];
   Farm() 
   {
      aBunchOfAnimals[0] = new Cow("cow","moo");
      aBunchOfAnimals[1] = new Chick("chick","cheep","cluck");
      aBunchOfAnimals[2] = new Pig("pig","oink");
   }

   void animalSounds()
   {
      for (int nI=0; nI < aBunchOfAnimals.length; nI++)
      {
         System.out.println( aBunchOfAnimals[nI].getType() + " goes " + aBunchOfAnimals[nI].getSound());
      }
   }
}
