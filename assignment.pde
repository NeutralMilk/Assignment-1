//Colin White c14509343
// A program to analyse the words of a song (or any text file)

String[] words;
String[] sortedWords;

void setup()
{
  size(1000,750);
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
    String[] w = lyrics[i].toLowerCase().replaceAll(".", " ").replaceAll(",", " ").split(" ");
    words = sort(w);
  }//end for
}//end loadData()

int[] wordFrequency()
{
  int currentPlace = 0;
  int j = 0;
  //find the number of unique words
  for(int i = 0; i < words.length; i++)
  {
    if(words[currentPlace] != words[i])
    {
      currentPlace = i;
      j++;
      sortedWords[i] = words[i];
    }//end if
  }//endfor
  
  //create an array the size of the number of unique words
  int[] numSet = new int[j];
  currentPlace = 0;
  j = 0;
  
  //compare the words
  for(int i = 0; i < words.length; i++)
  {
    if(words[currentPlace] == words[i])
    {
      numSet[j]++;
    }//end if
    
    else
    {    
      currentPlace = i;
      j++;
    }//end if
  }//endfor
  
  return numSet;
 
}//end wordFrequency()

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
  
  //draw the axes
  float border = height*.1f;
  float tick = (border/4);
  stroke(0);
  line(border-tick, height-border, width-border, height-border);
  line(border, height-border+tick, border,border);

  //draw the bars
  for(int i = 0; i < numSet.length ; i++)
  {
    float barHeight = map(numSet[i], min, max, height-border, border);
    float barWidth = (width-2*border)/10;
    float x = border+(i* barWidth);
    float y = height-border;
  
    rect(x, y, barWidth, 10);
  }//end for
  
}//end drawBarChart()
void draw()
{
  
}//end draw