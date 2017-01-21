/******************************
* Bilberry Goats Exhibition
* SOMA Gallery Waterford City
* January 2017
* South East Makerspace 
* Licence: GPL 3.0
******************************/

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
