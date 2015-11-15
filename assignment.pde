//Colin White c14509343
// A program to analyse the words of a song (or any text file)
String[] words;
void setup()
{
  size(750,750);
  background(255);
  stroke(0);
  
  loadData();
  int[] numSet = wordFrequency();
  drawBarChart(numSet);
}//end setup

void loadData()
{
  //put the contents of the file into an array
  String[] lyrics = loadStrings("lyrics.txt");  
  
  //for loop to split the words up and put them in a new array
  for(int i = 0; i < lyrics.length; i++)
  {
    words = lyrics[i].toLowerCase().replaceAll(".", " ").replaceAll(",", " ").split(" ");
  }//end for
}//end loadData()

int[] wordFrequency()
{
  int[] freq = new int[words.length];
  for(int i = 0; i < words.length; i++)
  {
    freq[i] = 1;
    println(words[i]); 
  }//end for
  
  for(int i = 0; i < words.length; i++)
  {
    //inner for loop to compare all words to the word chosen in the outer loop
    for(int j = 0; j < words.length; j++)
    {
      if(words[i] == words[j])
      {
         freq[i]++;
      }//end if
    }//end inner for
  }//end outer for
  
  return(freq);
}//end createNumSet()

void drawBarChart(int [] numSet)
{
  float max = 0;
  float min = 0;
  
  //find max
  for(int i = 0; i < words.length; i++)
  {
    if (numSet[i] > max)
    {
      max = numSet[i];
    }//end if
  }//end for

  //find min
  for(int i = 0; i < words.length; i++)
  {
    if (numSet[i] < min)
    {
      min = numSet[i];
    }//end if
  }//end for
  
  float border = height*.1f;
  float tick = (border/4);
  stroke(100);
  line(border-tick, height-border, width-border, height-border);
  line(border, height-border+tick, border,border);

  for(int i = 0; i < 9 ; i++)
  {
    float barWidth = (width *.8f)/10;
    float x = border+(i* barWidth);
    float y = height-border;
    rect(x, y, 100, -100);
  }//end for
  
}//end drawBarChart()
void draw()
{
  
}//end draw