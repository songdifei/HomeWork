int num = 10;
Wave waves[] = new Wave[num];

void setup() {
  size(1000, 1000);
  
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  for (int i=0; i<num; i++) {
    waves[i] = new Wave(new PVector(0,0), 300, 300, 100);//位置、宽度、高度、周期
  }
}

void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(TWO_PI/num*i);
    waves[i].calculate();
    waves[i].display();
    popMatrix();
    //saveFrame();
  }
}
