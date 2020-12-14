class Tool {
  float posX, posY;
  float toolWidth, toolHeight;
  color toolColor;
  boolean pickTool;
  PImage img;
  color c1 = color(sliderH, sliderS, sliderB, opacity);

  Tool(PImage tempImg, float x, float y, float w, float h) {
    posX = x;
    posY = y;
    toolWidth = w;
    toolHeight = h;
    img = tempImg;
  }

  void showTool() {
    //color myColor = c1;
    if (hover()) {
      tint(#64FF7F);
    } else {
      tint(0);
    }
    if (mousePressed && hover()) {
      pickTool = true;
      color toolColor = color(sliderH, sliderS, sliderB, opacity);
      tint (toolColor);
    } else {
      tint(255);
    }
    image(img, posX, posY, toolWidth, toolHeight);
  }

  void brushShape() {
    if (mousePressed && tool[0].hover()) {
      brushWeight = 5;
      opacity = 100;
      strokeCap(ROUND);
      tint(sliderH, sliderS, sliderB);
    }
    if (mousePressed && tool[1].hover()) {
      brushWeight = 10;
      opacity = 100;
    }
    if (mousePressed && tool[2].hover()) {
      brushWeight = 40;
      opacity = 10;
      strokeCap(PROJECT);
    }
    if (mousePressed && tool[3].hover()) {
      brushWeight = 40;
      opacity = 100;
      strokeCap(PROJECT);
    }
    if (mousePressed && tool[4].hover()) {
      fill(sliderH, sliderS, sliderB);
      rect(200,0,1000,620);
    }
    if (mousePressed && tool[5].hover()) {
      brushWeight = 50;
      opacity = 100;
      sliderS=0; sliderB=100;
      strokeCap(ROUND);
    }
  }

  boolean hover() {
    if (mouseX<posX+toolWidth && mouseX>posX && 
      mouseY<posY+toolHeight && mouseY>posY) {
      return true;
    } else {
      return false;
    }
  }
}
