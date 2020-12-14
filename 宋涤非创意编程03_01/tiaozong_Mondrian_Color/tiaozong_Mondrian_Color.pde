void setup() {
  size(600,600);
  colorMode(HSB,360,100,100);
}

void draw(){
  //background(43,0,100);
  background(mouseX%360,mouseY%50,100);
  strokeWeight(8);
  stroke(0,0,100);
  //画线
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
  line(mouseX+(width-mouseX)/3,mouseY,mouseX+(width-mouseX)/3,height );
  line(mouseX+(width-mouseX)/3,mouseY+(height-mouseY)/2,width,mouseY+(height-mouseY)/2);
  //line(mouseX/3,0,mouseX/3,height);
  line(0,mouseY/4,mouseX,mouseY/4);
  line(5*width/6+mouseX/6,mouseY+(height-mouseY)/2,5*width/6+mouseX/6,height);
  //画色块
  fill(mouseX%360+100,mouseY%50+30,100);
  rect(mouseX,0,(width-mouseX),mouseY);
  fill(mouseX%360-80,mouseY%50+40,100);
  rect(0,mouseY,mouseX,height-mouseY);
  fill(mouseX%360-60,mouseY%50+35,100);
  rect(5*width/6+mouseX/6,mouseY+(height-mouseY)/2,mouseX,height-mouseY);
}
