

void setup(){
  size(400,400);  
  noFill();
//}

//void draw(){
  

   for(int x=0;x<9;x++){
     for(int y=0;y<9;y++)
  arc(x*50,y*50,100,100,radians( int( random(0,4.1)) *90 ),radians(int( random(0,4.1)) *90 ),OPEN);
   }
}
