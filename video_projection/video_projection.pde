import processing.serial.*;

/******************************
* Bilberry Goats Exhibition
* SOMA Gallery Waterford City
* January 2017
* South East Makerspace 
* Licence: GPL 3.0
******************************/
import processing.video.*;

Movie myMovie1, myMovie2;
boolean isPlaying1, isPlaying2;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port


void setup() {
  fullScreen();
  background (0);
  frameRate(30);

  myMovie1 = new Movie(this, dataPath("1.mp4"));
  myMovie2 = new Movie(this, dataPath("2.mp4"));

  myMovie1.loop();
  myMovie2.loop();
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}


void draw() {
  noCursor();
  
  try {
    if ( myPort.available() > 0) 
    {  // If data is available,
      val = myPort.readStringUntil('\n');         // read it and store it in val
      if(val.equals("1")){ isPlaying1 = true; isPlaying2 = true;} else { isPlaying1 = false; isPlaying2 = false; }
    }
  } catch(Exception e) {
    e.printStackTrace();
  }
  delay(100);

  if(isPlaying1){
    myMovie1.play();
    image(myMovie1, 0, 250, 600, 337); //aspect3:4
  }
  
  if(isPlaying2){
    myMovie2.play();
    image (myMovie2, 575, 75, 400, 225); //aspect3:4
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
}


void keyReleased()
{
  if(key=='q'){
    isPlaying1 = false;
  }
  if(key=='w'){
    isPlaying2 = false;
  }
}


void movieEvent(Movie m) {
  m.read();
}
