PImage img;
PImage paint;


void setup(){
  size(600,590);
  
  img=loadImage("1.png");
  paint=loadImage("2.JPG");
  
  img.resize(20,20);
  paint.resize(1200,1200);
  background(255);
  
  for (int i=-6;i<30;i++)
    for (int j=-6;j<30;j++){
   
      //tint(random(0,255),random(0,150),random(100,150));
    color c=paint.get(i*20,j*20);
    tint(c);
    
    image(img,i*20,j*20);//图片的x坐标和y坐标
    image(img,i*20+10,j*20-10);
    noTint();
    }
}
