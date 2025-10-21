class Spaceship {
// Member variables
int x,y,w;
PImage ship;

//Constructor
Spaceship(){
x = width/2;
y = height/2;
w = 100;
ship = loadImage("spaceship.png");
}

// Member methods
void display(){
  ship.resize(100,100);
imageMode(CENTER);
image(ship,x,y);
}

void move(int x, int y){
this.x = x;
this.y = y;
}

void fire(){}

boolean intersect(){
return true;
 }
}
