//Colin White c14509343
// A program to analyse the words of a song (or any text file)
int totalWords = 0;
float globalX;
float globalY;
int max = 0;
int pressed = 0;
ArrayList<Integer> numSet = new ArrayList<Integer>();
ArrayList<String> allWords = new ArrayList<String>();
ArrayList<String> uniqueWords = new ArrayList<String>();
PImage itaots;
PImage illinois;
PImage arthur;
PImage animals;
PImage lastchristmas;

void setup()
{
  size(1600,900);
  background(255);
  stroke(0);
  fill(255);
  itaots = loadImage("ITAOTS.jpg");
  itaots.resize(100, 100);
  
  illinois = loadImage("Illinois.jpg");
  illinois.resize(100, 100);

  arthur = loadImage("Arthur.jpg");
  arthur.resize(100, 100);

  animals = loadImage("Animals.jpg");
  animals.resize(100, 100);

  lastchristmas = loadImage("lastchristmas.jpg");
  lastchristmas.resize(100, 100);

  globalX = width;
  loadData();
}//end setup

void draw()
{  
   //draw the menu
   float x = width/3;
   float w = width/4;
   float h = height/9;
  
   //put the images on the screen
   image(itaots, x, height*.2);
   image(illinois, x, height*.32);
   image(arthur, x, height*.44);
   image(animals, x, height*.56);
   image(lastchristmas, x, height*.68);
   
   float boxX = x + (x*.206);
   //draw the boxes
   //1
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.2 && mouseY < (height*.2 + h))
   {
     fill(240);
     pressed = 1;
   }//end if
   else
   {
     if(pressed > 0)
     {
       pressed = pressed;
     }
     fill(255);
   }
   rect(boxX, height*.2, w, h);
   
   //2
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.32 && mouseY < (height*.32 + h))
   {
     fill(240);
     pressed = 2;
   }//end if
   else
   {
     if(pressed > 0)
     {
       pressed = pressed;
     }
     fill(255);
   }
   rect(boxX, height*.32, w, h);
   
   //3
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.44 && mouseY < (height*.44 + h))
   {
     fill(240);
     pressed = 3;
   }//end if
   else
   {
     if(pressed > 0)
     {
       pressed = pressed;
     }
     fill(255);
   }
   rect(boxX, height*.44, w, h);
   
   //4
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.56 && mouseY < (height*.56 + h))
   {
     fill(240);
     pressed = 4;
   }//end if
   else
   {
     if(pressed > 0)
     {
       pressed = pressed;
     }
     fill(255);
   }
   rect(boxX, height*.56, w, h);
   
   //5
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.68 && mouseY < (height*.68 + h))
   {
     fill(240);
     pressed = 5;
   }//end if
   else
   {
     if(pressed > 0)
     {
       pressed = pressed;
     }
     fill(255);
   }
   rect(boxX, height*.68, w, h);
   
   //put the info in and line it up
   fill(0);
   textSize(height * .022);
   text("Two Headed Boy - Neutral Milk Hotel", x+(x*.25), height*.265);
   text("Casimir Pulaski Day - Sufjan Stevens", x+(x*.25), height*.375);
   text("Shangri-La - The Kinks", x+(x*.365), height*.5);
   text("Dogs - Pink Floyd", x+(x*.413), height*.62);
   text("Last Christmas - Wham!", x+(x*.369), height*.743);

}//end draw

void loadData()
{
  //put the contents of the file into an array
  String[] lyrics = loadStrings("ShangriLa.txt");  
  
  //for loop to split the words up and put them in a new array
  for(int i = 0; i < lyrics.length; i++)
  {
    //println(lyrics[i]);
    //change everything to lowercase, replace full stops and commas with spaces and split at a space
    String temp = lyrics[i].toLowerCase().replaceAll("\\.", " ").replaceAll(",", " ").replaceAll("\\?", " ").replaceAll("!", " ").replaceAll("\"", " ");
    String[] w = temp.split(" ");
    for(String s:w)
    {
      allWords.add(s);
    }
  }//end for
  java.util.Collections.sort(allWords);
  for (int i = 0; i < allWords.size(); i++)
  {
    totalWords++;
  }//end for
  
  wordFrequency();
  
}//end loadData()

void wordFrequency()
{
  int currentPlace = 0;
  println("uniqueWords is " + uniqueWords.size());
  
  int count = 0;
  
  //finding the frequency
  for(int i = 0 ; i < allWords.size(); i++)
  {
    String str1 = allWords.get(currentPlace); 
    String str2 = allWords.get(i); 
 
    //count the amount of times a word repeats.
    if(str1.equals(str2))
    {
      count++;
    }//end if
    
    //when the number of repeated words has been counted, add the amount to numSet and put the string into the uniqueWords arraylist
    else
    {
      //change the current place to be where the words stop repeating
      currentPlace = i;
      
      numSet.add(count);
      uniqueWords.add(str1);
      
      //start counting again
      count = 0;
      i--;
    }//end else
  }//endfor //<>//
  
  if(uniqueWords.get(0).equals(""))
  {
    totalWords = totalWords - numSet.get(0);
    uniqueWords.remove(0);
    numSet.remove(0);
  }//end if  
  
  println("totalWords" + totalWords);
  println("uniqueWords is now " + uniqueWords.size());
  println("allWords is " + allWords.size());
  println("numSet is " + numSet.size());
  
  for(int i = 0; i< numSet.size(); i++)
  {
    //println(uniqueWords.get(i) + " occurs " + numSet.get(i) + " times");
  }//end for

  sortNumbers();

}//end wordFrequency()

