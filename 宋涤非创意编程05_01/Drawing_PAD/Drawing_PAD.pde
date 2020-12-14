import controlP5.*;
ControlP5 cp5;
PImage[] tools = new PImage[6];
int sliderH=128, sliderS=50, sliderB=50;
String lines = "H\nS\nB";
color c1;
boolean hover_pencil;
float brushWeight, opacity;
boolean[] thisTool = new boolean[6];



void setup() {
  size(1200, 800);
  background(255);

  //工具载入
  tools[0] = loadImage("00-pencil.png");
  tools[1] = loadImage("01-pen.png");
  tools[2] = loadImage("02-highlighter.png");
  tools[3] = loadImage("03-brush.png");
  tools[4] = loadImage("04-bucket.png");
  tools[5] = loadImage("05-eraser.png");
  //不能使用for循环和0i-tools.png。
  //但可以用for（int i=0; i<tools.length; i++){tools[i]=loadImage("0"+i+"tools.png");}
  for (int i=0; i<6; i++) {
    image(tools[i], 160*(i+1), 700, 100, 100);
  }
  for (int i=0; i<6; i++) {
    thisTool[i] =false;
  }

  //颜色选择
  colorMode(HSB, 360, 100, 100);
  fill(0);
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderH").setPosition(20, 40).setRange(0, 360);
  cp5.addSlider("sliderS").setPosition(20, 70).setRange(0, 100);
  cp5.addSlider("sliderB").setPosition(20, 100).setRange(0, 100);
  textLeading(30);
  textSize(20);
  smooth();
  text(lines, 5, 52);
  //画板
  fill(#FFFFE0);
  rect(160, 20, 1000, 650);
}

void draw() {
  float paint_x = constrain(mouseX, 170, 1160);
  float paint_y = constrain(mouseY, 30, 660);//用来限制作画区域
  //frameRate(500);
  color c1 = color(sliderH, sliderS, sliderB, opacity);
  opacity=100;
  fill(c1);
  noStroke();
  ellipse(65, 150, 50, 50);

  if (mousePressed) {
    println(mouseX, mouseY);
  }//用来测试应该点击哪个位置才能更改画笔。

  //画笔选择:pencil
  if (mousePressed && mouseX<240 && mouseX>170 && mouseY<800 && mouseY>700 ) {
    println("您当前的画笔是pencil");//用来测试的
    thisTool[0] = true; 
    for (int i=0; i<6; i++) {
      thisTool[i] =false;
    }
    thisTool[0] = true;
    println("0"+thisTool[0]);
    println("1"+thisTool[1]);
    println("2"+thisTool[2]);
    println("3"+thisTool[3]);
    println("4"+thisTool[4]);
    println("5"+thisTool[5]);
  }

  //画笔选择：pen
  if (mousePressed && mouseX<410 && mouseX>330 && mouseY<800 && mouseY>700) {
    println("您当前的画笔是pen");//用来测试的
    thisTool[1] = true; 
    for (int i=0; i<6 && i!=1; i++) {
      thisTool[i] =false;
    }
  }
  //画笔选择：highlighter
  if (mousePressed && mouseX<580 && mouseX>480 && mouseY<800 && mouseY>700) {
    println("您当前的画笔是highliter");//用来测试的
    thisTool[1] = true; 
    for (int i=0; i<6 && i!=1; i++) {
      thisTool[i] =false;
    }
  }
  //画笔选择：brush
  if (mousePressed && mouseX<720 && mouseX>660 && mouseY<800 && mouseY>700) {
    println("您当前的画笔是brush");//用来测试的
    thisTool[3] = true; 
    for (int i=0; i<6 && i!=3; i++) {
      thisTool[i] =false;
    }
  }
  //画笔选择：bucket
  if (mousePressed && mouseX<890 && mouseX>800 && mouseY<800 && mouseY>700) {
    println("您当前的画笔是bucket");//用来测试的
    fill(c1);
    thisTool[4] = true; 
    for (int i=0; i<6 && i!=4; i++) {
      thisTool[i] =false;
    }
  }
  //画笔选择：eraser
  if (mousePressed && mouseX<890 && mouseX>800 && mouseY<800 && mouseY>700) {
    println("您当前的画笔是eraser");//用来测试的
    fill(c1);
    thisTool[5] = true; 
    for (int i=0; i<6 && i!=5; i++) {
      thisTool[i] =false;
    }
  }




  if (thisTool[0]) {
    ellipse(210, 680, 20, 20);//标记
    if (mousePressed && mouseX > 170 && mouseY < 660) {//画笔选择:pencil
      brushWeight = 3; 
      opacity=100; 
      ellipse(paint_x, paint_y, brushWeight, brushWeight);
    }
  }
  if (mousePressed && mouseX > 170 && mouseY < 660) {
    /*println("0"+thisTool[0]);
     println("1"+thisTool[1]);
     println("2"+thisTool[2]);
     println("3"+thisTool[3]);
     println("4"+thisTool[4]);
     println("5"+thisTool[5]);*/


    if (thisTool[1]) {//画笔选择：pen
      brushWeight = 20; 
      opacity=100; 
      ellipse(paint_x, paint_y, brushWeight, brushWeight);
    }
    if (thisTool[2]) {//画笔选择：highlighter
      brushWeight = 50; 
      opacity=5;
      rect(paint_x, paint_y, brushWeight, brushWeight);
    }
    if (thisTool[3]) {//画笔选择：brush
      brushWeight = 20; 
      opacity=100; 
      rect(paint_x, paint_y, brushWeight, brushWeight);
    }
    if (thisTool[4]) {//画笔选择：bucket
      brushWeight = 20; 
      opacity=100; 
      rect(160, 20, 1000, 650);
    }
    if (thisTool[5]) {//画笔选择：bucket
      fill(#FFFFE0);
      rect(160, 20, 1000, 650);
    }
  }
}
