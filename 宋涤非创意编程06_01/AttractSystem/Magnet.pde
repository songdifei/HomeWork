class Magnet {
  Boolean attract;
  int R=120;
  int r=10;
  float theta=random(TWO_PI);
  float individualFactor;//独立的弹力系数
  PVector spd, prevball;
  PVector MagPos = new PVector(R*cos(theta)+width/2, R*sin(theta)+height/2);

  Magnet() {
    spd=new PVector(0, 0);//初始速度
    individualFactor=random(0.2, 5);
  }

  void show() {
    if (random(1)<0.5) {
      attract=true;
    } else {
      attract=false;
    }
    ellipse(MagPos.x, MagPos.y, r, r);
  }

  void update() {
    PVector spd=PVector.sub(MagPos, ball);
    spd.mult(0.001);  
    spd.mult(individualFactor);
    //spd.add(acc);  
    ball.add(spd);
    spd.mult(0.98);
    //line(ball.x, ball.y, prevball.x, prevball.y);
    prevball=ball.copy();
  }
  
    void wrapEdges() {
    if (ball.x > width) spd.mult(-1);
    else if (ball.x <0) spd.mult(-1);
    if (ball.y > height) spd.mult(-1);
    else if (ball.y <0) spd.mult(-1);
  }
}
