int speakerPin = 8;
void setup() {
 pinMode(speakerPin, OUTPUT);
}
void loop() {
 tone(speakerPin, 262, 200); // plays a tone of 262Hz for 200ms
 delay(250); // wait 250 ms
 tone(speakerPin, 294, 200); // plays a tone of 294Hz for 200ms
 delay(250); // wait 250 ms
 tone(speakerPin, 330, 200); // plays a tone of 330Hz for 200ms
 delay(250); // wait 250 ms
 tone(speakerPin, 262, 200); // plays a tone of 262Hz for 200ms
 delay(500); // wait 500 ms
}
