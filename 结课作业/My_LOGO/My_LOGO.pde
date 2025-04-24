PVector[] characters = new PVector[27];
float perimeter = 150;
String sentense = "";
String mySentense = "";
int number_;

void setup() {
  size(900, 900);
  textSize(perimeter/6);
  textAlign(CENTER, CENTER);
  background(255);
}

void draw() {
  //background(255);
  translate(width/2, height/2);
  scale(1, 1);
  characters[0]  = new PVector(0, 0);
  characters[1]  = new PVector(0, sqrt(2)*perimeter/2 + perimeter);
  characters[2]  = new PVector(sqrt(2)*perimeter/2, sqrt(2)*perimeter/2 + perimeter);
  characters[3]  = new PVector(sqrt(2)*perimeter/2+perimeter/2, sqrt(2)*perimeter/2+perimeter/2);
  characters[4]  = new PVector(sqrt(2)*perimeter/2+perimeter, sqrt(2)*perimeter/2);
  characters[5]  = new PVector(sqrt(2)*perimeter/2+perimeter, 0);
  characters[6]  = new PVector(sqrt(2)*perimeter/2+perimeter, -(sqrt(2)*perimeter/2));
  characters[7]  = new PVector(sqrt(2)*perimeter/2+perimeter/2, -(sqrt(2)*perimeter/2+perimeter/2));
  characters[8]  = new PVector(sqrt(2)*perimeter/2, -(sqrt(2)*perimeter/2 + perimeter));
  characters[9]  = new PVector(0, -(sqrt(2)*perimeter/2 + perimeter));
  characters[10] = new PVector(-(sqrt(2)*perimeter/2), -(sqrt(2)*perimeter/2 + perimeter));
  characters[11] = new PVector(-(sqrt(2)*perimeter/2+perimeter/2), -(sqrt(2)*perimeter/2+perimeter/2));
  characters[12] = new PVector(-(sqrt(2)*perimeter/2+perimeter), -(sqrt(2)*perimeter/2));
  characters[13] = new PVector(-(sqrt(2)*perimeter/2+perimeter), 0);
  characters[14] = new PVector(-(sqrt(2)*perimeter/2+perimeter), sqrt(2)*perimeter/2);
  characters[15] = new PVector(-(sqrt(2)*perimeter/2+perimeter/2), sqrt(2)*perimeter/2+perimeter/2);
  characters[16] = new PVector(-(sqrt(2)*perimeter/2), sqrt(2)*perimeter/2 + perimeter);
  characters[17] = new PVector(0, perimeter);
  characters[18] = new PVector(sqrt(2)*perimeter/2, sqrt(2)*perimeter/2);
  characters[19] = new PVector(sqrt(2)*perimeter/2+perimeter/2, sqrt(2)*perimeter/2);
  characters[20] = new PVector(sqrt(2)*perimeter/2+perimeter/2, -(sqrt(2)*perimeter/2));
  characters[21] = new PVector(sqrt(2)*perimeter/2, -(sqrt(2)*perimeter/2));
  characters[22] = new PVector(0, -perimeter);
  characters[23] = new PVector(-(sqrt(2)*perimeter/2), -(sqrt(2)*perimeter/2));
  characters[24] = new PVector(-(sqrt(2)*perimeter/2+perimeter/2), -(sqrt(2)*perimeter/2));
  characters[25] = new PVector(-(sqrt(2)*perimeter/2+perimeter/2), sqrt(2)*perimeter/2);
  characters[26] = new PVector(-(sqrt(2)*perimeter/2), sqrt(2)*perimeter/2);
  fill(0);

  //显示点位，可以不用。
  //for (int i=0; i<27; i++) {
  //  //ellipse(characters[i].x, characters[i].y, 1, 1);
  //  //println(i + "//" + characters[1].x + "//" + characters[i].y);
  //}

  //文本
  float cursorPosition = textWidth(sentense)/2+5;
  fill(255);
  noStroke();
  rect(-width/2, perimeter*2, width, perimeter*3);
  fill(0);
  stroke(0);
  strokeWeight(1);
  text(sentense, 0, perimeter*2.3);
  line(cursorPosition, perimeter*2.24, cursorPosition, perimeter*2.44);


  //绘制
  if (keyPressed || key == ENTER) {
    mySentense = sentense;
    println(mySentense);
  }
  beginShape(TRIANGLE_FAN);//TRIANGLES;TRIANGLE_STRIP;TRIANGLE_FAN;QUAD_STRIP;QUADS
  fill(175);
  for (int i=0; i<mySentense.length(); i++) {
    int number = byte(mySentense.charAt(i));

    if (number >= 97) {
      number_ = number-97;
    }
    if (number < 97) {
      number_ = number-65;
    }
    int Number = constrain(number_, 0, 26);
    vertex(characters[Number].x, characters[Number].y);
  }
  endShape(CLOSE);
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (sentense.length() > 0) {
      sentense = sentense.substring(0, sentense.length()-1);
    }
  } else if (textWidth(sentense+key) < width && key != CODED) {
    sentense = sentense + key;
  }
}

void mousePressed() {
  saveFrame();
}
