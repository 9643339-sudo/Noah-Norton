// Noah Norton| 23 sept 2025 spacegame
Spaceship sp1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer;
int score,rocksPassed;

void setup(){ 
size(500,500);
sp1 = new Spaceship();
rockTimer = new Timer(1000);
rockTimer.start();
score = 0;
rocksPassed = 0;
}

void draw(){
background(0);
//Adding stars
stars.add(new Star());

//distribute rocks
if(rockTimer.isFinished()) {
rocks.add(new Rock());
rockTimer.start();
}



for (int i = 0; i < lasers.size(); i++) {
  Laser laser = lasers.get(i);
  for(int j = 0; j<rocks.size(); j++){
    Rock r = rocks.get(j);
    if(laser.intersect(r)){
    // reduce HP on rock and remove rock
    r.w = r.w - 15;
    if(r.w<5){
    rocks.remove(r);
    }
    // remove laser
    lasers.remove(laser);
    //something to score
    score = score + 10;
    //provide animated gif file and explosion sound
    
    }
  
  }
  laser.display();
  laser.move();
  if(laser.reachedTop()) {
  lasers.remove(laser);
  i--;
  }
  println("Lasers: " + lasers.size());
}
for (int i = 0; i < stars.size(); i++) {
  Star star = stars.get(i);
  star.display();
  star.move();
  if(star.reachedBottom()==true) {
  stars.remove(star);
  
  }
  
}
for (int i = 0; i < rocks.size(); i++) {
  Rock rock = rocks.get(i);
  // collision detection between rock and ship
  
  rock.display();
  rock.move();
  if(rock.reachedBottom()==true) {
  if (rock.reachedBottom()){
   rocks.remove(rock);
   i--;
   rocksPassed++;
  }
   
  
  }
  
}

sp1.display();
  sp1.move(mouseX, mouseY);
  infoPanel();
}
void mousePressed() {
 lasers.add(new Laser(sp1.x,sp1.y));
}

void infoPanel(){
  rectMode(CENTER);
  fill(127,127);
  noStroke();
  rect(width/2,25,width,50);
  fill(220);
  textSize(25);
  text("Score:" + score, 20, 40);
  text("Passed rocks:"+ rocksPassed, width-200,40);
}
