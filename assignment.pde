// A program to analyse the words of a song (or any text file)

void setup()
{
  size(750,750);
  background(255);
  stroke(0);
  
  //array list to hold the words
  
  String[] words = loadStrings("lyrics.txt");
  //String[] parts = line.split(" "); //from last years exam question
  //String[] list = split(words, ' '); //from the processing website
  
  for(int i = 0; i < words.length; i++)
  {
    String[] names = words[i].toLowerCase().replaceAll("\\W", " ").replaceAll(" +", " ").split(" ");
  }//end for
  
  Map map = new HashMap();
  
  for (int i = 0; i < names.length; i++)
  {
    String key = names[i];
    NameAndNumber nan = (NameAndNumber) map.get(key);
    if (nan == null)
    {
      // New entry
      map.put(key, new NameAndNumber(key, 1));
    }
    else
    {
      map.put(key, new NameAndNumber(key, nan.m_number + 1));
    }
  }
  //For every word create a corresponding number
  int[] numSet = new int[words.length];
  for(int i = 0; i < words.length; i++)
  {
    numSet[i] = 1;
  }//end for
 
  //print out the data to check if it works
  for(int i = 0; i < words.length; i++)
  {
    println(words[i]);  
  }//end for
  
  //for loops to find the frequency of the words
  //outer for loop to choose the word
  for(int i = 0; i < words.length; i++)
  {
    //inner for loop to compare all words to the word chosen in the outer loop
    for(int j = 0; j < words.length; j++)
    {
      if(words[i] == words[j])
      {
         numSet[j]++;
      }//end if
    }//end inner for
  }//end outer for
  
  //print counted words
  for(int i = 0; i < words.length; i++)
  {
    println(numSet[i]);    
    
  }//end for
}//end setup

void draw()
{
  
}//end draw