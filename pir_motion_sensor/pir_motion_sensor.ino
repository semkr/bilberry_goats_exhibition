/******************************
* Bilberry Goats Exhibition
* SOMA Gallery Waterford City
* January 2017
* South East Makerspace 
* Licence: GPL 3.0
******************************/

#define SENSOR_1  2
#define SENSOR_2  3
#define SENSOR_3  4
#define SENSOR_4  5

#define PIN_OUT 8


/**
 * Read the value from each sensor each second
 * Print output to the serial 0 low, 1 high, one value per sensor
 * eg: 0,0,1,0\n
 */
void read_sensors(){
  int val1 = digitalRead(SENSOR_1);
  int val2 = digitalRead(SENSOR_2);
  int val3 = digitalRead(SENSOR_3);
  int val4 = digitalRead(SENSOR_4);
  Serial.println(String(val1) + "," + String(val2) + "," + String(val3) + "," + String(val4));
  delay(1000);
}


void setup(){
  Serial.begin(9600);
  
  pinMode(SENSOR_1,  INPUT);
  pinMode(SENSOR_2,  INPUT);
  pinMode(SENSOR_3,  INPUT);
  pinMode(SENSOR_4,  INPUT);
  
  pinMode(PIN_OUT, OUTPUT);
}

void loop(){
  read_sensors();
}
