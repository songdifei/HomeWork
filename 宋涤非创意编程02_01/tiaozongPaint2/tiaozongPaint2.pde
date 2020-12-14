PImage img;
PImage paint;


void setup(){
  size(600,590);
  
  img=loadImage("1.png");
  paint=loadImage("2.JPG");
}


void draw(){
  int circleNum=mouseX/5;
  //float imgSize=(width/circleNum);
  img.resize(width/(circleNum+1),width/(circleNum+1));
  
  paint.resize(width,height);
  background(255);
  
  for (int i=-6;i<circleNum+1;i++)
    for (int j=-6;j<circleNum+1;j++){
   
      //tint(random(0,255),random(0,150),random(100,150));
    color c=paint.get(int(i*(width/(circleNum+1))),j*((width/(circleNum+1))));
    tint(c);
    
    image(img,i*width/(circleNum+1),j*width/(circleNum+1));//图片1的x坐标和y坐标
    //image(img,i*20+10,j*20-10);
    noTint();
    }
}
