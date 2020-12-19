float noiseScale = 0.1;
float noiseVal;
PGraphics p;
float fractor=0;

Snow[]snows;


void setup() {
  frameRate(300);
  size(900, 900);
  snows=new Snow[400];
  background(#1C1C2E);
  p=createGraphics(width, height);
  for (int i=0; i<snows.length; i++) {
    snows[i] = new Snow();
  }
}

void draw() {
  background(#1C1C2E);
  drawMountain(random(600, 900));
  noStroke();
  fill(#FFEE89);
  ellipse(200, 100, 80, 80);
  noLoop();

  for (int i=0; i<snows.length; i++) {
    snows[i].update();
    snows[i].display();
  }
  loop();
  loadPixels();
  saveFrame();
}

void drawMountain(float radius) {
  noStroke();
  ellipseMode(CENTER);
  float lift =0;
  fill(random(255), random(180, 230), random(200, 255));
  lift = lift - radius;
  for (int x=0; x < width; x++) {
    noiseVal = noise(x+fractor);
    ellipse(x, height-1*lift-noiseVal*700, radius, radius*0.75);
  }
  if (radius>2) {
    radius *=0.9;
    drawMountain(radius);
  }
}
