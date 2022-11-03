import processing.video.*;
import qrcodeprocessing.*;

Capture video;                                 
String statusMsg = "Waiting for an image";     

Decoder decoder;

void setup() {
  size(640, 500);
  video = new Capture(this, "pipeline:autovideosrc");
  video.start();

  
  decoder = new Decoder(this);
  
}



void decoderEvent(Decoder decoder) {
  statusMsg = decoder.getDecodedString();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);


  
  image(video, 0, 0);
  
  text(statusMsg, 10, height-4);

  
  if (decoder.decoding()) {
    
    PImage show = decoder.getImage();
   image(show, 0, 0, show.width/4, show.height/4); 
    statusMsg = "Decoding image";
    for (int i = 0; i < (frameCount/2) % 10; i++) statusMsg += ".";
  }
}

void keyReleased() {
  
  switch (key) {
  case ' ':        
     PImage savedFrame = createImage(video.width, video.height, RGB);
    savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    savedFrame.updatePixels();
    decoder.decodeImage(savedFrame);
    link(statusMsg);

    
    break;
 
    
    
  }
}
