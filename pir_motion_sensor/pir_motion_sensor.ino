/**
 * trashtalk - Interactive Rubbish Bin
 * 
 * A South East Makerspace project developed for the Waterford Imagine Festival 2016 
 * Github: https://github.com/semkr/digistreets
 * Wiki: https://wiki.southeastmakerspace.org/projects/digistreets/talking_rubbish/start
 * Version: 0.1.0
 */

#define SENSOR_1  2


/**
 * Read the value from each sensor each second
 * Print output to the serial 0 low, 1 high, one value per sensor
 * eg: 1,0\n
 */
void read_sensors(){
  int val1 = digitalRead(SENSOR_1);

  if(val1 == HIGH){
    for(int count = 0; count < 5; count++){
      Serial.println(String(HIGH));
      delay(1000);
    }
  }
  else{
    Serial.println(String(LOW));
  }
  delay(1000);
}


void setup(){
  Serial.begin(9600);
  
  pinMode(SENSOR_1,  INPUT);
}

void loop(){
  read_sensors();
}
