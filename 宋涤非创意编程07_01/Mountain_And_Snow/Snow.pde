class Snow {
  float xpos;
  float ypos;

  float yspd;
  color col;
  float size;

  Snow() {
    size=3;
    xpos=random(size, width-size);
    ypos=random(-height, -size);
    yspd=random(20, 40);
  }

  void update() {
    if (brightness(get(int(xpos), int(ypos)))>50) {
      ypos--;
    } else {    
      ypos += yspd;
    }
  }




  void display() {
    pushMatrix();
    translate(xpos, ypos);
    stroke(255);
    fill(255);
    beginShape();
    for (int i=0; i<100; i++) {
      float angle=i*TWO_PI/10-PI/2;
      if (i%2==0) {
        vertex(cos(angle)*size, sin(angle)*size);
      } else {
        vertex(cos(angle)*size*0.1, sin(angle)*size*0.1);
      }
    }
    endShape(CLOSE);
    popMatrix();
  }
}
