import ddf.minim.*;
Minim minim;
AudioPlayer player;
import controlP5.*;
ControlP5 cp5;

float amplitude;
PFont font;
Pin pins[];
int sliderN = 150;
//int num = sliderN;//有几条线
float sliderR=3, sliderR_=0.3, sliderD=1, sliderF=60, sliderC=50;

void setup() {
  minim = new Minim(this);
  player = minim.loadFile("Universe Lovesong.mp3");
  player.loop();
  
  size(800, 800);
  background(0);
  pins = new Pin[sliderN];
}

void draw() {
  background(0);
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderN").setPosition(20, 40).setRange(10, 150);
  cp5.addSlider("sliderR").setPosition(20, 60).setRange(2, 5);
  cp5.addSlider("sliderR_").setPosition(20, 80).setRange(0, 1);
  cp5.addSlider("sliderD").setPosition(20, 100).setRange(0, 5);
  cp5.addSlider("sliderC").setPosition(20, 120).setRange(0, 255);
  
  float level=player.mix.level();
  amplitude=level*200;
  for (int i=0; i<pins.length; i++) {
    pins[i] = new Pin();
    pushMatrix();
    translate(width/2, height/2);
    rotate(TWO_PI/sliderN*i);
    pins[i].show();
    popMatrix();
    //saveFrame();
  }
}
