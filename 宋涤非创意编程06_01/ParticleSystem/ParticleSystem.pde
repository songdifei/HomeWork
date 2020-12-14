Magnet[]magnets=new Magnet[int(random(100,1000))];
Repel[]repels=new Repel[50];
PVector pos[]=new PVector[magnets.length];
PVector ball, preBall;
float H = random(255);

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  ball=new PVector(width/2, height/2);
  preBall=ball.copy();
  background(0);
}

void draw() {
  stroke((frameCount*0.01)%255+H, 255, 255, 40-frameCount*0.001);
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

  for (int i=0; i<magnets.length; i++) {
    magnets[i].update();
    magnets[i].wrapEdges();
    noFill();
    line(ball.x, ball.y, preBall.x, preBall.y);
    preBall=ball.copy();
  }
  for (int i=0; i<repels.length; i++) {
    repels[i].update();
    repels[i].wrapEdges();
    noFill();
    preBall=ball.copy();
    //ellipse(ball.x, ball.y, 100, 100);
  }
  if (mousePressed) {
    background(0);
  }
  if (keyPressed) {
    saveFrame();
  }
  //saveFrame();
}
