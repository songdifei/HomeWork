PGraphics myMessage;//用来存放文字的绘图表面
int num = 10000;//点的数量
float [] x = new float[num];
float [] y = new float[num];
PFont font;
String message = "06-01";//在这里打字

void setup() {
  size(600, 300);
  font = createFont("Helvetica", 100);
  myMessage=createGraphics(width, height);
  myMessage.beginDraw();
  myMessage.background(255);
  myMessage.textAlign(CENTER, CENTER);
  myMessage.fill(0);
  myMessage.textSize(80);
  myMessage.text(message, width/2, height/2);
  myMessage.endDraw(); 
  for (int i =0; i<num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
  stroke(255);
}

void draw() {
  background(0);
  frameRate(200);
  for (int i=0; i<num; i++) {
    color c = myMessage.get(int(x[i]), int(y[i]));
    color b = int(brightness(c)/255);
    float speed = pow(b, 2) +0.05;
    x[i] += speed;
    if (x[i]>width) {
      x[i] = 0;
      y[i] = random(height);
    }
    point(x[i], y[i]);
  }
  if (keyPressed) {
    saveFrame();
  }
}
