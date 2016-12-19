import processing.serial.*;

/******************************
* Bilberry Goats Exhibition
* SOMA Gallery Waterford City
* January 2017
* South East Makerspace 
* Licence: Apache 2.0
******************************/

// Goat Files 1080 x 1440
// Sony Projector resolution 1024 x 768
// Hitachio 1920 x 1080

import processing.video.*;

ovie myMovie1, myMovie2, myMovie3, myMovie4;
boolean isPlaying1, isPlaying2, isPlaying3, isPlaying4;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port


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
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}


void draw() {
  // if (mousePressed == true){ noCursor(); } // Hide the cursor when the left mouse button is pressed
  noCursor();
  
  if ( myPort.available() > 0) 
  {  // If data is available,
    val = myPort.readStringUntil('\n');         // read it and store it in val
    String[] list = split(val, ',');
    if(list != null && list.length == 4){
      if(list[0].equals("1")){ isPlaying1 = true; } else { isPlaying1 = false; }
      if(list[1].equals("1")){ isPlaying2 = true; } else { isPlaying2 = false; }
      if(list[2].equals("1")){ isPlaying3 = true; } else { isPlaying3 = false; }
      if(list[3].equals("1")){ isPlaying4 = true; } else { isPlaying4 = false; }
    }
  } 
  delay(100);

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
