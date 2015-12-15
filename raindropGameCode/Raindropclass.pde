class Raindrop {
  PVector loc;
  PVector vel;
  float diam, locx, locy, grav;

  Raindrop(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector(0, 1);
    diam = 10;
    grav = 0.0981;
  }
  void fall() {
    loc.add(vel);
    vel.y += grav;
  }
  void display() {
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, diam, diam/2);
  }
  /*void reset() {
   }
   boolean isInContactWith(PVector bucket){
   
   }*/
}