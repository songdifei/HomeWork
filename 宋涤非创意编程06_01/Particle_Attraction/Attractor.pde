class Attractor {
  float mass;    
  float G;       
  PVector location;   

  Attractor() {
    location = new PVector(random(width), random(height));
    mass = 20;
    G = 1;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);   
    float d = force.mag();                              
    d = constrain(d, 5.0, 25.0);                        
    force.normalize();                                 
    float strength = (G * mass * m.mass) / (d * d);      
    force.mult(strength);                                  
    return force;
  }


  void display() {
    ellipseMode(CENTER);
    stroke(0, 0, 0, 10);
    strokeWeight(1);
    noFill();
    ellipse(location.x, location.y, mass*2, mass*2);
  }

}
