/******************************
* - Bilberry Goats Exhibition -
* SOMA Gallery Waterford City
* January 2017
* South East Makerspace
* Licence: Apache 2.0
******************************/

import processing.video.*;

Movie myMovie1, myMovie2, myMovie3, myMovie4;
boolean isPlaying1, isPlaying2, isPlaying3, isPlaying4;


void setup() {
  fullScreen();
  background (0);
  frameRate(30);

  myMovie1 = new Movie(this, dataPath("1.mp4"));
  myMovie2 = new Movie(this, dataPath("2.mp4"));
  myMovie3 = new Movie(this, dataPath("3.mp4"));
  myMovie4 = new Movie(this, dataPath("4.mp4"));

  myMovie1.loop();
  myMovie2.loop();
  myMovie3.loop();
  myMovie4.loop();
}


void draw() {
  if (mousePressed == true) { noCursor(); } // Hide the cursor when the left mouse button is pressed

  if(isPlaying1){
    myMovie1.play();
    image(myMovie1, 0, 0);
  } else{
    fill (0);
    rect (0, 0, displayWidth/2, displayHeight/2);
  }
  
  if(isPlaying2){
    myMovie2.play();
    image (myMovie2, displayWidth/2, 0);
  } else{
    fill(0);
    rect (displayWidth/2, 0, displayWidth, displayHeight/2);
  }
  
  if(isPlaying3){
    myMovie3.play();
    image (myMovie3, 0, displayHeight/2);
  } else{
    fill(0);
    rect (0, displayHeight/2, displayWidth/2, displayHeight);
  }
  
  if(isPlaying4){
    myMovie4.play();
    image (myMovie4, displayWidth/2, displayHeight/2);
  } else{
    fill(0);
    rect (displayWidth/2, displayHeight/2, displayWidth, displayHeight);
  }
}


void keyPressed()
{
  if(key=='q'){
    isPlaying1 = true;
  }
  if(key=='w'){
    isPlaying2 = true;
  }
  if(key=='e'){
    isPlaying3 = true;
  }
  if(key=='r'){
    isPlaying4 = true;
  }
}


void keyReleased()
{
  if(key=='q'){
    isPlaying1 = false;
  }
  if(key=='w'){
    isPlaying2 = false;
  }
  if(key=='e'){
    isPlaying3 = false;
  }
  if(key=='r'){
    isPlaying4 = false;
  }
}


void movieEvent(Movie m) {
  m.read();
}