PImage img; 

import qrcodeprocessing.*;

Decoder decoder;

void setup() {
  size(600, 600);
 
  img = loadImage("qrcode.png");
  
  decoder = new Decoder(this);
  decoder.decodeImage(img);
}

void decoderEvent(Decoder decoder) {
  String statusMsg = decoder.getDecodedString(); 
  println(statusMsg);
  link(statusMsg);
 
} 


void draw() {
  background(0);
  image(img, 0, 0, width, height);
}
