//Colin White c14509343
// A program to analyse the words of a song (or any text file)
import ddf.minim.*;

//variables to allow movement
float globalY;
int hover = 0;
int pressed = 0;
int arrowKey = 0;
int m = 0;

//variables for the words
int totalWords = 0;
int max = 0;
String[] lyrics;
color[] colourArray = new color[25];
ArrayList<Integer> numSet = new ArrayList<Integer>();
ArrayList<String> allWords = new ArrayList<String>();
ArrayList<String> uniqueWords = new ArrayList<String>();

//make the image variables
PImage itaots;
PImage illinois;
PImage arthur;
PImage animals;
PImage lastchristmas;

//variables to allow the songs to play
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
Minim minim;

void setup()
{
  size(1600,900);
  background(255);
  stroke(0);
  fill(255);
  int side = height/9;
  itaots = loadImage("ITAOTS.jpg");
  itaots.resize(side, side);
  
  illinois = loadImage("Illinois.jpg");
  illinois.resize(side, side);

  arthur = loadImage("Arthur.jpg");
  arthur.resize(side, side);

  animals = loadImage("Animals.jpg");
  animals.resize(side, side);

  lastchristmas = loadImage("lastchristmas.jpg");
  lastchristmas.resize(side, side);
  
  minim = new Minim(this);
  song1 = minim.loadFile("The King Of Carrot Flowers Pt. One.mp3", 2048);
  song2 = minim.loadFile("Casimir Pulaski Day.mp3", 2048);
  song3 = minim.loadFile("Shangri-La.mp3", 2048);
  song4 = minim.loadFile("Dogs.mp3", 2048);
  song5 = minim.loadFile("Last Christmas.mp3", 2048);
 
}//end setup

