
import processing.serial.* ;
import cc.arduino.* ;

Arduino arduino ;

int Xi = 0;
int Yi = 1;
int Zi = 2;

void setup() {
   size( 200 , 200 ) ;

   println( Arduino.list() ) ;
   arduino = new Arduino( this , Arduino.list()[0] , 57600 ) ;

   arduino.pinMode(Xi, Arduino.INPUT);
   arduino.pinMode(Yi, Arduino.INPUT);
   arduino.pinMode(Zi, Arduino.INPUT); 
}

void draw() {
  
   // 値の取得
   float valXi = arduino.analogRead(Xi);
   float valYi = arduino.analogRead(Yi);
   float valZi = arduino.analogRead(Zi);
   
   // 値の表示
   fill(0);
   textAlign(CENTER);
   text("x =" + valXi + "\n", width/2, height/2-30);
   text("y =" + valYi + "\n", width/2, height/2);
   text("z =" + valZi + "\n", width/2, height/2+30);
}
