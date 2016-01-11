class Blooddrop { //declare a class for the blood
  PVector loc; //declare pvector for location
  PVector vel; //declare pvector for velocity
  float diam, locx, locy, grav;  //declare diameter, x location, y location, and gravity

  Blooddrop(float locx, float locy) { //make a blooddrop at the location the user chooses
    loc = new PVector(locx, locy); //make the location be 
    vel = new PVector(0, 1);  //velocity 
    diam = 25; //diameter of the blooddrop is 25
    grav = 0.0981; //gravity of the blooddrop is actual gravity
  }
  void fall() {
    loc.add(vel);
    vel.y += grav;
  }
  void display() {
    noStroke();
    fill(200,0,0);
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
  int w,h; 

  catcher() {
 loc = new PVector();
 w = 50;
 h= 20;
  }
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(loc.x, loc.y, w, h);
  }
  void update(){
    loc.set(mouseX, mouseY);
  }
  boolean isCatching(Blooddrop droplet){
    if (droplet.loc.x + droplet.diam/2 > loc.x - w/2 && droplet.loc.x - droplet.diam/2 < loc.x + w/2 && droplet.loc.y + droplet.diam/2 > loc.y - h/2 && droplet.loc.y - droplet.diam/2 < loc.y + h/2) {
  return true;
    }else{
      return false; 
    }
  } 

 
}