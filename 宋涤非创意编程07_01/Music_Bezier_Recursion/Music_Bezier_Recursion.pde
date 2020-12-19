import ddf.minim.*;
Minim minim;
AudioPlayer player;
float factor, level, amplitude;

void setup() {
  //size(1000, 1000);
  fullScreen();
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("Disco.mp3");
  player.loop();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  drawShape(500,10);
  level=player.mix.level();
  factor =level*700;
  println(level);
  amplitude = map(level, 0, 9, 0, 1);

  if (level>0.3) {
    drawLine();
  }
}

void drawShape(float radius, float r) {
  noFill();
  stroke(255, 100);
  for (int an=1; an<int(random(10, 40)); an+=1) {
    rotate(2*PI/an);
    bezier(10, 10, radius, factor, radius, -1*factor, -10, -10);
    ellipse(0,radius*0.3,r,r);
  }
  if (radius>2) {
    radius *=0.9;
    r *=0.8;
    drawShape(radius,r);
  }
}

void drawLine() {
  for (int an=1; an<int(random(30, 100)); an+=1) {
    rotate(2*PI/an);
    line(0,0, random(500,600),0);
  }
}
