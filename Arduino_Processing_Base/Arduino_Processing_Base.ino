float sensorValue = 0; // variable for sensor value
int sensorPin = A0; // variable for sensor pin
void setup() {
 Serial.begin(9600); // Start the Serial connection at a
 // speed of 9600 bps
 pinMode(sensorPin, INPUT); // Input pin for potmeter or LDR
 pinMode(greenLedPin, OUTPUT); // Output pin for LED
}
void loop() {
 sensorValue = analogRead(sensorPin); // Read the value/current on the sensor pin and
 // store that value in the variable sensorValue
 sensorValue = (sensorValue/1023)*255; // Rescale the sensor's value
 // Change the values 1023 and 255 to calibrate the sensor
 Serial.println(sensorValue); // Print the sensorValue to the serial
 // connection
 delay(100);
}
