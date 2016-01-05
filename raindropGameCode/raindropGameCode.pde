PVector mouse;   //declare a P
Raindrop r;      //declare a new Raindrop called r
catcher bucket;
ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();    //declare and initialize the ArrayList


void setup() {
  size(800, 600);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  raindrops.add(new Raindrop(width/2, mouseY));    //add a new raindrop to the raindrop ArrayList
}

void draw() {
  println(raindrops.size());
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
  fill(204, 102, 0);
  quad(0, 0, 0, 60, width, 40, width, 0);
  int i =0;
  while (i < raindrops.size()) {
   r = raindrops.get(i);
   r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
   r.display();      //display the raindrop
   if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
     raindrops.remove(i);                         //if it is, reset the raindrop     raindrops.add(new Raindrop(random(0, width), 0));
   }
   if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
     raindrops.remove(i);    //if it does, reset the raindrop
     raindrops.add(new Raindrop(random(0, width), 0));
     float rand = random(1);
     if (rand <= .25) {
       raindrops.add(new Raindrop(random(0, width), 0));
     }
     //bucket.display();
   }
   i ++;
  }
}