import processing.serial.*;  
Serial myPort;  
String data="" ;
PFont  myFont;  
void setup()
{
size(1366,900); // size of processing window
background(0);// setting background color to black
myPort = new Serial(this, "COM3", 9600);
myPort.bufferUntil('\n');
}
void draw()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  text(data,820,400);
  textSize(100);
  fill(#4B5DCE);
  text("              Distance : duration       cm",450,400);
  rect(40,40, float(data), float(data));
   noFill();
   stroke(#4B5DCE);
   
  
}
void serialEvent(Serial myPort)
{

    data=myPort.readStringUntil('\n');
}
