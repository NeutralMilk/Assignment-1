void setup()
{
  size(750,750);
  background(255);
  stroke(0);
  
  ArrayList<String> wordSet = new ArrayList<String>();
  ArrayList<Float> numSet = new ArrayList<Float>();
  
  String[] words = loadStrings("lyrics.txt");
  //String[] list = split(words,' ');
  int itemCount = words.size();
  
  for (int i = 0; i < size; i++) 
  {
    String s = (string)words.get(i);
    s.display();
  }
  
  for(Float s:numSet)
  {
    // Add each element from the string array to the arrraylist
    float f = Float.parseFloat(s);
    sumData.add(f);
  }  
}//end setup

void draw()
{
  
}//end draw