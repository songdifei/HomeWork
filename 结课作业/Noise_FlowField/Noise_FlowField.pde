import controlP5.*;
ControlP5 cp5;
PImage img;
Boid[]boats;
float factor=10;
int num = int(random(1, 20)*500);//可修改参数
int posterize = 4;

void setup() {
  frameRate=200;
  img = loadImage("Example_05.JPG");
  size(1200, 1000);
  background(0);
  img.resize(1000, 0);
  image(img, 0, 0);
  boats=new Boid[num];
  for (int i=0; i<boats.length; i++) {
    boats[i]=new Boid();
  }
}

void draw() {
  cp5 = new ControlP5(this);
  cp5.addSlider("factor").setPosition(1050, 40).setRange(1, 30);
  cp5.addButton("restart").setPosition(1050, 140);
  cp5.addButton("save_picture").setPosition(1050, 160);
  cp5.addSlider("posterize").setPosition(1050, 60).setRange(1, 10);
  cp5.addButton("POSTERIZE").setPosition(1050, 80);
  strokeWeight(3);
  for (int i=0; i<boats.length; i++) {
    boats[i].update();
    boats[i].display();
  }

  surface.setTitle(nf(frameRate, 0, 2));
  noStroke();
  fill(0);
  rect(1000, 0, 20, height);
  //saveFrame("04-######.png");
}

public void restart() {
  image(img, 0, 0);
  println("restart!");
}
public void save_picture() {
  println("save_picture");
  saveFrame();
}
public void POSTERIZE() {
  filter(POSTERIZE, posterize);
  println("POSTERIZE!");
}
