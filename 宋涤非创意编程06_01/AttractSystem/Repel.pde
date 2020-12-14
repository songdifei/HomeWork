class Repel {
  int R=100;
  int r=20;
  float theta=random(TWO_PI);
  float individualFactor;//独立的弹力系数
  PVector spd, prevball;
  PVector RepelPos = new PVector(R*cos(theta)+width/2, R*sin(theta)+height/2);

  Repel() {
    spd=new PVector(0, 0);//初始速度
    individualFactor=random(0.2, 5);
  }

  void show() {
    ellipse(RepelPos.x, RepelPos.y, r, r);
  }

  void update() {
    PVector spd=PVector.sub(ball,RepelPos);
    spd.mult(0.01);  
    spd.mult(individualFactor);
    //spd.add(acc);  
    ball.add(spd);
    spd.mult(0.98);
    //line(ball.x, ball.y, prevball.x, prevball.y);
    prevball=ball.copy();
  }
  void wrapEdges() {
    float buffer = r*2;
    if (ball.x > width +  buffer) ball.x = -buffer;
    else if (ball.x <    -buffer) ball.x = width+buffer;
    if (ball.y > height + buffer) ball.y = -buffer;
    else if (ball.y <    -buffer) ball.y = height+buffer;
  }
}
