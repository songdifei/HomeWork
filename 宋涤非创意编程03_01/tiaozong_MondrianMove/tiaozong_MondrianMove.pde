int a=0;
float speed=2;


void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  strokeWeight(8);
  //画线
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);

  a+=speed;
  
  if (a>width-mouseX) {
    speed=-10*speed;
  }

  if (a<0) {
    speed=2;
  }

  //line(mouseX+(width-mouseX)/3,mouseY,mouseX+(width-mouseX)/3,height);//短竖线
  line(width-a, mouseY, width-a, height);//运动的短竖线
  line(width-a/2,mouseY+(height-mouseY)/2, width-a/2, height);
  line(width-a, mouseY+(height-mouseY)/2, width, mouseY+(height-mouseY)/2);//跟随竖线移动的横线
  line(0, mouseY/4, mouseX, mouseY/4);

  //line(mouseX-a+b, mouseY+(height-mouseY)/2, mouseX-a+b, height);


  //画色块
  fill(brightness(#b42519));//将蒙德里安的红色转换为灰度
  rect(mouseX, 0, (width-mouseX), mouseY);
  fill(brightness(#0e0c6a));//将蒙德里安的蓝色转换为灰度
  rect(0, mouseY, mouseX, height-mouseY);
  fill(brightness(#dbaf42));//将蒙德里安的黄色转换为灰度
  rect(width-a/2,mouseY+(height-mouseY)/2,mouseX,height-mouseY);
}
