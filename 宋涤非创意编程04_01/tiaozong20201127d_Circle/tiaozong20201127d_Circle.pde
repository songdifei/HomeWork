PFont f;
float r=120;
String message = "click the mouse to enlarge the circle";
float arclength = 0;

void setup(){
  
  size(600,600);
  background(255);
  f = createFont("Helvetica",30);
  textFont(f);
  textAlign(CENTER);
  //smooth();
   fill(0);
}

void draw(){
      background(255);
      translate(width/2, height/2);
      ellipse(0, 0, r*2, r*2);//画圆
    
    for (int i =0; i< message.length(); i++){
      char currentChar = message.charAt(i);
      float w = textWidth(currentChar);
      arclength += w/2.4;
      
      pushMatrix();
      translate(1.2*r*(cos(arclength/r + PI)), 1.2*r*(sin(arclength/r + PI)) );
      rotate(arclength/r-PI/2);
      text(currentChar,0,0);
      popMatrix();
      arclength += w/2.4;
    }
    
    
  if (mousePressed){
    r++;
  } else{
    r=120;
  }
 
}
