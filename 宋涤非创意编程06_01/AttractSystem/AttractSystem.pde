Magnet[]magnets=new Magnet[40];
Repel[]repels=new Repel[20];
PVector pos[]=new PVector[magnets.length];
PVector ball;

void setup() {
  size(300, 300);
  ball=new PVector(width/2, height/2);
  background(0);
  for (int i=0; i<magnets.length; i++) {
    magnets[i]=new Magnet();
    magnets[i].show();
    //pos[i] = magnets[i].MagPos.copy();
    //println(pos[i].x, pos[i].y);//ce
  }
  for (int i=0; i<repels.length; i++) {
    repels[i]=new Repel();
    repels[i].show();
  }
}

void draw() {
  for (int i=0; i<magnets.length; i++) {
    magnets[i].update();
    magnets[i].wrapEdges();
    //println(pos[i].x, pos[i].y);//ce
    noFill();
    stroke(255, 50);
    ellipse(ball.x, ball.y, 100, 100);
  }
  for (int i=0; i<repels.length; i++) {
    repels[i].update();
    repels[i].wrapEdges();
    //println(pos[i].x, pos[i].y);//ce
    noFill();
    stroke(255, 50);
    ellipse(ball.x, ball.y, 100, 100);
  }
  if (keyPressed) {
    saveFrame();
  }
}
