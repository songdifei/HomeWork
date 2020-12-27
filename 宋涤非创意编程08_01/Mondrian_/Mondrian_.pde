PImage Target;
PFont f;
int popmax;
float mutationRate;
color[] targetColor = new color[3];
Population population;

void setup() {
  size(1300, 500);
  f = createFont("Courier", 32, true);
  background(255);
  popmax = 200;//这里可以改
  mutationRate = 0.001;//这里可以改
  Target = loadImage("target.jpg");
  Target.resize(0, height);
  targetColor[0]=#C42309;
  targetColor[1]=#0a36eb;
  targetColor[2]=#f4ce4a;
  population = new Population (mutationRate, popmax);
}

void draw() {
  population.calcFitness();
  population.naturalSelection();
  population.generate();
  displayInfo();
  if (population.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
  //saveFrame();
}

void displayInfo() {
  background(255);
  image(Target, 0, 0);
  noStroke();
  color redColor = population.getBestRed();
  fill(redColor);
  rect(626, 0, 374, 370);
  color blueColor = population.getBestBlue();
  fill(blueColor);
  rect(500, height-136, 126, 140);
  color yellowColor = population.getBestYellow();
  fill(yellowColor);
  rect(950, height-68, 50, 90);
  fill(0);
  rect(626, 0, 14, height);
  rect(500, height-136, 500, 14);
  rect(500, 145, 126, 24);
  rect(950, height-136, 14, 136);
  rect(950, height-68, 50, 18);

  //信息
  fill(0);
  textSize(15);
  text("total generations:" + population.getGenerations(), 1100, 20);
  text("average fitness:" + nf(population.getAverageFitness(), 0, 2), 1100, 40);
  text("total populationation: " + popmax, 1100, 60);
  text("mutation rate: " + mutationRate*100 + "%", 1100, 80);
}
