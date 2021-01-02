class Boid {
  PVector pos;
  PVector vel;
  color c;

  Boid() {
    pos=new PVector(random(1000), random(height));
    c = img.get(int(pos.x), int(pos.y));
    vel=new PVector();
  }

  void update() {
    float scale = 0.01;//可修改参数
    float noiseValue=noise(pos.x*scale, pos.y*scale);
    float angle=noiseValue*TWO_PI*100;
    float magnitude=0.3;
    vel.set(cos(angle)*magnitude, sin(angle)*magnitude);

    pos.add(vel);
    if (pos.x<0 || pos.x>1000 || pos.y<0 || pos.y>height) {
      pos.set(random(1000), random(height));
    }
  }

  void display() {
    stroke(c);
    strokeWeight(factor);
    point(pos.x, pos.y);
  }
}
