float noiseScale = 0.1;
float noiseVal;
float H;
float moonX = 0, moonY;
float g = 0;
PGraphics p;
float fractor=0;


void setup() {
  size(900, 900);
  background(#5972A2);
  p=createGraphics(width, height);

}

void draw() {
}

void drawMountain(float radius) {
  noStroke();
  ellipseMode(CENTER);
  float lift =0;
  fill(random(255), random(180, 230), random(200, 255));
  lift = lift - radius;

  for (int x=0; x < width; x++) {
    noiseVal = noise(x+fractor);
    ellipse(x, height+H-1*lift-noiseVal*900, radius, radius*0.75);
  }

  if (radius>2) {
    radius *=0.9;
    drawMountain(radius);
  }
}

void mousePressed() {
  //saveFrame();
  g += 10;
  moonX += 100; 
  moonY +=g;
  p.beginDraw();
  p.background(#5972A2);
  p.noStroke();
  p.fill(#FFEE89);
  p.ellipse(moonX, moonY, 80, 80);
  p.endDraw();
  image(p, 0, 0, width, height);

  noStroke();
  fill(255, 30);
  tint(255, 126);
  rect(0, 0, width, height);
  fractor += 1000;
  H += 100;
  noiseScale -=0.1;
  drawMountain(random(600, 900));
}
