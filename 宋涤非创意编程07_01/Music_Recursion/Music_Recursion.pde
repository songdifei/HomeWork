import ddf.minim.*;
Minim minim;
AudioPlayer player;
float amplitude;

void setup() {
  size(800, 800);
  noStroke();
  fill(0);
  minim = new Minim(this);
  player = minim.loadFile("2.mp3");
  player.loop();
  frameRate(1000);
  colorMode(HSB,360,100,100,255);
}

void draw() {
  background(#1700F7);
  noStroke();
  translate(width/2, height/2);
  drawC(0, 0, width/1.3);
}

void drawC(float x, float y, float radius) {
  float level=player.mix.level();
  amplitude=level*400;
  fill(290 + level*20 , 80 - level , 98, amplitude);
  println(level);
  ellipse(x, y, radius, radius);
  float step = level*10; 
  if (radius>step) {
    rotate(1);
    drawC(x - step - radius/10, y, radius/2);
    drawC(x + step + radius/10, y, radius/2);
    drawC(x, y - step -radius/10, radius/2);
    drawC(x+ radius/10, y + step + radius/10, radius/2);
  }
}
