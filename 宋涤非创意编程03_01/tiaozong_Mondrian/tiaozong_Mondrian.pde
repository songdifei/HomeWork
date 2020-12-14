void setup() {
  size(600,600);
}

void draw(){
  background(255);
  strokeWeight(8);
  //画线
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
  line(mouseX+(width-mouseX)/3,mouseY,mouseX+(width-mouseX)/3,height );
  line(mouseX+(width-mouseX)/3,mouseY+(height-mouseY)/2,width,mouseY+(height-mouseY)/2);
  //line(mouseX/3,0,mouseX/3,height);
  line(0,mouseY/4,mouseX,mouseY/4);
  line(5*width/6+mouseX/6,mouseY+(height-mouseY)/2,5*width/6+mouseX/6,height);
  //画色块
  fill(brightness(#b42519));//将蒙德里安的红色转换为灰度
  rect(mouseX,0,(width-mouseX),mouseY);
  fill(brightness(#0e0c6a));//将蒙德里安的蓝色转换为灰度
  rect(0,mouseY,mouseX,height-mouseY);
  fill(brightness(#dbaf42));//将蒙德里安的黄色转换为灰度
  rect(5*width/6+mouseX/6,mouseY+(height-mouseY)/2,mouseX,height-mouseY);
}
