class DNA {
  float[] genes;
  float fitness;
  color c1, c2, c3;

  DNA() {
    genes = new float[9];
    for (int i = 0; i<genes.length; i++) {
      genes[i] = random(255);
    }
  }

  color getColorRed() {
    c1 =color(genes[0], genes[1], genes[2]);
    return c1;
  }
  color getColorBlue() {
    c2 = color(genes[3], genes[4], genes[5]);
    return c2;
  }
  color getColorYellow() {
    c3 = color(genes[6], genes[7], genes[8]);
    return c3;
  }

  void fitness() {
    float deflection = abs(genes[0]-red(targetColor[0])) + abs(genes[1]-green(targetColor[0])) + abs(genes[2]-blue(targetColor[0])) + abs(genes[3]-red(targetColor[1])) + abs(genes[4]-green(targetColor[1])) + abs(genes[5]-blue(targetColor[1])) + abs(genes[6]-red(targetColor[2])) + abs(genes[7]-green(targetColor[2])) + abs(genes[8]-blue(targetColor[2]));
    float score = map(deflection, 0, 255*9, 1, 0);
    fitness = pow(2, score);
  }


  DNA crossover(DNA partner) {
    DNA child = new DNA();
    int midpoint = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = partner.genes[i];
    }
    return child;
  }

  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = random(255);
      }
    }
  }
}
