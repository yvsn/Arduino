int ledPin = 13;
int sensorPin = A0;
void setup() {
 pinMode(ledPin, OUTPUT);
 pinMode(sensorPin, INPUT);
 Serial.begin(9600);
}
void loop() {
 int sensorValue = analogRead(sensorPin); // read sensorpin
 Serial.println(sensorValue); // print to serial monitor
 delay(10); // wait

 if (sensorValue > 550) { //if the temperature measured is above the value 550
  digitalWrite(13,HIGH);  //turn the LED on
 }
 else{                    //if the temperature measured is under the value of 550
   digitalWrite(13,LOW);  //turn the LED off
 }
}
