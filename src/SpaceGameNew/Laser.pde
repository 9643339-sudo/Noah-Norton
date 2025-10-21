class Laser {
// Member variables
int x,y,w,h,speed;
PImage laser;

//Constructor
Laser(int x, int y){
this.x = x;
this.y = y;
w = 6;
h = 12;
speed = 5;
}

// Member methods
void display(){
  fill(0,155,50);
  rectMode(CENTER);
  rect(x,y,w,h);
}

void move(){
y = y - speed;
}

void fire(){}

boolean reachedTop(){
if(y<-20) {
 return true;
} else {
  return false;
}
 }
 
 boolean intersect(Rock r){
 float d = dist(x,y,r.x,r.y);
 if(d<50){
    return true;
  } else {
 return false;
  }
 }
}
