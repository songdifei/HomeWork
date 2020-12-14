class Pin {
  float r = height/sliderR;//不规则形状的平均半径
  float factor_ = sliderR_;//内部圆环的大小
  float d = random(5*sliderD, 15*sliderD);//小球的半径
  float factor = sliderF;//控制变化的幅度
  color c = color(255,255,255,sliderC);
  PVector loc = new PVector();//球的位置
  PVector loc_ = new PVector();
  Pin() {
  }

  void show() {
    //translate(width/2, height/2);
    stroke(255);
    loc.y = r + random(-factor, factor);
    loc_.y = loc.y*factor_;
    strokeWeight(1);
    line (0, loc.y, 0, loc_.y);
    fill(c);//球的颜色
    ellipse(0, loc.y, d, d);
    strokeWeight(3);
    point(0, loc_.y);
    //println(0, loc.y, factor, factor);
    //println(y = r + random(-10, 10));
  }
}
