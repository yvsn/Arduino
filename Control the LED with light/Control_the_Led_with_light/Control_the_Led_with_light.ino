int redLedPin = 9;
int greenLedPin = 10;
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
 sensorValue = constrain(sensorValue, 482, 856);
sensorValue = map(sensorValue, 482, 856, 255, 0);
 analogWrite(redLedPin, sensorValue);
 analogWrite(greenLedPin, sensorValue);
 Serial.println(sensorValue); // print out sensorValue to the Serial Monitor
 delay(20); // delay for 0.02 seconds
}
