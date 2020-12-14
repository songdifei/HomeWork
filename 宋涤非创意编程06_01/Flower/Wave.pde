class Wave {
  int xspacing = 10; // 水平位置的间隔
  int w;            // 整体宽度
  PVector origin;          // 起始点
  float theta = 0.0;       // Start angle at 0
  float amplitude;         // H高度
  float period;            // How many pixels before the wave repeats
  float dx;                // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;         // Using an array to store height values for the wave (not entirely necessary)
  float opacity=100;
  float[] r;//圆的大小
  color green = color(168,90,98,opacity);

  Wave(PVector o, int w_, float a, float p) {//位置、宽度、高度、周期
    origin = o.get();
    w = w_;
    period = p;
    amplitude = a;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
    r = new float[w/xspacing];
  }


  void calculate() {
    theta += 0.1;
    
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  void display() {
    for (int x = 0; x < yvalues.length; x++) {
      noStroke();
      fill(168,90,(100*x*xspacing)/w);//颜色
      ellipseMode(CENTER);
      ellipse(origin.x+x*xspacing,origin.y+yvalues[x],(30*x)/(w/xspacing),(50*x)/(w/xspacing));
      //(w/xspacing-x)
    }
  }
}
