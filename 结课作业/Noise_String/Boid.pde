class Boid {
  PVector pos;
  PVector vel;
  float hue;
  float speed;

  Boid() {
    pos=new PVector(random(width), random(height));
    vel=new PVector();
  }

  void update() {
    color c = myMessage.get(int(pos.x), int(pos.y));
    color b = int(brightness(c)/255);
    float speed = pow(b, 2) +0.05;
    float scale=0.001;
    float noiseValue=noise(pos.x*scale, pos.y*scale, frameCount*scale*2);
    float angle=noiseValue*TWO_PI*1;

    float magnitude=noise(pos.x*scale+1111, pos.y*scale+2222, frameCount*scale)*5*speed;
    vel.set(cos(angle)*magnitude, sin(angle)*magnitude);

    hue=noise(pos.x*scale+3333, pos.y*scale+4444, frameCount*scale)*255;
    pos.add(vel);
    if (pos.x<0 || pos.x>width+100 || pos.y<-100 || pos.y>height) {
      pos.set(random(width), random(height));
    }
  }

  void display() {
    stroke(hue, 100, 255, 100);
    strokeWeight(3);
    point(pos.x, pos.y);
  }
}
