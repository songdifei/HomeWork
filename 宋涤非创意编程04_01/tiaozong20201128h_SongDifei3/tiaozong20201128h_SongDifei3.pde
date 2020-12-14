PGraphics myMessage;//用来存放文字的绘图表面
int num = 10000;//点的数量
float r = 0;//圆点的直径
int y;
int c;
PFont font;
String message = "Song Difei";//在这里打字

void setup() {
  size(600, 300);
  font = createFont("Helvetica", 100);
  myMessage=createGraphics(width, height);
  myMessage.beginDraw();
  myMessage.background(255);
  myMessage.textAlign(CENTER, CENTER);
  myMessage.fill(0);
  myMessage.textSize(100);
  myMessage.text(message, width/2, height/2);
  myMessage.endDraw(); 

  //stroke(255);
}

void draw() {
  background(0);
  frameRate(200);
  for (int x=1; x<width; x+=5) {
    for (int y=1; y<height; y+=5) {
      color c = myMessage.get(x, y);
      color b = int(brightness(c)/255);
      if (b==0){
        ellipse(x, y, 3, 3);
      }
      if (mousePressed){
        x += random(3);
        y += random(3);
      }
    }
  }
}