void draw()
{  
  menu();
  if(pressed == 1)
   {
     if( globalY != - height)
     {
       globalY -=20;
       loadData();
       menu();
     }//end if    
     else
     { 
       arrowKey = 1;
       pressed = 0;
     }//end else
   }//end for
   
   if(arrowKey == 2)
   {
     if( globalY != - 2*height)
     {
       globalY -=20;
       loadData();
     }//end if  
     else
     {
       arrowKey = 1;
     }//end else
   }//end if
   
   if(arrowKey == 3)
   {
     if( globalY == - height)
     {
       arrowKey = 1;
     }//end if  
     
     else
     {
       
       globalY +=20;
       loadData();
       menu();
     }//end else
   }//end if
   
   if (m == 1)
   {
     if( globalY != 0)
     {
       globalY +=20;
       loadData();
       menu();
     }//end else if 
     else
     {
       arrowKey = 0;
       m = 0;
     }//end else
   }//end if
   

}//end draw
void menu()
{
   hover = 0; 
   //draw the menu
   float x = width/3;
   float w = width/4;
   float h = height/9;
  
   //put the images on the screen
   image(itaots, x, height*.2 + globalY);
   image(illinois, x, height*.32 + globalY);
   image(arthur, x, height*.44 + globalY);
   image(animals, x, height*.56 + globalY);
   image(lastchristmas, x, height*.68 + globalY);
   
   float boxX = x + (x*.206);
   //draw the boxes
   //1
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.2 + globalY && mouseY < (height*.2 + h + globalY))
   {
     fill(240);
     hover = 1;
   }//end if
   else
   {
     
     fill(255);
   }
   rect(boxX, height*.2 + globalY, w, h);
   
   //2
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.32 + globalY && mouseY < (height*.32 + h + globalY))
   {
     fill(240);
     hover = 2;
   }//end if
   else
   {
     fill(255);
   }
   rect(boxX, height*.32 + globalY, w, h);
   
   //3
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.44 + globalY && mouseY < (height*.44 + h + globalY))
   {
     fill(240);
     hover = 3;
   }//end if
   else
   {
     fill(255);
   }
   rect(boxX, height*.44 + globalY, w, h);
   
   //4
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.56 + globalY && mouseY < (height*.56 + h + globalY))
   {
     fill(240);
     hover = 4;
   }//end if
   else
   {
     fill(255);
   }
   rect(boxX, height*.56 + globalY, w, h);
   
   //5
   if(mouseX > boxX && mouseX < (boxX + w) && mouseY > height*.68 + globalY&& mouseY < (height*.68 + h + globalY))
   {
     fill(240);
     hover = 5;
   }//end if
   else
   {
     fill(255);
   }
   rect(boxX, height*.68 + globalY, w, h);
   
   //put the info in and line it up
   fill(0);
   textSize(height * .020);
   text("The King of Carrot Flowers Pt. One", x+(x*.29), height*.255 + globalY);
   text("- Neutral Milk Hotel", x+(x*.4), height*.28 + globalY);
   text("Casimir Pulaski Day - Sufjan Stevens", x+(x*.275), height*.38 + globalY);
   text("Shangri-La - The Kinks", x+(x*.38), height*.5 + globalY);
   text("Dogs - Pink Floyd", x+(x*.43), height*.62 + globalY);
   text("Last Christmas - Wham!", x+(x*.373), height*.743 + globalY);
   
}//end menu()
void keyPressed()
{
  if(arrowKey == 1)
  {
    if (key == CODED) 
    {
      if (keyCode == DOWN) 
      {
         arrowKey = 2;
      }//end if
      
      if (keyCode == UP)
      {
         arrowKey = 3;
      }//end if
    }//end if
  }//end if
  
  if (key == 'm') 
    {
      m = 1;
    }//end if
  
}//end keyPressed()
void mousePressed()
{
  if(hover == 1)
  {
    background(255);
    pressed = 1;
    //close them all
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    
    song2.rewind();
    song3.rewind();
    song4.rewind();
    song5.rewind();
    
    song1.play();
    lyrics = loadStrings("KoCF.txt");  
    loadData();
  }//end if
  
  if(hover == 2)
  {
    background(255);
    song1.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    
    song1.rewind();
    song3.rewind();
    song4.rewind();
    song5.rewind();
    
    song2.play();
    pressed = 1;
    lyrics = loadStrings("CasimirPulaskiDay.txt");  
    loadData();
  }//end if
  
  if(hover == 3)
  {
    background(255);
    song1.pause();
    song2.pause();
    song4.pause();
    song5.pause();
    
    song1.rewind();
    song2.rewind();
    song4.rewind();
    song5.rewind();
    
    song3.play();
    pressed = 1;
    lyrics = loadStrings("ShangriLa.txt");  
    loadData();
  }//end if
  
  if(hover == 4)
  {
    background(255);
    song1.pause();
    song2.pause();
    song3.pause();
    song5.pause();
    
    song1.rewind();
    song2.rewind();
    song3.rewind();
    song5.rewind();
    
    song4.play();
    pressed = 1;
    lyrics = loadStrings("Dogs.txt");  
    loadData();
  }//end if
  
  if(hover == 5)
  {
    background(255);
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    
    song1.rewind();
    song2.rewind();
    song3.rewind();
    song4.rewind();
    
    
    song5.play();
    pressed = 1;
    lyrics = loadStrings("LastChristmas.txt");  
    loadData();
  }//end if
  
  if(pressed == 1)
  {
    for (int i = 0 ; i < 25; i++)
    {
      colourArray[i] = color(random(100,255),random(100,255),random(100,255));
    }//end for
  }//end if

}//end mousePressed()
void loadData()
{
  
  //for loop to split the words up and put them in a new array
  for(int i = 0; i < lyrics.length; i++)
  {
    //println(lyrics[i]);
    //change everything to lowercase, replace full stops and commas with spaces and split at a space
    String temp = trim(lyrics[i]).toLowerCase().replaceAll("\\.", "").replaceAll(",", "").replaceAll("\\?", "").replaceAll("!", "").replaceAll("\"", "");
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
  for(int i = 0 ; i < allWords.size(); i++) //<>//
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
  
  for(int i = 0; i < numSet.size(); i ++)
  {
    println(numSet.get(i) + uniqueWords.get(i));
    println(" before sort \n");
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
  
  println(max);
  
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
  
  //insertion sort to sort them by numerical order, largest to smallest
  int j;
  for (int i = 1 ; i <= numSet.size() - 1; i++) 
  {
    j = i;
 
    while (j > 0 && sortedNumSet[j] > sortedNumSet[j-1]) 
    {
      String swapWord = sortedUnique[j];
      sortedUnique[j] = sortedUnique[j-1];
      sortedUnique[j-1] = swapWord;
      
      int swapNum = sortedNumSet[j];
      sortedNumSet[j]   = sortedNumSet[j-1];
      sortedNumSet[j-1] = swapNum;
 
      j--;
    }
  }
  
  //remove everything from the number and word array so they can be filled with the completely sorted versions
  numSet.clear();
  uniqueWords.clear();
  
  //fill the arraylists back up
  for(int i = 0; i < sortedNumSet.length; i++)
  {
    numSet.add(sortedNumSet[i]);
    uniqueWords.add(sortedUnique[i]);
  }//end for
  
  for(int i = 0; i < numSet.size(); i ++)
  {
    println(numSet.get(i) + uniqueWords.get(i));
    println("after sortll\n");
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
  float offset = height;
  stroke(0);
  
  line(border-tick, height-border + globalY + offset, width-border, height-border + globalY + offset);//x axis
  line(border, height-border+tick + globalY + offset, border,border + globalY + offset);//y axis
  line(width-border, height-border + globalY + offset, width - border, height - border + tick + globalY + offset);//end mark
   //<>//
  text("0", border*.935, height - border + tick*2 + globalY + offset);
  text(max, width - border*1.1, height - border + tick*2 + globalY + offset);
  
  //draw the bars //<>//
  for(int i = 0; i < 25 ; i++)
  {
    float w = map(numSet.get(i),0, max, 0, width-(border*2));
    float h = (float)(height-border*2)/25;
    float x = border;
    float y = border + (i*h) + globalY + offset;
    float alignWord = height*0.009;
    
    stroke(0);
    fill(colourArray[i]);
    rect(x, y, w, h);
    
    
    fill(0);
    textSize(height*.02);
    text(uniqueWords.get(i), x + (alignWord), (y + h) - alignWord);
    text(numSet.get(i), x + w + alignWord, (y + h) - alignWord);
    
  }//end for
   //<>//
  //label the axes
  float x = border/2;
  float y = height/1.5 + globalY + offset;
  
  textSize(height*.025);
  pushMatrix();
  translate(x,y);
  rotate(-HALF_PI);
  translate(-x,-y);
  text("25 most Frequent words", x,y);
  popMatrix();
  text("Word frequency", width/2.25, height-(border/2) + globalY + offset);

  drawWordCloud();
}//end drawBarChart()

void drawWordCloud()
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
  
  float yOffset = 2*height + globalY;
  float centX = width/3;
  float centY = height/2;
  

  float x;
  float y;
  float offset = 0.0f; // Offset each iteration by this
 
  float bigRadius = 100;
  float smallRadius = 2;
  for (float theta = 0 ; theta < TWO_PI ; theta += TWO_PI)
  {
    for(int i = 0; i < 25; i++)
    {
      float tSize = map(numSet.get(i), 1, max, 30, 300);
      textSize(tSize);
      x = centX + sin(theta + offset) * bigRadius;
      y = centY -cos(theta + offset) * bigRadius + yOffset;
      fill(0);
      stroke(0);
      fill(colourArray[i]);
      ellipse(x, y, tSize, tSize);
      bigRadius += 10f;
      offset += 1f;
    }//end for      
 } 
     
  uniqueWords.clear();
  numSet.clear();
  allWords.clear();
}//end drawWordCloud()