// A program to analyse the words of a song (or any text file)

void setup()
{
  size(750,750);
  background(255);
  stroke(0);
  
  ArrayList<String> wordSet = new ArrayList<String>();
  ArrayList<Integer> numSet = new ArrayList<Integer>();
  
  String[] words = loadStrings("lyrics.txt");
  String[] parts = line.split(" "); //from last years exam question
  String[] list = split(words, ' '); //from the processing website
  
  //move the lyrics into an array list
  for(int i = 0; i < words.length; i++)
  {
    String w = words[i];
    wordSet.add(w);
  }  
  
  //For every word create a corresponding number element
  for(int i = 0; i < words.length; i++)
  {
    numSet.add(1);
  }//end for
 
  //print out the data to check if it works
  for(int i = 0; i < words.length; i++)
  {
    println(wordSet.get(i));    
  }//end for
  
  for(int i = 0; i < words.length; i++)
  {
    println(numSet.get(i));    
  }//end for
  
  
}//end setup

void draw()
{
  
}//end draw