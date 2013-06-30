
import cc.arduino.*;        // Arduinoライブラリ
import processing.serial.*; // シリアル通信ライブラリ
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
AudioPlayer player;
AudioMetaData meta;

Arduino arduino;
int pin = 0;  // 入力ピン（デジタル）
int i = 0;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(30);
  smooth();
  noStroke();
  
  println(Arduino.list());                       // シリアルポートの一覧を表示
  arduino = new Arduino(this, Arduino.list()[0], 57600);  // Arduinoの接続設定
  arduino.pinMode(pin, Arduino.INPUT);                    // 入出力ピンの設定
  
  minim = new Minim(this); //minimクラスをインスタンス化
  out   = minim.getLineOut(Minim.MONO); //オーディオ出力として、outを準備
  //sine  = new SineWave(5000, 1.0, out.sampleRate()); //440Hz,音量0.5でサイン波を出力
  //sine.portamento(200);//ポルタメント(音程変化の滑らかさ)200msec
  //out.addSignal(sine);//サイン波をオーディオ出力に追加

  player = minim.loadFile("http://ccmixter.org/contests/freestylemix/Cornelius%20-%20Wataridori%202.mp3", 2048);
  meta = player.getMetaData();
}

void draw() { 
  float value = arduino.analogRead(pin);  // ピンの状態を読み取る
  println(value);
  
  // 背景色の変化
  background(value, 50, 100, 100);
  
  //見た目
  String p = "PLAY";
  String s = "STOP";
  fill(0, 0, 100);
  textSize(80);
  textAlign(CENTER);
  
  //再生　::250以上で再生、それ以下で一時停止
  if(value>=250){
    player.play();
    text(p, width/2, 180);
  }else{
    player.pause();
    text(s, width/2, 180);
  }
  
  //曲名の表示
  textSize(50);
  text(meta.title(), width/2, 380);
  textSize(30);
  text(meta.author(), width/2, 450);
  
  float rb = value+50;
  
  noStroke();
  fill(360-value, 50, 100, 30); 
  ellipse(width/2, height/2, rb, rb);
  
  noFill();
  strokeWeight(0.5);
  stroke(0, 0, 100);
  int c = 80;
  for(i=0; i<10; i++){
    ellipse(width/2, height/2, rb+c, rb+c);
    c += 20;
  }
  
  // ぴこぴこうごく円を生成
  float x = random(value, width);
  float y = random(value, height);
  float r = random(value/5);
  
  fill(0, 0, 100, 50);
  ellipse(x, y, r, r);
  
}

void stop() {
  out.close();
  minim.stop();

  super.stop();
}


