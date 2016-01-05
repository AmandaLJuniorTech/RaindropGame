PVector mouse;   //declare a P
Blooddrop r;      //declare a new Raindrop called r
catcher tissue;
ArrayList<Blooddrop> blooddrops = new ArrayList<Blooddrop>();    //declare and initialize the ArrayList


void setup() {
  size(800, 600);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  blooddrops.add(new Blooddrop(width/2, mouseY));    //add a new raindrop to the raindrop ArrayList
}

void draw() {
  println(blooddrops.size());
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  fill(200, 102, 0);
  quad(0, 0, 0, 60, width, 40, width, 0);
  int i = 0;
  while (i < blooddrops.size()) {
    r = blooddrops.get(i);
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();      //display the raindrop
    if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      blooddrops.remove(i);                         //if it is, reset the raindrop     raindrops.add(new Raindrop(random(0, width), 0));
    }
    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      blooddrops.remove(i);    //if it does, reset the raindrop
      blooddrops.add(new Blooddrop(random(0, width), 0));
      float rand = random(1);
      if (rand <= .75) {
        blooddrops.add(new Blooddrop(random(0, width), 0));
      }
    }
    i ++;
    if (i>= 500) {
      background(255);
      textSize(50);
      text("Game Over, You Lose!", width/2, height/2);
      textAlign(CENTER);
    }
  }
}