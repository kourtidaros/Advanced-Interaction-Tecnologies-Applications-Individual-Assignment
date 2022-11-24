import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV opencv;

void setup() {
  size(1000, 1000);
  video = new Capture(this, 1000, 1000);
  video.start();
  
  opencv = new OpenCV(this, 1000, 1000);

  opencv.startBackgroundSubtraction(5, 8, 0.2);

  
  
  video.start();
}

void draw() {
  image(video, 0, 0);

  if (video.width == 0 || video.height == 0)
    return;

  opencv.loadImage(video);
  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(0, 255, 0);
  strokeWeight(2);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void captureEvent(Capture video) {

  video.read();
}
