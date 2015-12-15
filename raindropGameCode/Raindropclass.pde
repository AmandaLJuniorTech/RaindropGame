class Raindrop() {
  PVector loc;
  PVector vel;
  float diam, locx, locy;

  Raindrop(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector(0, 1);
    diam = 10;
  }
    void display() {
      fill(0, 0, 255);
      ellipse(loc.x, loc.y, diam, diam/2);
    }
}