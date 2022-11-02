import processing.video.*;
import jp.nyatla.nyar4psg.*;
PImage img;
Capture cam;
MultiMarker nya;

void setup() {
  size(640,480,P3D);
  
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiMarker(this,width,height,"../simpleLite/data/camera_para.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addARMarker("../simpleLite/data/patt.hiro",80);
  cam.start();
   img = loadImage("batmanos.png");
}

void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
 
  nya.drawBackground(cam);
  

  if((!nya.isExist(0))){
    return;
  }
  nya.beginTransform(0);
  fill(0,0,255);
 image(img, 0,0);
 scale(100,100,100);

   
  nya.endTransform();
}
