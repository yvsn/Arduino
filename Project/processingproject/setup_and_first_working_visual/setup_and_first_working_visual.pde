import gab.opencv.*;
import processing.video.*;
import java.awt.*;

//arduino port
import processing.serial.*;
Capture video;
OpenCV opencv;
int end = 10; 
String receivedString;
Serial myPort;

/*float x= 50;
float y=50;
float angle = 90;


int cols,rows;
int scl = 20;
int w = 1280;
int h = 720;
*/

float sw,alpha;
float arcSize;
float yStep;



void setup() {
  size(1280, 720);  
  smooth(2);
  // add correct port Yannik
  myPort= new Serial(this, Serial.list()[0], 9600);
  myPort.clear();
  receivedString = myPort.readStringUntil(end);
  video = new Capture(this, 1280/2, 720/2);
  opencv = new OpenCV(this, 1280/2, 720/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  strokeCap(SQUARE);
  video.start();
  
/*  cols= w/scl;
  rows = h/scl;
  */
}

void draw() {
  background(255);
  scale(2);
  opencv.loadImage(video);
  //image(video, 0, 0 );
  stroke(0);
  strokeWeight(0.3);
  Rectangle[] faces = opencv.detect();
  //println(faces.length);





  for (int i = 0; i < faces.length; i++) {

    while (myPort.available () > 0) { //as long as there is data coming from serial port, read it and store it 
      receivedString = myPort.readStringUntil(end);
    }
    if (receivedString != null) {  //if the string is not empty, print the following

      /*  Note: the split function used below is not necessary if sending only a single variable. However, it is useful for parsing (separating) messages when
       reading from multiple inputs in Arduino.
       */

      String[] a = split(receivedString, ',');  // a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
      println(a[0]); //print the first string value of the array
      println(a[1]); //print to the console the second string value
      println(a[2]);
      int distance = Integer.parseInt(a[0].trim()); // This is probably the scariest line of code here. For now, you...
      int light = Integer.parseInt(a[1].trim()); // ...just need to know that it converts the string into an integer.
      int heat = Integer.parseInt(a[2].trim());

      // sketch starts here 
      
faces[i].x = constrain(faces[i].x,10,width/4);
faces[i].y = constrain(faces[i].y,10,height/4);
     
     yStep= faces[i].y;
     arcSize= faces[i].x;
      noFill();
      stroke(20);
      
      for(float y=+arcSize/2; y<height-arcSize/2; y+=yStep){
        sw = map(sin(radians(y+alpha)), -1,1,2,yStep);
      strokeWeight(sw);
      for(float x1=arcSize/2; x1<width+arcSize; x1+=arcSize){
        arc(x1,y,arcSize/2,arcSize/2,0,PI);
      }
      sw= map(sin(radians(y-alpha)),-1,1,2,yStep);
      strokeWeight(sw);
      for(float x2= 0; x2<width+arcSize; x2+=arcSize){
      arc(x2,y,arcSize/2,arcSize/2,PI, TWO_PI); 
      }
      }
      alpha++;
      
      
      
      
      
      
      
 /*     for (int y=0; y<rows; y++){
      beginShape(TRIANGLE_STRIP);
      for(int x= 0; x <cols; x++){
      vertex(x*scl, y*scl);
        }
         endShape();
      }
      
     
      
/*       translate(width/4, height/4);
      rotate(radians(angle/3));
      for(float w=0; w<360; w+=30){
      pushMatrix();
      if(angle<360) rotate(radians(w)*cos(radians(angle)));
      else rotate(radians(w));
      stroke(0);
      strokeWeight(2);
      line(x*sin(radians(angle)),0,x,y);
      popMatrix();
      }
      angle++;
/*      float red = 200;
      float green = 150;
      float blue = 140;
      float alpha = 100;

      //fill(100+float(distance)*2, 0, 255-float(light)*2, 50);
      stroke(red, green, blue, alpha);
      strokeWeight(3);
      fill(red, green, blue, alpha);

      if (distance > 500) {
        red = random(150, 200);
        alpha = random(0, 50);
      }
      if (heat > 30) {
        red = 255;
      }
      if (light > 5) {
        green = random(50, 100);
        alpha = random(15, 25);
      } else if (light < 20) {
        blue = 50;
      } else if (light > 100) {
        fill(0, 255);
        alpha = random(50, 150);
      }



      ellipse(faces[i].x, faces[i].y, faces[i].width/2, faces[i].height/2);
      // ellipse(faces[i].x+50, faces[i].y+50, faces[i].width, faces[i].height);
      translate(width/4, height/4); 
      int circleResolution = int(map(faces[i].x, 0, faces[i].y, 2, 80));

      int radius =  (faces[i].x + faces[i].y)/2 - light;
      float angle = circleResolution;

      beginShape(LINES);
      for (int z = 0; z <= circleResolution; z++) {
        float x = (cos(angle * z) * radius);
        float y = sin(angle * z) * radius;
        vertex(x, y);
        vertex(x+ faces[i].x, y + faces[i].x);
        vertex(x, y + 50);
         vertex(x- faces[i].x, y - faces[i].x);
       // line(x, y, faces[i].x, faces[i].y);
      }
    //  endShape();  



      */  

      // ends here
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}
