int speakerPin = 8;
int i=0;
void setup() {
 pinMode(speakerPin, OUTPUT);
}
void loop() {
  for(i=500;i<900;i++){ //loop for increasing frequencies between 500 and 900 hz
  tone(8,i);
  delay(20); //20ms delay
  }
  for(i=900;i>500;i--){ //loop for decreasing frequencies between 500 and 900 hz
  tone(8,i);
  delay(20); //20ms delay
  }
}
