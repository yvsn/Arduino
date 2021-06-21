/*
  Blink

  Turns an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the UNO, MEGA and ZERO
  it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
  the correct LED pin independent of which board is used.
  If you want to know what pin the on-board LED is connected to on your Arduino
  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products

  modified 8 May 2014
  by Scott Fitzgerald
  modified 2 Sep 2016
  by Arturo Guadalupi
  modified 8 Sep 2016
  by Colby Newman

  This example code is in the public domain.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/Blink
*/
int redLedPin = 10;
int greenLedPin = 9;
int sensorValue = 0; // variable for sensor value
int sensorPin = A0; // variable for sensor pin
void setup() {
 pinMode(redLedPin, OUTPUT);
 pinMode(greenLedPin, OUTPUT);
 pinMode(sensorPin, INPUT);
 Serial.begin(9600);
}
void loop() {
 sensorValue = analogRead(sensorPin); // read the value/voltage on the sensor pin and
 // store that value in the variable sensorValue
sensorValue = map(sensorValue, 0, 1023, 0, 255);
 analogWrite(redLedPin, sensorValue);
 analogWrite(greenLedPin, - sensorValue);
 Serial.println(sensorValue); // print out sensorValue to the Serial Monitor
 delay(20); // delay for 0.02 seconds
}
