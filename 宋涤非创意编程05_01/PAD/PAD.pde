Tool[] tool = new Tool[6];

import controlP5.*;
ControlP5 cp5;
int sliderH=128, sliderS=20, sliderB=100;
float brushWeight;
float opacity = 100;
String lines = "H\nS\nB";
color c1, brushColor = #A53AA0;
PImage[] toolpng = new PImage[6];
int count = 1;



void setup() {
  size(1200, 800); 
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  fill(#82988A);
  textLeading(30);
  textSize(20);
  text(lines, 5, 52);
  for (int i = 0; i<toolpng.length; i++) {
    toolpng[i] = loadImage(i+".png");
  }
  for (int i = 0; i<tool.length; i++) {
    //int index = int(random(0, toolpng.length));
    tool[i] = new Tool(toolpng[i], 150+160*i, 700, 100, 100);
  }
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderH").setPosition(20, 40).setRange(0, 360);
  cp5.addSlider("sliderS").setPosition(20, 70).setRange(0, 100);
  cp5.addSlider("sliderB").setPosition(20, 100).setRange(0, 100);
}

void draw() {
  color c1 = color(sliderH, sliderS, sliderB, opacity);
  fill(c1);
  noStroke();
  ellipse(65, 150, 50, 50);


  for (int i = 0; i < tool.length; i ++) {
    tool[i].showTool();
    if (tool[i].pickTool) {
      brushColor = tool[i].toolColor;
      tool[i].pickTool = false;
    }
  }

  if (keyPressed == true) {
    save("frame" + count + ".png");
    delay(500);
    count++;
  }

  for (int i = 0; i < tool.length; i ++) {
    tool[i].brushShape();
  }
}


void mouseDragged() {
  if (pmouseX>200 && pmouseY<620) {
    strokeWeight(brushWeight);
    println(brushWeight);
    color toolColor = color(sliderH, sliderS, sliderB, opacity);
    stroke(toolColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
