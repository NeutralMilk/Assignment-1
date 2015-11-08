// A program to analyse the words of a song (or any text file)
String[] words;

void setup()
{
  size(750,750);
  background(255);
  stroke(0);
  
  //put the contents of the file into an array
  String[] lyrics = loadStrings("lyrics.txt");  
  
  //for loop to split the words up and put them in a new array
  for(int i = 0; i < lyrics.length; i++)
  {
    words = lyrics[i].toLowerCase().replaceAll(".", " ").replaceAll(",", " ").split(" ");
  }//end for
  
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
         numSet[i]++;
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