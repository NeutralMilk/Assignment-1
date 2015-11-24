//Colin White c14509343
// A program to analyse the words of a song (or any text file)

String[] words;
String[] sortedWords;
ArrayList<Integer> numSet = new ArrayList<Integer>();

void setup()
{
  size(900,900);
  background(255);
  stroke(0);
  
  loadData();
  
}//end setup

void loadData()
{
  //put the contents of the file into an array
  String[] lyrics = loadStrings("lyrics.txt");  
  
  //for loop to split the words up and put them in a new array
  for(int i = 0; i < lyrics.length; i++)
  {
    //change everything to lowercase, replace full stops and commas with spaces and split at a space
    String[] w = lyrics[i].toLowerCase().replaceAll(".", " ").replaceAll(",", " ").split(" ");
    words = sort(w);
  }//end for
  
  for (int i = 0; i < words.length; i++)
  {
    numSet.add(i);
    println(numSet.get(i));
  }//end for
  
  wordFrequency();
  
}//end loadData()

void wordFrequency()
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
  currentPlace = 0;
  j = 0;
  
  //compare the words
  for(int i = 0; i < words.length; i++)
  {
    if(words[currentPlace] == words[i])
    {
      numSet.add(1);
    }//end if
    
    else
    {    
      currentPlace = i;
      j++;
    }//end if
  }//endfor
  
  drawBarChart();

}//end wordFrequency()

void drawBarChart()
{
  float max = 0;
  float min = 0;
  
  //find max
  for(int i = 0; i < words.length; i++)
  {
    if (numSet.get(i) > max)
    {
      max = numSet.get(i);
    }//end if
  }//end for

  //find min
  for(int i = 0; i < words.length; i++)
  {
    if (numSet.get(i) < min)
    {
      min = numSet.get(i);
    }//end if
  }//end for
  
  //draw the axes
  float border = height*.1f;
  float tick = (border/4);
  stroke(0);
  line(border-tick, height-border, width-border, height-border);
  line(border, height-border+tick, border,border);

  //draw the bars
  for(int i = 0; i < numSet.size() ; i++)
  {
    float barHeight = map(numSet.get(i), min, max, height-border, border);
    float barWidth = (height-2*border)/10;
    float x = border;
    float y = border + (i*barWidth);
  
    rect(x, y, 100, 100);
  }//end for
  println("draw bar chart runs");
}//end drawBarChart()
void draw()
{
  
}//end draw