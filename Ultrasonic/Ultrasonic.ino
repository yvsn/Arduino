const int echoPin = 6;
const int trigPin = 7;
int ledPin = 8;
void setup() {
pinMode(echoPin, INPUT);
pinMode(trigPin, OUTPUT);
Serial.begin(9600);
pinMode(ledPin, OUTPUT);
}
void loop() {
// send a pulse
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
digitalWrite(trigPin, HIGH);
delayMicroseconds(5);
digitalWrite(trigPin, LOW);
// wait for the echo
long duration = pulseIn(echoPin, HIGH);
// convert the time into a distance, the speed of sound is 29 microseconds per centimeter,
//the pulse traveled forth and back, so we divided the distance by 2
int cm = duration / 29 / 2;
Serial.print(cm);
//if the measured distance is lower than 50 cm, turn on LED
if(cm<50){
digitalWrite(ledPin, HIGH);
}
//else turn off LED
else{
 digitalWrite(ledPin, LOW);
}
delay(100);
}
