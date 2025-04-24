color backgroundColor = (#0200fb);
color followerColor = (#fe019f);
int steps = 4;//控制重复绘制的次数
float diameter = 50;
PVector follower;




void setup() {
  frameRate(100);
  size(600, 600);
  //  smooth();
  ellipseMode(CENTER);
  background(backgroundColor);

  follower = new PVector(mouseX, mouseY);
}

void draw() {
  noStroke();
  fill(backgroundColor, 5);
  rect(0, 0, width, height);
  stroke(#fe019f);
  noFill();
  PVector mouse = new PVector(mouseX, mouseY);
  PVector middle = new PVector(width/2, height/2);
  mouse.mult(2);
  mouse.sub(middle);
  follower.add(PVector.mult(PVector.sub(mouse, follower), 0.04));

  display(follower, new PVector(width/2, height/2), diameter, 0);
}


void display(PVector location, PVector center, float diam, int step) {
  float factor1 = 0.1;
  int num = 6;
  //更改数量
  if (key == '7') {
    num = 7;
  }
  if (key == '8') {
    num = 8;
  }
  if (key == '9') {
    num = 9;
  }


  //更改样式1
  if (key == 'q') {
    noStroke();
    fill(followerColor);
  }

  //更改样式2
  if ((keyPressed == true) && (key == 'w')) {
    stroke(followerColor);
    noFill();
  }

  //更改样式2
  if ((keyPressed == true) && (key == 'w')) {
    noStroke();
    fill(followerColor);
  }

  if (step<steps) {
    PVector arm = PVector.sub(location, center);
    float angle = atan2(arm.y, arm.x);
    float radius = arm.mag();
    for (int i=0; i<num; i++) {
      float newAngle = angle + TWO_PI*i/num;
      PVector newArm = new PVector(radius*cos(newAngle), radius*sin(newAngle));
      newArm.add(center);
      ellipse(newArm.x, newArm.y, diam, diam);

      float newNewAngle = angle * 2 * (-1 + (step%2)*2);
      float newRadius = radius*factor1;
      float newDiam = diam*0.3;
      PVector newNewArm = new PVector(newRadius*cos(newNewAngle), newRadius*sin(newNewAngle));
      newNewArm.add(newArm);
      rect(newArm.x, newArm.y, diam, diam);
      display(newNewArm, newArm, newDiam, step+1);
    }
  }
}
