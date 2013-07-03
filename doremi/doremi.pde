import org.jbox2d.p5.*;
import ddf.minim.*;

Physics physics;
Minim minim;
AudioSample d, re, mi, fa, so, ra, si, d1;

void setup() {
  size(480, 320);
  frameRate(60);
  
  //maru
  physics = new Physics(this, width, height);
  physics.setDensity(1.0); //重さ(密度)
  physics.setRestitution(0.2); //反発係数
  physics.setFriction(0.0); //摩擦係数
  
  //doremi
  minim = new Minim(this);
  d  = minim.loadSample("do.mp3", 2048);
  re = minim.loadSample("re.mp3", 2048);
  mi = minim.loadSample("mi.mp3", 2048);
  fa = minim.loadSample("fa.mp3", 2048);
  so = minim.loadSample("so.mp3", 2048);
  ra = minim.loadSample("ra.mp3", 2048);
  si = minim.loadSample("si.mp3", 2048);
  d1 = minim.loadSample("do1.mp3", 2048);
}

void draw() {
  background(255);
}

void keyPressed(){
  if(key == 'd'){
    physics.b2Color(255, 50, 50);
    physics.createCircle(mouseX, mouseY, 15);
  }
  if(key == 'r'){physics.createCircle(mouseX, mouseY, 15);}
  if(key == 'm'){
    float d = 5;
    physics.createRect(mouseX - d * 2, mouseY - d, mouseX + d * 2, mouseY + d);
  }
}
