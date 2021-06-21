import processing.video.Capture;
import gab.opencv.OpenCV;
import gab.opencv.Contour;
import java.awt.*;

//arduino port
import processing.serial.*;
int end = 10; 
String receivedString;
Serial myPort;
Capture cam;
OpenCV opencv;

// input resolution
int w = 640, h = 360;

// output zoom
int zoom = 2;

// target frameRate
int fps = 30;

// contour threshold ( 0 .. 255)
int threshold = 100;

// display options
boolean showOutput = true;
boolean showContours = true;
boolean showPolys = true;

// drawing style
boolean fillShapes;
color contourColor = color(255, 50, 50, 150);
color polyColor = color(50, 255, 50, 150);


void setup() {
  myPort= new Serial(this, Serial.list()[1], 9600);
  myPort.clear();
  receivedString = myPort.readStringUntil(end);
  // actual size is a result of input resolution and zoom factor
  size(1280, 720);

  // limit redrawing to the target frame rate
  frameRate(fps);

  // capture camera with input resolution and target frame rate
  cam = new Capture(this, w, h, fps);
  cam.start();

  // init OpenCV with input resolution 
  opencv = new OpenCV(this, w, h);
  opencv.gray();

  // drawing style
  smooth();
  strokeWeight(2);
  strokeJoin(ROUND);
}


void draw() {

  background(255);
  while (myPort.available () > 0) { //as long as there is data coming from serial port, read it and store it 
    receivedString = myPort.readStringUntil(end);
  }
  if (receivedString != null) { 
    String[] a = split(receivedString, ',');  // a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
   
    int distance = Integer.parseInt(a[0].trim()); // This is probably the scariest line of code here. For now, you...
    int light = Integer.parseInt(a[1].trim()); // ...just need to know that it converts the string into an integer.
    int heat = Integer.parseInt(a[2].trim());
    light /= 3;
   heat /= 3;
     println(distance); //print the first string value of the array
    println(light); //print to the console the second string value
    println(heat);
    if (distance > 255) {
      distance= 255;
    }

    contourColor = color(distance+heat, 0, 0, light);
    polyColor = color(heat, distance*2, distance/2, light);
    // read a single frame
    opencv.loadImage(cam);

    // init OpenCV for thresholding
    opencv.gray();
    opencv.threshold(threshold);

    // find contours
    ArrayList<Contour> contours = opencv.findContours();

    // zoom to input resolution
    scale(zoom);

    // get output image
    PImage output = opencv.getOutput();

    // Show camera or OpenCV input
    image(showOutput ? output : cam, 0, 0);


    // draw on top of output image
    for (Contour contour : contours) {

      fill(distance, fillShapes ? 150 : 0);
      // draw the contour
    

        stroke(contourColor);
        contour.draw();
      

      // draw a polygonal approximation

        stroke(polyColor);
        beginShape();
        for (PVector point : contour.getPolygonApproximation().getPoints()) {
          vertex(point.x, point.y);
          
        }
        endShape(CLOSE);
      
    }
  }
}


void captureEvent(Capture cam) {
  cam.read();
}
