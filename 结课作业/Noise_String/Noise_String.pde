PGraphics myMessage;//用来存放文字的绘图表面
PFont font;
String message = "Mary";//在这里打字
Boid[]boats;


void setup() {
  fullScreen();
  font = createFont("Helvetica", 200);
  myMessage=createGraphics(width, height);
  myMessage.beginDraw();
  myMessage.background(255);
  myMessage.textAlign(CENTER, CENTER);
  myMessage.fill(0);
  myMessage.textSize(400);
  myMessage.text(message, width/2, height/2);
  myMessage.endDraw(); 

  boats=new Boid[10000];
  for (int i=0; i<boats.length; i++) {
    boats[i]=new Boid();
  }
  stroke(255);
}

void draw() {
  fill(0, 14);
  noStroke();
  rect(0, 0, width, height);

  strokeWeight(3);
  for (int i=0; i<boats.length; i++) {
    boats[i].update();
    boats[i].display();
  }
  if (keyPressed) {
    saveFrame();
  }
  //saveFrame();
}