void sortNumbers()
{
  max = 0;
  
  //find max
  for(int i = 0; i < numSet.size(); i++)
  {
    if (numSet.get(i) > max)
    {
      max = numSet.get(i);
    }//end if
  }//end for
  
  //put numSet into  sorting.
  int sortedNumSet[] = new int[numSet.size()];
  for(int i = 0; i < numSet.size(); i++)
  {
    sortedNumSet[i] = numSet.get(i);
  }//end for
  
  //put uniqueWords into an array for sorting.
  String sortedUnique[] = new String[uniqueWords.size()];
  for(int i = 0; i < uniqueWords.size(); i++)
  {
    sortedUnique[i] = uniqueWords.get(i);
  }//end for
  
  //bubble sort
  for (int i = 0 ; i < numSet.size() - 1 ; i++)
  {
    for (int j = 0 ; j < numSet.size() - i - 1; j++)
    {
      if (sortedNumSet[j] < sortedNumSet[j+1]) /* For decreasing order use < */
      {
        String swapWord = sortedUnique[i];
        sortedUnique[j]   = sortedUnique[j+1];
        sortedUnique[j+1] = swapWord;
        
        int swapNum = sortedNumSet[j];
        sortedNumSet[j]   = sortedNumSet[j+1];
        sortedNumSet[j+1] = swapNum;
      }//end if
    }//end for
  }//end for
  
  //remove everything from the number and word array so they can be filled with the completely sorted versions
  numSet.clear();
  uniqueWords.clear();
  
  //fill the arraylists back up
  for(int i = 0; i < sortedNumSet.length; i++)
  {
    numSet.add(sortedNumSet[i]);
    uniqueWords.add(sortedUnique[i]);
  }//end for
  drawBarChart();

}//end sortNumbers

void drawBarChart()
{
  background(255);

  //calculate the closest multiple of 5 to the highest word amount. This is to prevent the graph ending on a weird number
  while(max % 5 !=0)
  {
    max++;
  }
  
  float border = height*.1f;
  float tick = (border/4);
  stroke(0);
  
  line(border-tick + globalX, height-border, width-border + globalX, height-border);//x axis
  line(border + globalX, height-border+tick, border + globalX,border);//y axis
  line(width-border + globalX, height-border, width - border + globalX, height - border + tick);//end mark
  
  text("0", border + globalX, height - border + tick);
  text(max, width - border + globalX, height - border + tick);
  
  //draw the bars
  for(int i = 0; i < 25 ; i++)
  {
    float w = map(numSet.get(i),0, max, 0, width-(border*2));
    float h = (float)(height-border*2)/25;
    float x = border + globalX;
    float y = border + (i*h);
    float alignWord = height*0.009;
    
    color colour = color(random(100,255),random(100,255),random(100,255));
    stroke(0);
    fill(colour);
    rect(x, y, w, h);
    
    fill(0);
    textSize(height*.02);
    text(uniqueWords.get(i), x + (alignWord), (y + h) - alignWord);
    text(numSet.get(i), x + w + alignWord, (y + h) - alignWord);
    
  }//end for
  
  //label the axes
  float x = border/2 + globalX;
  float y = height/1.5;
  
  textSize(height*.025);
  pushMatrix();
  translate(x,y);
  rotate(-HALF_PI);
  translate(-x,-y);
  text("25 most Frequent words", x,y);
  popMatrix();
  text("Word frequency", width/2.25 + globalX, height-(border/2));
  
  //drawWordCloud();
}//end drawBarChart()

/*void drawWordCloud()
{
  float max = 0;
  float min = 0;
  //find max
  for(int i = 0; i < numSet.size(); i++)
  {
    if (numSet.get(i) > max)
    {
      max = numSet.get(i);
    }//end if
  }//end for
  
  float centX = width/2;
  float centY = height/2;
  

     float x;
     float y;
     float offset = 0.0f; // Offset each iteration by this
     float bigRadius = 100;
     float smallRadius = 2;
     for (float theta = 0 ; theta < TWO_PI ; theta += TWO_PI)
     {
        for(int i = 0; i < uniqueWords.size(); i++) //<>//
        {
          float tSize = map(numSet.get(i), 1, max, 35, 350);
          textSize(tSize);
          x = centX + sin(theta + offset) * bigRadius;
          y = centY -cos(theta + offset) * bigRadius;
          fill(0);
          stroke(0);
          fill(random(255),random(255),random(255));
          text(uniqueWords.get(i), x, y);
          bigRadius += 10f;
          offset += 1f;
        }//end for       //<>//
     }      
}//end drawWordCloud()*/

void mousePressed()
{
  if(pressed == 1)
  {
    println("1");
  }//end if
  
  if(pressed == 2)
  {
    println("2");
  }//end if
  
  if(pressed == 3)
  {
    println("3");
  }//end if
  
  if(pressed == 4)
  {
    println("4");
  }//end if
  
  if(pressed == 5)
  {
    println("5");
  }//end if
}//end mousePressed()