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
 analogWrite(greenLedPin, sensorValue);
 Serial.println(sensorValue); // print out sensorValue to the Serial Monitor
 delay(20); // delay for 0.02 seconds
}
