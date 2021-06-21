int redLedPin = 10;
int greenLedPin = 9;
int sensorValueRed = 0; // variable for sensor value
int sensorValueGreen = 0;
int sensorPin = A0; // variable for sensor pin
void setup() {
 pinMode(redLedPin, OUTPUT);
 pinMode(greenLedPin, OUTPUT);
 pinMode(sensorPin, INPUT);
 Serial.begin(9600);
}
void loop() {
 sensorValueRed = analogRead(sensorPin);
 sensorValueGreen = analogRead(sensorPin);// read the value/voltage on the sensor pin and
 // store that value in the variable sensorValue
 sensorValueRed = map(sensorValueRed, 0, 1023, 0, 255);
 sensorValueGreen = map(sensorValueGreen, 0, 1023, 255, 0);
 analogWrite(redLedPin, sensorValueRed);
 analogWrite(greenLedPin, sensorValueGreen);
 Serial.println(sensorValueRed); // print out sensorValue to the Serial Monitor
 Serial.println(sensorValueGreen); // print out sensorValue to the Serial Monitor
 delay(20); // delay for 0.2 seconds
}
