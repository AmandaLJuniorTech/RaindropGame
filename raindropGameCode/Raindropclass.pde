class Raindrop {
  PVector loc;
  PVector vel;
  float diam, locx, locy, grav;

  Raindrop(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector(0, 1);
    diam = 25;
    grav = 0.0981;
  }
  void fall() {
    loc.add(vel);
    vel.y += grav;
  }
  void display() {
    noStroke();
    fill(255,0,0);
    ellipse(loc.x, loc.y, 2*diam/3, diam);
  }
  void reset() {
    loc.x = random(width);
    loc.y = 0;
    vel.y = 1;
  }
  boolean isInContactWith(PVector thing) {
    if (loc.dist(thing)<diam/2) {
      return true;
    } else {
      return false;
    }
  }
}

class catcher {
  PVector loc;
  float diam; 

  catcher(float tdiam) {
    diam = tdiam;
  }
  void display() {
    fill(255, 0, 0);
    rect(mouseX, mouseY, 40, 10);
  }
}