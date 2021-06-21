int redLedPin = 10;
int greenLedPin = 9;

void setup() {
 pinMode(redLedPin, OUTPUT);
 pinMode(greenLedPin, OUTPUT);
}
void loop() {
 for (int brightness=0; brightness <256; brightness++){
 analogWrite(redLedPin, brightness);
 analogWrite (greenLedPin, - brightness);
 delay(10);
 }
}
